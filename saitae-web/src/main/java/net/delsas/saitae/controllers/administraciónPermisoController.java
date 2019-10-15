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
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.prueba;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class administraciónPermisoController implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<Permisos> solicitados;
    private List<Permisos> aceptados;
    private List<Permisos> rechazados;
    private Permisos permiso;
    private Permisos acep;
    private Permisos solc;
    private GradoPK gradoPK;
    private Persona usuario;

    @EJB
    private PermisosFacadeLocal permisosFL;
    @EJB
    private GradoFacadeLocal grsoFL;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private NotificacionesFacadeLocal notFL;

    @PostConstruct
    public void init() {
        try {
            usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
            List<Integer> tps = new ArrayList<>();
            if (usuario == null) {
                redirect();
                if (usuario.getMaestro() != null) {
                    usuario.getMaestro().getMaestoCargoList().forEach((mc) -> {
                        tps.add(mc.getCargo().getCargoTipoPersona().getIdtipoPersona());
                    });
                }
                int tp = usuario.getTipoPersona().getIdtipoPersona();
                boolean r = (tp == 1 || tp == 2 || tp == 3) ? true : (tps.contains(3) || tps.contains(2) || tps.contains(1));
                if (!r) {
                    redirect();
                } else {
                    solicitados = (tp == 1 || tp == 2) ? permisosFL.getPermisosPorEstado("0") : permisosFL.findByPEPEs("0");
                    aceptados = (tp == 1 || tp == 2) ? permisosFL.getPermisosPorEstado("1") : permisosFL.findByPEPEs("1");
                    rechazados = (tp == 1 || tp == 2) ? permisosFL.getPermisosPorEstado("2") : permisosFL.findByPEPEs("2");
                    acep = solc = new Permisos(new PermisosPK());
                    gradoPK = new GradoPK(0, " ", "", getAño());
                    permiso = new Permisos(new PermisosPK(0, new Date(), 0, new Date()), new Date(), "", "1");
                    permiso.setPermisosComentario("0¿¿ ¿¿ ¿¿ ");
                    permiso.setTipoPersona(tipoPersonaFL.find(8));
                }
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

    public List<SelectItem> getModalidades() {
        List<SelectItem> items = new ArrayList<>();
        List<String> mo = grsoFL.getModalidadPorAño(getAño());
        mo.forEach((s) -> {
            items.add(new SelectItem(s, s.equals("C") ? "TVC Contador"
                    : (s.equals("S") ? "TVC Secretariado"
                    : (s.equals("G") ? "General" : "??"))));
        });
        return items;
    }

    public List<Integer> getNiveles() {
        return grsoFL.getIdPorAñoyModalidad(getAño(), gradoPK.getGradoModalidad());
    }

    public List<String> getSecciones() {
        return grsoFL.getSeccionPorAñoModalidadyId(getAño(), gradoPK.getGradoModalidad(), gradoPK.getIdgrado());
    }

    public List<Persona> getEstudiantes() {
        return matriculaFL.findMatriculaByGrado(gradoPK);
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
        return a != null ? new SimpleDateFormat("dd-MM-yyyy").format(a) : "";
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
                Permisos pp = permisosFL.find(permiso.getPermisosPK());
                if (pp != null) {
                    ms = new FacesMessage(FacesMessage.SEVERITY_WARN, "Imposible proceder",
                            "En la base de datos ya hay un permiso del tipo '" + permiso.getTipoPermiso1().getTipoPermisoNombre() + "' para "
                            + permiso.getPersona().getPersonaNombre().split(" ")[0]
                            + " " + permiso.getPersona().getPersonaApellido().split(" ")[0] + " en el día "
                            + (new SimpleDateFormat("dd/MM/yyy").format(permiso.getPermisosPK().getPermisoFechaInicio())
                            + " por lo que no se procede con la concesión del permiso"));
                    FacesContext.getCurrentInstance().addMessage(null, ms);
                    return;
                }
                permisosFL.create(permiso);
                ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Concesión exitosa",
                        "El permiso se ha concedido para entre las fechas: "
                        + (new SimpleDateFormat("dd/MM/yyyy").format(permiso.getPermisosPK().getPermisoFechaInicio())) + " y "
                        + (new SimpleDateFormat("dd/MM/yyyy").format(permiso.getPermisoFechafin())));
                mensaje m = new mensaje(permiso.getPermisosPK().getIpPersona(), usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                        + " le ha concedido un nuevo permiso a petición de " + getNombreSol() + " " + getApellidoSol() + ".",
                        "Nueva concesión de permiso", FacesMessage.SEVERITY_INFO, permiso.getPermisosSolicitante().getIdpersona(), " ");
                sendMessage(m.toString());
                try {
                    notFL.create(m.getNotificacion());
                } catch (Exception e) {
                }
                FacesContext.getCurrentInstance().addMessage(null, ms);
                init();
            }
        } catch (Exception e) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", e.getMessage());
            FacesContext.getCurrentInstance().addMessage(null, ms);
        }
    }

    public void guardar(int w) {
        solicitados.remove(solc);
        solc.setPermisosEstado(w + "");
        permisosFL.edit(solc);
        if (w == 1) {
            aceptados.add(solc);
        } else if (w == 2) {
            rechazados.add(solc);
        }
        FacesMessage m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios gurdados", "el permiso ha sido "
                + (w == 1 ? "aceptado" : (w == 2 ? "rechazado" : "")));
        FacesContext.getCurrentInstance().addMessage(null, m);
        mensaje x = new mensaje(solc.getPermisosPK().getIpPersona(), usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                + " ha " + (w == 1 ? "aceptado" : "rechazado") + " su solicitud de permiso ",
                (w == 1 ? "Aceptación" : "Rechado") + " de permiso", FacesMessage.SEVERITY_INFO, usuario.getIdpersona(), " ");
        sendMessage(x.toString());
        try {
            notFL.create(x.getNotificacion());
        } catch (Exception e) {
        }
    }

    public String getGrado(int id) {
        Matricula mat = matriculaFL.find(new MatriculaPK(id, getAño()));
        if (mat != null) {
            GradoPK gr = mat.getGrado().getGradoPK();
            String g = "";
            g = gr.getIdgrado() + "° " + (gr.getGradoModalidad().equals("C") ? "TVC Contador"
                    : (gr.getGradoModalidad().equals("S") ? "TVC Secretariado"
                    : (gr.getGradoModalidad().equals("G") ? "General" : "??")))
                    + " Sección " + gr.getGradoSeccion();
            return g;
        } else {
            return " ";
        }
    }

    public String getSolicitadoPor(Permisos s) {
        if (s.getPermisosSolicitante() != null) {
            Persona solicitante;
            boolean e = s.getPermisosSolicitante().getTipoPersona().getIdtipoPersona() == 3 ? true
                    : s.getPermisosSolicitante().getTipoPersona().getIdtipoPersona() == 2 ? true
                    : s.getPermisosSolicitante().getTipoPersona().getIdtipoPersona() == 1;
            if (e) {
                solicitante = new Persona();
                new prueba().setDui(s.getPermisosComentario().split("¿¿")[0], solicitante);
                solicitante.setPersonaNombre(s.getPermisosComentario().split("¿¿")[1]);
                solicitante.setPersonaApellido(s.getPermisosComentario().split("¿¿")[2]);
            } else {
                solicitante = s.getPermisosSolicitante();
            }
            String h = solicitante.getPersonaNombre().split(" ")[0]
                    + " " + solicitante.getPersonaApellido().split(" ")[0];
            return h;
        } else {
            return "";
        }
    }

    public List<Permisos> getSolicitados() {
        return Collections.unmodifiableList(solicitados);
    }

    public void setSolicitados(List<Permisos> solicitados) {
        this.solicitados = solicitados;
    }

    public List<Permisos> getAceptados() {
        return Collections.unmodifiableList(aceptados);
    }

    public void setAceptados(List<Permisos> aceptados) {
        this.aceptados = aceptados;
    }

    public List<Permisos> getRechazados() {
        return Collections.unmodifiableList(rechazados);
    }

    public void setRechazados(List<Permisos> rechazados) {
        this.rechazados = rechazados;
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

    public GradoPK getGradoPK() {
        return gradoPK;
    }

    public void setGradoPK(GradoPK gradoPK) {
        this.gradoPK = gradoPK;
    }

    public boolean isEstudiante() {
        return permiso.getTipoPersona().getIdtipoPersona() == 8;
    }

    public void setDuiSol(String dui) {
        String d[] = dui.split("-");
        permiso.setPermisosComentario(d[0] + d[1] + "¿¿" + getNombreSol() + "¿¿" + getApellidoSol() + "¿¿" + getComentario());
    }

    public String getDuiSol() {
        String d = permiso.getPermisosComentario().split("¿¿")[0];
        if (d.equals("0")) {
            return "";
        }
        String m = d.substring(0, 7) + "-" + d.substring(8);
        return m;
    }

    public void setNombreSol(String nombre) {
        permiso.setPermisosComentario(getDuiSol() + "¿¿" + nombre + "¿¿" + getApellidoSol() + "¿¿" + getComentario());
    }

    public String getNombreSol() {
        return permiso.getPermisosComentario().split("¿¿")[1];
    }

    public void setApellidoSol(String apellido) {
        permiso.setPermisosComentario(getDuiSol() + "¿¿" + getNombreSol() + "¿¿" + apellido + "¿¿" + getComentario());
    }

    public String getApellidoSol() {
        return permiso.getPermisosComentario().split("¿¿")[2];
    }

    public void setComentarioAcep(String comentario) {
        String[] f = acep.getPermisosComentario() != null ? acep.getPermisosComentario().split("¿¿") : new String[]{" ", " ", " ", " "};
        acep.setPermisosComentario(f[0] + "¿¿" + f[1] + "¿¿" + f[2] + "¿¿" + comentario);
    }

    public String getComentarioAcep() {
        return acep.getPermisosComentario() == null ? " " : acep.getPermisosComentario().split("¿¿")[3];
    }

    public void setComentarioSolc(String comentario) {
        String[] f = solc.getPermisosComentario() != null ? acep.getPermisosComentario().split("¿¿") : new String[]{" ", " ", " ", " "};
        solc.setPermisosComentario(f[0] + "¿¿" + f[1] + "¿¿" + f[2] + "¿¿" + comentario);
    }

    public String getComentarioSolc() {
        return solc.getPermisosComentario() == null ? " " : acep.getPermisosComentario().split("¿¿")[3];
    }

    public void setComentario(String comentario) {
        permiso.setPermisosComentario(getDuiSol() + "¿¿" + getNombreSol() + "¿¿" + getApellidoSol() + "¿¿" + comentario);
    }

    public String getComentario() {
        return permiso.getPermisosComentario().split("¿¿")[3];
    }

    @Inject
    @Push
    private PushContext notificacion;

    public void sendMessage(String message) {
        notificacion.send(message);
    }
}
