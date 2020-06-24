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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class ayudaController implements Serializable {

    private final String prefijo = "https://www.youtube.com/watch?v=";
    private List<Acceso> accesos;
    private List<String> videos;
    private Acceso Selected;
    @EJB
    private AccesoTipoPersonaFacadeLocal acFL;
    private Persona us;

    @PostConstruct
    public void init() {
        accesos = new ArrayList<>();
        videos = new ArrayList<>();
        Acceso a = new Acceso(0, "Introducción a SAITAE", "#");
        a.setYouTubeUrl("zu4mpRJzd58");
        accesos.add(a);
        Selected = a;
        onSelectTutorial(null);
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            us = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (us == null) {
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se ha logueado."));
                context.getExternalContext().redirect("./../");
            }
            Optional.ofNullable(us).ifPresent(u -> {
                u.getTipoPersona().getAccesoTipoPersonaList().stream()
                        .map(z -> z.getAcceso())
                        .filter(z -> z.getYouTubeUrl() != null
                        && !z.getYouTubeUrl().isEmpty()
                        && !accesos.contains(z))
                        .forEachOrdered(accesos::add);
            });
            Collections.sort(accesos, (Acceso a0, Acceso a1) -> {
                String c1 = Optional.ofNullable(a0.getAccesoIndice()).orElseGet(() -> new Acceso(0, "", "")).getAccesoNombre() + " -> " + a0.getAccesoNombre();
                String c2 = Optional.ofNullable(a1.getAccesoIndice()).orElseGet(() -> new Acceso(0, "", "")).getAccesoNombre() + " -> " + a1.getAccesoNombre();
                return c1.hashCode() - c2.hashCode();
            });
        } catch (IOException e) {
        }
    }

    public void onSelectTutorial(SelectEvent e) {
        videos.clear();
        videos.addAll(Arrays.asList(Selected.getYouTubeUrl().split(";")));
    }

    public List<String> getVideos() {
        return videos;
    }

    public List<Acceso> getAccesos() {
        return accesos;
    }

    public Acceso getSelected() {
        return Selected;
    }

    public void setSelected(Acceso Selected) {
        this.Selected = Selected;
    }

}
