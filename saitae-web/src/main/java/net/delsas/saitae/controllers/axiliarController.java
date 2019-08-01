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

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import net.delsas.prueba;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named(value = "axiliarController")
@ViewScoped
public class axiliarController implements Serializable{

    private static final long serialVersionUID = 1L;
       private final prueba auxiliar=new prueba();
       public static Persona p=new Persona(0);
       @EJB
       private PersonaFacadeLocal pfl;
       
    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();        
        try {
            auxiliar.setDui(query, p);
            for(Persona p : pfl.getByLikeId(p.getIdpersona())){
                results.add(p.getPersonaNombre()+" "
                        +p.getPersonaApellido()+"=>"+p.getIdpersona());
            }
            
        } catch (NumberFormatException p) {
            System.out.println(p.getMessage());
        }
        return results;
    }

    public void onItemSelect(SelectEvent event) {
        try{
        p=pfl.find(p.getIdpersona());
        }catch(Exception o){
            System.out.println("Error en maestroController.onItemSelect: "+o.getMessage());
        }
        FacesContext.getCurrentInstance().addMessage(null, 
                new FacesMessage("Selected", p.getPersonaNombre()));
    }
    
}
