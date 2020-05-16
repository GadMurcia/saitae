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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.EjemplarFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonasReservaFacadeLocal;
import net.delsas.saitae.beans.ReservaDetalleFacadeLocal;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.beans.ReservaXpedagogiaFacadeLocal;
import net.delsas.saitae.beans.SolicitudReservaFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.ProyectoPedagogico;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaDetalle;
import net.delsas.saitae.entities.SolicitudReserva;
import net.delsas.saitae.entities.TipoRecurso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class adminReservas extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ReservaFacadeLocal resFL;
    @EJB
    private TipoRecursoFacadeLocal trFL;
    @EJB
    private PersonasReservaFacadeLocal prFL;
    @EJB
    private SolicitudReservaFacadeLocal srFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private EjemplarFacadeLocal ejFL;
    @EJB
    private ReservaDetalleFacadeLocal rdFL;
    @EJB
    private ReservaXpedagogiaFacadeLocal rxpFL;

    private List<Reserva> solicitados, entregados, devueltos, rechazados, cancelados, aceptados;
    private List<Integer> tipos;
    private List<Ejemplar> r;
    private List<Integer> añosDisponibles;
    private Reserva selected;
    private String textoReserva;
    private String[] u;
    private boolean rechazo;
    private Persona usuario;
    private Ejemplar ejemplar;
    private ProyectoPedagogico proyecto;
    private Integer añoSelected;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance()
                .getExternalContext().getSessionMap().get("usuario");
        tipos = getTiposPersonas(usuario);
        boolean tr = (tipos.contains(1) || tipos.contains(2) || tipos.contains(5) || tipos.contains(6) || tipos.contains(7));
        if (!tr) {
            solicitados = entregados = devueltos = rechazados = cancelados = aceptados = new ArrayList<>();
            FacesContext context = FacesContext.getCurrentInstance();
            context.getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_FATAL,
                            "Acceso denegado",
                            "Usted no tiene los privilegios suficientes para acceder a esa funcionalidad."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // completeList();
            textoReserva = "";
            u = new String[]{"Docente", "Estudiante", "Grupo de estudiantes", "Personal (No académico)"};
            rechazo = false;
            añoSelected = getAñoActual();
            añosDisponibles = getAñosParaMostrar(5);
        }
    }

    public List<Reserva> getSolicitados() {
        solicitados = tipos.contains(1) || tipos.contains(2)
                ? resFL.getReservaByEstado("S", añoSelected)
                : resFL.findByEstadoAndIdTipoRecurso("S",
                        (tipos.contains(5) ? 3
                        : (tipos.contains(6) ? 1
                        : (tipos.contains(7) ? 2 : 0))), añoSelected);
        solicitados.stream().map((s) -> {
            s.setSolicitudReservaList(srFL.findByIdReserva(s.getIdreserva()));
            return s;
        }).forEachOrdered((s) -> {
            s.setPersonasReservaList(prFL.findByIdReserva(s.getIdreserva()));
        });
        return Collections.unmodifiableList(solicitados);
    }

    public List<Reserva> getEntregados() {
        entregados = tipos.contains(1) || tipos.contains(2)
                ? resFL.getReservaByEstado("E", añoSelected)
                : resFL.findByEstadoAndIdTipoRecurso("E",
                        (tipos.contains(5) ? 3
                        : (tipos.contains(6) ? 1
                        : (tipos.contains(7) ? 2 : 0))), añoSelected);
        entregados.stream().map((s) -> {
            s.setSolicitudReservaList(srFL.findByIdReserva(s.getIdreserva()));
            return s;
        }).forEachOrdered((s) -> {
            s.setPersonasReservaList(prFL.findByIdReserva(s.getIdreserva()));
        });
        return Collections.unmodifiableList(entregados);
    }

    public List<Reserva> getDevueltos() {
        devueltos = tipos.contains(1) || tipos.contains(2)
                ? resFL.getReservaByEstado("D", añoSelected)
                : resFL.findByEstadoAndIdTipoRecurso("D",
                        (tipos.contains(5) ? 3
                        : (tipos.contains(6) ? 1
                        : (tipos.contains(7) ? 2 : 0))), añoSelected);
        devueltos.stream().map((s) -> {
            s.setSolicitudReservaList(srFL.findByIdReserva(s.getIdreserva()));
            return s;
        }).forEachOrdered((s) -> {
            s.setPersonasReservaList(prFL.findByIdReserva(s.getIdreserva()));
        });
        return Collections.unmodifiableList(devueltos);
    }

    public List<Reserva> getRechazados() {
        rechazados = tipos.contains(1) || tipos.contains(2)
                ? resFL.getReservaByEstado("R", añoSelected)
                : resFL.findByEstadoAndIdTipoRecurso("R",
                        (tipos.contains(5) ? 3
                        : (tipos.contains(6) ? 1
                        : (tipos.contains(7) ? 2 : 0))), añoSelected);
        rechazados.stream().map((s) -> {
            s.setSolicitudReservaList(srFL.findByIdReserva(s.getIdreserva()));
            return s;
        }).forEachOrdered((s) -> {
            s.setPersonasReservaList(prFL.findByIdReserva(s.getIdreserva()));
        });
        return Collections.unmodifiableList(rechazados);
    }

    public Reserva getSelected() {
        return selected;
    }

    public void setSelected(Reserva selected) {
        this.selected = selected;
    }

    public List<Reserva> getCancelados() {
        cancelados = tipos.contains(1) || tipos.contains(2)
                ? resFL.getReservaByEstado("C", añoSelected)
                : resFL.findByEstadoAndIdTipoRecurso("C",
                        (tipos.contains(5) ? 3
                        : (tipos.contains(6) ? 1
                        : (tipos.contains(7) ? 2 : 0))), añoSelected);
        cancelados.stream().map((s) -> {
            s.setSolicitudReservaList(srFL.findByIdReserva(s.getIdreserva()));
            return s;
        }).forEachOrdered((s) -> {
            s.setPersonasReservaList(prFL.findByIdReserva(s.getIdreserva()));
        });
        return Collections.unmodifiableList(cancelados);
    }

    public List<Reserva> getAceptados() {
        aceptados = tipos.contains(1) || tipos.contains(2)
                ? resFL.getReservaByEstado("A", añoSelected)
                : resFL.findByEstadoAndIdTipoRecurso("A",
                        (tipos.contains(5) ? 3
                        : (tipos.contains(6) ? 1
                        : (tipos.contains(7) ? 2 : 0))), añoSelected);
        aceptados.stream().map((s) -> {
            s.setSolicitudReservaList(srFL.findByIdReserva(s.getIdreserva()));
            return s;
        }).forEachOrdered((s) -> {
            s.setPersonasReservaList(prFL.findByIdReserva(s.getIdreserva()));
        });
        return Collections.unmodifiableList(aceptados);
    }

    public String getFechaString(Date d) {
        if (d == null) {
            return "";
        }
        return new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d);
    }

    public void onRowSelect(SelectEvent event) {
        selected = (Reserva) event.getObject();
        List<ProyectoPedagogico> re = rxpFL.findProyectoByIdReserva(selected == null
                ? 0 : selected.getIdreserva());
        if (!re.isEmpty()) {
            proyecto = re.get(0);
        } else {
            proyecto = null;
        }
        procesoDetalle();
        rechazo = false;
        textoReserva = getEstadoCita1(selected.getReservaEstado());
    }

    public String getTextoReserva() {
        return textoReserva;
    }

    public void setTextoReserva(String textoReserva) {
        this.textoReserva = textoReserva;
    }

    public void setReservaDetalle(List<Ejemplar> ejs) {
        r = ejs != null ? ejs : new ArrayList<>();
    }

    public List<Ejemplar> getReservaDetalle() {
        return Collections.unmodifiableList(r != null ? r : new ArrayList<>());
    }

    public void procesoDetalle() {
        r = new ArrayList<>();
        if (selected != null) {
            String e = selected.getReservaEstado();
            if (e.equals("S")) {
                List<SolicitudReserva> sol = getSolicitudReservaDetalle();
                sol.forEach((sr) -> {
                    int y;
                    try {
                        y = Integer.valueOf(sr.getSolicitudReservaComentario());
                    } catch (NumberFormatException ex) {
                        y = 0;
                    }
                    for (int x = 0; x < y; x++) {
                        Ejemplar ej = new Ejemplar(sr.getRecurso().getIdrecurso(), 0);
                        ej.setRecurso(sr.getRecurso());
                        ej.setEjemplarComentario(sr.getSolicitudReservaComentario());
                        r.add(ej);
                    }
                });
            } else {
                List<ReservaDetalle> rds = selected.getReservaDetalleList();
                rds = (rds == null || rds.isEmpty())
                        ? rdFL.findByIdReserva(selected.getIdreserva())
                        : rds;
                if (rds != null) {
                    rds.forEach((rd) -> {
                        r.add(rd.getEjemplar());
                    });
                }
            }
        }
    }

    public List<SolicitudReserva> getSolicitudReservaDetalle() {
        return selected != null
                ? ((selected.getSolicitudReservaList() == null || selected.getSolicitudReservaList().isEmpty())
                ? srFL.findByIdReserva(selected.getIdreserva())
                : selected.getSolicitudReservaList())
                : new ArrayList<>();
    }

    public String getUsos() {
        return (selected != null && getUsadoPor() > 0) ? u[(getUsadoPor() - 1)] : "";
    }

    public void setResponsable(String resp) {
        setCom(0, resp);
    }

    public String getResponsable() {
        return selected != null ? selected.getReservaComentario().split("¿¿")[0] : " ";
    }

    public String getResponsableTabla(Reserva r) {
        return r != null ? r.getReservaComentario().split("¿¿")[0] : "";
    }

    public Integer getNumeroPractica() {
        return selected != null ? Integer.valueOf(selected.getReservaComentario().split("¿¿")[2]) : 0;
    }

    public void setNumeroPractica(Integer n) {
        setCom(2, n + "");
    }

    public void setCom(Integer ind, String v) {
        selected.setReservaComentario(setComentario(ind, v, selected.getReservaComentario()));
    }

    public void setUsadoPor(int usadoPor) {
        setCom(1, usadoPor + "");
    }

    public int getUsadoPor() {
        return selected != null ? Integer.valueOf(selected.getReservaComentario().split("¿¿")[1]) : 0;
    }

    public String getDocente(Reserva r) {
        Maestro m = r != null ? r.getDocente() : null;
        String salida = "";
        if (m != null) {
            salida = getNombreCortoPersona(m.getPersona());
        }
        return salida;
    }

    public String getRazonRechazo() {
        return selected != null ? selected.getReservaComentario().split("¿¿")[3] : "";
    }

    public void setRazonRechazo(String rechazo) {
        setCom(3, rechazo);
    }

    public String getGradoNombre(Grado g) {
        return getGradoNombre(g.getGradoPK());
    }

    public boolean isRechazo() {
        return rechazo;
    }

    public void setRechazo(boolean rechazo) {
        this.rechazo = rechazo;
    }

    public boolean isVariasPersonas() {
        return selected == null ? false : selected.getPersonasReservaList().size() > 1;
    }

    public Grado getGradoActualDePersonas(Persona p) {
        Grado g = null;
        if (p != null && p.getEstudiante() != null) {
            for (Matricula m : p.getEstudiante().getMatriculaList()) {
                if (m.getGrado().getGradoPK().getGradoAño() == getAñoActual()) {
                    g = m.getGrado();
                }
            }
        }
        return g;
    }

    public boolean isGradoValido() {
        return getGradoUso().split("").length > 1;
    }

    public String getGradoUso() {
        String g = "";
        for (Persona p : getPersonasEnSolicitud()) {
            String n = p.getPersonaNombre().split(" ")[0]
                    + " " + p.getPersonaApellido().split(" ")[0];
            if (getResponsable().equals(n)) {
                if (p.getEstudiante() != null) {
                    Grado gg = getGradoActualDePersonas(p);
                    g = gg != null ? getGradoNombre(gg) : "";
                }
            }
        }
        return g;
    }

    public List<Persona> getPersonasEnSolicitud() {
        List<Persona> l = new ArrayList<>();
        if (selected != null) {
            List<PersonasReserva> prs = selected.getPersonasReservaList();
            prs = (prs == null || prs.isEmpty()) ? prFL.findByIdReserva(selected.getIdreserva()) : prs;
            prs.forEach((pr) -> {
                l.add(pr.getPersona());
            });
        }

        return l;
    }

    public String getPersonasEnSolicitudTexto() {
        String l = "";
        for (Persona p : getPersonasEnSolicitud()) {
            l += (l.split("").length > 0 ? "\n" : "") + "* " + p.getPersonaNombre() + " "
                    + p.getPersonaApellido();
        }
        return l;
    }

    public boolean isadmin() {
        return (tipos.contains(1) || tipos.contains(2));
    }

    public String getTipoRecurso(Reserva r) {
        return r == null ? "" : (!r.getSolicitudReservaList().isEmpty()
                ? r.getSolicitudReservaList().get(0).getRecurso().getIdTipoRecurso().getTipoRecursoNombre()
                : "");
    }

    public boolean getEslaboratorio() {
        TipoRecurso tr = trFL.find(2);
        if (tr == null || selected == null) {
            return false;
        }
        return getTipoRecurso(selected).equals(tr.getTipoRecursoNombre());
    }

    public boolean getVerEquipoDetalle() {
        boolean m = (selected == null ? false : (!selected.getReservaEstado().equals("S") && !selected.getReservaEstado().equals("R") && !selected.getReservaEstado().equals("C") && !getEslaboratorio()));
        return m;
    }

    public void rechazar() {
        System.out.println(getRazonRechazo());
        if (selected != null) {
            String e1 = selected.getReservaEstado();
            selected.setReservaEstado("R");
            resFL.edit(selected);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Rechazo exitoso",
                            "El rechazo de la solicitud de reserva de equipo se ha llevado a cabo con éxito."
                            + "Se notificarán a las personas solicitantes del rechazo."));
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "solicitudH<form",
                            new FacesMessage(FacesMessage.SEVERITY_WARN, "Rechazo de reserva",
                                    "Su solicitud de reserva de equipo con fecha "
                                    + (new SimpleDateFormat("dd/MM/yyyy").format(selected.getReservaFecha()))
                                    + " a las " + (new SimpleDateFormat("hh:mm a").format(selected.getReservaFecha()))
                                    + " ha sido rechazada por " + usuario.getPersonaNombre().split(" ")[0] + " "
                                    + usuario.getPersonaApellido().split(" ")[0] + ". La razón del rechazo es: "
                                    + getRazonRechazo() + ".")),
                    getPersonasEnReserva(selected), notiFL, notificacion);
            solicitados.remove(selected);
            aceptados.remove(selected);
            rechazados.add(selected);
            if (e1.equals("A") && selected.getReservaDetalleList() != null) {
                selected.getReservaDetalleList().forEach((rd) -> {
                    rdFL.remove(rd);
                });
            }
            selected = null;
            PrimeFaces.current().executeScript("PF('Dreserva1').hide();"
                    + "PF('Dreserva').hide();");
            PrimeFaces.current().ajax().update(":form0:msgs", "noti", ":form", "d1", "d2");
        }
    }

    public void aceptar() {
        boolean lleno = true;
        if (!getEslaboratorio()) {
            for (Ejemplar ej : r) {
                if (ej.getEjemplarPK().getEjemplarCorrelativo() < 1) {
                    lleno = false;
                }
            }
        }
        if (selected != null && lleno) {
            selected.setReservaEstado("A");
            resFL.edit(selected);
            Reserva res;
            if (!getEslaboratorio()) {
                r.stream().map((ej) -> {
                    ReservaDetalle rd = new ReservaDetalle(ej.getEjemplarPK().getIdRecurso(),
                            ej.getEjemplarPK().getEjemplarCorrelativo(),
                            selected.getIdreserva());
                    rd.setEjemplar(ej);
                    return rd;
                }).map((rd) -> {
                    rd.setReserva(selected);
                    return rd;
                }).map((rd) -> {
                    rd.setReservaDetalleComentario("");
                    return rd;
                }).forEachOrdered((rd) -> {
                    rdFL.edit(rd);
                });
                res = rdFL.findReservaByIdReserva(selected.getIdreserva());
                selected.setReservaDetalleList(res.getReservaDetalleList());
                resFL.edit(selected);
            }
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Aceptación Exitosa",
                            "La asignación de recursos para la solicitud de reserva de equipo se ha llevado a cabo con éxito."
                            + "Se notificarán a las personas solicitantes de la aceptación de su solicitud."));
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "solicitudH<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Aceptación de reserva",
                                    "Su solicitud de reserva de equipo con fecha "
                                    + (new SimpleDateFormat("dd/MM/yyyy").format(selected.getReservaFecha()))
                                    + " a las " + (new SimpleDateFormat("hh:mm a").format(selected.getReservaFecha()))
                                    + " ha sido aceptada por " + usuario.getPersonaNombre().split(" ")[0] + " "
                                    + usuario.getPersonaApellido().split(" ")[0]
                                    + ".")),
                    getPersonasEnReserva(selected), notiFL, notificacion);
            solicitados.remove(selected);
            aceptados.add(selected);
            selected = null;
            PrimeFaces.current().executeScript("PF('Dreserva').hide();"
                    + "PF('Dreserva2').hide();");
        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al aceptar la solicitud",
                            "Ningún correlativo puede ser cero (0). Corrija e intete de nuevo."));
        }
        PrimeFaces.current().ajax().update(":form0:msgs", "noti", ":form", "d1", "d3");
    }

    public void entregar() {
        if (selected != null) {
            selected.setReservaEstado("E");
            selected.setEntregante(usuario);
            resFL.edit(selected);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Entrega exitosa",
                            "La entrega de los recursos solicitados se ha llevado a cabo con éxito."
                            + "Se notificarán a las personas solicitantes."));
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "solicitudH<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Entrega de equipo reservado",
                                    "Los recursos que solicitó el día "
                                    + (new SimpleDateFormat("dd/MM/yyyy").format(selected.getReservaFecha()))
                                    + " a las " + (new SimpleDateFormat("hh:mm a").format(selected.getReservaFecha()))
                                    + " han sido entregados en este momento por " + usuario.getPersonaNombre().split(" ")[0] + " "
                                    + usuario.getPersonaApellido().split(" ")[0])),
                    getPersonasEnReserva(selected), notiFL, notificacion);
            aceptados.remove(selected);
            entregados.add(selected);
            selected = null;
            PrimeFaces.current().executeScript("PF('Dreserva3').hide();"
                    + "PF('Dreserva').hide();");
            PrimeFaces.current().ajax().update(":form0:msgs", "noti", ":form", "d1", "d4");

        }
    }

    public void recibir() {
        if (selected != null) {
            selected.setReservaEstado("D");
            selected.setRecibe(usuario);
            resFL.edit(selected);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Devolución exitosa",
                            "La devolución de los recursos solicitados se ha llevado a cabo con éxito."
                            + "Se notificarán a las personas solicitantes."));
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "solicitudH<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Devolución de equipo reservado",
                                    "Los recursos que solicitó el día "
                                    + (new SimpleDateFormat("dd/MM/yyyy").format(selected.getReservaFecha()))
                                    + " a las " + (new SimpleDateFormat("hh:mm a").format(selected.getReservaFecha()))
                                    + " han sido recibidos en este momento por " + usuario.getPersonaNombre().split(" ")[0] + " "
                                    + usuario.getPersonaApellido().split(" ")[0])),
                    getPersonasEnReserva(selected), notiFL, notificacion);
            entregados.remove(selected);
            devueltos.add(selected);
            selected = null;
            PrimeFaces.current().executeScript("PF('Dreserva4').hide();"
                    + "PF('Dreserva').hide();");
            PrimeFaces.current().ajax().update(":form0:msgs", "noti", ":form", "d1", "d5");

        }
    }

    public boolean getVerRechazo() {
        return (selected == null ? false
                : (selected.getReservaEstado().equals("S")
                || selected.getReservaEstado().equals("A")));
    }

    public boolean getVerEntregar() {
        return (selected == null ? false
                : (selected.getReservaEstado().equals("A")));
    }

    public boolean getVerAceptar() {
        return (selected == null ? false
                : (selected.getReservaEstado().equals("S")));
    }

    public boolean getVerRecibir() {
        return (selected == null ? false
                : (selected.getReservaEstado().equals("E")));
    }

    public boolean getVertema() {
        String x = selected != null ? selected.getTema() : "";
        return !(x.isEmpty() || x.equals(" "));
    }

    public boolean getVerObjetivo() {
        String x = selected != null ? selected.getObjetivoTema() : "";
        return !(x.isEmpty() || x.equals(" "));
    }

    public List<Integer> getCorrelativos(Ejemplar e) {
        List<Integer> co = ejFL.findCorrelativosByIdRecurso(
                e == null ? 0 : e.getRecurso().getIdrecurso());
        co = co == null ? new ArrayList<>() : co;
        return co;
    }

    public void onRowEdit(RowEditEvent event) {
        System.out.println(event.getObject());
    }

    public void onRowCancel(RowEditEvent event) {
        System.out.println(event.getObject());
        Ejemplar ej = (Ejemplar) event.getObject();
        r.remove(ej);
        ejemplar = null;
    }

    public void onDetalleRowSelect(SelectEvent event) {
        ejemplar = (Ejemplar) event.getObject();
        System.out.println(ejemplar);
    }

    public void onItemSelect(SelectEvent event) {
        System.out.println(event.getObject());
        int co = (int) event.getObject();
        int o = r.indexOf(ejemplar);
        r.get(o).getEjemplarPK().setEjemplarCorrelativo(co);
    }

    public Ejemplar getEjemplar() {
        return ejemplar;
    }

    public void setEjemplar(Ejemplar ejemplar) {
        this.ejemplar = ejemplar;
    }

    public boolean getCancelado() {
        boolean ra = selected == null ? false : !getRazonRechazo().isEmpty();
        boolean v = selected != null ? selected.getReservaEstado().equals("C") : false;
        return (ra && v);
    }

    public boolean getHayProyecto() {
        return proyecto != null;
    }

    public void verProyecto() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            context.getExternalContext().getSessionMap().put("proyecto", proyecto);
            context.getExternalContext().getSessionMap().put("editar", true);
            context.getExternalContext().getSessionMap().put("ms",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Redirección exitosa",
                            "Éste es el despliegue de la información contenida en el proyecto planificado al"
                            + "que hacía referencia la solicitud de reserva que usted estaba viedo."
                            + " Para efectos de integridad de la información, usted no puede editar ningún campo. "
                            + "visualice la información"));
            context.getExternalContext().redirect("solicitudRPP.intex");
        } catch (IOException ex) {
        }
    }

//    public void onBlour(AjaxBehaviorEvent a) {
//
//    }

    public List<Integer> getAñosDisponibles() {
        return añosDisponibles;
    }

    public void setAñosDisponibles(List<Integer> añosDisponibles) {
        this.añosDisponibles = añosDisponibles;
    }

    public Integer getAñoSelected() {
        return añoSelected;
    }

    public void setAñoSelected(Integer añoSelected) {
        this.añoSelected = añoSelected;
    }

}
