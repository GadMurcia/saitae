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

import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.prueba;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class matriculaController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private GradoFacadeLocal gradoFL;
    private List<Matricula> nuevasMatriculas;
    private Persona usuario;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        boolean r = usuario.getTipoPersona().getIdtipoPersona().equals(1) ? false
                : usuario.getTipoPersona().getIdtipoPersona().equals(2) ? false
                : !usuario.getTipoPersona().getIdtipoPersona().equals(13);
        if (r) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {

        }
    }

    public List<Matricula> getNuevasMatriculas() {
        return Collections.unmodifiableList(nuevasMatriculas);
    }

    public void setNuevasMatriculas(List<Matricula> nuevasMatriculas) {
        this.nuevasMatriculas = nuevasMatriculas;
    }

    

}
