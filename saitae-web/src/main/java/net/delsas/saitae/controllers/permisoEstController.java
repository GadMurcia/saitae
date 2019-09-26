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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class permisoEstController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
    private MatriculaFacadeLocal mfl;

    private Matricula m;
    private List<TipopersonaPermiso> permisos;
    private Persona usuario;
    private List<Estudiante> e;
    private int id;
    private Permisos p;

    @PostConstruct
    public void init() {
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            boolean r = usuario.getTipoPersona().getIdtipoPersona().equals(8) ? false
                    : !usuario.getTipoPersona().getIdtipoPersona().equals(9);
            if (usuario == null || r) {

                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                        "Falla!", "Esa vista no le está permitida."));
                context.getExternalContext().redirect("./../");

            } else {
                p = new Permisos();
                p.setTipoPermiso1(new TipoPermiso(0));
                p.setPermisosPK(new PermisosPK(0, Calendar.getInstance().getTime(), 0, Calendar.getInstance().getTime()));
                permisos = usuario.getTipoPersona().getTipopersonaPermisoList();
                p.setTipoPersona(tipoPersonaFL.find(8));
                p.setPersona(new Persona(0));
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
                p.setPermisosComentario("0¿¿ ¿¿ ¿¿ ");
                if (usuario.getTipoPersona().getIdtipoPersona() == 8) {
                    e = new ArrayList<>();
                    e.add(usuario.getEstudiante());
                } else {
                    e = usuario.getEstudiante().getEstudianteList();
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void guardar() {
        FacesMessage ms = null;
        try {
            if (p.getPermisosPK().getPermisoFechaInicio().before(new SimpleDateFormat("dd/MM/yyyy").parse(new SimpleDateFormat("dd/MM/yyyy").format(new Date())))) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Error en la fecha de inicio del permiso",
                        "No debe seleccionar una fecha para el inicio del periodo del permiso anterior a la actual."));
                p.getPermisosPK().setPermisoFechaInicio(new Date());
            } else if (p.getPermisoFechafin().before(p.getPermisosPK().getPermisoFechaInicio())) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Error en la fecha de fin del permiso",
                        "No debe seleccionar una fecha para el final del periodo del permiso anterior a la fecha en la que inicia éste."));
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
            } else {
                p.getPermisosPK().setTipoPermiso(p.getTipoPermiso1().getIdtipoPermiso());
                p.setPermisosSolicitante(usuario);
                p.setPersona(personaFL.find(id));
                p.getPermisosPK().setIpPersona(id);
                p.setPermisosEstado("0");
                Permisos pp = pfl.find(p.getPermisosPK());
                if (pp != null) {
                    ms = new FacesMessage(FacesMessage.SEVERITY_WARN, "Imposible proceder",
                            "En la base de datos ya hay un permiso del tipo '" + p.getTipoPermiso1().getTipoPermisoNombre() 
                                    + "' para usted en el día "
                            + (new SimpleDateFormat("dd/MM/yyy").format(p.getPermisosPK().getPermisoFechaInicio())
                            + " por lo que no se procede con la petición del permiso"));
                    FacesContext.getCurrentInstance().addMessage(null, ms);
                    return;
                }
                pfl.create(p);
                ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                        "Su permiso se ha solicitado para entre las fechas: "
                        + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisosPK().getPermisoFechaInicio())) + " y "
                        + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisoFechafin())));
                sendMessage(new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                        + " ha solicitado un nuevo permiso.",
                        "Solicitud de permiso nueva", FacesMessage.SEVERITY_INFO, id, "tp¿¿3").toString());

                FacesContext.getCurrentInstance().addMessage(null, ms);
                p = new Permisos(new PermisosPK((usuario == null ? 0 : usuario.getIdpersona()), new Date(), 0, new Date()));
                p.setTipoPersona(tipoPersonaFL.find(8));
                p.setPersona(new Persona(0));
                p.setTipoPermiso1(new TipoPermiso(0));
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
                id = 0;
            }
        } catch (Exception e) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", e.getMessage());
            FacesContext.getCurrentInstance().addMessage(null, ms);
        }
    }

    public ArrayList<TipoPermiso> getListaPermisos() {
        ArrayList<TipoPermiso> items = new ArrayList<>();
        for (TipopersonaPermiso t : permisos) {
            items.add(t.getTipoPermiso());
        }
        return items;
    }

    public boolean isSeleccionPermiso() {
        return p.getTipoPermiso1().getIdtipoPermiso() > 0;
    }

    public void onItemSelect(SelectEvent event) {
        id = event.getObject() != null ? (int) event.getObject() : 0;
        if (id > 0) {
            m = mfl.find(new MatriculaPK(id, getAño()));
        } else {
            m = new Matricula(new MatriculaPK(0, getAño()));
        }
    }

    public boolean isSeleccionEstudiante() {
        return id > 0;
    }

    public Matricula getM() {
        return m;
    }

    public void setM(Matricula m) {
        this.m = m;
    }

    public Persona getUsuario() {
        return usuario;
    }

    public void setUsuario(Persona usuario) {
        this.usuario = usuario;
    }

    public List<Estudiante> getE() {
        return e;
    }

    public void setE(List<Estudiante> e) {
        this.e = e;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Permisos getP() {
        return p;
    }

    public void setP(Permisos p) {
        this.p = p;
    }

    private int getAño() {
        return Integer.valueOf(new SimpleDateFormat("YYYY").format(new Date()));
    }

    @Inject
    @Push
    private PushContext notificacion;

    public void sendMessage(String message) {
        notificacion.send(message);
    }

}
