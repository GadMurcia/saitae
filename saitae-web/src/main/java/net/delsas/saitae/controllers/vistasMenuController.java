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
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.TipoPersona;
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
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;

    @PostConstruct
    public void init() {
        tipo = new TipoPersona();
        accesos = accesoFL.findAll();
        tipoPersonas = tipoPersonaFL.findAll();
        model = new DualListModel<>(new ArrayList<>(), new ArrayList<>());
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
        switch (event.getComponent().getId()) {
            case "accesos":
                Acceso a = (Acceso) event.getObject();
                if (a.getIdacceso() != null) {
                    accesoFL.edit(a);
                } else {
                    accesoFL.create(a);
                }
                accesos.add(a);
                titulo = "Tipo de recurso";
                mensaje = ((Acceso) event.getObject()).getAccesoNombre();
                break;
            case "tipo":
                TipoPersona tp = (TipoPersona) event.getObject();
                if (tp.getIdtipoPersona() != null) {
                    tipoPersonaFL.edit(tp);
                } else {
                    tipoPersonaFL.create(tp);
                }
                tipoPersonas.add(tp);
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
            tipo.getAccesoTipoPersonaList().stream().map((a) -> {
                l.add(a.getAcceso());
                return a;
            }).forEachOrdered((a) -> {
                target.add(a.getAcceso().getAccesoNombre());
            });

            accesos.stream().filter((p) -> (!l.contains(p))).forEachOrdered((p) -> {
                source.add(p.getAccesoNombre());
            });
            FacesMessage msg = new FacesMessage("Persona seleccionada", tipo.getTipoPersonaNombre());
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        model.setTarget(target);
        model.setSource(source);
    }

    public List<SelectItem> getTiposPersonas() {
        List<SelectItem> list = new ArrayList<>();
        list.add(new SelectItem(0, "Seleccione"));
        tipoPersonas.forEach((p) -> {
            list.add(new SelectItem(p.getIdtipoPersona(), p.getTipoPersonaNombre()));
        });
        return list;
    }

    public void guardar() {
        if (tipo.getIdtipoPersona() > 0) {
            List<AccesoTipoPersona> access = new ArrayList<>();
            model.getTarget().forEach((g) -> {
                accesos.stream().filter((t) -> (g.equals(t.getAccesoNombre()))).map((t) -> {
                    AccesoTipoPersona r = new AccesoTipoPersona(t.getIdacceso(), tipo.getIdtipoPersona());
                    r.setAcceso(t);
                    return r;
                }).map((r) -> {
                    r.setTipoPersona(tipo);
                    return r;
                }).map((r) -> {
                    r.setAccesoTipoPersonaComentario("");
                    return r;
                }).forEachOrdered((r) -> {
                    access.add(r);
                });
            });
            tipo.getAccesoTipoPersonaList().stream().filter((t) -> (!access.contains(t))).forEachOrdered((t) -> {
                accesoTPFL.remove(t);
            });
            tipo.setAccesoTipoPersonaList(access);
            access.forEach((atp) -> {
                AccesoTipoPersona a = accesoTPFL.find(atp.getAccesoTipoPersonaPK());
                if (a == null) {
                    accesoTPFL.create(atp);
                } else {
                    accesoTPFL.edit(atp);
                }
            });
            tipoPersonaFL.edit(tipo);
            Auxiliar.persistirNotificación(
                    new mensaje(0, 1045367073, "perfil<form0:menubar¿¿¿tp¿¿" + tipo.getIdtipoPersona(),
                            new FacesMessage(FacesMessage.SEVERITY_INFO,
                                    "Cambios en el menú",
                                    "La barra de menús ha sufrido cambios y los verá cuando "
                                    + "actualice o cambie de página. Notificación del sistema.")),
                    Auxiliar.getPersonasParaNotificar(tipo),
                    notiFL, notificacion);
            String m = "Al Tipo de Ususario " + tipo.getTipoPersonaNombre();
            if (model.getTarget().size() > 0) {
                m += " se le han asignado los siguientes accesos:";
                m = model.getTarget().stream().map((d) -> "\n* " + d + ".").reduce(m, String::concat);
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
        accesos.forEach((a) -> {
            items.add(new SelectItem(a.getIdacceso(), a.getAccesoNombre()));
        });
        return items;
    }

    public List<Acceso> getAccesos() {
        return Collections.unmodifiableList(accesos);
    }

    public void setAccesos(List<Acceso> accesos) {
        this.accesos = accesos;
    }

    public List<TipoPersona> getTipoPersonas() {
        return Collections.unmodifiableList(tipoPersonas);
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
