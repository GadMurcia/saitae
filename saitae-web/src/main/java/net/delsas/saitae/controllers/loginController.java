package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.Calendar;
import javax.ejb.EJB;
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
    private String user;
    private String pass;
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

    public void login() {
        String q[] = user.split("-");
        String u = 1 + (q.length > 0 ? q[0] : "0") + (q.length > 1 ? q[1] : "");
        int w;
        try {
            w = Integer.valueOf(u);
        } catch (NumberFormatException e) {
            w = 0;
        }
        String passwd=DigestUtils.md5Hex(pass);
        Persona p = pfl.find(w);
        if (p != null && p.getPersonaActivo() && p.getPersonaContrasenya().equals(passwd)) {
            System.out.println("logueado");
        } else {
            System.out.println("no logueado");
        }
    }

    public int getYear() {
        return (Calendar.getInstance().getTime().getYear() + 1900);
    }

}
