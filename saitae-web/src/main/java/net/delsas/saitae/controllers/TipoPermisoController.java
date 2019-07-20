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
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipopersonaPermiso;
import net.delsas.saitae.entities.TipopersonaPermisoPK;
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
public class TipoPermisoController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private TipopersonaPermisoFacadeLocal tppfl;
    @EJB
    private TipoPersonaFacadeLocal personaFL;
    private TipopersonaPermiso personaPermiso;
    private List<TipoPersona> Personas;
    private TipoPersona tipo;
    private DualListModel<String> model;

    @EJB
    private TipoPermisoFacadeLocal tpfl;
    private TipoPermiso tp;
    private List<TipoPermiso> all;

    @PostConstruct
    public void init() {
        tp = new TipoPermiso(0);
        tipo = new TipoPersona(0);
        personaPermiso = new TipopersonaPermiso(new TipopersonaPermisoPK());
        all = tpfl.findAll();
        Personas = personaFL.findAll();
        model = new DualListModel<>(new ArrayList<String>(), new ArrayList<String>());
    }

    public void nuevo() {
        try {
            tpfl.edit(tp);
            all.add(tp);
        } catch (Exception e) {

        }
    }

    public List<SelectItem> getTiposPersonas() {
        List<SelectItem> list = new ArrayList<>();
        list.add(new SelectItem(0, "Seleccione"));
        for (TipoPersona p : Personas) {
            list.add(new SelectItem(p.getIdtipoPersona(), p.getTipoPersonaNombre()));
        }
        return list;
    }

    public void onItemSelect(ItemSelectEvent event) {
        tipo = personaFL.find(tipo.getIdtipoPersona());
        tipo = tipo == null ? new TipoPersona(0) : tipo;
        List<TipoPermiso> l = new ArrayList<>();
        List<String> target = new ArrayList<>();
        List<String> source = new ArrayList<>();
        if (tipo.getIdtipoPersona() > 0) {
            for (TipopersonaPermiso a : tipo.getTipopersonaPermisoList()) {
                l.add(a.getTipoPermiso());
                target.add(a.getTipoPermiso().getTipoPermisoNombre());
            }

            for (TipoPermiso p : all) {
                if (!l.contains(p)) {
                    source.add(p.getTipoPermisoNombre());
                }
            }
            FacesMessage msg = new FacesMessage("Persona seleccionada", tipo.getTipoPersonaNombre());
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        model.setTarget(target);
        model.setSource(source);
    }

    public void onAddNew() {
        // Add one new car to the table:
        TipoPermiso p = new TipoPermiso(all.size() + 1);
        all.add(p);
        FacesMessage msg = new FacesMessage("Campos Nuevos agregados.",
                "Edite los campos para que las modificaciones sean permenentes");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowEdit(RowEditEvent event) {
        TipoPermiso name = (TipoPermiso) event.getObject();
        tpfl.edit(name);
        FacesMessage msg = new FacesMessage("Tipo Permiso Editado", ((TipoPermiso) event.getObject()).getTipoPermisoNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        TipoPermiso z = (TipoPermiso) event.getObject();
        if (z.getTipoPermisoNombre() == null || z.getTipoPermisoNombre().isEmpty()) {
            all.remove(z);
        }
        FacesMessage msg = new FacesMessage("Edición cancelada", ((TipoPermiso) event.getObject()).getTipoPermisoNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public TipopersonaPermiso getPersonaPermiso() {
        return personaPermiso;
    }

    public void setPersonaPermiso(TipopersonaPermiso personaPermiso) {
        this.personaPermiso = personaPermiso;
    }

    public List<TipoPersona> getPersonas() {
        return Personas;
    }

    public void setPersonas(List<TipoPersona> Personas) {
        this.Personas = Personas;
    }

    public TipoPersona getTipo() {
        return tipo;
    }

    public void setTipo(TipoPersona tipo) {
        this.tipo = tipo;
    }

    public TipoPermiso getTp() {
        return tp;
    }

    public void setTp(TipoPermiso tp) {
        this.tp = tp;
    }

    public List<TipoPermiso> getAll() {
        return all;
    }

    public void setAll(List<TipoPermiso> all) {
        this.all = all;
    }

    public DualListModel<String> getModel() {
        return model;
    }

    public void setModel(DualListModel<String> model) {
        this.model = model;
    }

    public void guardar() {
        if (tipo.getIdtipoPersona() > 0) {
            List<TipopersonaPermiso> permisos = new ArrayList<>();
            for (String g : model.getTarget()) {
                for (TipoPermiso t : all) {
                    if (g.equals(t.getTipoPermisoNombre())) {
                        TipopersonaPermiso r = new TipopersonaPermiso(tipo.getIdtipoPersona(), t.getIdtipoPermiso());
                        r.setTipoPermiso(t);
                        r.setTipoPersona(tipo);
                        r.setTipopersonaPermisoComentario("");
                        permisos.add(r);
                    }
                }
            }
            for (TipopersonaPermiso t : tipo.getTipopersonaPermisoList()) {
                if (!permisos.contains(t)) {
                    tppfl.remove(t);
                }
            }
            tipo.setTipopersonaPermisoList(permisos);
            personaFL.edit(tipo);
            String m="Al Tipo de Ususario "+tipo.getTipoPersonaNombre();
            if(model.getTarget().size()>0){
            m+=" se le han asignado los Tipos de permisos:";
            for(String d: model.getTarget()){
                m+="\n* "+d+".";
            }            
            }else{
                m+=" Se le han removido todos los tipos de permisos.";
            }
            FacesMessage msg = new FacesMessage("Las modificaciones se han realizado:", m);
            FacesContext.getCurrentInstance().addMessage(null, msg);
            PrimeFaces.current().ajax().update("form:msgs");
        }
    }

}
