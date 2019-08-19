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

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.AutorFacadeLocal;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.EditorialFacadeLocal;
import net.delsas.saitae.beans.EjemplarFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
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
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipoReservaRecurso;
import net.delsas.saitae.entities.TipoReservaRecursoPK;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author gabriela
 */
@Named
@ViewScoped

public class RecursoController implements Serializable {

    private static final long serialVersionUID = 1L;
    //validación de usuarios
    private Persona usuario;
    private FacesContext context;
    private boolean verTipos, verOtrosPaneles, verBotonGuardarPanel1, verCategorias, verCategoriastabla;
    //FIn de validación de usuarios

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

    //contenidolibro
    private List<ContenidoLibro> contenido;
    private ContenidoLibro cl;

    //autores
    @EJB
    private AutorFacadeLocal autorFL;
    private List<Autor> autores;

    @EJB
    private EditorialFacadeLocal editorialFL;
    private List<Editorial> editoriales;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        initVariables();
        controlUsuarios();
    }

    private void initVariables() {
        categorialist = categoriaFL.findAll();
        tiporecursolist = tiporecursoFL.findAll();
        tipocargolist = tipocargoFL.findAll();
        paislist = paisFL.findAll();
        listaTipoReserva = tipoReservaFL.findAll();
        listaEjemplar = ejemplarFL.findAll();
        Seleccionado = new Recurso(0);
        ejemplares = 1;
        ejemplar = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
        cat = new Categoria(0, "");
        tr = new TipoRecurso(0, "");
        tipoCargo = new TipoCargo(0, "");
        pais = (new Pais(0, ""));
        cl = new ContenidoLibro(new ContenidoLibroPK(0, "", 0));
        contenido = new ArrayList<>();
        autores = autorFL.findAll();
        editoriales = editorialFL.findAll();
    }

    private void llenado(int tr, boolean verPaneles) {
        TipoRecurso tipor = tiporecursoFL.find(tr);
        Seleccionado.setIdTipoRecurso(tipor);
        recurso = tipor.getRecursoList();
        verTipos = false;
        verBotonGuardarPanel1 = !verPaneles;
        verOtrosPaneles = verPaneles;
        verCategorias = verPaneles;
        verCategoriastabla = verPaneles;
    }

    public void controlUsuarios() {
        try {
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            switch (usuario.getTipoPersona().getIdtipoPersona()) {
                case 1:
                case 2:
                    verTipos = true;
                    verCategorias = true;
                    verCategoriastabla = true;
                    recurso = recursoFL.findAll();
                    break;
                case 5:
                    llenado(3, true);
                    break;
                case 6:
                    llenado(1, false);
                    break;
                case 7:
                    llenado(2, false);
                    break;
                default:
                    context.getExternalContext().getSessionMap().put("mensaje",
                            new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                    "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                    context.getExternalContext().redirect("perfil.intex");
            }
        } catch (IOException ex) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error iniesperado",
                    (ex != null ? ex.getMessage() : "Error desconocido.")));
        }

    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public String AutorLibro(List<AutorLibro> listautorlibro) {
        String auts = "";
        for (AutorLibro al : listautorlibro) {
            if (listautorlibro.indexOf(al) > 0) {
                auts += ", ";
            }
            auts += al.getAutor().getAutorNombre();
        }
        return auts;
    }

    public String EditorialLibro(List<EditorialLibro> listeditoriallibro) {
        String edts = "";
        for (EditorialLibro el : listeditoriallibro) {
            if (listeditoriallibro.indexOf(el) > 0) {
                edts += ", ";
            }
            edts += el.getEditorial().getEditorialNombre();
        }
        return edts;
    }

    public void ejemplar() {
        List<Ejemplar> ej = new ArrayList<>();

        for (int i = 0; i < ejemplares; i++) {
            Ejemplar e = new Ejemplar(new EjemplarPK(Seleccionado.getIdrecurso(), (Seleccionado.getIdrecurso() + i)));
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
                if (Seleccionado.getIdTipoRecurso().getIdtipoRecurso() == 3) {
                    Seleccionado.setCategoria(categoriaFL.find(cat.getIdcategoria()));
                    Seleccionado.setPais(paisFL.find(pais.getIdpais()));
                    //Seleccionado.setIdTipoRecurso(tiporecursoFL.find(tr.getIdtipoRecurso()));
                    Seleccionado.setContenidoLibroList(contenido);
                }
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

    public Integer[] getTiposReservas() {
        List<TipoReservaRecurso> l = Seleccionado.getTipoReservaRecursoList();
        Integer[] a;
        if (l != null) {
            a = new Integer[l.size()];
            for (int i = 0; i < l.size(); i++) {
                a[i] = l.get(i).getTipoReserva1().getIdtipoReserva();
            }
        } else {
            a = new Integer[0];
        }
        return a;
    }

    public void setTiposReservas(Integer[] a) {
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

    public Integer[] getAutoresXlibro() {
        List<AutorLibro> l = Seleccionado.getAutorLibroList();
        Integer[] a;
        if (l != null) {
            a = new Integer[l.size()];
            for (int i = 0; i < l.size(); i++) {
                a[i] = l.get(i).getAutor().getIdautor();
            }
        } else {
            a = new Integer[0];
        }
        return a;
    }

    public void setAutoresXlibro(Integer[] a) {
        List<AutorLibro> l = new ArrayList<>();
        for (int i : a) {
            AutorLibro al = new AutorLibro(new AutorLibroPK(i, Seleccionado.getIdrecurso()));
            al.setRecurso(Seleccionado);
            al.setAutor(autorFL.find(i));
            al.setAutorLibrocComentario("");
            l.add(al);
        }
        Seleccionado.setAutorLibroList(l);
    }

    public Integer[] getEditorialesXlibro() {
        List<EditorialLibro> l = Seleccionado.getEditorialLibroList();
        Integer[] a;
        if (l != null) {
            a = new Integer[l.size()];
            for (int i = 0; i < l.size(); i++) {
                a[i] = l.get(i).getEditorial().getIdeditorial();
            }
        } else {
            a = new Integer[0];
        }
        return a;
    }

    public void setEditorialesXlibro(Integer[] a) {
        List<EditorialLibro> l = new ArrayList<>();
        for (int i : a) {
            EditorialLibro al = new EditorialLibro(new EditorialLibroPK(i, Seleccionado.getIdrecurso()));
            al.setRecurso(Seleccionado);
            al.setEditorial(editorialFL.find(i));
            al.setEditorialLibroComentario("");
            l.add(al);
        }
        Seleccionado.setEditorialLibroList(l);
    }

    public void cancelarEdicion() {
        init();
        PrimeFaces.current().ajax().update("form0", "form", "h1", "h2");
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
        if (Seleccionado == null) {
            TipoRecurso t = this.Seleccionado.getIdTipoRecurso();
            this.Seleccionado = new Recurso(0);
            if (t != null) {
                this.Seleccionado.setIdTipoRecurso(t);
            } else {
                init();
            }
        } else {
            this.Seleccionado = Seleccionado;
            cat = Seleccionado.getCategoria();
            tr = Seleccionado.getIdTipoRecurso();
            tipoCargo = Seleccionado.getTipoCargo();
            pais = Seleccionado.getPais();
            contenido = Seleccionado.getContenidoLibroList();
            ejemplares = Seleccionado.getEjemplarList().size();
        }
    }

    public void tipoRecursoSelect(SelectEvent event) {
        if (((int) event.getObject()) == 3) {
            verBotonGuardarPanel1 = false;
            verCategorias = true;
            verOtrosPaneles = true;
        } else {
            verBotonGuardarPanel1 = true;
            verCategorias = false;
            verOtrosPaneles = false;
        }
        Seleccionado.setIdTipoRecurso(tiporecursoFL.find((Integer) event.getObject()));
        PrimeFaces.current().ajax().update("form0", "form", "h1", "h2");
        System.out.println(event.getObject());
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

    public void agregarContenido() {
        if (!cl.getContenidoLibroPK().getContenidoLibroNombre().isEmpty()
                && cl.getContenidoLibroPK().getContenidoLibroPagina() > 0) {
            cl.getContenidoLibroPK().setIdLibro(Seleccionado.getIdrecurso());
            contenido.add(cl);
            nuevoContenido();
        }
    }

    public void nuevoContenido() {
        cl = new ContenidoLibro(new ContenidoLibroPK(Seleccionado.getIdrecurso(), "", 0));
    }

    public void nuevoRecurso() {
        ejemplares = 1;
        verBotonGuardarPanel1=true;
        TipoRecurso t = this.Seleccionado.getIdTipoRecurso();        
        Seleccionado = new Recurso(0);
        this.Seleccionado = new Recurso(0);
        if (t != null) {
            this.Seleccionado.setIdTipoRecurso(t);
        } else {
            init();
        }
        PrimeFaces.current().ajax().update("h1", "h2");
    }

    public List<Autor> getAutores() {
        return autores;
    }

    public void setAutores(List<Autor> autores) {
        this.autores = autores;
    }

    public List<Editorial> getEditoriales() {
        return editoriales;
    }

    public void setEditoriales(List<Editorial> editoriales) {
        this.editoriales = editoriales;
    }

    public boolean isVerTipos() {
        return verTipos;
    }

    public void setVerTipos(boolean verTipos) {
        this.verTipos = verTipos;
    }

    public boolean isVerOtrosPaneles() {
        return verOtrosPaneles;
    }

    public void setVerOtrosPaneles(boolean verOtrosPaneles) {
        this.verOtrosPaneles = verOtrosPaneles;
    }

    public boolean isVerBotonGuardarPanel1() {
        return verBotonGuardarPanel1;
    }

    public void setVerBotonGuardarPanel1(boolean verBotonGuardarPanel1) {
        this.verBotonGuardarPanel1 = verBotonGuardarPanel1;
    }

    public boolean isVerCategorias() {
        return verCategorias;
    }

    public void setVerCategorias(boolean verCategorias) {
        this.verCategorias = verCategorias;
    }

    public boolean isVerCategoriastabla() {
        return verCategoriastabla;
    }

    public void setVerCategoriastabla(boolean verCategoriastabla) {
        this.verCategoriastabla = verCategoriastabla;
    }
}
