package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.TipoPersona;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;

/**
 *
 * @author delsas
 */
@Named(value = "tipoPersonaController")
@ViewScoped
public class TipoPersonaController implements Serializable {

    private static final long serialVersionUID = 1L;

    private TipoPersona tipoPersona;

    private List<TipoPersona> personas;

    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;

    /**
     * Creates a new instance of tipoPersonaPermiso
     */
    @PostConstruct
    public void tipoPersonaPermisoController() {
        tipoPersona = new TipoPersona();
        personas = tipoPersonaFL.findAll();
        //rellenarPerm2();
    }


    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public List<TipoPersona> getPersonas() {
        return personas;
    }

    public void setPersonas(List<TipoPersona> personas) {
        this.personas = personas;
    }

    public void setSelectedTipoPersona(TipoPersona tp) {
        this.tipoPersona = tp;
    }

    public TipoPersona getSelectedTipoPersona() {
        return this.tipoPersona;
    }

    public void onRowSelect(SelectEvent event) {
        tipoPersona = (TipoPersona) event.getObject();
        FacesMessage msg = new FacesMessage("Tipo de usuario Seleccionado", ((TipoPersona) event.getObject()).getTipoPersonaNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowUnselect(UnselectEvent event) {
        tipoPersona = new TipoPersona(0);
        FacesMessage msg = new FacesMessage("Tipo de Usuario Desmarcado", ((TipoPersona) event.getObject()).getIdtipoPersona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onAddNew() {
        // Add one new car to the table:
        TipoPersona p = new TipoPersona(personas.size() + 1);
        personas.add(p);
        FacesMessage msg = new FacesMessage("New Zone added", p.getIdtipoPersona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowEdit(RowEditEvent event) {
        TipoPersona name = (TipoPersona) event.getObject();
        if (tipoPersonaFL.find(name.getIdtipoPersona()) == null) {
            tipoPersonaFL.create(name);
        } else {
            tipoPersonaFL.edit(name);
        }
        FacesMessage msg = new FacesMessage("tipo Persona Edited", ((TipoPersona) event.getObject()).getIdtipoPersona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        TipoPersona z = (TipoPersona) event.getObject();
        if (z.getTipoPersonaNombre() == null || z.getTipoPersonaNombre().isEmpty()) {
            personas.remove(personas.indexOf(z));
        }
        FacesMessage msg = new FacesMessage("Edit Cancelled", ((TipoPersona) event.getObject()).getIdtipoPersona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    

}
