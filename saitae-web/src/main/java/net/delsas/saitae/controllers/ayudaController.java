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
//        Selected = new Acceso(0, "Introducción a SAITAE", "#");
//        Selected.setYouTubeUrl("zu4mpRJzd58");
//        accesos.add(Selected);
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            us = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (us == null) {
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se ha logueado."));
                context.getExternalContext().redirect("./../");
            }
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
        Optional.ofNullable(us).ifPresent(u -> {
            u.getTipoPersona().getAccesoTipoPersonaList().stream()
                    .map(z -> z.getAcceso())
                    .filter(z -> z.getYouTubeUrl() != null
                    && !z.getYouTubeUrl().isEmpty()
                    && !accesos.contains(z))
                    .forEachOrdered(c -> {
                        Acceso b = new Acceso(c.getIdacceso());
                        b.setAccesoNombre(((c.getIdacceso() != 1) ? c.getAccesoIndice().getAccesoNombre() + " - " : "") + c.getAccesoNombre());
                        b.setYouTubeUrl(c.getYouTubeUrl());
                        accesos.add(b);
                        if (c.getIdacceso() == 1) {
                            Selected = b;
                            onSelectTutorial(null);
                        }
                    });
        });
        Collections.sort(accesos, (Acceso a0, Acceso a1) -> {
            return String.CASE_INSENSITIVE_ORDER.compare(a0.getAccesoNombre(), a1.getAccesoNombre());
        });
        return accesos;
    }

    public Acceso getSelected() {
        return Selected;
    }

    public void setSelected(Acceso Selected) {
        this.Selected = Selected;
    }

}
