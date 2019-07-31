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
import javax.faces.model.SelectItem;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.entities.Pais;
import net.delsas.saitae.entities.Recurso;

/**
 *
 * @author gabriela
 */
@Named(value = "recursosController")
@ViewScoped
public class RecursosController implements Serializable{

    private static final long serialVersionUID = 1L;

  @EJB
  private RecursoFacadeLocal recursoFL;
  private Recurso recurso;
 
  
  @EJB
  private PaisFacadeLocal paisFL;
   private List<Pais> listaPais;
   private Pais pais;
   private String algo;
    
   
    
    
    @PostConstruct
    public void init() {
    listaPais = paisFL.findAll();
    }
   
       

    

    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    public List<Pais> getListaPais() {
        return listaPais;
    }

    public void setListaPais(List<Pais> listaPais) {
        this.listaPais = listaPais;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    

    

    public String getAlgo() {
        return algo;
    }

    public void setAlgo(String algo) {
        this.algo = algo;
    }

  
    
    
}
