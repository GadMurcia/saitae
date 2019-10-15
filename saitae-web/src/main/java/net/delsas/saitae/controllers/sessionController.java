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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Notificaciones;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;
import org.primefaces.PrimeFaces;
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
@ViewScoped
public class sessionController implements Serializable {

    private static final long serialVersionUID = 1L;

    private DefaultMenuModel mm;
    private Persona us;
    @EJB
    private TipoPersonaFacadeLocal tpfl;

    //para notificaciones
    @EJB
    private NotificacionesFacadeLocal notiFL;
    private List<Notificaciones> notificaciones;
    private boolean verNoti;

    @PostConstruct
    public void init() {
        verNoti = false;
        notificaciones = new ArrayList<>();
        log();
    }

    public void log() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            us = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (us == null) {

                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
                context.getExternalContext().redirect("./../");

            } else {
                this.menu();
                FacesMessage ms = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
                List<Notificaciones> not = us.getNotificacionesRecibidasList();
                notificaciones.clear();
                if (not != null) {
                    Collections.sort(not, (Notificaciones o1, Notificaciones o2) -> o2.getFechaHora().hashCode() - o1.getFechaHora().hashCode());
                    if (not.size() <= 5) {
                        notificaciones.addAll(not);
                    } else {
                        for (int y = 0; y < 6; y++) {
                            if (y < not.size()) {
                                notificaciones.add(not.get(y));
                            }
                        }
                    }
                }
                if (!((boolean) context.getExternalContext().getSessionMap().get("primerInicio"))) {
                    if (ms != null) {
                        context.addMessage("growl", ms);
                        context.getExternalContext().getSessionMap().remove("mensaje");
                    }
                } else {
                    context.addMessage("growl", new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido",
                            "Gracias por iniciar Sesión " + us.getPersonaNombre()));
                    context.getExternalContext().getSessionMap().remove("primerInicio");
                    context.getExternalContext().getSessionMap().put("primerInicio", false);
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

    public void menu() {
        mm = new DefaultMenuModel();
        DefaultMenuItem mi;
        mi = new DefaultMenuItem("Inicio");
        mi.setIcon("pi pi-home");
        mi.setUrl("perfil.intex");
        mm.addElement(mi);
        mm.addElement(menu2(us.getTipoPersona().getAccesoTipoPersonaList(),
                us.getTipoPersona().getTipoPersonaNombre(),
                us.getTipoPersona().getTipoPersonaComentario()));
        us.getDelagacionCargoList().forEach((dlc) -> {
            mm.addElement(menu2(dlc.getIdTipoPersona().getAccesoTipoPersonaList(),
                    dlc.getIdTipoPersona().getTipoPersonaNombre(),
                    dlc.getIdTipoPersona().getTipoPersonaComentario()));
        });
        if (us.getMaestro() != null) {
            TipoPersona tp;
            for (MaestoCargo mc : us.getMaestro().getMaestoCargoList()) {
                tp = mc.getCargo().getCargoTipoPersona();
                if (tp != null) {
                    mm.addElement(menu2(tp.getAccesoTipoPersonaList(),
                            tp.getTipoPersonaNombre(),
                            tp.getTipoPersonaComentario()));
                }
            }
        }
        if (us.getTipoPersona().getIdtipoPersona() == 1) {
            mi = new DefaultMenuItem("Control de vistas", "fa fa-wrench");
            mi.setUrl("cvista.intex");
            mm.addElement(mi);
        }
        DefaultSubMenu s = new DefaultSubMenu(us.getPersonaNombre().split(" ")[0] + " "
                + us.getPersonaApellido().split(" ")[0], "fa fa-user");
        mi = new DefaultMenuItem("Cerrar Sesión", "pi pi-sign-out");
        mi.setCommand("#{sessionController.cerrarSesion()}");
        s.addElement(mi);
        mm.addElement(s);
    }

    public DefaultSubMenu menu2(List<AccesoTipoPersona> accesos, String nombreMenu, String icono) {
        DefaultSubMenu sm = new DefaultSubMenu(nombreMenu, icono);
        DefaultMenuItem mi;
        List<Acceso> ac = new ArrayList<>();
        accesos.forEach((atp) -> {
            ac.add(atp.getAcceso());
        });
        ac.stream().filter((a) -> (a.getAccesoIndice() == null)).forEachOrdered((a) -> {
            sm.addElement(menu3(a, ac));
        });
        return sm;
    }

    private MenuElement menu3(Acceso a, List<Acceso> ac) {
        DefaultSubMenu s = new DefaultSubMenu(a.getAccesoNombre(), a.getAccesoComentario());
        a.getAccesoList().stream().filter((b) -> (ac.contains(b))).forEachOrdered((b) -> {
            if (b.getAccesoList() == null || b.getAccesoList().isEmpty()) {
                s.addElement(new DefaultMenuItem(b.getAccesoNombre(), b.getAccesoComentario(), b.getAccesourl()));
            } else {
                s.addElement(menu3(b, ac));
            }
        });
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

    public void escucha() {
        try {
            mensaje m = new mensaje(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("mss"));
            int tp = Integer.valueOf(m.getCadenaAccion().contains("tp¿¿") ? m.getCadenaAccion().split("¿¿")[1] : "0");
            if (m.getDestinatario() == us.getIdpersona() || tp == us.getTipoPersona().getIdtipoPersona()) {
                if (!notificaciones.contains(m.getNotificacion())) {
                    List<Notificaciones> n1 = new ArrayList<>();
                    n1.add(m.getNotificacion());
                    notificaciones.forEach((Notificaciones not) -> {
                        try {
                            not.setVista(true);
                            notiFL.edit(not);
                        } catch (Exception e) {
                            System.out.println(e.getMessage() != null ? e.getMessage()
                                    : "Error al actualizar las notificaciones");
                        }
                    });
                    notificaciones.stream().map((nn) -> {
                        nn.setVista(true);
                        return nn;
                    }).forEachOrdered((nn) -> {
                        n1.add(nn);
                    });
                    Collections.sort(n1, (Notificaciones o1, Notificaciones o2) -> o2.getFechaHora().hashCode() - o1.getFechaHora().hashCode());
                    notificaciones.clear();
                    if (n1.size() < 4) {
                        notificaciones.addAll(n1);
                    } else {
                        for (int y = 0; y < 6; y++) {
                            notificaciones.add(n1.get(y));
                        }
                    }
                    verNoti = true;
                    FacesContext.getCurrentInstance().addMessage(null, m.getFacesmessage());
                    PrimeFaces.current().ajax().update("noti");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(sessionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getDetalle_Fecha(Date e) {
        String x[] = new SimpleDateFormat("EEEEE dd-MMMMM-yyyy hh:mm:ss a").format(e).split("-");
        return x[0] + " de " + x[1] + " de " + x[2];
    }

    public boolean isVerNoti() {
        return verNoti;
    }

    public List<Notificaciones> getNotificaciones() {
        return Collections.unmodifiableList(notificaciones);
    }
}
