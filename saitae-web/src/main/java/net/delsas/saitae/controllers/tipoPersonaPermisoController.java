package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipopersonaPermiso;
import net.delsas.saitae.entities.TipopersonaPermisoPK;
import net.delsas.saitae.entities.Zona;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DualListModel;

/**
 *
 * @author delsas
 */
@Named(value = "tipoPersonaPermisoController")
@ViewScoped
public class tipoPersonaPermisoController implements Serializable {

    private static final long serialVersionUID = 1L;

    private TipoPermiso tipoPermiso;
    private TipoPersona tipoPersona;

    private DualListModel<String> permisos;
    private List<TipoPersona> personas;
    private List<String> perm2;
    private List<TipoPermiso> perm1;
    private List<String> perm3;

    @EJB
    private TipopersonaPermisoFacadeLocal tipopersonaPermisoFL;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private TipoPermisoFacadeLocal tipoPermisoFL;

    /**
     * Creates a new instance of tipoPersonaPermiso
     */
    @PostConstruct
    public void tipoPersonaPermisoController() {
        tipoPermiso = new TipoPermiso();
        tipoPersona = new TipoPersona();
        perm1 = tipoPermisoFL.findAll();
        personas = tipoPersonaFL.findAll();
        perm3 = new ArrayList<>();        
        rellenarPerm2();
        permisos = new DualListModel<>(perm2, perm3);
    }

    public TipoPermiso getTipoPermiso() {
        return tipoPermiso;
    }

    public void setTipoPermiso(TipoPermiso tipoPermiso) {
        this.tipoPermiso = tipoPermiso;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public DualListModel<String> getPermisos() {
        return permisos;
    }

    public void setPermisos(DualListModel<String> permisos) {
        this.permisos = permisos;
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
        rellenarPerm2();
        perm3=new ArrayList<>();
        for (TipopersonaPermiso tp : tipopersonaPermisoFL.tiposPermisosPorPersona(
                tipoPersona.getIdtipoPersona())) {
            perm3.add(perm1.indexOf(tp.getTipoPermiso()), tp.getTipoPermiso().getTipoPermisoNombre());
        }
        for(String f : perm3){
            if(perm2.contains(f)){
                perm2.remove(f);
            }
        }
        FacesMessage msg = new FacesMessage("Car Selected", ((TipoPersona) event.getObject()).getIdtipoPersona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowUnselect(UnselectEvent event) {
        tipoPersona = new TipoPersona(0);
        perm2=new ArrayList<>();
        FacesMessage msg = new FacesMessage("Car Unselected", ((TipoPersona) event.getObject()).getIdtipoPersona() + "");
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
        tipoPersonaFL.edit((TipoPersona) event.getObject());
        FacesMessage msg = new FacesMessage("tipo Persona Edited", ((TipoPersona) event.getObject()).getIdtipoPersona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        TipoPersona z = (TipoPersona) event.getObject();
        if (z.getTipoPersonaNombre() == null || z.getTipoPersonaNombre().isEmpty()) {
            personas.remove(personas.indexOf(z));
        }
        FacesMessage msg = new FacesMessage("Edit Cancelled", ((Zona) event.getObject()).getIdzona() + "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void guardar() {
        if (tipoPersona != null && tipoPersona.getIdtipoPersona() != 0) {
            for (String g : permisos.getTarget()) {
                tipopersonaPermisoFL.create(new TipopersonaPermiso(
                        new TipopersonaPermisoPK(tipoPersona.getIdtipoPersona(),
                                idperm1DePerm3(g))));
            }
            rellenarPerm2();
        }
    }
    
    private int idperm1DePerm3(String g){
        for(TipoPermiso tp: perm1){
            if(g.equals(tp.getTipoPermisoNombre())){
                return tp.getIdtipoPermiso();
            }
        }
        return 0;
    }
    
    private void rellenarPerm2(){
        perm2=new ArrayList<>();
        for (TipoPermiso tp : perm1) {
            perm2.add(perm1.indexOf(tp), tp.getTipoPermisoNombre());
        }
    }

}
