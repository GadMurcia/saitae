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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacade;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.Pais;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipoReservaRecurso;
import net.delsas.saitae.entities.TipoReservaRecursoPK;

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
    
//Tipo Cargo
    @EJB
    private TipoCargoFacadeLocal tipocargoFL;
    private List<TipoCargo> tipocargolist;

//Pais
    @EJB
    private PaisFacadeLocal paisFL;
    private List<Pais> paislist;
//Tipo Reserva    
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    //private TipoReservaRecurso tipoReservaRecurso = new TipoReservaRecurso();
    //private TipoReservaRecursoPK tipoReservaRecursoPK = new TipoReservaRecursoPK();
    private List<TipoReserva> listaTipoReserva;
    private List<TipoReserva> seleccionTipoReserva;
    private List<TipoReservaRecurso> listaTipoReservaRecursos;

    //ejemplar
    
    
    
@PostConstruct
    public void init(){
    recurso = recursoFL.findAll();
    categorialist = categoriaFL.findAll();
    tiporecursolist = tiporecursoFL.findAll();
    tipocargolist = tipocargoFL.findAll();
    paislist = paisFL.findAll();
    listaTipoReserva = tipoReservaFL.findAll();
    Seleccionado = new Recurso();    
    Seleccionado.setCategoria(new Categoria(0,""));
    Seleccionado.setIdTipoRecurso(new TipoRecurso(0,""));
    Seleccionado.setTipoCargo(new TipoCargo(0, ""));
    Seleccionado.setPais(new Pais(0,""));
   
    
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
 public void agregarRecurso() {
        try {
            if (Seleccionado != null && Seleccionado!= null) {
                recursoFL.create(this.Seleccionado);                
                this.init();
                FacesContext.getCurrentInstance().addMessage(null, 
                        new FacesMessage("Creado con Exito!", null));
            } else {
                System.err.println("ESTA VACIA");
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
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

    public List<TipoCargo> getTipocargolist() {
        return tipocargolist;
    }

    public void setTipocargolist(List<TipoCargo> tipocargolist) {
        this.tipocargolist = tipocargolist;
    }

    public List<Pais> getPaislist() {
        return paislist;
    }

    public void setPaislist(List<Pais> paislist) {
        this.paislist = paislist;
    }

    public List<TipoReservaRecurso> getListaTipoReservaRecursos() {
        return listaTipoReservaRecursos;
    }

    public void setListaTipoReservaRecursos(List<TipoReservaRecurso> listaTipoReservaRecursos) {
        this.listaTipoReservaRecursos = listaTipoReservaRecursos;
    }

    public List<TipoReserva> getListaTipoReserva() {
        return listaTipoReserva;
    }

    public void setListaTipoReserva(List<TipoReserva> listaTipoReserva) {
        this.listaTipoReserva = listaTipoReserva;
    }



}