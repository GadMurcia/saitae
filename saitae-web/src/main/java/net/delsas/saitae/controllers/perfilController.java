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
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AnuncioFacadeLocal;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class perfilController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private AnuncioFacadeLocal anuncioFL;

    private Persona usuario;
    private List<Anuncio> activos;
    private List<Anuncio> individual;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        individual = new ArrayList<>();
        try {
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (usuario == null) {
                context.getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                "Falla!", "Esa vista no le está permitida."));
                context.getExternalContext().redirect("./../");
            }
        } catch (IOException e) {

        }
    }

    public List<Anuncio> getIndividual() {
        individual.clear();
        Integer tp = usuario.getTipoPersona().getIdtipoPersona();
        individual = anuncioFL.getAnunciosActivos();
        activos = new ArrayList<>();
        if (!(tp == 1 || tp == 2)) {
            List<Integer> tps = new Auxiliar().getTiposPersonas(usuario);
            individual.stream()
                    .filter(a -> a.getAnuncioTipoPersona() != null)
                    .filter(a -> !tps.contains(a.getAnuncioTipoPersona().getIdtipoPersona()))
                    .forEach(activos::add);
            individual.removeAll(activos);
        }
        return Collections.unmodifiableList(individual);
    }

}
