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
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
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
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoMateria;
import net.delsas.saitae.entities.TipoNombramiento;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipopersonaPermiso;
import net.delsas.saitae.entities.Zona;
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
               materias.add(new Materia());
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
                break;
            case "form:tw:reserva":
                tipoReservaFL.edit((TipoReserva) event.getObject());
                titulo = "Tipo Reserva";
                mensaje = ((TipoReserva) event.getObject()).getTipoReservaNombre();
                break;
            case "form:tw:materia":
                TipoMateria m = (TipoMateria) event.getObject();
                tipoMateriaFL.edit(m);
                titulo = "Tipo de Materia";
                mensaje = ((TipoMateria) event.getObject()).getTipoMateriaNombre();
                break;
            case "form:materia:":
                Materia ma = (Materia) event.getObject();
                materiaFL.edit(ma);
                titulo = "Materia";
                mensaje = ((Materia) event.getObject()).getMateriaNombre();
                break;
                
            default:
                System.out.println(id);
        }
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
                 case "form:materia":
                Materia ma = (Materia) event.getObject();
                if (ma.getMateriaNombre()== null || ma.getMateriaNombre().isEmpty()) {
                    materias.remove(ma);
                }
                mensaje = ma.getMateriaNombre();
                break;
            default:
                System.out.println(id);
        }
        FacesMessage msg = new FacesMessage("Edición cancelada", mensaje);
        FacesContext.getCurrentInstance().addMessage(null, msg);
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

    public List<TipoRecurso> getRecursos() {
        return recursos;
    }

    public void setRecursos(List<TipoRecurso> recursos) {
        this.recursos = recursos;
    }

    public List<TipoPermiso> getAll() {
        return all;
    }

    public void setAll(List<TipoPermiso> all) {
        this.all = all;
    }

    public List<TipoCargo> getCargos() {
        return cargos;
    }

    public void setCargos(List<TipoCargo> cargos) {
        this.cargos = cargos;
    }

    public List<TipoPersona> getPersonas() {
        return Personas;
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
        return zonas;
    }

    public void setZonas(List<Zona> zonas) {
        this.zonas = zonas;
    }

    public List<TipoReserva> getReservas() {
        return reservas;
    }

    public void setReservas(List<TipoReserva> reservas) {
        this.reservas = reservas;
    }

    public List<TipoNombramiento> getNombramientos() {
        return nombramientos;
    }

    public void setNombramientos(List<TipoNombramiento> nombramientos) {
        this.nombramientos = nombramientos;
    }   

    public List<Materia> getMaterias() {
        return materias;
    }

    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    public List<TipoMateria> getTipoMaterias() {
        return tipoMaterias;
    }

    public void setTipoMaterias(List<TipoMateria> tipoMaterias) {
        this.tipoMaterias = tipoMaterias;
    }
    
    

}
