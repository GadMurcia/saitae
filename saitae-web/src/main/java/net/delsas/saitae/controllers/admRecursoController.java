/*
 * Copyright (C) 2020 delsas
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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.component.behavior.AjaxBehavior;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AutorFacadeLocal;
import net.delsas.saitae.beans.AutorLibroFacadeLocal;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.ContenidoLibroFacadeLocal;
import net.delsas.saitae.beans.EditorialFacadeLocal;
import net.delsas.saitae.beans.EditorialLibroFacadeLocal;
import net.delsas.saitae.beans.EjemplarFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipoReservaRecursoFacadeLocal;
import net.delsas.saitae.entities.Autor;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.AutorLibroPK;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.ContenidoLibro;
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
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.omnifaces.component.output.OutputLabel;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named(value = "admRecursoC")
@ViewScoped
public class admRecursoController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    private Persona usuario;
    private FacesContext context;
    private boolean verTipos, verOtrosPaneles, verBotonGuardarPanel1,
            verCategorias, verCategoriastabla, editarID, editarTipo;
    @EJB
    private RecursoFacadeLocal recursoFL;
    private List<Recurso> recurso;
    private Recurso seleccionado;
    private List<Ejemplar> ejemplares;
    private Ejemplar ejemplarSeleccionado;
    private List<TipoRecurso> tiposRecursos;
    @EJB
    private TipoRecursoFacadeLocal tiporecursoFL;
    private ContenidoLibro cl, clControl;
    private List<ContenidoLibro> contenido;
    private int indiceCl;
    @EJB
    private CategoriaFacadeLocal catFL;
    private List<Categoria> categorias;
    @EJB
    private PaisFacadeLocal pFL;
    private List<Pais> paises;
    @EJB
    private TipoCargoFacadeLocal tcFL;
    private List<TipoCargo> tiposCargos;
    @EJB
    private TipoReservaFacadeLocal treFL;
    private List<TipoReserva> tiposReservas;
    private List<TipoReserva> tiposReservasRecurso;
    @EJB
    private AutorFacadeLocal aFL;
    private List<Autor> autores;
    @EJB
    private EditorialFacadeLocal edFL;
    private List<Editorial> editoriales;
    @EJB
    private TipoPersonaFacadeLocal tperFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private TipoReservaRecursoFacadeLocal trrFL;
    @EJB
    private ContenidoLibroFacadeLocal clFL;
    @EJB
    private EjemplarFacadeLocal ejFL;
    @EJB
    private EditorialLibroFacadeLocal elFL;
    @EJB
    private AutorLibroFacadeLocal alFL;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        initVariables();
        llenarListas();
        controlUsuarios();
    }

    private void initVariables() {
        seleccionado = new Recurso(0);
        seleccionado.setContenidoLibroList(new ArrayList<>());
        seleccionado.setAutorLibroList(new ArrayList<>());
        seleccionado.setEditorialLibroList(new ArrayList<>());
        seleccionado.setTipoReservaRecursoList(new ArrayList<>());
        seleccionado.setEjemplarList(new ArrayList<>());
        ejemplares = new ArrayList<>();
        contenido = new ArrayList<>();
        editarID = true;
        editarTipo = true;
        indiceCl = -1;
        tiposReservasRecurso = new ArrayList<>();
    }

    public void llenarListas() {
        tiposRecursos = tiporecursoFL.findAll();
        categorias = catFL.findAll();
        paises = pFL.findAll();
        tiposCargos = tcFL.findAll();
        tiposReservas = treFL.findAll();
        autores = aFL.findAll();
        editoriales = edFL.findAll();
    }

    private void llenado(int tr, boolean verPaneles) {
        seleccionado.setIdTipoRecurso(tiporecursoFL.find(tr));
        recurso.addAll(recursoFL.findByTipoRecurso(seleccionado.getIdTipoRecurso().getIdtipoRecurso()));
        verTipos = false;
        verBotonGuardarPanel1 = !verPaneles;
        verOtrosPaneles = verPaneles;
        verCategorias = verPaneles;
        verCategoriastabla = verPaneles;
    }

    public void controlUsuarios() {
        try {
            recurso = new ArrayList<>();
            List<Integer> tps = getTiposPersonas(usuario);
            if (tps.contains(1) || tps.contains(2)) {
                verTipos = true;
                verCategorias = true;
                verCategoriastabla = true;
                recurso = recursoFL.findAll();
            } else {
                if (tps.contains(7)) {
                    llenado(2, false);
                }
                if (tps.contains(6)) {
                    llenado(1, false);
                }
                if (tps.contains(5)) {
                    llenado(3, true);
                }

                if (!tps.contains(7) && !tps.contains(6) && !tps.contains(5)) {
                    FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                            new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                    "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                    redireccionarPagina("./../");
                } else if ((tps.contains(6) && tps.contains(5)) || ((tps.contains(7) && tps.contains(5)))) {
                    verTipos = true;
                    verCategorias = true;
                    verCategoriastabla = true;
                    tiposRecursos.remove(tiporecursoFL.find(tps.contains(6) ? 7 : 6));
                }
//                else {
//                    verTipos = true;
//                    verCategorias = true;
//                    verCategoriastabla = true;
//                }

            }
        } catch (Exception ex1) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error iniesperado",
                    (ex1 != null ? ex1.getMessage() : "Error desconocido.")));
        }
    }

    public void nuevoRecurso() {
        initVariables();
        controlUsuarios();
        PrimeFaces.current().ajax().update("dialogN", "hn", "h2");
    }

    public void agregarContenido() {
        if (!cl.getContenidoLibroNombre().isEmpty()
                && cl.getContenidoLibroPagina() > 0 && indiceCl == -1) {
            cl.setIdLibro(seleccionado);
            System.out.println("agregar " + cl);
            cl.setContenidoLibroIndice(cl.getContenidoLibroPagina() + (cl.getContenidoLibroPagina() * 7));
            if (!contenido.contains(cl)) {
                contenido.add(cl);
            }
        } else if (indiceCl > -1) {
            System.out.println("modificar " + cl);
        }
        nuevoContenido();
        ordenarContenido();
        PrimeFaces.current().ajax().update("hn:h1Contenido", "h2");
    }

    private void ordenarContenido() {
        Collections.sort(contenido, (ContenidoLibro c1, ContenidoLibro c2) -> {
            return c1.getContenidoLibroPagina() - c2.getContenidoLibroPagina();
        });
    }

    public void nuevoContenido() {
        cl = new ContenidoLibro(0, "", seleccionado);
        clControl = new ContenidoLibro(0, "", seleccionado);
        indiceCl = -1;
    }

    public ContenidoLibro getCl() {
        return cl;
    }

    public void setCl(ContenidoLibro cl) {
        indiceCl = contenido.contains(cl) ? contenido.indexOf(cl) : -1;
        clControl = indiceCl != -1 ? new ContenidoLibro(
                cl.getContenidoLibroPagina(), cl.getContenidoLibroNombre(), cl.getIdLibro())
                : new ContenidoLibro();
        this.cl = cl;
    }

    public String getEstadoFisico(Recurso r) {
        return r.getEstadoFisico().equals("B") ? "Bueno" : "Regular";
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

    public void onAdd() {
        Ejemplar ej = new Ejemplar(new EjemplarPK(seleccionado.getIdrecurso(), 0),
                getAñoActual(), true);
        if (!ejemplares.contains(ej)) {
            ejemplares.add(ej);
        }
    }

    public void onRowEdit(RowEditEvent event) {
        System.out.println(event.getObject());
    }

    public void onRowCancel(RowEditEvent event) {
        System.out.println(event.getObject());
        ejemplares.remove((Ejemplar) event.getObject());
    }

    public Integer[] getAutoresXlibro() {
        List<AutorLibro> l = seleccionado.getAutorLibroList();
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
            AutorLibro al = new AutorLibro(new AutorLibroPK(i, seleccionado.getIdrecurso()));
            al.setRecurso(seleccionado);
            al.setAutor(aFL.find(i));
            al.setAutorLibrocComentario("");
            l.add(al);
        }
        seleccionado.setAutorLibroList(l);
    }

    public Integer[] getEditorialesXlibro() {
        List<EditorialLibro> l = seleccionado.getEditorialLibroList();
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
            EditorialLibro al = new EditorialLibro(
                    new EditorialLibroPK(i, seleccionado.getIdrecurso()));
            al.setRecurso(seleccionado);
            al.setEditorial(edFL.find(i));
            al.setEditorialLibroComentario("");
            l.add(al);
        }
        seleccionado.setEditorialLibroList(l);
    }

    public void tipoRecursoSelect(SelectEvent event) {
        TipoRecurso tp = ((TipoRecurso) event.getObject());
        seleccionado.setIdTipoRecurso(tp);
        if (tp == null || tp.getIdtipoRecurso() == 3) {
            verBotonGuardarPanel1 = false;
            verCategorias = true;
            verOtrosPaneles = true;
        } else {
            verBotonGuardarPanel1 = true;
            verCategorias = false;
            verOtrosPaneles = false;
        }
        PrimeFaces.current().ajax().update("hn", "h2");
        System.out.println(tp == null ? "No Selection" : tp);
    }

    public void eliminarContenido() {
        if (cl != null) {
            contenido.remove(cl);
            nuevoContenido();
        }
    }

    public void guardar() {
        System.out.println("guardar");
        mensaje x;
        seleccionado.setContenidoLibroList(new ArrayList<>());
        seleccionado.setEjemplarList(ejemplares);
        seleccionado.setTipoReservaRecursoList(new ArrayList<>());
        tiposReservasRecurso.stream().map((tr) -> {
            TipoReservaRecurso trr = new TipoReservaRecurso(tr.getIdtipoReserva(), seleccionado.getIdrecurso());
            trr.setRecurso(seleccionado);
            trr.setTipoReserva1(tr);
            trr.setTipoReservaRecursoComentario("");
            return trr;
        }).forEachOrdered((trr) -> {
            seleccionado.getTipoReservaRecursoList().add(trr);
        });
        int tp = seleccionado.getIdTipoRecurso().getIdtipoRecurso();
        tp = tp == 1 ? 6 : (tp == 2 ? 7 : (tp == 3 ? 5 : 0));
        Recurso r = recursoFL.find(seleccionado.getIdrecurso());
        if (r != null && !editarID && !editarTipo) {
            //modificación
            r.getContenidoLibroList().stream().filter((cl1) -> (!seleccionado.getContenidoLibroList().contains(cl1))).forEachOrdered((cl1) -> {
                System.out.println("contenidoLibro a borrar:\n" + cl1);
                clFL.remove(cl1);
            });
            recursoFL.edit(seleccionado);
            contenido.stream().map((cl3) -> {
                cl3.setContenidoLibroIndice(null);
                clFL.create(cl3);
                return cl3;
            }).forEachOrdered((cl3) -> {
                seleccionado.getContenidoLibroList().add(cl3);
            });
            recursoFL.edit(seleccionado);
            r.getTipoReservaRecursoList().stream().filter((trr) -> (!seleccionado.getTipoReservaRecursoList().contains(trr))).forEachOrdered((trr) -> {
                System.out.println("TipoReservaLibro a borrar:\n" + trr);
                trrFL.remove(trr);
            });
            r.getEjemplarList().stream().filter((e) -> (!seleccionado.getEjemplarList().contains(e))).forEachOrdered((e) -> {
                System.out.println("Ejemplar a borrar: \n" + e);
                try {
                    ejFL.remove(e);
                } catch (Exception exx) {
                    try {
                        e.setEjemplarActivo(false);
                        ejFL.edit(e);
                    } catch (Exception exxx) {

                    }
                }
            });
            r.getAutorLibroList().stream().filter((al) -> (!seleccionado.getAutorLibroList().contains(al))).forEachOrdered((al) -> {
                System.out.println("AutorLibro a borrar:\n" + al);
                alFL.remove(al);
            });
            r.getEditorialLibroList().stream().filter((el) -> (!seleccionado.getEditorialLibroList().contains(el))).forEachOrdered((el) -> {
                System.out.println("editorialLibro a borrar\n" + el);
                elFL.remove(el);
            });
            x = new mensaje(0, usuario.getIdpersona(), "admRecurso<<:form:recurso",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Edición de recurso",
                            usuario.getPersonaNombre().split(" ")[0] + " "
                            + usuario.getPersonaApellido().split(" ")[0]
                            + " Ha editado la información del recurso: ID: "
                            + seleccionado.getIdrecurso()
                            + ", NOMBRE: " + seleccionado.getNombre()));
            persistirNotificación(x,
                    getPersonasParaNotificar(tperFL.find(tp)), notiFL, notificacion);
            FacesContext.getCurrentInstance().addMessage("form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Edición exitosa",
                            "El recurso con el id: " + seleccionado.getIdrecurso()
                            + " y nombre: " + seleccionado.getNombre()
                            + " se ha editado con éxito."));
            init();
            PrimeFaces.current().ajax().update("form0:msgs", "form", "dialogN");
        } else if (r == null) {
            //agregación nueva
            recursoFL.create(seleccionado);
            contenido.stream().map((cl3) -> {
                cl3.setContenidoLibroIndice(null);
                clFL.create(cl3);
                return cl3;
            }).forEachOrdered((cl3) -> {
                seleccionado.getContenidoLibroList().add(cl3);
            });
            recursoFL.edit(seleccionado);
            x = new mensaje(0, usuario.getIdpersona(), "admRecurso<<:form:recurso",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Nuevo recurso agregado",
                            usuario.getPersonaNombre().split(" ")[0] + " "
                            + usuario.getPersonaApellido().split(" ")[0]
                            + " Ha agregado un nuevo recurso: ID: " + seleccionado.getIdrecurso()
                            + ", NOMBRE: " + seleccionado.getNombre()));
            persistirNotificación(x,
                    getPersonasParaNotificar(tperFL.find(tp)), notiFL, notificacion);
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Creación exitosa",
                            "El recurso con el id: " + seleccionado.getIdrecurso()
                            + " y nombre: " + seleccionado.getNombre()
                            + " se ha guardado con éxito."));
            init();
            PrimeFaces.current().ajax().update("form", "dialogN");
            redireccionarPagina("admRecurso.intex");
        } else {
            //intento de agregación de un id existente
            FacesContext.getCurrentInstance().addMessage("form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Imposible agregar",
                            "Se ha detectado que el recurso con el id " + seleccionado.getIdrecurso()
                            + " ya se ha guardado y no es posible editarlo desde la ventana de "
                            + "agregación. So lo que quiere es editarlo, seleccione en la tabla"
                            + "principar editar sobre el recurso en cuestión. Si quiere agregarlo, "
                            + "debe cambiar el id que está indicando en el actual para proceder."));
            PrimeFaces.current().ajax().update("form0:msgs");
        }
    }

    public List<Recurso> getRecurso() {
        return Collections.unmodifiableList(recurso);
    }

    public void setRecurso(List<Recurso> recurso) {
        this.recurso = recurso;
    }

    public Recurso getSeleccionado() {
        return seleccionado;
    }

    public void eliminarEjemplar() {
        if (ejemplarSeleccionado != null) {
            ejemplares.remove(ejemplarSeleccionado);
        }
        PrimeFaces.current().ajax().update("hn:h1Contenido");
    }

    public void nuevoEjemplar() {
        ejemplarSeleccionado = new Ejemplar(new EjemplarPK(seleccionado.getIdrecurso(), 0),
                getAñoActual(), true);
        PrimeFaces.current().ajax().update("h3");
    }

    public void agregarEjemplar() {
        if (ejemplarSeleccionado != null) {
            ejemplares.add(ejemplarSeleccionado);
            PrimeFaces.current().ajax().update("hn:h1Contenido", "h3");
            nuevoEjemplar();
        }
    }

    public void setSeleccionado(Recurso seleccionado) {
        contenido.clear();
        this.seleccionado = seleccionado != null ? seleccionado : this.seleccionado;
        this.seleccionado.getContenidoLibroList().forEach((c) -> {
            contenido.add(c);
        });
        ordenarContenido();
        tiposReservasRecurso = new ArrayList<>();
        this.seleccionado.getTipoReservaRecursoList().forEach((trr) -> {
            tiposReservasRecurso.add(trr.getTipoReserva1());
        });
        ejemplares = this.seleccionado.getEjemplarList();
        editarID = editarTipo = false;
        tipoRecursoSelect(new SelectEvent(
                new OutputLabel(), new AjaxBehavior(), this.seleccionado.getIdTipoRecurso()));
    }

    public boolean isVerTipos() {
        return verTipos;
    }

    public void setVerTipos(boolean verTipos) {
        this.verTipos = verTipos;
    }

    public boolean isVerCategoriastabla() {
        return verCategoriastabla;
    }

    public void setVerCategoriastabla(boolean verCategoriastabla) {
        this.verCategoriastabla = verCategoriastabla;
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

    public boolean isEditarTipo() {
        return editarTipo;
    }

    public void setEditarTipo(boolean editarTipo) {
        this.editarTipo = editarTipo;
    }

    public List<Ejemplar> getEjemplares() {
        return Collections.unmodifiableList(ejemplares);
    }

    public void setEjemplares(List<Ejemplar> ejemplares) {
        this.ejemplares = ejemplares;
    }

    public List<TipoRecurso> getTiposRecursos() {
        return Collections.unmodifiableList(tiposRecursos);
    }

    public void setTiposRecursos(List<TipoRecurso> tiposRecursos) {
        this.tiposRecursos = tiposRecursos;
    }

    public boolean isEditarID() {
        return editarID;
    }

    public void setEditarID(boolean editarID) {
        this.editarID = editarID;
    }

    public List<ContenidoLibro> getContenido() {
        return Collections.unmodifiableList(contenido);
    }

    public void setContenido(List<ContenidoLibro> contenido) {
        this.contenido = contenido;
    }

    public List<Categoria> getCategorias() {
        return Collections.unmodifiableList(categorias);
    }

    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    public List<Pais> getPaises() {
        return Collections.unmodifiableList(paises);
    }

    public void setPaises(List<Pais> paises) {
        this.paises = paises;
    }

    public List<TipoCargo> getTiposCargos() {
        return Collections.unmodifiableList(tiposCargos);
    }

    public void setTiposCargos(List<TipoCargo> tiposCargos) {
        this.tiposCargos = tiposCargos;
    }

    public List<TipoReserva> getTiposReservas() {
        return Collections.unmodifiableList(tiposReservas);
    }

    public void setTiposReservas(List<TipoReserva> tiposReservas) {
        this.tiposReservas = tiposReservas;
    }

    public List<TipoReserva> getTiposReservasRecurso() {
        return tiposReservasRecurso;
    }

    public void setTiposReservasRecurso(List<TipoReserva> tiposReservasRecurso) {
        this.tiposReservasRecurso = tiposReservasRecurso;
    }

    public Ejemplar getEjemplarSeleccionado() {
        return ejemplarSeleccionado;
    }

    public void setEjemplarSeleccionado(Ejemplar ejemplarSeleccionado) {
        this.ejemplarSeleccionado = ejemplarSeleccionado;
    }

    public List<Autor> getAutores() {
        return Collections.unmodifiableList(autores);
    }

    public void setAutores(List<Autor> autores) {
        this.autores = autores;
    }

    public List<Editorial> getEditoriales() {
        return Collections.unmodifiableList(editoriales);
    }

    public void setEditoriales(List<Editorial> editoriales) {
        this.editoriales = editoriales;
    }

    @Override
    public String onFlowProcess(FlowEvent event) {
        String st = event.getNewStep();
        PrimeFaces.current().ajax().update("hn:ws");
        return st;
    }
}
