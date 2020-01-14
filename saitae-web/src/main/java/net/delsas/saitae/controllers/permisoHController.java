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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class permisoHController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private PermisosFacadeLocal psFL;
    private List<Permisos> permisos;
    private Permisos selected;
    private Persona usuario;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        permisos = psFL.findByIpPersona(usuario.getIdpersona());
    }

    public List<Permisos> getPermisos() {
        return Collections.unmodifiableList(permisos);
    }

    public Permisos getSelected() {
        return selected;
    }

    public void setSelected(Permisos selected) {
        this.selected = selected;
    }

    public String getFechas(Date d) {
        return d == null ? "" : new SimpleDateFormat("dd/MM/yyyy").format(d);
    }

    public String getFechas(Date d1, Date d2) {
        if (d1 == null || d2 == null) {
            return "";
        } else if (d1.equals(d2)) {
            return new SimpleDateFormat("dd/MM/yyyy").format(d1);
        } else {
            return new SimpleDateFormat("dd/MM/yyyy").format(d1) + " - " + new SimpleDateFormat("dd/MM/yyyy").format(d2);
        }

    }

    public String getEstado(String e) {
        System.out.println(e);
        return e == null ? "" : (e.equals("0") ? "Solicitado" : (e.equals("1") ? "Aceptado" : (e.equals("2") ? "Rechazado" : "????")));
    }

}
