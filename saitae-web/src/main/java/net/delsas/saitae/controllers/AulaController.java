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
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.AulaFacadeLocal;
import net.delsas.saitae.beans.ZonaFacadeLocal;
import net.delsas.saitae.entities.Aula;
import net.delsas.saitae.entities.Zona;
import org.primefaces.event.CellEditEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;


/**
 *
 * @author gabriela
 */
@Named(value = "aulaController")
@ViewScoped

public class AulaController implements Serializable {
 private static final long serialVersionUID = 1L;

    /**
     * Creates a new instance of zonaController
     */
    @EJB
    private AulaFacadeLocal afl;
    @EJB
    private ZonaFacadeLocal zfl;
    private List<Aula> aulas;

    @PostConstruct
    public void aulaController() {
       
        aulas= afl.findAll();
        aulas = aulas != null || !aulas.isEmpty() ? aulas : new ArrayList<Aula>();
    }
    

    public List<Aula> getAulas() {
        return aulas;
    }

    public void setAulas(List<Aula> aulas) {
        this.aulas= aulas;
    }

    
    
    public void onCellEdit(CellEditEvent event) {
        Object oldValue = event.getOldValue();
        Object newValue = event.getNewValue();
        
        if (newValue != null && !newValue.equals(oldValue)) {
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Cell Changed",
                    "Old: " + oldValue + ", New:" + newValue);
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
    }
    
     public void onAddNew() {
        // Add one new car to the table:
        Aula naula = new Aula(aulas.size() + 1);
        naula.setZonaAula(new Zona(0));
        aulas.add(naula);
        FacesMessage msg = new FacesMessage("New Aula added", naula.getIdaula() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }


    public void onRowEdit(RowEditEvent event) {
        Aula a = (Aula) event.getObject();
        a.setZonaAula(zfl.find(a.getZonaAula().getIdzona()));
        afl.edit(a);
        FacesMessage msg = new FacesMessage("Aula Edited", ((Aula) event.getObject()).getIdaula() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        Aula a= (Aula) event.getObject();
        if(a.getZonaAula().getZonaNombre()==null||a.getZonaAula().getZonaNombre().isEmpty()){
            aulas.remove(aulas.indexOf(a));
        }
        FacesMessage msg = new FacesMessage("Edit Cancelled", ((Aula) event.getObject()).getIdaula() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    
    public void onSelectEvent(Object event){
        System.out.println("Evento: "+event.toString());
    }

    public List<SelectItem> getListaZonas(){
    List<SelectItem> ListaZonas = new ArrayList<>();
    List<Zona> ZonasArray = zfl.findAll();
    for(Zona z: ZonasArray){
    ListaZonas.add(new SelectItem(z.getIdzona(), z.getZonaNombre()));
    }
    return ListaZonas;
    
    }
}

