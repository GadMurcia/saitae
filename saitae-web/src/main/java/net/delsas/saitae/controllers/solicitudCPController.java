/*
 * Copyright (C) 2020 delsas
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.CitaPsicologiaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.CitaPsicologia;
import net.delsas.saitae.entities.CitaPsicologiaPK;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class solicitudCPController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private CitaPsicologiaFacadeLocal cpsFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private TipoPersonaFacadeLocal tpFL;

    private CitaPsicologia cita;
    private CitaPsicologiaPK control;
    private Persona usuario;
    private boolean editar;
    private FacesMessage m;
    private Auxiliar ax;

    @PostConstruct
    public void init() {
        ax = new Auxiliar();
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        Integer tp = usuario == null ? 0 : usuario.getTipoPersona().getIdtipoPersona();
        if (tp == 8) {
            cita = (CitaPsicologia) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("cita");
            if (cita != null) {
                editar = true;
                control = new CitaPsicologiaPK(cita.getCitaPsicologiaPK().getEstudiante(),
                        cita.getCitaPsicologiaPK().getFechaSolicitada());
                cita.setFechaSolicitud(getHoras(control.getFechaSolicitada()));
                cita.getCitaPsicologiaPK().setFechaSolicitada(getFechas(control.getFechaSolicitada()));
                m = (FacesMessage) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("ms");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("cita");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ms");
            } else {
                initVariables();
            }
        } else {
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_ERROR,
                            "Usted no puede hacer una solicitud al pscólogo institucional. ",
                            "Esta es una vista restringida sólo para estudiantes. Regrese a su perfil."));
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            } catch (IOException ex) {
                m = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Usted no puede hacer una solicitud al pscólogo institucional. ",
                        "Esta es una vista restringida sólo para estudiantes. Regrese a su perfil.");
                postRender();
            }
        }
    }

    private void initVariables() {
        cita = new CitaPsicologia(usuario.getIdpersona(), null);
        cita.setFechaSolicitud(null);
        control = cita.getCitaPsicologiaPK();
    }

    public void guardar() {
        cita.getCitaPsicologiaPK().setFechaSolicitada(
                getFechas(cita.getCitaPsicologiaPK().getFechaSolicitada(),
                        cita.getFechaSolicitud()));
        if (cita.getCitaPsicologiaPK().getFechaSolicitada().before(new Date())) {
            m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Fecha incorrecta",
                    "La fecha en la que desea ser atendido no puede ser anterior a la fecha "
                    + "y hora actuales. Además, usted sólo puede ser antendido entre las "
                    + "8:00 am y las 12:00 pm de lunes a viernes."
                    + "Revise antes de continuar.");
            cita.setFechaSolicitud(getHoras(control.getFechaSolicitada()));
            cita.getCitaPsicologiaPK().setFechaSolicitada(getFechas(control.getFechaSolicitada()));
            postRender();
        } else {
            cita.setFechaSolicitud(new Date());
            cita.setEstado("S");
            cita.setComentarios("");
            CitaPsicologia ctr = cpsFL.find(control);
            if (ctr != null && !editar) {
                m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Solicitud duplicada",
                        "Hemos encontrado que usted ya tiene una solicitud para el día y hora "
                        + "indicados por lo que no se solicitará de nuevo. "
                        + "Revse su historial de citas antes de continuar.");
                cita.setFechaSolicitud(getHoras(control.getFechaSolicitada()));
                cita.getCitaPsicologiaPK().setFechaSolicitada(getFechas(control.getFechaSolicitada()));
                postRender();
                return;
            } 
            if (editar) {
                cpsFL.remove(ctr);
            }
            cita.setEstudiante1(usuario.getEstudiante());
            cpsFL.create(cita);
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "admCitasPs<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Nueva solicitud de cita",
                                    "El estudiante " + getNombreUs() + " ha hecho una solicitud de cita. "
                                    + "Revise la administración de las citas para más detalles")),
                    getPersonasParaNotificar(tpFL.find(14)), notiFL, notificacion);
            persistirNotificación(
                    new mensaje(usuario.getIdpersona(), usuario.getIdpersona(), " ",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                                    "Su solicitud de citas con el psicólogo de la institución se ha "
                                    + "realizado con éxito. su solicitud es para el día "
                                    + new SimpleDateFormat("EEEEE dd/MMMMM/yyyy hh:mm a")
                                            .format(cita.getCitaPsicologiaPK().getFechaSolicitada())
                                    + ". Manténgase pendiente de la respuesta del psicólogo.")),
                    usuario, notiFL, notificacion);
            initVariables();
            PrimeFaces.current().ajax().update("form");
        }
    }

    public CitaPsicologia getCita() {
        return cita;
    }

    public boolean isEditar() {
        return editar;
    }

    public void setCita(CitaPsicologia cita) {
        this.cita = cita;
    }

    public void postRender() {
        if (m != null) {
            FacesContext.getCurrentInstance().addMessage("form0:msgs", m);
            PrimeFaces.current().ajax().update("form0:msgs");
            m = null;
        }
    }

    public String getNombreUs() {
        return usuario == null ? "" : usuario.getPersonaNombre().split(" ")[0] + " "
                + usuario.getPersonaApellido().split(" ")[0];
    }

    public Date getMinHora() {
        return getHoras(getMinTimeCPs());
    }

    public Date getMaxHora() {
        return getHoras(getMaxTimeCPs());
    }

    public List<Integer> getInvalidDays() {
        return getDisabledDays();
    }

    private Date getHoras(Date d) {
        Date s = null;
        try {
            s = new SimpleDateFormat("hh:mm a").parse(new SimpleDateFormat("hh:mm a").format(d));
        } catch (ParseException ex) {
        }
        return s;
    }

    private Date getFechas(Date d) {
        Date s = null;
        try {
            s = new SimpleDateFormat("dd/MM/yyyy").parse(new SimpleDateFormat("dd/MM/yyyy").format(d));
        } catch (ParseException ex) {
        }
        return s;
    }

    private Date getFechas(Date fecha, Date hora) {
        Date s = null;
        try {
            s = new SimpleDateFormat("dd/MM/yyyy hh:mm a").parse(
                    new SimpleDateFormat("dd/MM/yyyy").format(fecha) + " "
                    + new SimpleDateFormat("hh:mm a").format(hora));
        } catch (ParseException ex) {
        }
        return s;
    }

}
