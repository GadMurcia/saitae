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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Constancias;
import net.delsas.saitae.entities.ConstanciasPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FileUploadEvent;

/**
 *
 * @author gabriela
 */
@Named
@ViewScoped
public class permisoMaController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private NotificacionesFacadeLocal notFL;
    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @Inject
    @Push
    private PushContext notificacion;
    private List<TipopersonaPermiso> permisos;
    private Persona usuario;
    private Permisos p;
    private Constancias constancia;
    private Permisos pcontrol;
    private boolean editar;
    private FacesMessage ms;

    @PostConstruct
    public void init() {
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            boolean r = usuario.getTipoPersona().getIdtipoPersona().equals(8) ? true
                    : usuario.getTipoPersona().getIdtipoPersona().equals(9);

            if (usuario == null || r) {

                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                        "Falla!", "Esa vista no le está permitida."));
                context.getExternalContext().redirect("./../");

            } else {
                initVariables();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void initVariables() {
        permisos = usuario.getTipoPersona().getTipopersonaPermisoList();
        editar = false;
        p = (Permisos) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("permiso");
        if (p == null) {
            p = new Permisos();
            constancia = new Constancias(new ConstanciasPK());
            p.setConstancias(constancia);
            p.setTipoPermiso1(new TipoPermiso(0));
            p.setPermisosPK(new PermisosPK(0, new Date(), 0, new Date()));
            p.setTipoPersona(usuario.getTipoPersona());
            p.setPersona(usuario);
            p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
            p.setPermisosSolicitante(usuario);
            p.setPermisosComentario("1¿¿1¿¿0¿¿0");
        } else {
            PermisosPK pk = p.getPermisosPK();
            constancia = p.getConstancias();
            constancia = constancia == null ? new Constancias(new ConstanciasPK()) : constancia;
            p.setConstancias(constancia);
            pcontrol = new Permisos(new PermisosPK(pk.getIpPersona(), pk.getPermisoFechaSolicitud(), pk.getTipoPermiso(), pk.getPermisoFechaInicio()));
            pcontrol.setPermisoFechafin(p.getPermisoFechafin());
            pcontrol.setTipoPersona(p.getTipoPersona());
            pcontrol.setPermisosEstado(p.getPermisosEstado());
            pcontrol.setPermisosSolicitante(p.getPermisosSolicitante());
            editar = (boolean) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("editar");
            ms = (FacesMessage) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("ms");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("permiso");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("editar");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ms");
            String cc[] = p.getPermisosComentario().split("¿¿");
            p.setPermisosComentario(cc[0] + "¿¿" + cc[1] + "¿¿" + cc[2] + "¿¿ ");
        }
    }

    public void guardar() {
        ms = null;
        try {
            Date actual = new SimpleDateFormat("dd/MM/yyyy").parse(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
            if (p.getPermisosPK().getPermisoFechaInicio().before(actual)) {
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
                mensaje x;
                p.setPermisosEstado("0");
                if (constancia.getDocumento() != null) {
                    constancia.setConstanciasPK(new ConstanciasPK(p.getPermisosPK().getIpPersona(),
                            p.getPermisosPK().getPermisoFechaSolicitud(),
                            p.getPermisosPK().getTipoPermiso(),
                            p.getPermisosPK().getPermisoFechaInicio()));
                } else {
                    constancia = null;
                }
                p.setConstancias(constancia);
                if (editar) {
                    if (pcontrol.getPermisosPK().getPermisoFechaInicio() != p.getPermisosPK().getPermisoFechaInicio()) {
                        pfl.remove(pcontrol);
                        pfl.create(p);
                    } else {
                        pfl.edit(p);
                    }
                } else {
                    p.getPermisosPK().setTipoPermiso(p.getTipoPermiso1().getIdtipoPermiso());
                    p.setPermisosSolicitante(usuario);
                    p.setPermisosMotivo(null);
                    p.getPermisosPK().setIpPersona(usuario.getIdpersona());
                    pcontrol = pfl.find(p.getPermisosPK());
                    if (pcontrol == null) {
                        pfl.create(p);
                        Auxiliar.persistirNotificación(
                                new mensaje(usuario.getIdpersona(), usuario.getIdpersona(), "permisoH<form",
                                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                                                "Su permiso se ha solicitado para entre las fechas: "
                                                + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisosPK().getPermisoFechaInicio())) + " y "
                                                + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisoFechafin())))),
                                usuario, notFL, notificacion);
                        TipoPersona tp = tipoPersonaFL.find(usuario.getTipoPersona().getIdtipoPersona() == 4 ? 3 : 2);
                        Auxiliar.persistirNotificación(
                                new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                                        + " ha solicitado un nuevo permiso.",
                                        "Solicitud de permiso nueva", FacesMessage.SEVERITY_INFO, usuario.getIdpersona(),
                                        "permiso<form"),
                                Auxiliar.getPersonasParaNotificar(tp), notFL, notificacion);
                        initVariables();
                    } else {
                        FacesContext.getCurrentInstance().addMessage(null,
                                new FacesMessage(FacesMessage.SEVERITY_WARN,
                                        "Solicitud duplicada",
                                        "Usted ya solicitó hoy un permiso por "
                                        + p.getTipoPermiso1().getTipoPermisoNombre()
                                        + ", cuya fecha de inicio es "
                                        + new SimpleDateFormat("dd/MM/yy")
                                                .format(p.getPermisosPK().getPermisoFechaInicio())
                                        + ". Por lo que no se procede con esta solicitud. "
                                        + "Verifique su historial de permisos."));
                    }
                }
            }
            PrimeFaces.current().ajax().update(":form", "form0:msgs");
        } catch (Exception e) {
            init();
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", e.getMessage());
            FacesContext.getCurrentInstance().addMessage("form0:msgs", ms);
            PrimeFaces.current().ajax().update(":form", "form0:msgs");
        }
    }

    public ArrayList<TipoPermiso> getListaPermisos() {
        ArrayList<TipoPermiso> items = new ArrayList<>();
        if (permisos != null) {
            permisos.forEach((t) -> {
                items.add(t.getTipoPermiso());
            });
        }
        return items;
    }

    public List<TipopersonaPermiso> getPermisos() {
        return Collections.unmodifiableList(permisos);
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

    public boolean getGoceDeSueldo() {
        return p == null ? false : p.getPermisosComentario().split("¿¿")[0].equals("1");

    }

    public boolean getLicenciasAnteriores() {
        return p == null ? false : p.getPermisosComentario().split("¿¿")[1].equals("1");
    }

    public void setGoceDeSueldo(boolean goce) {
        p.setPermisosComentario((goce ? "1" : "0") + "¿¿" + (getLicenciasAnteriores() ? "1" : "0") + "¿¿¿¿ ");
    }

    public void setLicenciasAnteriores(boolean lic) {
        p.setPermisosComentario((getGoceDeSueldo() ? "1" : "0") + "¿¿" + (lic ? "1" : "0") + "¿¿¿¿");
    }

    public void postRender() {
        if (ms != null) {
            FacesContext.getCurrentInstance().addMessage(null, ms);
            ms = null;
        }
    }

    public List<Integer> getInvalidDays() {
        return Auxiliar.getDisabledDays();
    }

    public boolean isEditar() {
        return editar;
    }

    public Constancias getConstancia() {
        return constancia;
    }

    public void setConstancia(Constancias constancia) {
        this.constancia = constancia;
    }

    public void notas(FileUploadEvent f) {
        constancia.setDocumento(f.getFile().getContents());
        constancia.setExtención(f.getFile().getFileName() + "¿¿" + f.getFile().getContentType());
    }

    public boolean getHayDocumento() {
        return constancia.getDocumento() != null;
    }

}
