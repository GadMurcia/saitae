/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.Persona;
import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;

/**
 *
 * @author delsas
 */
@Named(value = "sessionController")
@ViewScoped
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
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            Persona u = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (u == null) {

                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
                context.getExternalContext().redirect("./../");

            } else {
                FacesMessage ms = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
                context.addMessage("growl", ms != null ? ms : new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido",
                        "Gracias por iniciar Sesión " + u.getPersonaNombre()));
                this.setUs(u);
                context.getExternalContext().getSessionMap().remove("mensaje");
            }
            this.menu();
        } catch (IOException ex) {
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

    private void menu() {
        mm = new DefaultMenuModel();
        DefaultMenuItem mi;
        for (AccesoTipoPersona atp : us.getTipoPersona().getAccesoTipoPersonaList()) {
            mi = new DefaultMenuItem(atp.getAcceso().getAccesoNombre());
            mi.setIcon("ui-icon-close");
            mi.setUrl(atp.getAcceso().getAccesourl());
            mm.addElement(mi);
        }
        mi = new DefaultMenuItem("salir");
        mi.setIcon("ui-icon-close");
        mi.setAjax(false);
        mi.setCommand("#{sessionController.cerrarSesion()}");
        mm.addElement(mi);
    }

    public void cerrarSesion() {
        ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
        context.invalidateSession();
        context.getSessionMap().remove("usuario");
        try {
            context.redirect("./../");
        } catch (IOException ex) {
            Logger.getLogger(sessionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getUsNie() {
        return Integer.valueOf(us.getIdpersona().toString().subSequence(1, us.getIdpersona().toString().split("").length - 1).toString());
    }

    public void setUsNie(int nie) {
        us.setIdpersona(Integer.valueOf("1" + nie));
    }

    public String getAño() {
        return String.valueOf(Calendar.getInstance().getTime().getYear()+1900);
    }
}
