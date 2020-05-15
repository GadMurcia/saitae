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

import java.io.IOException;
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
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Constancias;
import net.delsas.saitae.entities.ConstanciasPK;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class admPermisoController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<Permisos> solicitados;
    private List<Permisos> aceptados;
    private List<Permisos> rechazados;
    private List<Permisos> cancelados;
    private Permisos permiso;
    private Constancias constancia;
    private Permisos acep;
    private Permisos solc;
    private String nombreE, duiS;
    private Persona usuario;
    private List<Integer> tps;
    private List<Integer> tipos;
    private List<Integer> añosDisponnibles;
    private Integer añoSelected;

    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private PermisosFacadeLocal permisosFL;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private NotificacionesFacadeLocal notFL;
    @EJB
    private PersonaFacadeLocal pFL;

    @PostConstruct
    public void init() {
        try {
            acep = solc = new Permisos(new PermisosPK());
            nombreE = "";
            permiso = new Permisos(new PermisosPK(0, new Date(), 0, new Date()), new Date(), "1");
            permiso.setPermisosComentario("0¿¿ ¿¿ ¿¿ ");
            permiso.setTipoPersona(tipoPersonaFL.find(8));
            constancia = new Constancias();
            permiso.setConstancias(constancia);
            solicitados = rechazados = aceptados = new ArrayList<>();
            usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
            tps = new ArrayList<>();
            añoSelected = getAñoActual();
            añosDisponnibles = getAñosParaMostrar(5);
            if (usuario == null) {
                redirect();
            } else {
                tps = getTiposPersonas(usuario);
                boolean r = (tps.contains(3) || tps.contains(2) || tps.contains(1));
                if (!r) {
                    redirect();
                }
                tipos = new ArrayList<>();
                tipos.add(8);
                tipos.add(4);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void redirect() {
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            context.getExternalContext().redirect("./../");
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public List<TipoPermiso> getTipoPermiso() {
        List<TipoPermiso> items = new ArrayList<>();
        List<TipopersonaPermiso> tt = tipoPersonaFL.find(8).getTipopersonaPermisoList();
        tt.forEach((t) -> {
            items.add(t.getTipoPermiso());
        });
        return items;
    }

    public void onRowSelect(SelectEvent event) {
        String id = event.getComponent().getId();
        switch (id) {
            case "solicitados":
                solc = (Permisos) event.getObject();
                break;
            default:
                acep = (Permisos) event.getObject();
        }
    }

    public String getFecha(Date a) {
        return a != null ? new SimpleDateFormat("dd/MM/yyyy").format(a) : " ";
    }

    public String getFechas(Date i, Date f) {
        String g = "";
        if (i != null) {
            String in = getFecha(i);
            String fi = getFecha(f);
            if (in.equals(fi)) {
                g = in;
            } else {
                g = "Entre " + in + " y " + fi;
            }
        }
        return g;
    }

    public void concederPermiso() {
        FacesMessage ms = null;
        try {
            if (permiso.getPermisosPK().getPermisoFechaInicio().before(new SimpleDateFormat("dd/MM/yyyy").parse(new SimpleDateFormat("dd/MM/yyyy").format(new Date())))) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Error en la fecha de inicio del permiso",
                        "No debe seleccionar una fecha para el inicio del periodo del permiso anterior a la actual."));
                permiso.getPermisosPK().setPermisoFechaInicio(new Date());
            } else if (permiso.getPermisoFechafin().before(permiso.getPermisosPK().getPermisoFechaInicio())) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Error en la fecha de fin del permiso",
                        "No debe seleccionar una fecha para el final del periodo del permiso anterior a la fecha en la que inicia éste."));
                permiso.setPermisoFechafin(permiso.getPermisosPK().getPermisoFechaInicio());
            } else {
                permiso.getPermisosPK().setTipoPermiso(permiso.getTipoPermiso1().getIdtipoPermiso());
                permiso.setPermisosSolicitante(usuario);
                permiso.getPermisosPK().setIpPersona(permiso.getPersona().getIdpersona());
                permiso.setPermisosEstado("1");
                permiso.setPermisosGestor(usuario);
                Permisos pp = permisosFL.find(permiso.getPermisosPK());
                if (pp != null) {
                    ms = new FacesMessage(FacesMessage.SEVERITY_WARN, "Imposible proceder",
                            "Ya hay un permiso del tipo '" + permiso.getTipoPermiso1().getTipoPermisoNombre() + "' para "
                            + getNombreCompletoPersona(permiso.getPersona()) + " en el día "
                            + (dateToString(permiso.getPermisosPK().getPermisoFechaInicio())
                            + " por lo que no se procede con la concesión del permiso"));
                    FacesContext.getCurrentInstance().addMessage(null, ms);
                    return;
                }
                if (constancia != null && constancia.getDocumento() != null) {
                    constancia.setConstanciasPK(
                            new ConstanciasPK(
                                    permiso.getPermisosPK().getIpPersona(),
                                    permiso.getPermisosPK().getPermisoFechaSolicitud(),
                                    permiso.getPermisosPK().getTipoPermiso(),
                                    permiso.getPermisosPK().getPermisoFechaInicio()));
                } else {
                    constancia = null;
                    permiso.setConstancias(null);
                }
                permisosFL.create(permiso);
                ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Concesión exitosa",
                        "El permiso se ha concedido para entre las fechas: "
                        + (dateToString(permiso.getPermisosPK().getPermisoFechaInicio())) + " y "
                        + (dateToString(permiso.getPermisoFechafin())));
                mensaje m = new mensaje(permiso.getPermisosPK().getIpPersona(),
                        usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                        + " le ha concedido un nuevo permiso a petición de "
                        + getNombreSol() + " " + getApellidoSol() + ".",
                        "Nueva concesión de permiso",
                        FacesMessage.SEVERITY_INFO,
                        permiso.getPermisosSolicitante().getIdpersona(), "permisoH<form");
                persistirNotificación(m, new Persona(m.getDestinatario()), notFL, notificacion);
                FacesContext.getCurrentInstance().addMessage(null, ms);
                init();
                ms = null;
            }
            if (ms != null) {
                FacesContext.getCurrentInstance().addMessage(null, ms);
                PrimeFaces.current().ajax().update("form:msgs");
            }
        } catch (Exception e) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", e.getMessage());
            FacesContext.getCurrentInstance().addMessage(null, ms);
            PrimeFaces.current().ajax().update("form:msgs");
        }
    }

    public void guardar(Integer w) {
        solicitados.remove(solc);
        solc.setPermisosEstado(w + "");
        solc.setPermisosGestor(usuario);
        permisosFL.edit(solc);
        if (w == 1) {
            aceptados.add(solc);
        } else if (w == 2) {
            rechazados.add(solc);
        }
        FacesMessage m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios gurdados", "el permiso ha sido "
                + (w == 1 ? "aceptado" : (w == 2 ? "rechazado" : "")));
        FacesContext.getCurrentInstance().addMessage(null, m);
        mensaje x = new mensaje(solc.getPermisosPK().getIpPersona(),
                usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                + " ha " + (w == 1 ? "aceptado" : "rechazado") + " su solicitud de permiso. "
                + (w == 2 ? "Motivo del rechazo: " + getComentarioSolc() : ""),
                (w == 1 ? "Aceptación" : "Rechado") + " de permiso",
                FacesMessage.SEVERITY_INFO, usuario.getIdpersona(), "permiso<form<<permisoH<form");
        persistirNotificación(x, new Persona(x.getDestinatario()), notFL, notificacion);
    }

    public String getGrado(Integer id) {
        Matricula mat = matriculaFL.find(new MatriculaPK(id, getAño()));
        if (mat != null) {
            GradoPK gr = mat.getGrado().getGradoPK();
            return gr.getIdgrado() + "° " + (gr.getGradoModalidad().equals("C") ? "TVC Contador"
                    : (gr.getGradoModalidad().equals("S") ? "TVC Secretariado"
                    : (gr.getGradoModalidad().equals("G") ? "General" : "??")))
                    + " Sección " + gr.getGradoSeccion();
        } else {
            return " ";
        }
    }

    public List<Permisos> getSolicitados() {
        solicitados = (tps.contains(1) || tps.contains(2))
                ? permisosFL.getPermisosPorEstado("0", añoSelected)
                : depurar(permisosFL.findByEstadoAndTipos("0", tipos, añoSelected));
        return Collections.unmodifiableList(solicitados);
    }

    public void setSolicitados(List<Permisos> solicitados) {
        this.solicitados = solicitados;
    }

    public List<Permisos> getAceptados() {
        aceptados = (tps.contains(1) || tps.contains(2))
                ? permisosFL.getPermisosPorEstado("1", añoSelected)
                : depurar(permisosFL.findByEstadoAndTipos("1", tipos, añoSelected));
        return Collections.unmodifiableList(aceptados);
    }

    public void setAceptados(List<Permisos> aceptados) {
        this.aceptados = aceptados;
    }

    public List<Permisos> getRechazados() {
        rechazados = (tps.contains(1) || tps.contains(2))
                ? permisosFL.getPermisosPorEstado("2", añoSelected)
                : depurar(permisosFL.findByEstadoAndTipos("2", tipos, añoSelected));
        return Collections.unmodifiableList(rechazados);
    }

    public void setRechazados(List<Permisos> rechazados) {
        this.rechazados = rechazados;
    }

    public List<Permisos> getCancelados() {
        cancelados = (tps.contains(1) || tps.contains(2))
                ? permisosFL.getPermisosPorEstado("3", añoSelected)
                : depurar(permisosFL.findByEstadoAndTipos("3", tipos, añoSelected));
        return Collections.unmodifiableList(cancelados);
    }

    private List<Permisos> depurar(List<Permisos> pps) {
        List<Permisos> psr = new ArrayList<>();
        pps.stream().filter((p) -> (!getTiposPersonas(p.getPersona()).contains(3))).forEachOrdered((p) -> {
            psr.add(p);
        });
        return psr;
    }

    public void setCancelados(List<Permisos> cancelados) {
        this.cancelados = cancelados;
    }

    public Permisos getPermiso() {
        return permiso;
    }

    public void setPermiso(Permisos permiso) {
        this.permiso = permiso;
    }

    public Integer getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public Permisos getAcep() {
        return acep;
    }

    public void setAcep(Permisos acep) {
        this.acep = acep;
    }

    public Permisos getSolc() {
        return solc;
    }

    public void setSolc(Permisos solc) {
        this.solc = solc;
    }

    public boolean isEstudiante() {
        return permiso.getTipoPersona().getIdtipoPersona() == 8;
    }

    public void setDuiSol(String dui) {
        duiS = dui;
        String d[] = dui.split("-");
        permiso.setPermisosComentario(d[0] + d[1] + "¿¿" + getNombreSol() + "¿¿" + getApellidoSol() + "¿¿" + getComentario());
    }

    public String getDuiSol() {
        return duiS;
    }

    public void setNombreSol(String nombre) {
        permiso.setPermisosComentario(getDuiSol() + "¿¿"
                + (nombre.split("")[0].equals(" ") ? nombre.substring(1) : nombre)
                + "¿¿" + getApellidoSol() + "¿¿" + getComentario());
    }

    public String getNombreSol() {
        return permiso.getPermisosComentario().split("¿¿")[1];
    }

    public void setApellidoSol(String apellido) {
        permiso.setPermisosComentario(getDuiSol() + "¿¿" + getNombreSol() + "¿¿"
                + (apellido.split("")[0].equals(" ") ? apellido.substring(1) : apellido)
                + "¿¿" + getComentario());
    }

    public String getApellidoSol() {
        return permiso.getPermisosComentario().split("¿¿")[2];
    }

    public void setComentarioAcep(String comentario) {
        String[] f = acep.getPermisosComentario() != null ? acep.getPermisosComentario().split("¿¿") : new String[]{" ", " ", " ", " "};
        acep.setPermisosComentario(f[0] + "¿¿" + f[1] + "¿¿" + f[2] + "¿¿" + comentario);
    }

    public String getComentarioAcep() {
        return acep.getPermisosComentario() == null ? "" : acep.getPermisosComentario().split("¿¿")[3];
    }

    public void setComentarioSolc(String comentario) {
        String[] f = solc.getPermisosComentario() != null ? acep.getPermisosComentario().split("¿¿") : new String[]{" ", " ", " ", " "};
        solc.setPermisosComentario(f[0] + "¿¿" + f[1] + "¿¿"
                + (f.length >= 3 ? f[3] : "") + "¿¿" + comentario);
    }

    public String getComentarioSolc() {
        String g[] = solc.getPermisosComentario() == null
                ? new String[]{" ", " ", " ", " "}
                : solc.getPermisosComentario().split("¿¿");
        String h = "";
        if (g.length < 4) {
            solc.setPermisosComentario(g[0] + "¿¿" + g[1] + "¿¿"
                    + (g.length >= 3 ? g[3] : "") + "¿¿ ");
        } else {
            h = g[3];
        }
        return h;
    }

    public void setComentario(String comentario) {
        permiso.setPermisosComentario(getDuiSol() + "¿¿" + getNombreSol() + "¿¿" + getApellidoSol() + "¿¿" + comentario);
    }

    public String getComentario() {
        return permiso.getPermisosComentario().split("¿¿")[3];
    }

    public boolean VerMotivo(Permisos p) {
        return p == null ? false
                : (p.getPermisosMotivo() != null ? p.getPermisosMotivo().split("").length > 1
                : false);
    }

    public String dateToString(Date d) {
        return new SimpleDateFormat("dd/MM/yyy").format(d);
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> list = pFL.getPersonaByLikeNombreAndType(query, 8);
        list.forEach((p) -> {
            results.add(p.getPersonaNombre() + " " + p.getPersonaApellido() + ", NIE:  " + p.getIdpersona());
        });
        if (results.isEmpty()) {
            results.add("No hay resultados.");
        }
        return results;
    }

    public void onItemSelect(SelectEvent event) {
        String[] tt = event.getObject().toString().split(", NIE:  ");
        Persona est = null;
        if (tt.length == 2) {
            est = pFL.find(Integer.valueOf(tt[1]));
        }
        permiso.setPersona(est);
        nombreE = tt[0];
    }

    public void onblour(AjaxBehaviorEvent e) {

    }

    public String getNombreE() {
        return nombreE;
    }

    public void setNombreE(String nombreE) {
        this.nombreE = nombreE;
    }

    public boolean getHayConstancia() {
        return acep == null ? false : acep.getConstancias() != null;
    }

    public String getConstanciaSelected() {
        Constancias c = acep == null ? null : acep.getConstancias();
        return c == null ? "" : getDoc(c.getDocumento(), c.getExtención().split("¿¿")[1]);
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
        return constancia == null || constancia.getDocumento() != null;
    }

    public String getDoc() {
        return getDoc(
                constancia.getDocumento(),
                (constancia.getExtención() == null || constancia.getExtención().isEmpty())
                ? "" : constancia.getExtención().split("¿¿")[1]);
    }

    public void quitarConstancia() {
        constancia.setDocumento(null);
        constancia.setExtención("");
    }

    public void onBour(AjaxBehaviorEvent e) {

    }

    public List<Integer> getAñosDisponnibles() {
        return añosDisponnibles;
    }

    public void setAñosDisponnibles(List<Integer> añosDisponnibles) {
        this.añosDisponnibles = añosDisponnibles;
    }

    public Integer getAñoSelected() {
        return añoSelected;
    }

    public void setAñoSelected(Integer añoSelected) {
        this.añoSelected = añoSelected;
    }

    public String getEstadoPermiso(Permisos p) {
        String e = (p == null || p.getPermisosEstado() == null) ? "" : p.getPermisosEstado();
        return getEstadoPermisos2(e);
    }
}
