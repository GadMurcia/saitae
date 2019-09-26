/*
 * Copyright (C) 2019 gabriela
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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;

/**
 *
 * @author gabriela
 */
@Named
@ViewScoped
public class permisoMaController implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private PersonaFacadeLocal personaFL;
    
    private List<TipopersonaPermiso> permisos;
    private Persona usuario;
    
    private Permisos p;
    
    @PostConstruct
    public void init() {
        
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
             boolean r = usuario.getTipoPersona().getIdtipoPersona().equals(8) ? true
                    : !usuario.getTipoPersona().getIdtipoPersona().equals(9);
            
            if (usuario == null || r) {
                
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                        "Falla!", "Esa vista no le está permitida."));
                context.getExternalContext().redirect("./../");
                
            } else {
                p = new Permisos();
                p.setTipoPermiso1(new TipoPermiso(0));
                p.setPermisosPK(new PermisosPK(0, new Date(), 0, new Date()));
                permisos = usuario.getTipoPersona().getTipopersonaPermisoList();
                p.setTipoPersona(usuario.getTipoPersona());
                p.setPersona(usuario);
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
                p.setPermisosSolicitante(usuario);
                p.setPermisosComentario("0¿¿0¿¿0¿¿0 ");
                
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void guardar() {
        FacesMessage ms = null;
        try {
            if (p.getPermisosPK().getPermisoFechaInicio().before(new SimpleDateFormat("dd/mm/yyyy").parse(new SimpleDateFormat("dd/mm/yyyy").format(new Date())))) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Error en la fecha de inicio del permiso",
                        "No debe seleccionar una fecha para el inicio del periodo del permiso anterior a la actual."));
                p.getPermisosPK().setPermisoFechaInicio(new Date());
            } else if (p.getPermisoFechafin().before(p.getPermisosPK().getPermisoFechaInicio())) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Error en la fecha de fin del permiso",
                        "No debe seleccionar una fecha para el final del periodo del permiso anterior a la fecha en la que inicia éste."));
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
            } else {
                p.getPermisosPK().setTipoPermiso(p.getTipoPermiso1().getIdtipoPermiso());
                p.setPermisosSolicitante(usuario);
                p.setPermisosMotivo(" ");
                p.getPermisosPK().setIpPersona(usuario.getIdpersona());
                p.setPermisosEstado("0");
                pfl.create(p);
                ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                        "Su permiso se ha solicitado para entre las fechas: "
                        + (new SimpleDateFormat("dd/mm/yyyy").format(p.getPermisosPK().getPermisoFechaInicio())) + " y "
                        + (new SimpleDateFormat("dd/mm/yyyy").format(p.getPermisoFechafin())));
                sendMessage(new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                        + " ha solicitado un nuevo permiso.",
                        "Solicitud de permiso nueva", FacesMessage.SEVERITY_INFO, usuario.getIdpersona(), "tp¿¿3").toString());
                
                FacesContext.getCurrentInstance().addMessage(null, ms);
                p = new Permisos(new PermisosPK((usuario == null ? 0 : usuario.getIdpersona()), new Date(), 0, new Date()));
                p.setTipoPersona(tipoPersonaFL.find(8));
                p.setPersona(new Persona(0));
                p.setTipoPermiso1(new TipoPermiso(0));
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
                p.setPermisosComentario("0¿¿0¿¿0¿¿0 ");
            }
        } catch (Exception e) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", e.getMessage());
            FacesContext.getCurrentInstance().addMessage(null, ms);
        }
    }
    
    public ArrayList<TipoPermiso> getListaPermisos() {
        ArrayList<TipoPermiso> items = new ArrayList<>();
        if(permisos != null){
        for (TipopersonaPermiso t : permisos) {
            items.add(t.getTipoPermiso());
        }
        }
        return items;
    }
        
    
    public List<TipopersonaPermiso> getPermisos() {
        return permisos;
    }
    
    public void setPermisos(List<TipopersonaPermiso> permisos) {
        this.permisos = permisos;
    }
    
    public Persona getUsuario() {
        return usuario;
    }
    
    public void setUsuario(Persona usuario) {
        this.usuario = usuario;
    }
    
    public Permisos getP() {
        return p;
    }
    
    public void setP(Permisos p) {
        this.p = p;
    }
    
    @Inject
    @Push
    private PushContext notificacion;
    
    public void sendMessage(String message) {
        notificacion.send(message);
    }
    
    public boolean getGoceDeSueldo() {
    return  p == null ? false : p.getPermisosComentario().split("¿¿")[0].equals("1");
        
        
    }
    
    public boolean getLicenciasAnteriores() {
        return p == null ? false : p.getPermisosComentario().split("¿¿")[1].equals("1");
    }
    
    public void setGoceDeSueldo(boolean goce) {
        p.setPermisosComentario((goce ? "1" : "0") + "¿¿" + (getLicenciasAnteriores() ? "1" : "0"));
    }

    public void setLicenciasAnteriores(boolean lic) {
        p.setPermisosComentario((getGoceDeSueldo() ? "1" : "0") + "¿¿" + (lic ? "1" : "0"));
    }
    
}
