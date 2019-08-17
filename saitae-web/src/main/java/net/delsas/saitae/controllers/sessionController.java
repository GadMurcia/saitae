/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import net.delsas.saitae.aux.mensaje;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.ToggleEvent;
import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;
import org.primefaces.model.menu.DefaultSubMenu;
import org.primefaces.model.menu.MenuElement;

/**
 *
 * @author delsas
 */
@Named
@SessionScoped
public class sessionController implements Serializable {

    private static final long serialVersionUID = 1L;

    private DefaultMenuModel mm;
    private Persona us;
    @EJB
    private TipoPersonaFacadeLocal tpfl;

    @PostConstruct
    public void init() {
        // this.menu();
    }

    public void log() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            Persona u = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (u == null) {

                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
                context.getExternalContext().redirect("./../");

            } else {
                this.setUs(u);
                FacesMessage ms = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
                if (!((boolean) context.getExternalContext().getSessionMap().get("primerInicio"))) {
                    if (ms != null) {
                        context.addMessage("growl", ms);
                        context.getExternalContext().getSessionMap().remove("mensaje");
                    }
                } else {
                    context.addMessage("growl", new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido",
                            "Gracias por iniciar Sesión " + u.getPersonaNombre()));
                    context.getExternalContext().getSessionMap().remove("primerInicio");
                    context.getExternalContext().getSessionMap().put("primerInicio", false);
                    this.menu2();
                }
            }
        } catch (Exception ex) {
            context.addMessage("growl", new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado", ex.getMessage()));
        }
    }

    public Persona getUs() {
        return us;
    }

    public void setUs(Persona us) {
        this.us = us;
    }

    public DefaultMenuModel getMm() {
        return mm;
    }

    public void setMm(DefaultMenuModel mm) {
        this.mm = mm;
    }

    public void menu2() {
        mm = new DefaultMenuModel();
        DefaultMenuItem mi;
        mi = new DefaultMenuItem("Inicio");
        mi.setIcon("pi pi-home");
        mi.setUrl("perfil.intex");
        mm.addElement(mi);
        List<Acceso> ac = new ArrayList<>();
        for (AccesoTipoPersona atp : us.getTipoPersona().getAccesoTipoPersonaList()) {
            ac.add(atp.getAcceso());
        }
        for (Acceso a : ac) {
            if (a.getAccesoIndice() == null) {
                mm.addElement(menu3(a, ac));
            }
        }
        if (us.getTipoPersona().getIdtipoPersona() == 1) {
            mi = new DefaultMenuItem("Control de vistas");
            mi.setIcon("fa fa-wrench");
            mi.setUrl("cvista.intex");
            mm.addElement(mi);
        }
        mi = new DefaultMenuItem("salir");
        mi.setIcon("fa fa-close");
        mi.setAjax(false);
        mi.setCommand("#{sessionController.cerrarSesion()}");
        mm.addElement(mi);
    }

    private MenuElement menu3(Acceso a, List<Acceso> ac) {
        DefaultSubMenu s = new DefaultSubMenu(a.getAccesoNombre(), a.getAccesoComentario());
        for (Acceso b : a.getAccesoList()) {
            if (ac.contains(b)) {
                if (b.getAccesoList() == null || b.getAccesoList().isEmpty()) {
                    s.addElement(new DefaultMenuItem(b.getAccesoNombre(), b.getAccesoComentario(), b.getAccesourl()));
                }else{
                    s.addElement(menu3(b, ac));
                }
            }
        }
        return s;
    }

    public void cerrarSesion() {
        ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
        context.getSessionMap().remove("usuario");
        context.invalidateSession();
        try {
            context.redirect("./../");
        } catch (IOException ex) {
            Logger.getLogger(sessionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void onToggle(ToggleEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, 
                event.getComponent().getId() + " toggled", "Status:" + event.getVisibility().name());
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public int getUsNie() {
        return Integer.valueOf(us.getIdpersona().toString().subSequence(1, us.getIdpersona().toString().split("").length - 1).toString());
    }

    public void setUsNie(int nie) {
        us.setIdpersona(Integer.valueOf("1" + nie));
    }

    public int getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }
    
    public void escucha(){
        try {
            String mss = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("mss");
            mensaje m=new mensaje(mss);
            FacesContext.getCurrentInstance().addMessage(null, m.getFacesmessage());
        } catch (Exception ex) {
            Logger.getLogger(sessionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
