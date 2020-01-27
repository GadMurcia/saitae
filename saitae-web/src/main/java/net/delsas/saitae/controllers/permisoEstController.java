/*
 * Copyright (C) 2019 delsas
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
import java.text.ParseException;
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
import net.delsas.saitae.beans.ConstanciasFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Constancias;
import net.delsas.saitae.entities.ConstanciasPK;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class permisoEstController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
    private MatriculaFacadeLocal mfl;
    @EJB
    private NotificacionesFacadeLocal notFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private ConstanciasFacadeLocal conFL;

    private Matricula m;
    private List<TipopersonaPermiso> permisos;
    private Persona usuario;
    private List<Estudiante> e;
    private int id;
    private Permisos p;
    private Permisos pcontrol;
    private boolean editar;
    FacesMessage ms;
    private Constancias constancia;

    @PostConstruct
    public void init() {
        try {
            usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
            boolean r = usuario.getTipoPersona().getIdtipoPersona() == 8 ? false
                    : usuario.getTipoPersona().getIdtipoPersona() != 9;
            if (r) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Falla!", "Esa vista no le está permitida."));
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            } else {
                initVariables();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void initVariables() {
        permisos = usuario.getTipoPersona().getTipopersonaPermisoList();
        editar = false;
        p = (Permisos) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("permiso");
        if (p == null) {
            p = new Permisos();
            constancia = new Constancias(new ConstanciasPK());
            p.setConstancias(constancia);
            p.setTipoPermiso1(new TipoPermiso(0));
            p.setPermisosPK(new PermisosPK(0, new Date(), 0, new Date()));
            p.setTipoPersona(tipoPersonaFL.find(8));
            p.setPersona(new Persona(0));
            p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
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
            id = p.getPermisosPK().getIpPersona();
            for (Matricula mm : p.getPersona().getEstudiante().getMatriculaList()) {
                if (mm.getMatriculaPK().getMatriculaAnyo() == getAño()) {
                    m = mm;
                    break;
                }
            }
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("permiso");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("editar");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ms");
        }
        p.setPermisosComentario("0¿¿¿¿¿¿ ");
        if (usuario.getTipoPersona().getIdtipoPersona() == 8) {
            e = new ArrayList<>();
            e.add(usuario.getEstudiante());
        } else {
            e = usuario.getEstudiante().getEstudianteList();
        }
    }

    public void guardar() {
        ms = null;
        try {
            if (p.getPermisosPK().getPermisoFechaInicio().before(new SimpleDateFormat("dd/MM/yyyy").parse(new SimpleDateFormat("dd/MM/yyyy").format(new Date())))) {
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
                p.setPermisosSolicitante(usuario);
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
                    Constancias cControl = conFL.find(
                            new ConstanciasPK(
                                    pcontrol.getPermisosPK().getIpPersona(),
                                    pcontrol.getPermisosPK().getPermisoFechaSolicitud(),
                                    pcontrol.getPermisosPK().getTipoPermiso(),
                                    pcontrol.getPermisosPK().getPermisoFechaInicio()));
                    if (cControl != null) {
                        conFL.remove(cControl);
                    }
                    if (pcontrol.getPermisosPK().getPermisoFechaInicio() != p.getPermisosPK().getPermisoFechaInicio()) {
                        pfl.remove(pcontrol);
                        pfl.create(p);
                    } else {
                        pfl.edit(p);
                    }
                    List<Persona> solicitantes = new ArrayList<>();
                    solicitantes.add(usuario);
                    if (usuario.getTipoPersona().getIdtipoPersona() != 8 && !solicitantes.contains(p.getPersona())) {
                        solicitantes.add(p.getPersona());
                    }
                    Auxiliar.persistirNotificación(
                            new mensaje(usuario.getIdpersona(), usuario.getIdpersona(), "permisoH<form",
                                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Modificación de solicitud de permiso",
                                            "Su permiso se ha solicitado para entre las fechas: "
                                            + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisosPK().getPermisoFechaInicio())) + " y "
                                            + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisoFechafin())))),
                            solicitantes, notFL, notificacion);
                    Auxiliar.persistirNotificación(
                            new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                                    + " ha cambiado su solicitud de permiso.",
                                    "Modificaciones en una solicitud de permiso",
                                    FacesMessage.SEVERITY_INFO, usuario.getIdpersona(),
                                    "permiso<form"),
                            Auxiliar.getPersonasParaNotificar(
                                    tipoPersonaFL.find(3)),
                            notFL, notificacion);
                    initVariables();
                } else {
                    p.getPermisosPK().setTipoPermiso(p.getTipoPermiso1().getIdtipoPermiso());
                    p.setPersona(personaFL.find(id));
                    p.getPermisosPK().setIpPersona(id);
                    if (pfl.find(p.getPermisosPK()) != null) {
                        FacesContext.getCurrentInstance().addMessage(null,
                                new FacesMessage(FacesMessage.SEVERITY_WARN, "Solicitud duplicada",
                                        "Usted ya ha solicitado un permiso del tipo '"
                                        + p.getTipoPermiso1().getTipoPermisoNombre()
                                        + "' para el día "
                                        + (new SimpleDateFormat("dd/MM/yyy").format(p.getPermisosPK().getPermisoFechaInicio())
                                        + " por lo que no se procede con la solicitud de este permiso. "
                                        + "Verifique en su historial de permisos.")));
                        return;
                    }
                    if (constancia != null && constancia.getDocumento() != null) {
                        constancia.setConstanciasPK(
                                new ConstanciasPK(p.getPermisosPK().getIpPersona(),
                                        p.getPermisosPK().getPermisoFechaSolicitud(),
                                        p.getPermisosPK().getTipoPermiso(),
                                        p.getPermisosPK().getPermisoFechaInicio()));
                    }
                    pfl.create(p);
                    Auxiliar.persistirNotificación(
                            new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                                    + " ha solicitado un nuevo permiso.",
                                    "Solicitud de permiso nueva", FacesMessage.SEVERITY_INFO, id, "permiso<form"),
                            Auxiliar.getPersonasParaNotificar(tipoPersonaFL.find(3)),
                            notFL, notificacion);
                    FacesContext.getCurrentInstance().addMessage("frm:msgs",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                                    "Su permiso se ha solicitado para entre las fechas: "
                                    + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisosPK().getPermisoFechaInicio())) + " y "
                                    + (new SimpleDateFormat("dd/MM/yyyy").format(p.getPermisoFechafin()))));
                    initVariables();
                }
            }
        } catch (ParseException sx) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", sx.getMessage());
            FacesContext.getCurrentInstance().addMessage(null, ms);
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

    public boolean isSeleccionPermiso() {
        return p == null ? false : p.getTipoPermiso1().getIdtipoPermiso() > 0;
    }

    public void onItemSelect(SelectEvent event) {
        id = event.getObject() != null ? (int) event.getObject() : 0;
        if (id > 0) {
            m = mfl.find(new MatriculaPK(id, getAño()));
        } else {
            m = new Matricula(new MatriculaPK(0, getAño()));
        }
    }

    public boolean isSeleccionEstudiante() {
        return id > 0;
    }

    public Matricula getM() {
        return m;
    }

    public void setM(Matricula m) {
        this.m = m;
    }

    public Persona getUsuario() {
        return usuario;
    }

    public void setUsuario(Persona usuario) {
        this.usuario = usuario;
    }

    public List<Estudiante> getE() {
        return Collections.unmodifiableList(e);
    }

    public void setE(List<Estudiante> e) {
        this.e = e;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Permisos getP() {
        return p;
    }

    public void setP(Permisos p) {
        this.p = p;
    }

    private int getAño() {
        return Auxiliar.getAñoActual();
    }

    public boolean isEditar() {
        return editar;
    }

    public void setEditar(boolean editar) {
        this.editar = editar;
    }

    public boolean disabled() {
        return editar || !isSeleccionPermiso();
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
        return constancia == null ? false : constancia.getDocumento() != null;
    }

    public String getDoc() {
        return Auxiliar.getDoc(
                constancia.getDocumento(),
                (constancia.getExtención() == null || constancia.getExtención().isEmpty())
                ? "" : constancia.getExtención().split("¿¿")[1]);
    }

    public void quitarConstancia() {
        constancia.setDocumento(null);
        constancia.setExtención("");
    }

    public String getNombreGrado(Grado g) {
        return g == null ? "" : Auxiliar.getGradoNombre(g.getGradoPK());
    }
}
