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
import net.delsas.saitae.beans.AnuncioFacadeLocal;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.MaestoCargo;
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
            } else {
                activos = anuncioFL.getAnunciosActivos();
                Integer tp = usuario.getTipoPersona().getIdtipoPersona();
                individual = (tp == 1 || tp == 2) ? activos
                        : anuncioFL.getAnunciosActivosParaUnTipo(usuario.getTipoPersona());
                individual = individual == null ? new ArrayList<>() : individual;
                if (!(tp == 1 || tp == 2)) {
                    activos.stream().filter((an) -> (an.getAnuncioTipoPersona() == null || an.getAnuncioTipoPersona() == usuario.getTipoPersona())).forEachOrdered((an) -> {
                        individual.add(an);
                    });
                }
                if (usuario.getMaestro() != null) {
                    List<MaestoCargo> mcl = usuario.getMaestro().getMaestoCargoList();
                    mcl.forEach((mc) -> {
                        individual.addAll(anuncioFL.getAnunciosActivosParaUnTipo(mc.getCargo().getCargoTipoPersona()));
                    });
                }

            }
        } catch (IOException e) {

        }
    }
    
    public List<Anuncio> getIndividual() {
        return Collections.unmodifiableList(individual);
    }

}
