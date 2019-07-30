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
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.primefaces.PrimeFaces;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.model.DualListModel;
import org.primefaces.model.NestedSelectItem;

/**
 *
 * @author delsas
 */
@Named
@SessionScoped
public class vistasMenuController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private AccesoFacadeLocal accesoFL;
    private List<Acceso> accesos;
    private DualListModel<String> model;

    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;

    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    private List<TipoPersona> tipoPersonas;
    private TipoPersona tipo;

    @PostConstruct
    public void init() {
        tipo = new TipoPersona();
        accesos = new ArrayList<>();
        for (Acceso a : accesoFL.findAll()) {
            if (a.getAccesoIndice() == null) {
                a.setAccesoIndice(new Acceso(0));
            }
            accesos.add(a);
        }
        tipoPersonas = tipoPersonaFL.findAll();
        model = new DualListModel<>(new ArrayList<String>(), new ArrayList<String>());
    }

    public void onAddNew(String id) {
        // Add one new car to the table:
        switch (id) {
            case "acceso":
                Acceso a = new Acceso();
                a.setAccesoIndice(new Acceso(0));
                accesos.add(a);
                break;
            case "tipo":
                tipoPersonas.add(new TipoPersona());
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
            case "form:tw:accesos":
                Acceso a = (Acceso) event.getObject();
                if (a.getAccesoIndice().getIdacceso() == 0) {
                    a.setAccesoIndice(null);
                } else {
                    a.setAccesoIndice(accesoFL.find(a.getAccesoIndice().getIdacceso()));
                }
                accesoFL.edit(a);
                titulo = "Tipo de recurso";
                mensaje = ((Acceso) event.getObject()).getAccesoNombre();
                break;
            case "form:tw:tipo":
                tipoPersonaFL.edit((TipoPersona) event.getObject());
                titulo = "Tipo de personas";
                mensaje = ((TipoPersona) event.getObject()).getTipoPersonaNombre();
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
            case "form:tw:accesos":
                Acceso a = ((Acceso) event.getObject());
                if (a.getAccesoNombre() == null || a.getAccesoNombre().isEmpty()) {
                    accesos.remove(a);
                }
                mensaje = a.getAccesoNombre();
                break;
            case "form:tw:tipo":
                TipoPersona tp = (TipoPersona) event.getObject();
                if (tp.getTipoPersonaNombre() == null || tp.getTipoPersonaNombre().isEmpty()) {
                    tipoPersonas.remove(tp);
                }
                mensaje = tp.getTipoPersonaNombre();
                break;
            default:
                System.out.println(id);
        }
        init();
        PrimeFaces.current().ajax().update(id);
        FacesMessage msg = new FacesMessage("Edición cancelada", mensaje);
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onItemSelect(ItemSelectEvent event) {
        tipo = tipoPersonaFL.find(tipo.getIdtipoPersona());
        tipo = tipo == null ? new TipoPersona(0) : tipo;
        List<Acceso> l = new ArrayList<>();
        List<String> target = new ArrayList<>();
        List<String> source = new ArrayList<>();
        if (tipo.getIdtipoPersona() > 0) {
            for (AccesoTipoPersona a : tipo.getAccesoTipoPersonaList()) {
                l.add(a.getAcceso());
                target.add(a.getAcceso().getAccesoNombre());
            }

            for (Acceso p : accesos) {
                if (!l.contains(p)) {
                    source.add(p.getAccesoNombre());
                }
            }
            FacesMessage msg = new FacesMessage("Persona seleccionada", tipo.getTipoPersonaNombre());
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        model.setTarget(target);
        model.setSource(source);
    }

    public List<SelectItem> getTiposPersonas() {
        List<SelectItem> list = new ArrayList<>();
        list.add(new SelectItem(0, "Seleccione"));
        for (TipoPersona p : tipoPersonas) {
            list.add(new SelectItem(p.getIdtipoPersona(), p.getTipoPersonaNombre()));
        }
        return list;
    }

    public void guardar() {
        if (tipo.getIdtipoPersona() > 0) {
            List<AccesoTipoPersona> access = new ArrayList<>();
            for (String g : model.getTarget()) {
                for (Acceso t : accesos) {
                    if (g.equals(t.getAccesoNombre())) {
                        AccesoTipoPersona r = new AccesoTipoPersona(t.getIdacceso(), tipo.getIdtipoPersona());
                        r.setAcceso(t);
                        r.setTipoPersona(tipo);
                        r.setAccesoTipoPersonaComentario("");
                        access.add(r);
                    }
                }
            }
            for (AccesoTipoPersona t : tipo.getAccesoTipoPersonaList()) {
                if (!access.contains(t)) {
                    accesoTPFL.remove(t);
                }
            }
            tipo.setAccesoTipoPersonaList(access);
            tipoPersonaFL.edit(tipo);
            String m = "Al Tipo de Ususario " + tipo.getTipoPersonaNombre();
            if (model.getTarget().size() > 0) {
                m += " se le han asignado los siguientes accesos:";
                for (String d : model.getTarget()) {
                    m += "\n* " + d + ".";
                }
            } else {
                m += " Se le han removido todos los tipos de permisos.";
            }
            FacesMessage msg = new FacesMessage("Las modificaciones se han realizado:", m);
            FacesContext.getCurrentInstance().addMessage(null, msg);
            PrimeFaces.current().ajax().update(new String[]{"form0:msgs", "form0:menubar"});

        }
    }

    public List<SelectItem> getAccesosItems() {
        List<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(0, "Ninguno"));
        for (Acceso a : accesos) {
            items.add(new SelectItem(a.getIdacceso(), a.getAccesoNombre()));
        }
        return items;
    }

    public List<Acceso> getAccesos() {
        return accesos;
    }

    public void setAccesos(List<Acceso> accesos) {
        this.accesos = accesos;
    }

    public List<TipoPersona> getTipoPersonas() {
        return tipoPersonas;
    }

    public void setTipoPersonas(List<TipoPersona> tipoPersonas) {
        this.tipoPersonas = tipoPersonas;
    }

    public TipoPersona getTipo() {
        return tipo;
    }

    public void setTipo(TipoPersona tipo) {
        this.tipo = tipo;
    }

    public DualListModel<String> getModel() {
        return model;
    }

    public void setModel(DualListModel<String> model) {
        this.model = model;
    }

}
