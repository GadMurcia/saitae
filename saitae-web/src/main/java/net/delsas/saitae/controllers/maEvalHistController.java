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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.EvaluacionMaestroFacadeLocal;
import net.delsas.saitae.entities.EvaluacionMaestro;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class maEvalHistController extends Auxiliar implements Serializable {

    private List<EvaluacionMaestro> evaluaciones;
    private EvaluacionMaestro evSelected;    
    private Persona usuario;
    @EJB
    private EvaluacionMaestroFacadeLocal emFL;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        List<Integer> tps = getTiposPersonas(usuario);
        if (!tps.contains(4)) {
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
                    .put("mensaje",
                            new FacesMessage(
                                    FacesMessage.SEVERITY_FATAL,
                                    "Falla!",
                                    "Esa vista no le está permitida. Es sólo para maestros."));
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
            }
            return;
        }
        evaluaciones = emFL.findByIdMaestro(usuario.getIdpersona());
    }

    public List<EvaluacionMaestro> getEvaluaciones() {
        return evaluaciones;
    }

    public EvaluacionMaestro getEvSelected() {
        return evSelected;
    }

    public void setEvSelected(EvaluacionMaestro evSelected) {
        this.evSelected = evSelected;
    }
}
