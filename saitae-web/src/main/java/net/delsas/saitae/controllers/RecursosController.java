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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.beans.AutorFacadeLocal;
import net.delsas.saitae.beans.AutorLibroFacadeLocal;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.ContenidoLibroFacadeLocal;
import net.delsas.saitae.beans.EditorialFacadeLocal;
import net.delsas.saitae.beans.EditorialLibroFacadeLocal;
import net.delsas.saitae.beans.EjemplarFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipoReservaRecursoFacadeLocal;
import net.delsas.saitae.entities.Autor;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.AutorLibroPK;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.ContenidoLibro;
import net.delsas.saitae.entities.ContenidoLibroPK;
import net.delsas.saitae.entities.Editorial;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.EditorialLibroPK;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.EjemplarPK;
import net.delsas.saitae.entities.Pais;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipoReservaRecurso;
import net.delsas.saitae.entities.TipoReservaRecursoPK;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author gabriela
 */
@Named(value = "recursosController")
@ViewScoped
public class RecursosController implements Serializable {

    private static final long serialVersionUID = 1L;
    private boolean mostrar1 = false;

    //Recurso  
    @EJB
    private RecursoFacadeLocal recursoFL;
    private List<Recurso> recurso;
    private Recurso recursoEntity = new Recurso();
    private List<Recurso> filterRecurso;
    //Seleccion
    private Recurso SelectRecursos = new Recurso();
    private AutorLibro selectAutorLibro = new AutorLibro();
    private EditorialLibro selectEditorial = new EditorialLibro();
    private ContenidoLibro selectContenidoLibro = new ContenidoLibro();
    private TipoReservaRecurso selectTipoReserva = new TipoReservaRecurso();
    private Ejemplar selectEjemplar = new Ejemplar();
    //botones
    private boolean btnNewAutorLibro = true;
    private boolean btnAddAutorLibro = false;
    private boolean btnEditAutorLIbro = false;
    private boolean btncancelAutorLibro = false;
    //comparar si es libro
    private boolean isLibro = false;

    //Pais
    @EJB
    private PaisFacadeLocal paisFL;
    private List<Pais> listaPais;

    //Categoria
    @EJB
    private CategoriaFacadeLocal categoriaFL;
    private List<Categoria> categoria;

    //Tipo Recurso
    @EJB
    private TipoRecursoFacadeLocal tiporecursoFL;
    private List<TipoRecurso> tiporecurso;

    //TipoCargo;
    @EJB
    private TipoCargoFacadeLocal tipocargoFL;
    private List<TipoCargo> tipocargo;

    //Ejemplar
    @EJB
    private EjemplarFacadeLocal ejemplarFL;
    private Ejemplar ejemplarEntity = new Ejemplar();
    private EjemplarPK ejemplarPK = new EjemplarPK();
    private List<Ejemplar> listaEjemplares;

    //ContenidoLibro
    @EJB
    private ContenidoLibroFacadeLocal contenidolibroFL;
    private List<ContenidoLibro> listacontenidolibro;
    private ContenidoLibro contenidolibro = new ContenidoLibro();
    private ContenidoLibro contenidoLibroEntity = new ContenidoLibro();
    private ContenidoLibroPK contenidoLibroPK = new ContenidoLibroPK();

    //EditorialLibro
    @EJB
    private EditorialFacadeLocal editorialFL;
    @EJB
    private EditorialLibroFacadeLocal editorialLibroFL;
    private EditorialLibro editorialLibro = new EditorialLibro();
    private EditorialLibroPK editorialLibroPK = new EditorialLibroPK();
    private List<Editorial> listaEditorial;
    private List<EditorialLibro> listaEditorialLibros;

    //Autor Libro
    @EJB
    private AutorFacadeLocal autorFL;
    @EJB
    private AutorLibroFacadeLocal autorLibroFL;
    private AutorLibro autorLibro = new AutorLibro();
    private AutorLibroPK autorLibroPK = new AutorLibroPK();
    private List<Autor> listaAutores;
    private List<AutorLibro> listaAutorLibros;

    //Tipo Reserva Recurso
    @EJB
    private TipoReservaRecursoFacadeLocal tipoReservaRecursoFL;
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    private TipoReservaRecurso tipoReservaRecurso = new TipoReservaRecurso();
    private TipoReservaRecursoPK tipoReservaRecursoPK = new TipoReservaRecursoPK();
    private List<TipoReserva> listaTipoReserva;
    private List<TipoReserva> seleccionTipoReserva;
    private List<TipoReservaRecurso> listaTipoReservaRecursos;

    //Lista de Pruebas (Solo Debug)
    private List<AutorLibro> listaPrueba;

    @PostConstruct
    public void init() {
        recurso = recursoFL.findAll();
        listaPais = paisFL.findAll();
        categoria = categoriaFL.findAll();
        tiporecurso = tiporecursoFL.findAll();
        tipocargo = tipocargoFL.findAll();
        listaAutores = autorFL.findAll();
        listaEditorial = editorialFL.findAll();
        listaTipoReserva = tipoReservaFL.findAll();

    }

    public void crear() {
        this.recursoEntity.setActivo(true);

        try {
            if (this.recursoEntity != null && this.recursoEntity != null) {
                recursoFL.create(this.recursoEntity);
                this.crearEjemplar();
                this.crearEditorial();
                this.crearAutor();
                this.crearContenidolibro();
                this.crearTipoReservaRecurso();
                this.nuevo();
                recurso = recursoFL.findAll();

                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Creado con Exito!", null));
            } else {
                System.err.println("ESTA VACIAAAAA LA ENTITTY");
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void onRowSelect(SelectEvent evento) {
        this.recursoEntity = this.SelectRecursos;

        listaAutorLibros = autorLibroFL.findByIdRecruso(recursoEntity.getIdrecurso());
        listaEditorialLibros = editorialLibroFL.findByIdRecruso(recursoEntity.getIdrecurso());
        listaEjemplares = ejemplarFL.findByIdRecruso(recursoEntity.getIdrecurso());
        listaTipoReservaRecursos = tipoReservaRecursoFL.findByIdRecruso(recursoEntity.getIdrecurso());
        listacontenidolibro = contenidolibroFL.findByIdRecruso(recursoEntity.getIdrecurso());

        if (this.recursoEntity.getIdTipoRecurso().getIdtipoRecurso() == 3) {
            this.isLibro = true;
        } else {
            this.isLibro = false;
        }

    }

    public void seleccionAutor(SelectEvent evento) {
        this.autorLibro = this.selectAutorLibro;
        this.btnEditAutorLIbro = true;
        this.btnAddAutorLibro = false;
        this.btncancelAutorLibro = true;
    }

    public void crearAutorLibro() {
        try {
            if (this.recursoEntity.getIdrecurso() == null || this.recursoEntity.getIdrecurso() == 0) {
                if (this.autorLibro != null && this.autorLibroFL != null) {
                    this.autorLibroPK.setIdLibro(this.recursoEntity.getIdrecurso());
                    this.autorLibroPK.setIdautor(this.autorLibro.getAutor().getIdautor());
                    this.autorLibro.setAutorLibroPK(this.autorLibroPK);
                    this.autorLibroFL.create(autorLibro);
                    this.listaAutorLibros = autorLibroFL.findByIdRecruso(recursoEntity.getIdrecurso());
                    this.autorLibro = new AutorLibro();
                    this.cancelAutorLibro();
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Creado con Exito!", null));
                } else {
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Debe seleccionar un recurso primero!", null));
                }
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void editarAutorLibro() {
        try {
            if (this.autorLibro != null && this.autorLibroFL != null) {
                this.autorLibroPK.setIdLibro(this.recursoEntity.getIdrecurso());
                this.autorLibroPK.setIdautor(this.autorLibro.getAutor().getIdautor());
                this.autorLibro.setAutorLibroPK(this.autorLibroPK);
                this.autorLibroFL.edit(autorLibro);
                this.listaAutorLibros = autorLibroFL.findByIdRecruso(recursoEntity.getIdrecurso());
                this.autorLibro = new AutorLibro();
                this.selectAutorLibro = new AutorLibro();
                this.cancelAutorLibro();
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Modificado con Exito!", null));
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void mostrarAddAutorLibro() {
        this.autorLibro = new AutorLibro();
        this.selectAutorLibro = new AutorLibro();
        this.btnAddAutorLibro = true;
        this.btncancelAutorLibro = true;
        this.btnEditAutorLIbro = false;
    }

    public void cancelAutorLibro() {
        this.btnAddAutorLibro = false;
        this.btncancelAutorLibro = false;
        this.btnAddAutorLibro = false;
    }

    public void update() {
        try {
            if (this.recursoEntity != null && this.recursoFL != null) {
                this.recursoFL.edit(this.recursoEntity);
                recurso = recursoFL.findAll();

//                this.ejemplarFL.edit(this.ejemplarEntity);
//                this.tipoReservaRecursoFL.edit(this.tipoReservaRecurso);
//                this.autorLibroFL.edit(this.autorLibro);
                this.nuevo();
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Moficiado con Exito!", null));

            } else {
                System.err.println("La entity esta vacia revisar");
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void crearEjemplar() {
        try {
            Date fecha = new Date();
            this.ejemplarEntity.setRecurso(this.recursoEntity);
            this.ejemplarEntity.setEjemplarAnioDeIngreso(fecha.getYear());
            this.ejemplarEntity.setEjemplarComentario("Agregado");
            this.ejemplarPK.setIdRecurso(this.recursoEntity.getIdrecurso());
            this.ejemplarPK.setEjemplarCorrelativo(1);
            this.ejemplarEntity.setEjemplarPK(ejemplarPK);

            this.ejemplarFL.create(this.ejemplarEntity);
            this.ejemplarEntity = new Ejemplar();
            this.ejemplarPK = new EjemplarPK();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void crearEditorial() {
        try {
            this.editorialLibro.setEditorialLibroComentario("Agregado");
            this.editorialLibroPK.setIdLibro(this.recursoEntity.getIdrecurso());
            this.editorialLibroPK.setIdeditorial(this.editorialLibro.getEditorial().getIdeditorial());
            this.editorialLibro.setEditorialLibroPK(this.editorialLibroPK);
            this.editorialLibroFL.create(this.editorialLibro);
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void crearAutor() {
        try {

            this.autorLibro.setAutorLibrocComentario("");
            this.autorLibroPK.setIdLibro(this.recursoEntity.getIdrecurso());
            this.autorLibroPK.setIdautor(this.autorLibro.getAutor().getIdautor());

            this.autorLibro.setAutorLibroPK(this.autorLibroPK);
            this.autorLibroFL.create(this.autorLibro);

        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void crearContenidolibro() {
        try {
            this.contenidolibro.setContenidoLibroComentario("");
            this.contenidoLibroPK.setIdLibro(this.recursoEntity.getIdrecurso());

            this.contenidoLibroEntity.setContenidoLibroPK(contenidoLibroPK);
            this.contenidolibroFL.create(this.contenidoLibroEntity);
            this.contenidoLibroEntity = new ContenidoLibro();
            this.contenidoLibroPK = new ContenidoLibroPK();

        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }

    }

    public void crearTipoReservaRecurso() {
        try {
            for (TipoReserva tipoReserva : seleccionTipoReserva) {
                this.tipoReservaRecurso.setTipoReservaRecursoComentario("");
                this.tipoReservaRecursoPK.setTipoRecurso(this.recursoEntity.getIdrecurso());
                this.tipoReservaRecursoPK.setTipoReserva(tipoReserva.getIdtipoReserva());
                this.tipoReservaRecurso.setTipoReservaRecursoPK(this.tipoReservaRecursoPK);
                this.tipoReservaRecursoFL.create(this.tipoReservaRecurso);
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }

    }

    public void nuevo() {
        this.recursoEntity = new Recurso();
    }

    public List<Recurso> getRecurso() {
        return recurso;
    }

    public void setRecurso(List<Recurso> recurso) {
        this.recurso = recurso;
    }

    public List<Pais> getListaPais() {
        return listaPais;
    }

    public void setListaPais(List<Pais> listaPais) {
        this.listaPais = listaPais;
    }

    public List<Categoria> getCategoria() {
        return categoria;
    }

    public void setCategoria(List<Categoria> categoria) {
        this.categoria = categoria;
    }

    public List<TipoRecurso> getTiporecurso() {
        return tiporecurso;
    }

    public void setTiporecurso(List<TipoRecurso> tiporecurso) {
        this.tiporecurso = tiporecurso;
    }

    public List<TipoCargo> getTipocargo() {
        return tipocargo;
    }

    public void setTipocargo(List<TipoCargo> tipocargo) {
        this.tipocargo = tipocargo;
    }

    public RecursoFacadeLocal getRecursoFL() {
        return recursoFL;
    }

    public void setRecursoFL(RecursoFacadeLocal recursoFL) {
        this.recursoFL = recursoFL;
    }

    public PaisFacadeLocal getPaisFL() {
        return paisFL;
    }

    public void setPaisFL(PaisFacadeLocal paisFL) {
        this.paisFL = paisFL;
    }

    public CategoriaFacadeLocal getCategoriaFL() {
        return categoriaFL;
    }

    public void setCategoriaFL(CategoriaFacadeLocal categoriaFL) {
        this.categoriaFL = categoriaFL;
    }

    public TipoRecursoFacadeLocal getTiporecursoFL() {
        return tiporecursoFL;
    }

    public void setTiporecursoFL(TipoRecursoFacadeLocal tiporecursoFL) {
        this.tiporecursoFL = tiporecursoFL;
    }

    public TipoCargoFacadeLocal getTipocargoFL() {
        return tipocargoFL;
    }

    public void setTipocargoFL(TipoCargoFacadeLocal tipocargoFL) {
        this.tipocargoFL = tipocargoFL;
    }

    public Recurso getRecursoEntity() {
        return recursoEntity;
    }

    public void setRecursoEntity(Recurso recursoEntity) {
        this.recursoEntity = recursoEntity;
    }

    public Ejemplar getEjemplarEntity() {
        return ejemplarEntity;
    }

    public void setEjemplarEntity(Ejemplar ejemplarEntity) {
        this.ejemplarEntity = ejemplarEntity;
    }

    public boolean isMostrar1() {
        return mostrar1;
    }

    public void setMostrar1(boolean mostrar1) {
        this.mostrar1 = mostrar1;
    }

    public ContenidoLibro getContenidoLibroEntity() {
        return contenidoLibroEntity;
    }

    public void setContenidoLibroEntity(ContenidoLibro contenidoLibroEntity) {
        this.contenidoLibroEntity = contenidoLibroEntity;
    }

    public EditorialLibro getEditorialLibro() {
        return editorialLibro;
    }

    public void setEditorialLibro(EditorialLibro editorialLibro) {
        this.editorialLibro = editorialLibro;
    }

    public AutorLibro getAutorLibro() {
        return autorLibro;
    }

    public void setAutorLibro(AutorLibro autorLibro) {
        this.autorLibro = autorLibro;
    }

    public List<Editorial> getListaEditorial() {
        return listaEditorial;
    }

    public void setListaEditorial(List<Editorial> listaEditorial) {
        this.listaEditorial = listaEditorial;
    }

    public List<Autor> getListaAutores() {
        return listaAutores;
    }

    public void setListaAutores(List<Autor> listaAutores) {
        this.listaAutores = listaAutores;
    }

    public ContenidoLibroPK getContenidoLibroPK() {
        return contenidoLibroPK;
    }

    public void setContenidoLibroPK(ContenidoLibroPK contenidoLibroPK) {
        this.contenidoLibroPK = contenidoLibroPK;
    }

    public EjemplarPK getEjemplarPK() {
        return ejemplarPK;
    }

    public void setEjemplarPK(EjemplarPK ejemplarPK) {
        this.ejemplarPK = ejemplarPK;
    }

    public EditorialLibroPK getEditorialLibroPK() {
        return editorialLibroPK;
    }

    public void setEditorialLibroPK(EditorialLibroPK editorialLibroPK) {
        this.editorialLibroPK = editorialLibroPK;
    }

    public AutorLibroPK getAutorLibroPK() {
        return autorLibroPK;
    }

    public void setAutorLibroPK(AutorLibroPK autorLibroPK) {
        this.autorLibroPK = autorLibroPK;
    }

    public TipoReservaRecurso getTipoReservaRecurso() {
        return tipoReservaRecurso;
    }

    public void setTipoReservaRecurso(TipoReservaRecurso tipoReservaRecurso) {
        this.tipoReservaRecurso = tipoReservaRecurso;
    }

    public TipoReservaRecursoPK getTipoReservaRecursoPK() {
        return tipoReservaRecursoPK;
    }

    public void setTipoReservaRecursoPK(TipoReservaRecursoPK tipoReservaRecursoPK) {
        this.tipoReservaRecursoPK = tipoReservaRecursoPK;
    }

    public List<TipoReserva> getListaTipoReserva() {
        return listaTipoReserva;
    }

    public void setListaTipoReserva(List<TipoReserva> listaTipoReserva) {
        this.listaTipoReserva = listaTipoReserva;
    }

    public List<TipoReserva> getSeleccionTipoReserva() {
        return seleccionTipoReserva;
    }

    public void setSeleccionTipoReserva(List<TipoReserva> seleccionTipoReserva) {
        this.seleccionTipoReserva = seleccionTipoReserva;
    }

    public List<Recurso> getFilterRecurso() {
        return filterRecurso;
    }

    public void setFilterRecurso(List<Recurso> filterRecurso) {
        this.filterRecurso = filterRecurso;
    }

    public Recurso getSelectRecursos() {
        return SelectRecursos;
    }

    public void setSelectRecursos(Recurso SelectRecursos) {
        this.SelectRecursos = SelectRecursos;
    }

    public List<ContenidoLibro> getListacontenidolibro() {
        return listacontenidolibro;
    }

    public void setListacontenidolibro(List<ContenidoLibro> listacontenidolibro) {
        this.listacontenidolibro = listacontenidolibro;
    }

    public List<AutorLibro> getListaPrueba() {
        return listaPrueba;
    }

    public void setListaPrueba(List<AutorLibro> listaPrueba) {
        this.listaPrueba = listaPrueba;
    }

    public List<Ejemplar> getListaEjemplares() {
        return listaEjemplares;
    }

    public void setListaEjemplares(List<Ejemplar> listaEjemplares) {
        this.listaEjemplares = listaEjemplares;
    }

    public List<EditorialLibro> getListaEditorialLibros() {
        return listaEditorialLibros;
    }

    public void setListaEditorialLibros(List<EditorialLibro> listaEditorialLibros) {
        this.listaEditorialLibros = listaEditorialLibros;
    }

    public List<AutorLibro> getListaAutorLibros() {
        return listaAutorLibros;
    }

    public void setListaAutorLibros(List<AutorLibro> listaAutorLibros) {
        this.listaAutorLibros = listaAutorLibros;
    }

    public List<TipoReservaRecurso> getListaTipoReservaRecursos() {
        return listaTipoReservaRecursos;
    }

    public void setListaTipoReservaRecursos(List<TipoReservaRecurso> listaTipoReservaRecursos) {
        this.listaTipoReservaRecursos = listaTipoReservaRecursos;
    }

    public AutorLibro getSelectAutorLibro() {
        return selectAutorLibro;
    }

    public void setSelectAutorLibro(AutorLibro selectAutorLibro) {
        this.selectAutorLibro = selectAutorLibro;
    }

    public EditorialLibro getSelectEditorial() {
        return selectEditorial;
    }

    public void setSelectEditorial(EditorialLibro selectEditorial) {
        this.selectEditorial = selectEditorial;
    }

    public ContenidoLibro getSelectContenidoLibro() {
        return selectContenidoLibro;
    }

    public void setSelectContenidoLibro(ContenidoLibro selectContenidoLibro) {
        this.selectContenidoLibro = selectContenidoLibro;
    }

    public TipoReservaRecurso getSelectTipoReserva() {
        return selectTipoReserva;
    }

    public void setSelectTipoReserva(TipoReservaRecurso selectTipoReserva) {
        this.selectTipoReserva = selectTipoReserva;
    }

    public boolean isBtnNewAutorLibro() {
        return btnNewAutorLibro;
    }

    public void setBtnNewAutorLibro(boolean btnNewAutorLibro) {
        this.btnNewAutorLibro = btnNewAutorLibro;
    }

    public boolean isBtnAddAutorLibro() {
        return btnAddAutorLibro;
    }

    public void setBtnAddAutorLibro(boolean btnAddAutorLibro) {
        this.btnAddAutorLibro = btnAddAutorLibro;
    }

    public boolean isBtnEditAutorLIbro() {
        return btnEditAutorLIbro;
    }

    public void setBtnEditAutorLIbro(boolean btnEditAutorLIbro) {
        this.btnEditAutorLIbro = btnEditAutorLIbro;
    }

    public boolean isBtncancelAutorLibro() {
        return btncancelAutorLibro;
    }

    public void setBtncancelAutorLibro(boolean btncancelAutorLibro) {
        this.btncancelAutorLibro = btncancelAutorLibro;
    }

    public boolean isIsLibro() {
        return isLibro;
    }

    public void setIsLibro(boolean isLibro) {
        this.isLibro = isLibro;
    }

    public Ejemplar getSelectEjemplar() {
        return selectEjemplar;
    }

    public void setSelectEjemplar(Ejemplar selectEjemplar) {
        this.selectEjemplar = selectEjemplar;
    }

}
