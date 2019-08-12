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
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacade;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoRecurso;

/**
 *
 * @author gabriela
 */
@Named
@ViewScoped

public class RecursoController implements Serializable {
      private static final long serialVersionUID = 1L;

//Recurso
    @EJB
    private RecursoFacadeLocal recursoFL;
    private List<Recurso> recurso;
    private Recurso Seleccionado;
    
//Categoria
    @EJB
    private CategoriaFacadeLocal categoriaFL;
    private List<Categoria> categorialist;
    
//Tipo Recurso
    @EJB
    private TipoRecursoFacadeLocal tiporecursoFL;
    private List<TipoRecurso> tiporecursolist;
    
    
    
@PostConstruct
    public void init(){
    recurso = recursoFL.findAll();
    categorialist = categoriaFL.findAll();
    tiporecursolist = tiporecursoFL.findAll();
    Seleccionado = new Recurso();
    
    
    
}
    
    
    public String  AutorLibro(List<AutorLibro> listautorlibro){
        String autores ="";
        for(AutorLibro al : listautorlibro){
        autores+= al.getAutor().getAutorNombre()+ "-";
        if(listautorlibro.indexOf(al)>0){
            autores+=", ";
           
        }
         autores+= al.getAutor().getAutorNombre();
        }
        
        
        return autores;
    }
    
    public String EditorialLibro(List<EditorialLibro> listeditoriallibro){
        String editoriales ="";
        for(EditorialLibro el : listeditoriallibro){
        editoriales+= el.getEditorial().getEditorialNombre()+"-";
        if(listeditoriallibro.indexOf(el)>0){
            editoriales+=", ";
        }
         editoriales+= el.getEditorial().getEditorialNombre();
        }
        
    
        return editoriales;
    }

    
    
    
    public List<Recurso> getRecurso() {
        return recurso;
    }

    public void setRecurso(List<Recurso> recurso) {
        this.recurso = recurso;
    }

    public Recurso getSeleccionado() {
        return Seleccionado;
    }

    public void setSeleccionado(Recurso Seleccionado) {
        this.Seleccionado = Seleccionado;
    }

    public List<Categoria> getCategorialist() {
        return categorialist;
    }

    public void setCategorialist(List<Categoria> categorialist) {
        this.categorialist = categorialist;
    }

    public List<TipoRecurso> getTiporecursolist() {
        return tiporecursolist;
    }

    public void setTiporecursolist(List<TipoRecurso> tiporecursolist) {
        this.tiporecursolist = tiporecursolist;
    }



}
