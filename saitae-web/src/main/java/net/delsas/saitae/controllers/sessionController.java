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
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.DelagacionCargoFacadeLocal;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.MaestoCargoFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.Notificaciones;
import net.delsas.saitae.entities.Persona;
import org.primefaces.PrimeFaces;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.panel.Panel;
import org.primefaces.event.ToggleEvent;
import org.primefaces.model.Visibility;
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
    private MaestroFacadeLocal mfl;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
    private EstudianteFacadeLocal eFL;
    @EJB
    private MaestoCargoFacadeLocal mcFL;
    @EJB
    private DelagacionCargoFacadeLocal dcFL;
    @EJB
    private TipoPersonaFacadeLocal tipopFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal atpFL;
    //para notificaciones
    @EJB
    private NotificacionesFacadeLocal notiFL;
    private List<Notificaciones> notificaciones;
    private boolean verNoti;
    String id;

    @PostConstruct
    public void init() {
        verNoti = false;
    }

    public void log() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            notificaciones = new ArrayList<>();
            us = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (us == null) {
                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
                context.getExternalContext().redirect("./../");
            } else {
                FacesMessage ms = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
                us = personaFL.find(us.getIdpersona());
                us.setMaestro(mfl.find(us.getIdpersona()));
                us.setEstudiante(eFL.find(us.getIdpersona()));
                if (us.getMaestro() != null) {
                    us.getMaestro().setMaestoCargoList(mcFL.getMaestroCargoByIdMaestro(us.getIdpersona()));
                }
                us.setDelagacionCargoList(dcFL.getDelegacionCargoByIdPersona(us.getIdpersona()));
                us.setTipoPersona(tipopFL.find(us.getTipoPersona().getIdtipoPersona()));
                context.getExternalContext().getSessionMap().remove("usuario");
                context.getExternalContext().getSessionMap().put("usuario", us);
                ordenarNotificaciones();
                if (!((boolean) context.getExternalContext().getSessionMap().get("primerInicio"))) {
                    if (ms != null) {
                        context.addMessage("growl", ms);
                        context.getExternalContext().getSessionMap().remove("mensaje");
                    }
                } else {
                    context.addMessage("growl", new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido",
                            "Bienvenid" + (us.getPersonaSexo() ? "a " : "o ")
                            + Auxiliar.getNombreCortoPersona(us)));
                    context.getExternalContext().getSessionMap().remove("primerInicio");
                    context.getExternalContext().getSessionMap().put("primerInicio", false);
                }
                this.menu();
            }
        } catch (IOException ex) {
            context.addMessage("growl", new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado", ex.getMessage()));
        }
    }

    public Persona getUs() {
        return us;
    }

    private void ordenarNotificaciones() {
        us.setNotificacionesDestinatarioList(notiFL.getNotificacionesByIdDestinatario(us.getIdpersona()));
        List<Notificaciones> not = us.getNotificacionesDestinatarioList();
        if (not != null) {
            notificaciones.clear();
            Collections.sort(not, (Notificaciones o1, Notificaciones o2) -> o2.getFechaHora().hashCode() - o1.getFechaHora().hashCode());
            if (not.size() > 5) {
                for (Integer y = 0; y < 5; y++) {
                    if (y < not.size()) {
                        notificaciones.add(not.get(y));
                    }
                }
            } else {
                notificaciones.addAll(not);
            }
        }
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
        List<Acceso> menusDisponibles = new ArrayList<>();
        List<Integer> tps = Auxiliar.getTiposPersonas(us);
        tps.stream().map((i) -> atpFL.findAccesoByIdTipoPersona(i)).forEachOrdered((actps) -> {
            actps.stream().filter((a) -> (!menusDisponibles.contains(a))).forEachOrdered((a) -> {
                menusDisponibles.add(a);
            });
        });
        menusDisponibles.stream().filter((a) -> (a.getAccesoIndice() == null)).forEachOrdered((a) -> {
            mm.addElement(menu3(a, menusDisponibles));
        });
        if (us.getTipoPersona().getIdtipoPersona() == 1) {
            mi = new DefaultMenuItem("Control de vistas", "fa fa-cogs");
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
            System.out.println("El usuario " + us.getPersonaNombre().split(" ")[0] + " "
                    + us.getPersonaApellido().split(" ")[0] + " (" + us.getTipoPersona().getTipoPersonaNombre()
                    + ") ha cerrado sesión el "
                    + new SimpleDateFormat("EEEEE dd/MMM/yyyy hh:mm a").format(new Date()) + ".");
        } catch (IOException ex) {
            Logger.getLogger(sessionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void onToggle(ToggleEvent event) {
        Integer i;
        Panel p = (Panel) event.getSource();
        p.getChildren().stream().filter((c) -> (c.getId().equals("idnot"))).map((c) -> (OutputLabel) c).forEachOrdered((o) -> {
            id = o.getValue().toString();
        });
        if (id != null) {
            try {
                i = Integer.valueOf(id);
            } catch (NumberFormatException e) {
                i = 0;
            }
            Notificaciones n = notiFL.find(i);
            if (n != null) {
                n.setVista(event.getVisibility() == Visibility.HIDDEN);
                notiFL.edit(n);
            }
        }
    }

    public Integer getUsNie() {
        return Integer.valueOf(us.getIdpersona().toString().subSequence(1, us.getIdpersona().toString().split("").length - 1).toString());
    }

    public void setUsNie(Integer nie) {
        us.setIdpersona(Integer.valueOf("1" + nie));
    }

    public Integer getAño() {
        return Auxiliar.getAñoActual();
    }

    public void escucha() {
        try {
            mensaje m = new mensaje(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("mss"));
            String[] ac0 = m.getCadenaAccion().split("¿¿¿")[0].split("<<");
            String[] tp0 = m.getCadenaAccion().split("¿¿¿").length > 1
                    ? m.getCadenaAccion().split("¿¿¿")[1].split("¿¿") : new String[]{};
            Integer tp = 0;
            if (tp0.length > 1) {
                if (tp0[0].equals("tp")) {
                    tp = Integer.valueOf(tp0[1]);
                }
            }
            String np = FacesContext.getCurrentInstance().getExternalContext().getRequestServletPath().split("/")[2];
            long x = us.getTipoPersona().getIdtipoPersona();
            for (String ac1 : ac0) {
                String[] ac = ac1.split("<");
                if (ac.length > 1) {
                    String[] acid = ac[1].split(">");
                    if (np.equals((ac[0] + ".intex"))
                            && (Objects.equals(m.getDestinatario(), us.getIdpersona())
                            || x == 1 || x == 2
                            || Objects.equals(tp, us.getTipoPersona().getIdtipoPersona()))) {
                        PrimeFaces.current().ajax().update(acid);
                    }
                }
            }
            if (Objects.equals(m.getDestinatario(), us.getIdpersona())
                    || Objects.equals(tp, us.getTipoPersona().getIdtipoPersona())) {
                ordenarNotificaciones();
                verNoti = true;
                FacesContext.getCurrentInstance().addMessage(null, m.getFacesmessage());
                PrimeFaces.current().ajax().update(":noti", ":form0:msgs");
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
