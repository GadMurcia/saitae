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

import net.delsas.saitae.ax.orden;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.entities.Notificaciones;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class notifhController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private NotificacionesFacadeLocal nitiFL;
    private List<orden> notificaciones;
    private List<orden> notifFilradas;
    private Persona user;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        user = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        if (user == null) {
            try {
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                System.out.println("error: " + ex);
            }
        } else {
            List<Notificaciones> nots = nitiFL.getNotificacionesByIdDestinatario(user.getIdpersona());
            Collections.sort(nots, (Notificaciones o1, Notificaciones o2) -> o2.getFechaHora().hashCode() - o1.getFechaHora().hashCode());
            notifFilradas = new ArrayList<>();
            notificaciones = new ArrayList<>();
            nots.forEach((n) -> {
                notificaciones.add(new orden(n));
            });
        }
    }

    public List<orden> getNotificaciones() {
        return Collections.unmodifiableList(notificaciones);
    }

    public List<orden> getNotifFilradas() {
        return Collections.unmodifiableList(notifFilradas);
    }

    public void setNotifFilradas(List<orden> notifFilradas) {
        this.notifFilradas = notifFilradas;
    }

}
