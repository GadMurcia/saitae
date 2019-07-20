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
import org.primefaces.PrimeFaces;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.model.DualListModel;

/**
 *
 * @author delsas
 */
@Named(value = "tipoPersonaController")
@ViewScoped
public class TipoPersonaController implements Serializable {

    private static final long serialVersionUID = 1L;

    private TipoPersona tipoPersona;
    @EJB
    private TipopersonaPermisoFacadeLocal tppfl;
    @EJB
    private TipoPermisoFacadeLocal permisoFL;
    @EJB
    private TipoPersonaFacadeLocal personaFL;
    private List<TipoPersona> Personas;
    private TipoPersona tipo;
    private DualListModel<String> model;

    /**
     * Creates a new instance of tipoPersonaPermiso
     */
    @PostConstruct
    public void tipoPersonaPermisoController() {
        tipoPersona = new TipoPersona();
        tipo = new TipoPersona(0);
        Personas = personaFL.findAll();
        model = new DualListModel<>(new ArrayList<String>(), new ArrayList<String>());
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public void setSelectedTipoPersona(TipoPersona tp) {
        this.tipoPersona = tp;
    }

    public TipoPersona getSelectedTipoPersona() {
        return this.tipoPersona;
    }

    public void onAddNew() {
        // Add one new car to the table:
        TipoPersona p = new TipoPersona(Personas.size() + 1);
        Personas.add(p);
        FacesMessage msg = new FacesMessage("Nuevo Tipo de Usuario Agregado",
                "Modifique los campos para que los cambios sean permanentes.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowEdit(RowEditEvent event) {
        TipoPersona name = (TipoPersona) event.getObject();
        if (personaFL.find(name.getIdtipoPersona()) == null) {
            personaFL.create(name);
        } else {
            personaFL.edit(name);
        }
        FacesMessage msg = new FacesMessage("Edición exitosa.", "Editado: "
                + ((TipoPersona) event.getObject()).getTipoPersonaNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        TipoPersona z = (TipoPersona) event.getObject();
        if (z.getTipoPersonaNombre() == null || z.getTipoPersonaNombre().isEmpty()) {
            Personas.remove(Personas.indexOf(z));
        }
        FacesMessage msg = new FacesMessage("Edición cancelada", "El registro se ha restablecido.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
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

            for (TipoPermiso p : permisoFL.findAll()) {
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

    public List<SelectItem> getTiposPersonas() {
        List<SelectItem> list = new ArrayList<>();
        list.add(new SelectItem(0, "Seleccione"));
        for (TipoPersona p : Personas) {
            list.add(new SelectItem(p.getIdtipoPersona(), p.getTipoPersonaNombre()));
        }
        return list;
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

    public void guardar() {
        if (tipo.getIdtipoPersona() > 0) {
            List<TipopersonaPermiso> permisos = new ArrayList<>();
            for (String g : model.getTarget()) {
                for (TipoPermiso t : permisoFL.findAll()) {
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
            String m = "Al Tipo de Ususario " + tipo.getTipoPersonaNombre();
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

    public List<TipoPersona> getPersonas() {
        return Personas;
    }

    public void setPersonas(List<TipoPersona> Personas) {
        this.Personas = Personas;
    }
}
