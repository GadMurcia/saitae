/*
 * Copyright (C) 2020 delsas
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

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.ConstanciasFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.entities.Constancias;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class permisoHController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private PermisosFacadeLocal psFL;
    private List<Permisos> permisos;
    private Permisos selected;
    private Persona usuario;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private ConstanciasFacadeLocal conFL;
    private Integer añoSelected;
    private List<Integer> añosDisponnibles;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        añoSelected = getAñoActual();
        añosDisponnibles = getAñosParaMostrar(
                usuario.getTipoPersona().getIdtipoPersona().equals(8) ? 3 : 5);
    }

    public List<Permisos> getPermisos() {
        permisos = psFL.findByIpPersona(usuario.getIdpersona(), añoSelected);
        return Collections.unmodifiableList(permisos);
    }

    public Permisos getSelected() {
        return selected;
    }

    public void setSelected(Permisos selected) {
        this.selected = selected;
    }

    public String getFechas(Date d) {
        return d == null ? "" : new SimpleDateFormat("dd/MM/yyyy").format(d);
    }

    public String getFechas(Date d1, Date d2) {
        if (d1 == null || d2 == null) {
            return "";
        } else if (d1.equals(d2)) {
            return new SimpleDateFormat("dd/MM/yyyy").format(d1);
        } else {
            return new SimpleDateFormat("dd/MM/yyyy").format(d1) + " - " + new SimpleDateFormat("dd/MM/yyyy").format(d2);
        }
    }

    public void cancelarPermiso() {
        if (selected != null) {
            selected.setPermisosEstado("3");
            Constancias c = selected.getConstancias();
            if (c != null) {
                selected.setConstancias(null);
                conFL.remove(c);
            }
            psFL.edit(selected);
            mensaje x = new mensaje(usuario.getIdpersona(), usuario.getIdpersona(), "permiso<form",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Cancelación exitosa",
                            "Ha cancelado la solicitud de permiso con fechas: "
                            + getFechas(selected.getPermisosPK().getPermisoFechaInicio(), selected.getPermisoFechafin())
                            + ". La razón del cancelamiento es: " + getRazonRechazo() + "."));
            persistirNotificación(x, usuario, notiFL, notificacion);
            PrimeFaces.current().ajax().update("form", "d1", "d2", "form0:msgs");
            PrimeFaces.current().executeScript("PF('Dper1').hide(); PF('Dper2').hide();");
        }
    }

    public String getEstado(String e) {
        return getEstadoPermisos2(e);
    }

    public boolean isSolicitado() {
        return selected == null ? false : selected.getPermisosEstado().equals("0");
    }

    public boolean getVerMotivo() {
        return selected == null ? false : selected.getPersona().getTipoPersona().getIdtipoPersona().equals(8);
    }

    public boolean getEsRechazado() {
        return selected == null ? false : selected.getPermisosEstado().equals("2");
    }

    public boolean isCancelado() {
        return selected == null ? false : selected.getPermisosEstado().equals("3");
    }

    public boolean isVolverSolicitar() {
        return (getEsRechazado() || isCancelado());
    }

    public void setRazonRechazo(String razonRechazo) {
        String g[] = selected.getPermisosComentario().split("¿¿");
        selected.setPermisosComentario(g[0] + "¿¿" + g[1] + "¿¿"
                + (g.length >= 3 ? g[3] : "") + "¿¿" + razonRechazo);
    }

    public String getRazonRechazo() {
        return (getEsRechazado() || isCancelado())
                ? selected.getPermisosComentario().split("¿¿")[3] : "";
    }

    public boolean getGoceSueldo() {
        return selected == null ? false : selected.getPermisosComentario().split("¿¿")[0].equals("1");
    }

    public boolean getLicenciasAnteriores() {
        return selected == null ? false : selected.getPermisosComentario().split("¿¿")[1].equals("1");
    }

    public boolean getVerEditar() {
        String e = selected == null ? "" : selected.getPermisosEstado();
        return e.equals("0") || e.equals("2") || e.equals("3");
    }

    public void verProyecto() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            if (selected.getPermisosComentario().split("¿¿").length < 4) {
                selected.setPermisosComentario(selected.getPermisosComentario() + " ");
            }
            context.getExternalContext().getSessionMap().put("permiso", selected);
            context.getExternalContext().getSessionMap().put("editar", true);
            context.getExternalContext().getSessionMap().put("ms",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Redirección exitosa",
                            "Ésta es la información del permiso "
                            + "que usted estaba viendo."
                            + " Modifique la información y vuelva a solicitarlo o "
                            + "Actualice la página para solicitar uno diferente."));
            String pagina = getVerMotivo() ? "permisoE" : "permisoM";
            context.getExternalContext().redirect(pagina + ".intex");
        } catch (IOException ex) {
        }
    }

    public boolean getHayConstancia() {
        return selected == null ? false : selected.getConstancias() != null;
    }

    public String getConstanciaSelected() {
        Constancias c = selected == null ? null : selected.getConstancias();
        return c == null ? "" : getDoc(c.getDocumento(), c.getExtención().split("¿¿")[1]);
    }

    public void onBour(AjaxBehaviorEvent e) {

    }

    public List<Integer> getAñosDisponnibles() {
        return añosDisponnibles;
    }

    public Integer getAñoSelected() {
        return añoSelected;
    }

    public void setAñoSelected(Integer añoSelected) {
        this.añoSelected = añoSelected;
    }

}
