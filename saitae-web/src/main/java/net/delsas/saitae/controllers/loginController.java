package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.Cookie;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.PrimeFaces;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
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
        Integer w;
        try {
            w = Integer.valueOf(u);
        } catch (NumberFormatException e) {
            w = 0;
        }
        String passwd = DigestUtils.md5Hex(pass);
        Persona p = pfl.find(w);
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            if (p != null && p.getPersonaActivo() && p.getPersonaContrasenya().equals(passwd)) {
                System.out.println("El usuario " + p.getPersonaNombre() + " " + p.getPersonaApellido()
                        + " (" + p.getTipoPersona().getTipoPersonaNombre() + ") ha iniciado sesión el "
                        + new SimpleDateFormat("EEEEE dd/MMM/yyyy hh:mm a").format(new Date()));
                context.getExternalContext().getSessionMap().put("usuario", p);
                context.getExternalContext().getSessionMap().put("primerInicio", true);
                context.getExternalContext().redirect("pages/perfil.intex");
            } else {
                context.addMessage("frm:growl", new FacesMessage(
                        FacesMessage.SEVERITY_ERROR, "Loggin Error", "Credenciales no validas"));
                PrimeFaces.current().ajax().update("frm:growl");
            }
        } catch (IOException e) {
            context.addMessage("frm:growl", new FacesMessage(
                    FacesMessage.SEVERITY_FATAL, "Loggin Error", "Vaya! Hubo un problema inesperado."));
            PrimeFaces.current().ajax().update("frm:growl");
        }
    }
    
    public Integer getYear() {
        return Auxiliar.getAñoActual();
    }
    
    public void redirect() {
        try {
            FacesContext contex = FacesContext.getCurrentInstance();
            contex.getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_FATAL,
                            "Falla!",
                            "Un error desconocido ha afectado a la aplicación y por eso"
                            + " ha sido redirigido a esta página."));
            String pg = "./../";
            contex.getExternalContext().redirect(pg);
            if (contex.getExternalContext().getRequestContextPath().equals("/saitae-web")) {
                Map<String, Object> map = contex.getExternalContext().getRequestCookieMap();
                Cookie k = (Cookie) map.get(0);
                k.setMaxAge(0);
            }
        } catch (Exception ex) {
            FacesContext.getCurrentInstance().addMessage("form:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_ERROR,
                            "Falla!", "Un error desconocido ha afectado a la aplicación y por eso"
                            + " ha sido redirigido a esta página. Clickee el enlace para continuar"));
            PrimeFaces.current().ajax().update("form:msgs");
        }
    }
    
}
