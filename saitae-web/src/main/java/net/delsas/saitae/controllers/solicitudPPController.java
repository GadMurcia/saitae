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

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.ProyectoPedagogicoFacadeLocal;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.ProyectoPedagogico;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.FlowEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class solicitudPPController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ProyectoPedagogicoFacadeLocal ppFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;

    private ProyectoPedagogico proyecto;
    private Persona usuario;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance()
                .getExternalContext().getSessionMap().get("usuario");
        proyecto = new ProyectoPedagogico();
        String n = usuario.getPersonaNombre().split(" ")[0] + " " + usuario.getPersonaApellido().split(" ")[0];
        proyecto.setProyectoPedagogicoComentario(n + "¿¿0¿¿¿¿ ");
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    private void persistirNotificación(mensaje x, List<Persona> ps) {
        ps.forEach((p) -> {
            persistirNotificación(x, p);
        });
    }

    public void sendMessage(String message) {
        notificacion.send(message);
    }

    private void persistirNotificación(mensaje x, Persona ps) {
        x.setDestinatario(ps.getIdpersona());
        x.setRemitente(usuario.getIdpersona());
        x.getNotificacion().setFechaHora(new Date());
        sendMessage(x.toString());
        try {
            System.out.println("caracteres en el cuerpo: " + x.getNotificacion().getNotificacionCuerpo().split("").length);
            System.out.println(new SimpleDateFormat("EEEEE dd/MMM/yyyy HH:mm a").format(x.getNotificacion().getFechaHora()));
            notiFL.create(x.getNotificacion());
            System.out.println("notificación enviada " + x.getNotificacion().getFechaHora());
        } catch (Exception e) {
            try {
                notiFL.edit(x.getNotificacion());
            } catch (Exception ex) {
                System.out.println("doble error:\n" + e + "\n" + ex);
            }
        }
    }

    public ProyectoPedagogico getProyecto() {
        return proyecto;
    }

    public void setProyecto(ProyectoPedagogico proyecto) {
        this.proyecto = proyecto;
    }

    public String getResponsable() {
        return proyecto.getProyectoPedagogicoComentario().split("¿¿")[0];
    }

    public void setCom(Integer ind, String v) {
        String c[] = proyecto.getProyectoPedagogicoComentario().split("¿¿");
        String rr = "";
        for (Integer y = 0; y < c.length; y++) {
            rr += (y > 0 ? "¿¿" : "") + (Objects.equals(y, ind) ? v : c[y]);
        }
        proyecto.setProyectoPedagogicoComentario(rr);
        System.out.println("Se guardó " + ind + " en el indice " + ind + ". Cadena total: " + rr);
    }

    public void setJornadas(int j) {
        setCom(1, j + "");
    }

    public int getJornadas() {
        return Integer.valueOf(proyecto.getProyectoPedagogicoComentario().split("¿¿")[1]);
    }

    public void guardar() {
        System.out.println(proyecto);
    }

}
