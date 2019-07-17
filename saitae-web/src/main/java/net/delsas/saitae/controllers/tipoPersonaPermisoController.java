package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipopersonaPermiso;

/**
 *
 * @author delsas
 */
@Named(value = "tipoPersonaPermisoController")
@ViewScoped
public class tipoPersonaPermisoController implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private TipopersonaPermiso tipopersonaPermiso;    
    private TipoPermiso tipoPermiso;
    private TipoPersona tipoPersona;
    
    private List<TipoPermiso> permisos;
    private List<TipoPersona> personas;
    
    @EJB
    private TipopersonaPermisoFacadeLocal tipopersonaPermisoFL;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private TipoPermisoFacadeLocal tipoPermisoFL;

    /**
     * Creates a new instance of tipoPersonaPermiso
     */
    public tipoPersonaPermisoController() {
        tipoPermiso = new TipoPermiso();
        tipoPersona = new TipoPersona();
        tipopersonaPermiso = new TipopersonaPermiso();
        permisos=new ArrayList<>();
        personas=new ArrayList<>();
    }

    public TipopersonaPermiso getTipopersonaPermiso() {
        return tipopersonaPermiso;
    }

    public void setTipopersonaPermiso(TipopersonaPermiso tipopersonaPermiso) {
        this.tipopersonaPermiso = tipopersonaPermiso;
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

    public List<TipoPermiso> getPermisos() {
        return permisos;
    }

    public void setPermisos(List<TipoPermiso> permisos) {
        this.permisos = permisos;
    }

    public List<TipoPersona> getPersonas() {
        return personas;
    }

    public void setPersonas(List<TipoPersona> personas) {
        this.personas = personas;
    }
    
    public List<TipoPersona> tiposDePersonas(){
        return tipoPersonaFL.findAll();
    }
    
    public List<TipoPermiso> tiposDePermisos(){
        return tipoPermisoFL.findAll();
    }

}
