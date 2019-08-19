package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author delsas
 */
@Named(value = "loginController")
@ViewScoped
public class loginController implements Serializable {

    private static final long serialVersionUID = 1L;
    private String user = "";
    private String pass = "";
    @EJB
    private PersonaFacadeLocal pfl;

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void preinit() {
        FacesContext context = FacesContext.getCurrentInstance();
        Persona u = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        if (u == null) {
            FacesMessage fm = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
            if (fm == null) {
                fm = new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido", "Inicie Sesión para más funcionalidades.");
            }
            context.addMessage("grolm", fm);
            context.getExternalContext().getSessionMap().remove("mensaje");
        } else {
            try {
                context.getExternalContext().redirect("pages/perfil.intex");
            } catch (IOException ex) {
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(
                        FacesMessage.SEVERITY_FATAL, "Error", ex.getMessage()));
            }
        }

    }

    public void login() {
        String q[] = user.split("-");
        String u = 1 + (q.length > 0 ? q[0] : "0") + (q.length > 1 ? q[1] : "");
        int w;
        try {
            w = Integer.valueOf(u);
        } catch (NumberFormatException e) {
            w = 0;
        }
        String passwd = DigestUtils.md5Hex(pass);
        Persona p = /*new prueba().getEstudiante().getPersona();//*/ pfl.find(w);
        System.out.println("contra "+p.getPersonaContrasenya());
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            if (p != null && p.getPersonaActivo() && p.getPersonaContrasenya().equals(passwd)) {
                System.out.println("logueado");
                context.getExternalContext().getSessionMap().put("usuario", p);
                context.getExternalContext().getSessionMap().put("primerInicio", true);
                context.getExternalContext().redirect("pages/perfil.intex");
            } else {
                System.out.println("no logueado");
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(
                        FacesMessage.SEVERITY_ERROR, "Loggin Error", "Credenciales no validas"));
                context.getExternalContext().redirect("");
            }
        } catch (IOException e) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(
                    FacesMessage.SEVERITY_FATAL, "Loggin Error", "Vaya! Hubo un problema inesperado."));
            try {
                context.getExternalContext().redirect("index.intex");
            } catch (IOException ex) {
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(
                        FacesMessage.SEVERITY_FATAL, "Error", ex.getMessage()));
            }
        }
    }

    public int getYear() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

}
