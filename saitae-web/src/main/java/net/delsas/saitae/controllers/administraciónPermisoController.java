/*
 * Copyright (C) 2019 delsas
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class administraciónPermisoController implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<Permisos> solicitados;
    private List<Permisos> aceptados;
    private List<Permisos> rechazados;
    private Permisos permiso;
    private Permisos acep;
    private Permisos solc;
    private GradoPK gradoPK;

    @EJB
    private PermisosFacadeLocal permisosFL;
    @EJB
    private GradoFacadeLocal grsoFL;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;

    @PostConstruct
    public void init() {
        solicitados = permisosFL.getPermisosPorEstado("0");
        aceptados = permisosFL.getPermisosPorEstado("1");
        rechazados = permisosFL.getPermisosPorEstado("2");
        acep = solc = new Permisos(new PermisosPK());
        gradoPK = new GradoPK(0, " ", "", getAño());
    }

    public List<TipoPermiso> getTipoPermiso() {
        List<TipoPermiso> items = new ArrayList<>();
        List<TipopersonaPermiso> tt = tipoPersonaFL.find(8).getTipopersonaPermisoList();
        for (TipopersonaPermiso t : tt) {
            items.add(t.getTipoPermiso());
        }
        return items;
    }

    public List<SelectItem> getModalidades() {
        List<SelectItem> items = new ArrayList<>();
        List<String> mo = grsoFL.getModalidadPorAño(getAño());
        for (String s : mo) {
            items.add(new SelectItem(s, s.equals("C") ? "TVC Contador"
                    : (s.equals("S") ? "TVC Secretariado"
                    : (s.equals("G") ? "General" : "??"))));
        }
        return items;
    }

    public List<Integer> getNiveles() {
        return grsoFL.getIdPorAñoyModalidad(getAño(), gradoPK.getGradoModalidad());
    }
    
    public List<String> getSecciones(){
        return grsoFL.getSeccionPorAñoModalidadyId(getAño(), gradoPK.getGradoModalidad(), gradoPK.getIdgrado());
    }
    
    public List<Persona> getEstudiantes(){
        return new ArrayList<>();
    }

    public void onRowSelect(SelectEvent event) {
        String id = event.getComponent().getId();
        switch (id) {
            case "solicitados":
                solc = (Permisos) event.getObject();
                break;
            default:
                acep = (Permisos) event.getObject();
        }
    }

    public String getFecha(Date a) {
        return a != null ? new SimpleDateFormat("dd-MM-yyyy").format(a) : "";
    }

    public String getFechas(Date i, Date f) {
        String g = "";
        if (i != null) {
            String in = getFecha(i);
            String fi = getFecha(f);
            if (in.equals(fi)) {
                g = in;
            } else {
                g = "Entre " + in + " y " + fi;
            }
        }
        return g;
    }

    public void guardar(int w) {
        solc.setPermisosEstado(w + "");
        permisosFL.edit(solc);
        if (w == 1) {
            aceptados.add(solc);
        } else if (w == 2) {
            rechazados.add(solc);
        }
        solc.setPermisosEstado("0");
        solicitados.remove(solc);
        FacesMessage m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios gurdados", "el permiso ha sido "
                + (w == 1 ? "aceptado" : (w == 2 ? "rechazado" : "")));
        FacesContext.getCurrentInstance().addMessage(null, m);
        solc = new Permisos(new PermisosPK());
    }

    public String getGrado(int id) {
        Matricula mat = matriculaFL.find(new MatriculaPK(id, getAño()));
        GradoPK gr = mat.getGrado().getGradoPK();
        String g = "";
        g = gr.getIdgrado() + "° " + (gr.getGradoModalidad().equals("C") ? "TVC Contador"
                : (gr.getGradoModalidad().equals("S") ? "TVC Secretariado"
                : (gr.getGradoModalidad().equals("G") ? "General" : "??")))
                + " Sección " + gr.getGradoSeccion();
        return g;
    }

    public String getSolicitadoPor(Permisos s) {
        if (s.getPermisosSolicitante() != null) {
            Persona solicitante;
            if (s.getPermisosSolicitante().getIdpersona() == 1000000000) {
                solicitante = new Persona(Integer.valueOf(s.getPermisosComentario().split("¿¿")[0]));
                solicitante.setPersonaNombre(s.getPermisosComentario().split("¿¿")[1]);
                solicitante.setPersonaApellido(s.getPermisosComentario().split("¿¿")[2]);
            } else {
                solicitante = s.getPermisosSolicitante();
            }
            String h = solicitante.getPersonaNombre().split(" ")[0]
                    + " " + solicitante.getPersonaApellido().split(" ")[0];
            return h;
        } else {
            return "";
        }
    }

    public List<Permisos> getSolicitados() {
        return Collections.unmodifiableList(solicitados);
    }

    public void setSolicitados(List<Permisos> solicitados) {
        this.solicitados = solicitados;
    }

    public List<Permisos> getAceptados() {
        return Collections.unmodifiableList(aceptados);
    }

    public void setAceptados(List<Permisos> aceptados) {
        this.aceptados = aceptados;
    }

    public List<Permisos> getRechazados() {
        return Collections.unmodifiableList(rechazados);
    }

    public void setRechazados(List<Permisos> rechazados) {
        this.rechazados = rechazados;
    }

    public Permisos getPermiso() {
        return permiso;
    }

    public void setPermiso(Permisos permiso) {
        this.permiso = permiso;
    }

    public Integer getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public Permisos getAcep() {
        return acep;
    }

    public void setAcep(Permisos acep) {
        this.acep = acep;
    }

    public Permisos getSolc() {
        return solc;
    }

    public void setSolc(Permisos solc) {
        this.solc = solc;
    }

    public GradoPK getGradoPK() {
        return gradoPK;
    }

    public void setGradoPK(GradoPK gradoPK) {
        this.gradoPK = gradoPK;
    }
}
