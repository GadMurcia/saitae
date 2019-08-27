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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.aux.mensaje;
import net.delsas.saitae.aux.prueba;
import net.delsas.saitae.beans.AulaFacadeLocal;
import net.delsas.saitae.beans.AutorFacadeLocal;
import net.delsas.saitae.beans.CargoFacadeLocal;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.EditorialFacadeLocal;
import net.delsas.saitae.beans.FinanciamientoFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoMateriaFacadeLocal;
import net.delsas.saitae.beans.TipoNombramientoFacadeLocal;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.beans.ZonaFacadeLocal;
import net.delsas.saitae.entities.Aula;
import net.delsas.saitae.entities.Autor;
import net.delsas.saitae.entities.Cargo;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.Editorial;
import net.delsas.saitae.entities.Financiamiento;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoMateria;
import net.delsas.saitae.entities.TipoNombramiento;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipopersonaPermiso;
import net.delsas.saitae.entities.Zona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.model.DualListModel;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class TipoController implements Serializable {

    private static final long serialVersionUID = 1L;
    //Tipo Recurso
    private List<TipoRecurso> recursos;
    @EJB
    private TipoRecursoFacadeLocal tipoRecursoFL;

    //Tipo Permiso
    @EJB
    private TipoPermisoFacadeLocal tpfl;
    private List<TipoPermiso> all;

    //Tipo Cargo
    private List<TipoCargo> cargos;
    @EJB
    private TipoCargoFacadeLocal tipoCargoFL;

    //Tipo Persona
    @EJB
    private TipopersonaPermisoFacadeLocal tppfl;
    @EJB
    private TipoPermisoFacadeLocal permisoFL;
    @EJB
    private TipoPersonaFacadeLocal personaFL;
    private List<TipoPersona> Personas;
    private TipoPersona tipoPersona;
    private DualListModel<String> model;

    //Tipo Zona
    @EJB
    private ZonaFacadeLocal zfl;
    private List<Zona> zonas;

    //Tipo Reserva
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    private List<TipoReserva> reservas;

    //Tipo Nombramiento
    @EJB
    private TipoNombramientoFacadeLocal tipoNombramientoFL;
    private List<TipoNombramiento> nombramientos;

    //TipoMateria
    @EJB
    private TipoMateriaFacadeLocal tipoMateriaFL;
    private List<TipoMateria> tipoMaterias;

    //Materia
    @EJB
    private MateriaFacadeLocal materiaFL;
    private List<Materia> materias;

    //Aulas
    @EJB
    private AulaFacadeLocal afl;
    private List<Aula> aulas;

    //Autor
    @EJB
    private AutorFacadeLocal autorFL;
    private List<Autor> autor;

    //Cargo
    @EJB
    private CargoFacadeLocal cargoFL;
    private List<Cargo> cargo;

    //Categoria
    @EJB
    private CategoriaFacadeLocal categoriaFL;
    private List<Categoria> categoria;

    //Editorial
    @EJB
    private EditorialFacadeLocal editorialFL;
    private List<Editorial> editorial;

    //Horario
    @EJB
    private HorarioFacadeLocal horarioFL;
    private List<Horario> horario;
    private Horario hora;

    //Fiannciamiento
    @EJB
    private FinanciamientoFacadeLocal financiamientoFL;
    private List<Financiamiento> financiamientos;

    //Grado
    @EJB
    private GradoFacadeLocal gradoFL;
    private List<Grado> grados;
    @EJB
    private MaestroFacadeLocal maestroFL;

    @PostConstruct
    public void init() {
        recursos = tipoRecursoFL.findAll();
        all = tpfl.findAll();
        cargos = tipoCargoFL.findAll();
        tipoPersona = new TipoPersona(0);
        Personas = personaFL.findAll();
        model = new DualListModel<>(new ArrayList<String>(), new ArrayList<String>());
        zonas = zfl.findAll();
        reservas = tipoReservaFL.findAll();
        nombramientos = tipoNombramientoFL.findAll();
        tipoMaterias = tipoMateriaFL.findAll();
        materias = materiaFL.findAll();
        aulas = afl.findAll();
        autor = autorFL.findAll();
        cargo = cargoFL.findAll();
        categoria = categoriaFL.findAll();
        editorial = editorialFL.findAll();
        horario = horarioFL.findAll();
        financiamientos = financiamientoFL.findAll();
        grados = gradoFL.findAll();
        hora = new Horario(0, new Date(), new Date());
    }

    public void onAddNew(String id) {
        // Add one new car to the table:
        switch (id) {
            case "recursos":
                recursos.add(new TipoRecurso());
                break;
            case "permiso":
                all.add(new TipoPermiso());
                break;
            case "cargo":
                cargos.add(new TipoCargo());
                break;
            case "nombramiento":
                nombramientos.add(new TipoNombramiento());
                break;
            case "zona":
                zonas.add(new Zona());
                break;
            case "reserva":
                reservas.add(new TipoReserva());
                break;
            case "tipomateria":
                tipoMaterias.add(new TipoMateria());
                break;
            case "materia":
                Materia m = new Materia();
                m.setTipoMateria(new TipoMateria(0));
                materias.add(m);
                break;
            case "aula":
                Aula a = new Aula();
                a.setZonaAula(new Zona(0));
                aulas.add(a);
                break;
            case "autor":
                autor.add(new Autor());
                break;
            case "cargo1":
                cargo.add(new Cargo());
                break;
            case "categoria":
                categoria.add(new Categoria(0));
                break;
            case "editorial":
                editorial.add(new Editorial());
                break;
            case "horario":
                horario.add(new Horario(0));
                break;
            case "financiamiento":
                financiamientos.add(new Financiamiento(0));
                break;
            case "grado":
                Grado g = new Grado(new GradoPK(0, "", "",
                        Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()))), true);
                g.setAulaGrado(new Aula(0));
                g.getAulaGrado().setZonaAula(new Zona(0, ""));
                g.setGradoMaestroGuia(new prueba().getMaestro().getMaestro());
                grados.add(g);
                break;
            default:
                System.out.println(id);

        }

        FacesMessage msg = new FacesMessage("Campos Nuevos agregados.",
                "Edite los campos para que las modificaciones sean permenentes");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowEdit(RowEditEvent event) {
        String titulo = "", mensaje = "", id = event.getComponent().getClientId();
        switch (id) {
            case "form:tw:recurso":
                tipoRecursoFL.edit((TipoRecurso) event.getObject());
                titulo = "Tipo de recurso";
                mensaje = ((TipoRecurso) event.getObject()).getTipoRecursoNombre();
                break;
            case "form:tw:tp1":
                TipoPermiso name = (TipoPermiso) event.getObject();
                tpfl.edit(name);
                titulo = "Tipo de Permiso";
                mensaje = ((TipoPermiso) event.getObject()).getTipoPermisoNombre();
                tipoPersona = new TipoPersona(0);
                onItemSelect(null);
                break;
            case "form:tw:cargo":
                TipoCargo tc = (TipoCargo) event.getObject();
                tipoCargoFL.edit(tc);
                titulo = "Tipo Cargo";
                mensaje = tc.getNombre();
                break;
            case "form:tw:nombramiento":
                tipoNombramientoFL.edit((TipoNombramiento) event.getObject());
                titulo = "Tipo Nombramiento";
                mensaje = ((TipoNombramiento) event.getObject()).getTipoNombramientoNombre();
                break;
            case "form:tw:zona":
                zfl.edit((Zona) event.getObject());
                titulo = "Zona";
                mensaje = ((Zona) event.getObject()).getZonaNombre();
                enviarNotificación(event.getObject(), "zona");
                break;
            case "form:tw:reserva":
                tipoReservaFL.edit((TipoReserva) event.getObject());
                titulo = "Tipo Reserva";
                mensaje = ((TipoReserva) event.getObject()).getTipoReservaNombre();
                break;
            case "form:tw:tipomateria":
                TipoMateria m = (TipoMateria) event.getObject();
                tipoMateriaFL.edit(m);
                titulo = "Tipo de Materia";
                mensaje = m.getTipoMateriaNombre();
                break;
            case "form:tw:materia":
                Materia ma = (Materia) event.getObject();
                ma.setTipoMateria(tipoMateriaFL.find(ma.getTipoMateria().getIdtipoMateria()));
                materiaFL.edit(ma);
                titulo = "Materia";
                mensaje = ma.getMateriaNombre();
                break;
            case "form:tw:aula":
                Aula a = (Aula) event.getObject();
                a.setZonaAula(zfl.find(a.getZonaAula().getIdzona()));
                afl.edit(a);
                titulo = "Aula";
                mensaje = "Aula N° " + a.getIdaula();
                break;
            case "form:tw:autor":
                Autor au = (Autor) event.getObject();
                autorFL.edit(au);
                titulo = "Autor";
                mensaje = au.getAutorNombre();
                break;
            case "form:tw:cargo1":
                Cargo c = (Cargo) event.getObject();
                cargoFL.edit(c);
                titulo = "Cargo";
                mensaje = c.getCargoNombre();
                break;
            case "form:tw:categoria":
                Categoria ca = (Categoria) event.getObject();
                categoriaFL.edit(ca);
                titulo = "Editorial";
                mensaje = ca.getCategoriaNombre();
                break;
            case "form:tw:editorial":
                Editorial e = (Editorial) event.getObject();
                editorialFL.edit(e);
                mensaje = e.getEditorialNombre();
                break;
            case "form:tw:horario":
                Horario h = (Horario) event.getObject();
                horarioFL.edit(h);
                titulo = "Horario";
                mensaje = "Horario Agregado";
                break;
            case "form:tw:tabla1:financiamiento":
                Financiamiento f = (Financiamiento) event.getObject();
                financiamientoFL.edit(f);
                titulo = "Fianciamiento";
                mensaje = f.getFinanciamientoNombre();
                break;
            case "form:tw:grado":
                Grado g = (Grado) event.getObject();
                g.setAulaGrado(afl.find(g.getAulaGrado().getIdaula()));
                g.setGradoMaestroGuia(g.getGradoMaestroGuia() == null
                        || g.getGradoMaestroGuia().getIdmaestro() == 0
                        ? null : maestroFL.find(g.getGradoMaestroGuia().getIdmaestro()));
                gradoFL.edit(g);
                titulo = "Grado";
                mensaje = g.getGradoPK().getIdgrado() + "° " + g.getGradoPK().getGradoModalidad() + " "
                        + g.getGradoPK().getGradoSeccion() + " para el año"
                        + g.getGradoPK().getGradoAño() + " fue agregado.";
                break;
            default:
                System.out.println(id);
        }
        init();
        PrimeFaces.current().ajax().update(id);

        FacesMessage msg = new FacesMessage(titulo + " Editado", mensaje);
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        String mensaje = "", id = event.getComponent().getClientId();
        switch (id) {
            case "form:tw:recurso":
                TipoRecurso z = ((TipoRecurso) event.getObject());
                if (z.getTipoRecursoNombre() == null || z.getTipoRecursoNombre().isEmpty()) {
                    recursos.remove(z);
                }
                mensaje = z.getTipoRecursoNombre();
                break;
            case "form:tw:tp1":
                TipoPermiso tp1 = (TipoPermiso) event.getObject();
                if (tp1.getTipoPermisoNombre() == null || tp1.getTipoPermisoNombre().isEmpty()) {
                    all.remove(tp1);
                }
                mensaje = tp1.getTipoPermisoNombre();
                break;
            case "form:tw:cargo":
                TipoCargo tc = (TipoCargo) event.getObject();
                if (tc.getNombre() == null || tc.getNombre().isEmpty()) {
                    cargos.remove(tc);
                }
                mensaje = tc.getNombre();
                break;
            case "form:tw:persona":
                TipoPersona tp = (TipoPersona) event.getObject();
                if (tp.getTipoPersonaNombre() == null || tp.getTipoPersonaNombre().isEmpty()) {
                    Personas.remove(tp);
                }
                mensaje = tp.getTipoPersonaNombre();
                break;
            case "form:tw:zona":
                Zona zon = (Zona) event.getObject();
                if (zon.getZonaNombre() == null || zon.getZonaNombre().isEmpty()) {
                    zonas.remove(zon);
                }
                mensaje = zon.getZonaNombre();
                break;
            case "form:tw:reserva":
                TipoReserva res = (TipoReserva) event.getObject();
                if (res.getTipoReservaNombre() == null || res.getTipoReservaNombre().isEmpty()) {
                    reservas.remove(res);
                }
                mensaje = res.getTipoReservaNombre();
                break;
            case "form:tw:tipomateria":
                TipoMateria m = (TipoMateria) event.getObject();
                if (m.getTipoMateriaNombre() == null || m.getTipoMateriaNombre().isEmpty()) {
                    tipoMaterias.remove(m);
                }
                mensaje = m.getTipoMateriaNombre();
                break;
            case "form:tw:materia":
                Materia ma = (Materia) event.getObject();
                if (ma.getMateriaNombre() == null || ma.getMateriaNombre().isEmpty()) {
                    materias.remove(ma);
                }
                mensaje = ma.getMateriaNombre();
                break;
            case "form:tw:aula":
                Aula a = (Aula) event.getObject();
                if (a.getZonaAula().getIdzona() == null || a.getZonaAula().getIdzona() == 0) {
                    aulas.remove(aulas.indexOf(a));
                }
                mensaje = "Aula N° " + a.getIdaula();
                break;
            case "form:tw:autor":
                Autor au = (Autor) event.getObject();
                if (au.getAutorNombre() == null || au.getAutorNombre().isEmpty()) {
                    autor.remove(au);
                }
                mensaje = au.getAutorNombre();
                break;
            case "form:tw:cargo1":
                Cargo c = (Cargo) event.getObject();
                if (c.getCargoNombre() == null || c.getCargoNombre().isEmpty()) {
                    cargo.remove(c);
                }
                mensaje = c.getCargoNombre();
                break;

            case "form:tw:categoria":
                Categoria ca = (Categoria) event.getObject();
                if (ca.getCategoriaNombre() == null || ca.getCategoriaNombre().isEmpty()) {
                    categoria.remove(ca);
                }
                mensaje = ca.getCategoriaNombre();
                break;
            case "form:tw:editorial":
                Editorial e = (Editorial) event.getObject();
                if (e.getEditorialNombre() == null || e.getEditorialNombre().isEmpty()) {
                    editorial.remove(e);
                }
                mensaje = e.getEditorialNombre();
                break;
            case "form:tw:horario":
                Horario h = (Horario) event.getObject();
                if (h.getHoraInicio() == null && h.getHoraFin() == null) {
                    horario.remove(h);
                }
                mensaje = "Horario Cancelado";
                break;
            case "form:tw:tabla1:financiamiento":
                Financiamiento f = (Financiamiento) event.getObject();
                if (f.getFinanciamientoNombre() == null | f.getFinanciamientoNombre().isEmpty()) {
                    financiamientos.remove(f);
                }
                mensaje = "Financiamiento";
                break;
            case "form:tw:grado":
                Grado g = (Grado) event.getObject();
                if (g.getGradoPK().getIdgrado() == 0 | g.getGradoPK().getGradoModalidad().isEmpty()
                        | g.getGradoPK().getGradoSeccion().isEmpty() | g.getAulaGrado().getIdaula() == 0) {
                    grados.remove(g);
                }
                mensaje = "Grado";
                break;
            default:
                System.out.println(id);
        }
        init();
        PrimeFaces.current().ajax().update(id);
        FacesMessage msg = new FacesMessage("Edición cancelada", mensaje);
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public List<SelectItem> getListaZonas() {
        List<SelectItem> ListaZonas = new ArrayList<>();
        for (Zona z : zonas) {
            ListaZonas.add(new SelectItem(z.getIdzona(), z.getZonaNombre()));
        }
        return ListaZonas;

    }

    public List<SelectItem> getListaTipoMateria() {
        List<SelectItem> ListaTipoMateria = new ArrayList<>();
        for (TipoMateria tp : tipoMaterias) {
            ListaTipoMateria.add(new SelectItem(tp.getIdtipoMateria(), tp.getTipoMateriaNombre()));
        }
        return ListaTipoMateria;
    }

    public void onItemSelect(ItemSelectEvent event) {
        tipoPersona = personaFL.find(tipoPersona.getIdtipoPersona());
        tipoPersona = tipoPersona == null ? new TipoPersona(0) : tipoPersona;
        List<TipoPermiso> l = new ArrayList<>();
        List<String> target = new ArrayList<>();
        List<String> source = new ArrayList<>();
        if (tipoPersona.getIdtipoPersona() > 0) {
            for (TipopersonaPermiso a : tipoPersona.getTipopersonaPermisoList()) {
                l.add(a.getTipoPermiso());
                target.add(a.getTipoPermiso().getTipoPermisoNombre());
            }

            for (TipoPermiso p : permisoFL.findAll()) {
                if (!l.contains(p)) {
                    source.add(p.getTipoPermisoNombre());
                }
            }
            FacesMessage msg = new FacesMessage("Persona seleccionada", tipoPersona.getTipoPersonaNombre());
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        model.setTarget(target);
        model.setSource(source);
    }

    public List<SelectItem> getTiposPersonas() {
        List<SelectItem> list = new ArrayList<>();
        list.add(new SelectItem(0, "Seleccione"));
        for (TipoPersona p : Personas) {
            list.add(new SelectItem(p.getIdtipoPersona(), p.getTipoPersonaNombre()));
        }
        return list;
    }

    public void guardar() {
        if (tipoPersona.getIdtipoPersona() > 0) {
            List<TipopersonaPermiso> permisos = new ArrayList<>();
            for (String g : model.getTarget()) {
                for (TipoPermiso t : permisoFL.findAll()) {
                    if (g.equals(t.getTipoPermisoNombre())) {
                        TipopersonaPermiso r = new TipopersonaPermiso(tipoPersona.getIdtipoPersona(), t.getIdtipoPermiso());
                        r.setTipoPermiso(t);
                        r.setTipoPersona(tipoPersona);
                        r.setTipopersonaPermisoComentario("");
                        permisos.add(r);
                    }
                }
            }
            for (TipopersonaPermiso t : tipoPersona.getTipopersonaPermisoList()) {
                if (!permisos.contains(t)) {
                    tppfl.remove(t);
                }
            }
            tipoPersona.setTipopersonaPermisoList(permisos);
            personaFL.edit(tipoPersona);
            String m = "Al Tipo de Ususario " + tipoPersona.getTipoPersonaNombre();
            if (model.getTarget().size() > 0) {
                m += " se le han asignado los Tipos de permisos:";
                for (String d : model.getTarget()) {
                    m += "\n* " + d + ".";
                }
            } else {
                m += " Se le han removido todos los tipos de permisos.";
            }
            FacesMessage msg = new FacesMessage("Las modificaciones se han realizado:", m);
            FacesContext.getCurrentInstance().addMessage(null, msg);
            PrimeFaces.current().ajax().update("form:msgs");
        }
    }

    public void agregarHorario() {
        FacesMessage msg;
        if (hora.getIdhorario() > 0) {
            horarioFL.edit(hora);
            horario = horarioFL.findAll();
            hora = new Horario(0, new Date(), new Date());
            msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Agregación Exitosa",
                    "El horario n° " + hora.getIdhorario() + ", entre las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraInicio()))
                    + " y las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraFin())) + ", ha sido agregado.");
        } else {
            msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Horario", "no se ha agregado nada.");
        }
        FacesContext.getCurrentInstance().addMessage(null, msg);
        PrimeFaces.current().ajax().update("form", "h1");
    }

    public void eliminarHorario() {
        FacesMessage ms;
        try {
            horarioFL.remove(hora);
            horario.remove(hora);
            ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Eliminación",
                    "El horario n° " + hora.getIdhorario() + ", entre las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraInicio()))
                    + " y las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraFin())) + ", ha sido eliminado.");
            hora = new Horario(0, new Date(), new Date());
        } catch (Exception ex) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "¡Vaya, hubo un error!",
                    ex.getMessage() != null ? ex.getMessage()
                    : "Un error inesperado se ha interceptado mientras se hacía la operación indicada.");
        }
        FacesContext.getCurrentInstance().addMessage(null, ms);
        PrimeFaces.current().ajax().update("form", "h1");
    }

    public List<TipoRecurso> getRecursos() {
        return Collections.unmodifiableList(recursos);
    }

    public void setRecursos(List<TipoRecurso> recursos) {
        this.recursos = recursos;
    }

    public List<TipoPermiso> getAll() {
        return Collections.unmodifiableList(all);
    }

    public void setAll(List<TipoPermiso> all) {
        this.all = all;
    }

    public List<TipoCargo> getCargos() {
        return Collections.unmodifiableList(cargos);
    }

    public void setCargos(List<TipoCargo> cargos) {
        this.cargos = cargos;
    }

    public List<TipoPersona> getPersonas() {
        return Collections.unmodifiableList(Personas);
    }

    public void setPersonas(List<TipoPersona> Personas) {
        this.Personas = Personas;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public DualListModel<String> getModel() {
        return model;
    }

    public void setModel(DualListModel<String> model) {
        this.model = model;
    }

    public List<Zona> getZonas() {
        return Collections.unmodifiableList(zonas);
    }

    public void setZonas(List<Zona> zonas) {
        this.zonas = zonas;
    }

    public List<TipoReserva> getReservas() {
        return Collections.unmodifiableList(reservas);
    }

    public void setReservas(List<TipoReserva> reservas) {
        this.reservas = reservas;
    }

    public List<TipoNombramiento> getNombramientos() {
        return Collections.unmodifiableList(nombramientos);
    }

    public void setNombramientos(List<TipoNombramiento> nombramientos) {
        this.nombramientos = nombramientos;
    }

    public List<Materia> getMaterias() {
        return Collections.unmodifiableList(materias);
    }

    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    public List<TipoMateria> getTipoMaterias() {
        return Collections.unmodifiableList(tipoMaterias);
    }

    public void setTipoMaterias(List<TipoMateria> tipoMaterias) {
        this.tipoMaterias = tipoMaterias;
    }

    public List<Aula> getAulas() {
        return Collections.unmodifiableList(aulas);
    }

    public void setAulas(List<Aula> aulas) {
        this.aulas = aulas;
    }

    public List<Autor> getAutor() {
        return Collections.unmodifiableList(autor);
    }

    public void setAutor(List<Autor> autor) {
        this.autor = autor;
    }

    public List<Cargo> getCargo() {
        return Collections.unmodifiableList(cargo);
    }

    public void setCargo(List<Cargo> cargo) {
        this.cargo = cargo;
    }

    public List<Categoria> getCategoria() {
        return Collections.unmodifiableList(categoria);
    }

    public void setCategoria(List<Categoria> categoria) {
        this.categoria = categoria;
    }

    public List<Editorial> getEditorial() {
        return Collections.unmodifiableList(editorial);
    }

    public void setEditorial(List<Editorial> editorial) {
        this.editorial = editorial;
    }

    public List<Horario> getHorario() {
        return Collections.unmodifiableList(horario);
    }

    public void setHorario(List<Horario> horario) {
        this.horario = horario;
    }

    public List<Financiamiento> getFinanciamientos() {
        return Collections.unmodifiableList(financiamientos);
    }

    public void setFinanciamientos(List<Financiamiento> financiamientos) {
        this.financiamientos = financiamientos;
    }

    public List<Grado> getGrados() {
        List<Grado> i = new ArrayList<>();
        for (Grado g : grados) {
            if (g.getGradoMaestroGuia() == null) {
                g.setGradoMaestroGuia(new Maestro(0));
                g.getGradoMaestroGuia().setPersona(new Persona(0, "", "", true));
            }

            i.add(g);
        }
        return i;
    }

    public void setGrados(List<Grado> grados) {
        this.grados = grados;
    }

    public List<Maestro> getMaestros() {
        return maestroFL.findAll();
    }

    public Horario getHora() {
        return hora;
    }

    public void setHora(Horario horario) {
        this.hora = horario == null ? new Horario(0, new Date(), new Date()) : horario;
    }

    private void enviarNotificación(Object o, String tabla) {
        Persona usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        if (tabla.equals("zona")) {
            Zona z = (Zona) o;
            sendMessage(new mensaje(0, usuario.getIdpersona(), "??",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Zonas modificadas ",
                            "Modificación:" + z.getZonaNombre())).toString());
        }
    }

    @Inject
    @Push
    private PushContext notificacion;

    public void sendMessage(Object message) {
        notificacion.send(message);
    }

}
