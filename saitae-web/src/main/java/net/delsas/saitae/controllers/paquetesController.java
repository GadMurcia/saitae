/*
 * Copyright (C) 2019 gabriela
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
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author gabriela
 */
@Named(value = "paquetesController")

@ViewScoped
public class paquetesController implements Serializable {
  @EJB
  private EstudianteFacadeLocal estudianteFL;
  private Estudiante estudiante;
  private String est;
  
  
    

    private static final long serialVersionUID = 1L;

    
 public List<String> completeText(String query) {
        List<String> results = new ArrayList<String>();
       
         
        return results;
    }
 public void onItemSelect(SelectEvent event) {
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Alumno seleccionado", event.getObject().toString()));
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    
 
}
