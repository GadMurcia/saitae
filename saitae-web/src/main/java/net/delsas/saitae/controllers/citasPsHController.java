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
import java.text.SimpleDateFormat;
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
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
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
public class citasPsHController implements Serializable {
    
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
    
    private List<CitaPsicologia> citas;
    
    private CitaPsicologia selected;
    private Persona usuario;
    private FacesContext context;
    private String textoReserva;
    private Auxiliar ax;
    
    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        ax = new Auxiliar();
    }
    
    public void onDetalleRowSelect(SelectEvent event) {
        selected = (CitaPsicologia) event.getObject();
        textoReserva = ax.getEstadoCita1(selected.getEstado());
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
        return ax.getEstadoCita2(e);
    }
    
    public boolean isEstado(String e) {
        return selected == null ? false : selected.getEstado().equals(e);
    }
    
    public boolean getSePuedeEditar() {
        return selected == null ? false
                : (selected.getEstado().equals("S")
                || selected.getEstado().equals("P")
                || selected.getEstado().equals("C"));
    }
    
    public boolean getSePuedeCancelar() {
        return selected == null ? false
                : (selected.getEstado().equals("S")
                || selected.getEstado().equals("P"));
    }
    
    public boolean getSePuedeAceptar() {
        return selected == null ? false : selected.getEstado().equals("P");
    }
    
    public void aceptar() {
        cambiarEstado("A");
    }
    
    public void cancelar() {
        cambiarEstado("C");
    }
    
    public void cambiarEstado(String E) {
        if (selected != null) {
            selected.setEstado(E);
            cpsFL.edit(selected);
            String[] est = E.equals("C") ? new String[]{"Cancelación", "cancelad"}
                    : new String[]{"Aceptación", "aceptad"};
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, est[0] + " exitosa",
                            "La  " + est[0] + " se registró con éxito."));
            ax.persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "citasPSH<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, est[0] + " de cita",
                                    "Usted ha " + est[1] + "o "
                                    + (E.equals("C") ? "su solicitud" : "la propuesta")
                                    + " de cita con fecha "
                                    + getFechasToString(selected.getCitaPsicologiaPK().getFechaSolicitada())
                                    + " a las "
                                    + getHoraToString(selected.getCitaPsicologiaPK().getFechaSolicitada())
                                    + (E.equals("C") ? (". La razón de la " + est[0] + " es: " + selected.getComentarios()) : "")
                                    + ".")),
                    usuario, notiFL, notificacion);
            ax.persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "admCitasPs<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, est[0] + " de cita",
                                    "La solicitud de cita con fecha "
                                    + getFechasToString(selected.getCitaPsicologiaPK().getFechaSolicitada())
                                    + " a las "
                                    + getHoraToString(selected.getCitaPsicologiaPK().getFechaSolicitada())
                                    + " ha sido " + est[1] + "a por " + usuario.getPersonaNombre().split(" ")[0] + " "
                                    + usuario.getPersonaApellido().split(" ")[0]
                                    + (E.equals("C") ? (". La razón de la " + est[0] + " es: " + selected.getComentarios())
                                    : "") + ".")),
                    ax.getPersonasParaNotificar(tpFL.find(14)),
                    notiFL, notificacion);
            selected = null;
            PrimeFaces.current().executeScript("PF('Dcita1').hide();"
                    + "PF('Dcita').hide();");
            PrimeFaces.current().ajax().update(":form", "d1", "d2");
        }
    }
    
    public String getTextoReserva() {
        return textoReserva;
    }
    
    public int getAñoActual() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }
    
    public boolean getCancelado() {
        boolean ra = selected == null ? false : !selected.getComentarios().isEmpty();
        boolean v = selected != null ? selected.getEstado().equals("C") : false;
        return (ra && v);
    }
    
    public void vercita() {
        context = FacesContext.getCurrentInstance();
        try {
            context.getExternalContext().getSessionMap().put("cita", selected);
            context.getExternalContext().getSessionMap().put("ms",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Redirección exitosa",
                            "Ésta es la información contenida en la solicitud de cita psicológica que ested"
                            + " estaba viendo. Modifique si le parece necesario o actualice la página"
                            + " si quiere solicitar una cita diferente."));
            context.getExternalContext().redirect("solicitudCP.intex");
        } catch (IOException ex) {
        }
    }
    
    public List<CitaPsicologia> getCitas() {
        citas = cpsFL.findByEstudiante(usuario.getIdpersona());
        return Collections.unmodifiableList(citas);
    }
    
    public void setCitas(List<CitaPsicologia> citas) {
        this.citas = citas;
    }
    
    public CitaPsicologia getSelected() {
        return selected;
    }
    
    public void setSelected(CitaPsicologia selected) {
        this.selected = selected;
    }
    
    public boolean verMotivo() {
        return selected == null ? false : (selected.getComentarios() != null || !selected.getComentarios().isEmpty());
    }
    
}
