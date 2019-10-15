/*
 * Copyright (C) 2019 gabriela
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

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.EntregaUtilesFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.EntregaUtiles;
import net.delsas.saitae.entities.EntregaUtilesPK;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author gabriela
 */
@Named

@ViewScoped
public class paquetesController implements Serializable {

    private static final long serialVersionUID = 1L;

    boolean boton;
    @EJB
    private PersonaFacadeLocal personaFL;
    private Persona p;
    private Persona usuario;
    private String est;
    @EJB
    private EntregaUtilesFacadeLocal entregaUFL;
    private EntregaUtiles entregaUtiles;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;

    @PostConstruct
    public void init() {
        boton = true;
        entregaUtiles = new EntregaUtiles(new EntregaUtilesPK(0, getAño()));
        p = new Auxiliar().getEstudiante();
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        String pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        if (!(new Auxiliar().permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina))))) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex0) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error iniesperado",
                        (ex0 != null ? ex0.getMessage() : "Error desconocido.")));
            }
        }
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> listp;
        try {
            (new Auxiliar()).setDui(query, p);
            listp = personaFL.getPersonaByLikeIdAndType(p.getIdpersona(), 8);
            for (Persona datos : listp) {
                results.add(datos.getPersonaNombre() + " "
                        + datos.getPersonaApellido() + "=>" + datos.getIdpersona().toString().substring(1));
            }
        } catch (Exception m) {
            System.out.println(m.getMessage());
        }
        return results;
    }

    public void onItemSelect(SelectEvent event) {
        new Auxiliar().setDui(event.getObject().toString(), p);
        p = personaFL.find(p.getIdpersona());
        entregaUtiles = entregaUFL.find(new EntregaUtilesPK(p.getIdpersona(), getAño()));
        entregaUtiles = entregaUtiles == null ? new EntregaUtiles(p.getIdpersona(), getAño()) : entregaUtiles;
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Alumno seleccionado", event.getObject().toString()));
        entregaUtiles.setIdRepresentante(p.getEstudiante().getEstudianteRepresentante());
        entregaUtiles.setEstudiante(p.getEstudiante());
        boton = false;
    }

    public int getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public String getGradoAlumno() {
        String grado = "";
        Matricula mati = matriculaFL.find(new MatriculaPK(p.getIdpersona(), getAño()));
        if (mati != null) {
            GradoPK pk = mati.getGrado().getGradoPK();
            grado += pk.getIdgrado() == 1 ? "Primero" : pk.getIdgrado() == 2 ? "Segundo"
                    : pk.getIdgrado() == 3 ? "Tercero" : "";
            grado += " " + (pk.getGradoModalidad().equals("G") ? "General"
                    : pk.getGradoModalidad().equals("S") ? " T.V.C Secretariado"
                    : pk.getGradoModalidad().equals("C") ? "T.V.C Contador" : "");
        }
        return grado;
    }

    public void guardar() {
        EntregaUtiles entregaG = entregaUFL.find(entregaUtiles.getEntregaUtilesPK());
        if (!entregaUtiles.equals(entregaG)) {
            entregaUtiles.setIdEntregante(usuario);
            entregaUFL.edit(entregaUtiles);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Guardado con éxito", "Se guardaron los datos de paquetes entregados"));
            String g = entrega(entregaUtiles);
            sendMessage(new mensaje(entregaUtiles.getEntregaUtilesPK().getIdEstudiante(),
                    usuario.getIdpersona(),
                    " ",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Se ha registrado actividad en la entrega de paquetes.",
                            (g.split("").length > 2 ? "Lo que se le ha entregado es: " + g
                            : "No hay registro de entregas en este año."))).toString());
            this.init();
        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Falló", "No se seleccionaron datos"));
        }
    }

    private String entrega(EntregaUtiles e) {
        return (e.getUtiles() ? "Útiles" : "")
                + (e.getUniforme() ? ", Uniforme" : "")
                + (e.getZapatos() ? ", Zapatos" : "")
                + ".";
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    public Persona getP() {
        return p;
    }

    public void setNie(String nie) {
        new Auxiliar().setDui(nie, p);
    }

    public String getNie() {
        return p.getIdpersona().toString().substring(1);
    }

    public EntregaUtiles getEntregaUtiles() {
        return entregaUtiles;
    }

    public void setEntregaUtiles(EntregaUtiles entregaUtiles) {
        this.entregaUtiles = entregaUtiles;
    }

    public boolean isBoton() {
        return boton;
    }

    public void setBoton(boolean boton) {
        this.boton = boton;
    }

    public boolean getUni() {
        return this.entregaUtiles.getUniforme();
    }

    public void setUni(boolean boton) {
        this.entregaUtiles.setUniforme(boton);
    }

    public boolean getZap() {
        return this.entregaUtiles.getZapatos();
    }

    public void setZap(boolean boton) {
        this.entregaUtiles.setZapatos(boton);
    }

    public boolean getEsc() {
        return this.entregaUtiles.getUtiles();
    }

    public void setEsc(boolean boton) {
        this.entregaUtiles.setUtiles(boton);
    }

    @Inject
    @Push
    private PushContext notificacion;

    public void sendMessage(String message) {
        notificacion.send(message);
    }

}
