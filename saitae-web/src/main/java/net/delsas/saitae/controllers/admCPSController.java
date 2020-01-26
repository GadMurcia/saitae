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
import java.util.ArrayList;
import java.util.Collections;
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
import net.delsas.saitae.entities.CitaPsicologia;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class admCPSController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private CitaPsicologiaFacadeLocal cpsFL;
    private List<CitaPsicologia> solicitados;
    private List<CitaPsicologia> aceptados;
    private List<CitaPsicologia> pospuestos;
    private List<CitaPsicologia> cancelados;
    private List<CitaPsicologia> consultados;
    private CitaPsicologia selected;
    private String textoReserva;
    private Date fechaPosponer;
    private Date horaPosponer;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    private Persona usuario;
    private FacesMessage m;
    private FacesContext context;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        Integer tp = usuario == null ? 0 : usuario.getTipoPersona().getIdtipoPersona();
        if (tp == 14 || tp == 1) {
            m = (FacesMessage) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("ms");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ms");
        } else {
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_ERROR,
                            "Esa no es una vista que usted tenga permitida. ",
                            "Esta es una vista restringida sólo para pscólogos. Regrese a su perfil."));
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("perfil.intex");
            } catch (IOException ex) {
                m = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Esa no es una vista que usted tenga permitida. ",
                        "Esta es una vista restringida sólo para pscólogos. Regrese a su perfil.");
                postRender();
            }
        }
    }

    public void onDetalleRowSelect(SelectEvent event) {
        selected = (CitaPsicologia) event.getObject();
        textoReserva = Auxiliar.getEstadoCita1(selected.getEstado());
    }

    public String getFechaHoraToString(Date d) {
        return d == null ? "" : new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d);
    }

    public String getFechasToString(Date d) {
        return d == null ? "" : new SimpleDateFormat("dd/MM/yyyy").format(d);
    }

    public String getHoraToString(Date d) {
        return d == null ? "" : new SimpleDateFormat("hh:mm a").format(d);
    }

    public String getEstado(String e) {
        return Auxiliar.getEstadoCita2(e);
    }

    public boolean isEstado(String e) {
        return selected == null ? false : selected.getEstado().equals(e);
    }

    public List<CitaPsicologia> getConsultados() {
        consultados = cpsFL.findConsultados();
        return Collections.unmodifiableList(consultados);
    }

    public List<CitaPsicologia> getSolicitados() {
        solicitados = cpsFL.findByEstado("S");
        return Collections.unmodifiableList(solicitados);
    }

    public List<CitaPsicologia> getAceptados() {
        aceptados = cpsFL.findByEstado("A");
        List<CitaPsicologia> brs = new ArrayList<>();
        aceptados.stream().filter((c) -> (c.getFechaSolicitud().equals(c.getCitaPsicologiaPK().getFechaSolicitada()))).map((c) -> {
            cpsFL.remove(c);
            return c;
        }).forEachOrdered((c) -> {
            brs.add(c);
        });
        aceptados.removeAll(brs);
        return Collections.unmodifiableList(aceptados);
    }

    public List<CitaPsicologia> getPospuestos() {
        pospuestos = cpsFL.findByEstado("P");
        return Collections.unmodifiableList(pospuestos);
    }

    public List<CitaPsicologia> getCancelados() {
        cancelados = cpsFL.findByEstado("C");
        return Collections.unmodifiableList(cancelados);
    }

    public CitaPsicologia getSelected() {
        return selected;
    }

    public void setSelected(CitaPsicologia selected) {
        this.selected = selected;
    }

    public String getTextoReserva() {
        return textoReserva;
    }

    public boolean getSePuedeConsultar() {
        return selected == null ? false : selected.getEstado().equals("A");
    }

    public boolean getSePuedePosponer() {
        return selected == null ? false
                : (selected.getEstado().equals("S")
                || selected.getEstado().equals("A"));
    }

    public boolean getSePuedeAceptar() {
        return selected == null ? false : selected.getEstado().equals("S");
    }

    public void postRender() {
        if (m != null) {
            FacesContext.getCurrentInstance().addMessage("form0:msgs", m);
            PrimeFaces.current().ajax().update("form0:msgs");
            m = null;
        }
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

    public void aceptar() {
        selected.setEstado("A");
        selected.setComentarios("");
        cpsFL.edit(selected);
        Auxiliar.persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), "citasPSH<form",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud de cita aceptada",
                                "Su solicitud para una cita con el psicólogo institucional fue aprobada por "
                                + usuario.getPersonaNombre().split(" ")[0] + " " + usuario.getPersonaApellido().split(" ")[0]
                                + ". La cita consulta se llevará a cabo el "
                                + getFechaHoraToString(selected.getCitaPsicologiaPK().getFechaSolicitada()))),
                selected.getEstudiante1().getPersona(), notiFL, notificacion);
        m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud aceptada con éxito",
                "La solicitud de cita ha sido aceptada con éxito. Se ha enviado la notificación pertinente al interesado");
        postRender();
        selected = null;
        PrimeFaces.current().executeScript("PF('Dcita1').hide(); PF('Dcita').hide();");
        PrimeFaces.current().ajax().update("form", "d1", "d2");
    }

    public void posponer() {
        fechaPosponer = getFechas(fechaPosponer, horaPosponer);
        if (!fechaPosponer.after(selected.getFechaSolicitud())) {
            m = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Error en la fecha",
                    "La fecha propuesta para la cita con el alumno no puede ser anterior "
                    + "a la fecha y hora actuales. Verifique, rectifique e intente de nuevo");
            postRender();
            return;
        }
        CitaPsicologia ctr = cpsFL.find(selected.getCitaPsicologiaPK());
        selected.setEstado("P");
        selected.getCitaPsicologiaPK().setFechaSolicitada(fechaPosponer);
        cpsFL.remove(ctr);
        cpsFL.create(selected);
        Auxiliar.persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), "citasPSH<form",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Solicitud de cita pospuesta",
                                "Su solicitud para una cita con el psicólogo institucional fue aplazada por "
                                + usuario.getPersonaNombre().split(" ")[0] + " " + usuario.getPersonaApellido().split(" ")[0]
                                + "La razón del aplazamiento es :" + selected.getComentarios()
                                + ". Se le propone que la cita consulta se lleve a cabo el "
                                + getFechaHoraToString(selected.getCitaPsicologiaPK().getFechaSolicitada())
                                + ". Puede aceptarla, modificarla o cancelarla desde su historial de citas.")),
                selected.getEstudiante1().getPersona(), notiFL, notificacion);
        m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud aceptada con éxito",
                "La solicitud de cita ha sido aceptada con éxito. Se ha enviado la notificación pertinente al interesado");
        postRender();
        selected = null;
        fechaPosponer = null;
        horaPosponer = null;
        PrimeFaces.current().executeScript("PF('Dcita1').hide(); PF('Dcita').hide();");
        PrimeFaces.current().ajax().update("form", "d1", "d2");
    }

    public void consultar(boolean editar) {
        context = FacesContext.getCurrentInstance();
        try {
            context.getExternalContext().getSessionMap().put("cita", selected);
            context.getExternalContext().getSessionMap().put("editar", editar);
            context.getExternalContext().getSessionMap().put("ms",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Redirección exitosa",
                            "Ésta es la información contenida en la solicitud de cita psicológica que ested"
                            + " estaba viendo. A partir de aquí, realice la consulta médica."));
            context.getExternalContext().redirect("consultasPS.intex");
        } catch (IOException ex) {
        }
    }

    public Date getFechaPosponer() {
        return fechaPosponer;
    }

    public void setFechaPosponer(Date fechaPosponer) {
        this.fechaPosponer = fechaPosponer;
    }

    public Date getHoraPosponer() {
        return horaPosponer;
    }

    public void setHoraPosponer(Date horaPosponer) {
        this.horaPosponer = horaPosponer;
    }

    public List<Integer> getInvalidDays() {
        return Auxiliar.getDisabledDays();
    }

    public boolean isTerminada() {
        return selected == null ? false : selected.getEstado().equals("T");
    }

    public String getNombreEstudiante(CitaPsicologia c) {
        Persona e = c == null ? null : c.getEstudiante1().getPersona();
        return e == null ? "" : e.getPersonaNombre().split(" ")[0]
                + " " + e.getPersonaApellido().split(" ")[0];
    }

}
