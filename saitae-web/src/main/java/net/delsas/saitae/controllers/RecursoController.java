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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.ContenidoLibroFacadeLocal;
import net.delsas.saitae.beans.EjemplarFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacade;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.ContenidoLibro;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.EjemplarPK;
import net.delsas.saitae.entities.Pais;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipoReservaRecurso;
import net.delsas.saitae.entities.TipoReservaRecursoPK;
import org.primefaces.event.FlowEvent;

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
    private int ejemplares;
//Categoria
    @EJB
    private CategoriaFacadeLocal categoriaFL;
    private List<Categoria> categorialist;
    private Categoria cat;
//Tipo Recurso
    @EJB
    private TipoRecursoFacadeLocal tiporecursoFL;
    private List<TipoRecurso> tiporecursolist;
    private TipoRecurso tr;
//Tipo Cargo
    @EJB
    private TipoCargoFacadeLocal tipocargoFL;
    private List<TipoCargo> tipocargolist;
    private TipoCargo tipoCargo;
//Pais
    @EJB
    private PaisFacadeLocal paisFL;
    private List<Pais> paislist;
    private Pais pais;
//Tipo Reserva    
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    private List<TipoReserva> listaTipoReserva;
    private List<TipoReservaRecurso> listaTipoReservaRecursos;

    //ejemplar
    @EJB 
    private EjemplarFacadeLocal ejemplarFL;
    private List<Ejemplar> listaEjemplar;
    private int ejemplar; 
  //contenido libro
    
    //private ContenidoLibroFacadeLocal contenidolibroFL;
    private List<ContenidoLibro> contenido;
    private ContenidoLibro cl;
    //private boolean skip;
    private int indice; 
    
    @PostConstruct
    public void init() {
        recurso = recursoFL.findAll();
        categorialist = categoriaFL.findAll();
        tiporecursolist = tiporecursoFL.findAll();
        tipocargolist = tipocargoFL.findAll();
        paislist = paisFL.findAll();
        listaTipoReserva = tipoReservaFL.findAll();
        listaEjemplar = ejemplarFL.findAll();
        //contenido = contenidolibroFL.findAll();
        Seleccionado = new Recurso(0);
        ejemplares = 0;
        ejemplar = 0;
        indice = 0;
        cat = new Categoria(0, "");
        tr = new TipoRecurso(0, "");
        tipoCargo = new TipoCargo(0, "");
        pais = (new Pais(0, ""));
        cl = new ContenidoLibro();
        
        
      
    }
     public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public String AutorLibro(List<AutorLibro> listautorlibro) {
        String autores = "";
        for (AutorLibro al : listautorlibro) {
            autores += al.getAutor().getAutorNombre() + "-";
            if (listautorlibro.indexOf(al) > 0) {
                autores += ", ";

            }
            autores += al.getAutor().getAutorNombre();
        }

        return autores;
    }

    public String EditorialLibro(List<EditorialLibro> listeditoriallibro) {
        String editoriales = "";
        for (EditorialLibro el : listeditoriallibro) {
            editoriales += el.getEditorial().getEditorialNombre() + "-";
            if (listeditoriallibro.indexOf(el) > 0) {
                editoriales += ", ";
            }
            editoriales += el.getEditorial().getEditorialNombre();
        }

        return editoriales;
    }
    
    public void ejemplar (){
       List<Ejemplar> ej = new ArrayList<>();
               
  for(int i = 0; i<ejemplares; i++){
 Ejemplar e = new Ejemplar(new EjemplarPK(Seleccionado.getIdrecurso(), (Seleccionado.getIdrecurso()+i)));
    //e.getEjemplarPK().setIdRecurso(Seleccionado.getIdrecurso());
    e.setEjemplarAnioDeIngreso(ejemplar);
    e.setEjemplarComentario("");
    e.setRecurso(Seleccionado);
     ej.add(e);
    
  }  
  Seleccionado.setEjemplarList(ej);
  
  }

    public void agregarRecurso() {

        try {
            if (this.Seleccionado != null && this.Seleccionado.getIdrecurso() > 0) {
                Seleccionado.setCategoria(categoriaFL.find(cat.getIdcategoria()));
                Seleccionado.setPais(paisFL.find(pais.getIdpais()));
                Seleccionado.setIdTipoRecurso(tiporecursoFL.find(tr.getIdtipoRecurso()));
                Seleccionado.setTipoCargo(tipocargoFL.find(tipoCargo.getIdtipoCargo()));
                ejemplar();
                recursoFL.edit(this.Seleccionado);

                this.init();

                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Creado con Exito!", null));
            } else {
                System.err.println("ESTA VACIA");
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public int[] getTiposReservas() {
        List<TipoReservaRecurso> l = Seleccionado.getTipoReservaRecursoList();
        int[] a;
        if (l != null) {
            a = new int[l.size()];
            for (int i = 0; i < l.size(); i++) {
                a[i] = l.get(i).getTipoReserva1().getIdtipoReserva();
            }
        } else {
            a = new int[0];
        }
        return a;
    }

    public void setTiposReservas(int[] a) {
        List<TipoReservaRecurso> l = new ArrayList<>();
        for (int i : a) {
            TipoReservaRecurso trr = new TipoReservaRecurso(new TipoReservaRecursoPK(i, Seleccionado.getIdrecurso()));
            trr.setRecurso(Seleccionado);
            trr.setTipoReserva1(tipoReservaFL.find(i));
            trr.setTipoReservaRecursoComentario("");
            l.add(trr);
        }
        Seleccionado.setTipoReservaRecursoList(l);
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
        this.Seleccionado = Seleccionado == null ? new Recurso(0) : Seleccionado;
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

    public int getEjemplares() {
        return ejemplares;
    }

    public void setEjemplares(int ejemplares) {
        this.ejemplares = ejemplares;
    }

    public Categoria getCat() {
        return cat;
    }

    public void setCat(Categoria cat) {
        this.cat = cat;
    }

    public TipoRecurso getTr() {
        return tr;
    }

    public void setTr(TipoRecurso tr) {
        this.tr = tr;
    }

    public TipoCargo getTipoCargo() {
        return tipoCargo;
    }

    public void setTipoCargo(TipoCargo tipoCargo) {
        this.tipoCargo = tipoCargo;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public ContenidoLibro getCl() {
        return cl;
    }

    public void setCl(ContenidoLibro cl) {
        this.cl = cl;
    }

    

    

    public List<ContenidoLibro> getContenido() {
        return contenido;
    }

    public void setContenido(List<ContenidoLibro> contenido) {
        this.contenido = contenido;
    }

}
