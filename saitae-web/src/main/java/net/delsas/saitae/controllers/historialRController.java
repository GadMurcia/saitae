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
import java.util.Objects;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonasReservaFacadeLocal;
import net.delsas.saitae.beans.ReservaDetalleFacadeLocal;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.beans.ReservaXpedagogiaFacadeLocal;
import net.delsas.saitae.beans.SolicitudReservaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.ProyectoPedagogico;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaDetalle;
import net.delsas.saitae.entities.SolicitudReserva;
import net.delsas.saitae.entities.TipoPersona;
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
public class historialRController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ReservaFacadeLocal resFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private ReservaDetalleFacadeLocal rdFL;
    @EJB
    private TipoPersonaFacadeLocal tpFL;
    @EJB
    private SolicitudReservaFacadeLocal srFL;
    @EJB
    private PersonasReservaFacadeLocal prFL;
    @EJB
    private ReservaXpedagogiaFacadeLocal rxpFL;

    private List<Ejemplar> r;
    private List<Reserva> reservas;

    private String[] u;

    private String textoReserva;
    private Reserva selected;
    private Persona usuario;
    private FacesContext context;
    private boolean rechazo;
    private ProyectoPedagogico proyecto;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        if (usuario == null) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                reservas = new ArrayList<>();
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage(FacesMessage.SEVERITY_FATAL,
                                "Error en el redireccionamiento",
                                "No hemos detectado una sesión activa. no se carga nada."));
                PrimeFaces.current().ajax().update(":form0:msgs");
            }
        } else {
            //reservas = resFL.getReservaByIdUsuario(usuario.getIdpersona());            
            textoReserva = "";
            u = new String[]{"Docente", "Estudiante", "Grupo de estudiantes", "Personal (No académico)"};
        }
    }

    public void onRowEdit(RowEditEvent event) {
        System.out.println(event.getObject());
    }

    public void onRowCancel(RowEditEvent event) {
        System.out.println(event.getObject());
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

    public void onDetalleRowSelect(SelectEvent event) {
        selected = (Reserva) event.getObject();
        List<ProyectoPedagogico> re = rxpFL.findProyectoByIdReserva(selected == null ? 0 : selected.getIdreserva());
        if (!re.isEmpty()) {
            proyecto = re.get(0);
        } else {
            proyecto = null;
        }
        procesoDetalle();
        rechazo = false;
        if (selected == null) {
            textoReserva = "";
        } else {
            switch (selected.getReservaEstado()) {
                case "S":
                    textoReserva = "solicitad";
                    break;
                case "A":
                    textoReserva = "aceptad";
                    break;
                case "E":
                    textoReserva = "entregad";
                    break;
                case "D":
                    textoReserva = "devuelt";
                    break;
                case "R":
                    textoReserva = "rechazad";
                    rechazo = true;
                    break;
                case "C":
                    textoReserva = "cancelad";
                    break;
                default:
                    textoReserva = "";
            }
        }
    }

    private void notificar(Reserva s, mensaje x) {
        List<Persona> ss = new ArrayList<>();
        s.getPersonasReservaList().forEach((pr) -> {
            ss.add(pr.getPersona());
        });
        notificar(ss, x);
    }

    private void notificar(List<Persona> s, mensaje x) {
        x.getNotificacion().setFechaHora(new Date());
        s.stream().map((pr) -> {
            x.setDestinatario(pr.getIdpersona());
            return pr;
        }).map((pr) -> {
            notiFL.create(x.getNotificacion());
            return pr;
        }).forEachOrdered((pr) -> {
            sendMessage(x.toString());
        });
    }

    public void sendMessage(String message) {
        notificacion.send(message);
    }

    public Reserva getSelected() {
        return selected;
    }

    public void setSelected(Reserva selected) {
        this.selected = selected;
    }

    public List<Reserva> getReservas() {
        reservas = resFL.getReservaByIdUsuario(usuario.getIdpersona());
        return Collections.unmodifiableList(reservas);
    }

    public void setReservas(List<Reserva> rs) {
        this.reservas = rs != null ? rs : ((reservas != null && !reservas.isEmpty()) ? reservas : new ArrayList<>());
    }

    public String getFechasToString(Date d) {
        return d == null ? "" : new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d);
    }

    public String getEstado(String e) {
        return e.equals("S") ? "Solicitado"
                : (e.equals("A") ? "Aceptado"
                : (e.equals("E") ? "Entregado"
                : (e.equals("D") ? "Devuelto"
                : (e.equals("R") ? "Rechazado"
                : (e.equals("C") ? "Cancelado" : "")))));
    }

    public boolean getSePuedeCancelar() {
        return selected == null ? false
                : (selected.getReservaEstado().equals("S") || selected.getReservaEstado().equals("A"));
    }

    public String getResponsable(String r) {
        return r.split("¿¿")[0];
    }

    public String getTipoRecurso(Reserva r) {
        return r == null ? "" : (!r.getSolicitudReservaList().isEmpty()
                ? r.getSolicitudReservaList().get(0).getRecurso().getIdTipoRecurso().getTipoRecursoNombre()
                : "");
    }

    public void cancelar() {
        System.out.println(getRazonRechazo());
        if (selected != null) {
            String e1 = selected.getReservaEstado();
            selected.setReservaEstado("C");
            resFL.edit(selected);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Cancelación exitosa",
                            "La  cancelación se registró con éxito. "
                            + (selected.getPersonasReservaList().size() > 1
                            ? "Se notificará al resto  de personas en la reserva" : "")));
            mensaje x = new mensaje(0, usuario.getIdpersona(), "solicitudH<form",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Cancelación de reserva",
                            "Su solicitud de reserva de equipo con fecha "
                            + (new SimpleDateFormat("dd/MM/yyyy").format(selected.getReservaFecha()))
                            + " a las " + (new SimpleDateFormat("hh:mm a").format(selected.getReservaFecha()))
                            + " ha sido cancelada por " + usuario.getPersonaNombre().split(" ")[0] + " "
                            + usuario.getPersonaApellido().split(" ")[0]
                            + ". La razón de lacancelación es: " + getRazonRechazo() + "."));
            notificar(selected, x);
            x = new mensaje(0, usuario.getIdpersona(), "srCra<form",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Cancelación de reserva",
                            "La solicitud de reserva de equipo con fecha "
                            + (new SimpleDateFormat("dd/MM/yyyy").format(selected.getReservaFecha()))
                            + " a las " + (new SimpleDateFormat("hh:mm a").format(selected.getReservaFecha()))
                            + " ha sido cancelada por " + usuario.getPersonaNombre().split(" ")[0] + " "
                            + usuario.getPersonaApellido().split(" ")[0]
                            + ". La razón de la cancelación es: " + getRazonRechazo() + "."));
            Integer tp = selected.getTipoRecurso().getIdtipoRecurso();
            tp = tp == 1 ? 6 : (tp == 2 ? 7 : (tp == 3 ? 5 : 0));
            TipoPersona per = tpFL.find(tp);
            List<Persona> admins = new ArrayList<>();
            if (per != null) {
                per.getPersonaList().forEach((p) -> {
                    admins.add(p);
                });
                per.getDelagacionCargoList().stream().filter((dl) -> (!admins.contains(dl.getIdpersona()))).forEachOrdered((dl) -> {
                    admins.add(dl.getIdpersona());
                });
                per.getCargoList().forEach((g) -> {
                    g.getMaestoCargoList().stream().filter((mc) -> (!admins.contains(mc.getMaestro().getPersona()))).forEachOrdered((mc) -> {
                        admins.add(mc.getMaestro().getPersona());
                    });
                });

            }
            notificar(admins, x);
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

    public boolean getVerRechazo() {
        return (selected == null ? false
                : (selected.getReservaEstado().equals("S")
                || selected.getReservaEstado().equals("A")));
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

    public void setCom(Integer ind, String v) {
        String c[] = selected.getReservaComentario().split("¿¿");
        String rr = "";
        for (Integer y = 0; y < c.length; y++) {
            rr += (y > 0 ? "¿¿" : "") + (Objects.equals(y, ind) ? v : c[y]);
        }
        selected.setReservaComentario(rr);
    }

    public String getRazonRechazo() {
        return selected != null ? selected.getReservaComentario().split("¿¿")[3] : "";
    }

    public void setRazonRechazo(String rechazo) {
        setCom(3, rechazo);
    }

    public void setReservaDetalle(List<Ejemplar> ejs) {
        r = ejs != null ? ejs : new ArrayList<>();
    }

    public List<Ejemplar> getReservaDetalle() {
        return Collections.unmodifiableList(r != null ? r : new ArrayList<>());
    }

    public boolean getEslaboratorio() {
        return selected.getTipoRecurso().getIdtipoRecurso().equals(2);
    }

    public boolean getVerEquipoDetalle() {
        boolean m = (selected == null ? false : (!selected.getReservaEstado().equals("S") && !selected.getReservaEstado().equals("R") && !selected.getReservaEstado().equals("C") && !getEslaboratorio()));
        return m;
    }

    public List<SolicitudReserva> getSolicitudReservaDetalle() {
        return selected != null
                ? ((selected.getSolicitudReservaList() == null || selected.getSolicitudReservaList().isEmpty())
                ? srFL.findByIdReserva(selected.getIdreserva())
                : selected.getSolicitudReservaList())
                : new ArrayList<>();
    }

    public void setUsadoPor(int usadoPor) {
        setCom(1, usadoPor + "");
    }

    public int getUsadoPor() {
        return selected != null ? Integer.valueOf(selected.getReservaComentario().split("¿¿")[1]) : 0;
    }

    public String getUsos() {
        return (selected != null && getUsadoPor() > 0) ? u[(getUsadoPor() - 1)] : "";
    }

    public boolean getRechazo() {
        return rechazo;
    }

    public void setRechazo(boolean rechazo) {
        this.rechazo = rechazo;
    }

    public String getTextoReserva() {
        return textoReserva;
    }

    public void setTextoReserva(String textoReserva) {
        this.textoReserva = textoReserva;
    }

    public boolean getVertema() {
        String x = selected != null ? selected.getTema() : "";
        return !(x.isEmpty() || x.equals(" "));
    }

    public boolean getVerObjetivo() {
        String x = selected != null ? selected.getObjetivoTema() : "";
        return !(x.isEmpty() || x.equals(" "));
    }

    public String getDocente() {
        Maestro m = selected != null ? selected.getDocente() : null;
        String salida = "";
        if (m != null) {
            salida += m.getPersona().getPersonaNombre().split(" ")[0]
                    + " " + m.getPersona().getPersonaApellido().split(" ")[0];
        }
        return salida;
    }

    public boolean isGradoValido() {
        return getGradoUso().split("").length > 1;
    }

    public int getAñoActual() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
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

    public String getGradoNombre(Grado g) {
        if (g == null) {
            return "";
        }
        GradoPK id = g.getGradoPK();
        return id.getIdgrado() + "° " + (id.getGradoModalidad().equals("C") ? "TVC Contador"
                : (id.getGradoModalidad().equals("S") ? "TVC Secretariado" : "General"))
                + " " + id.getGradoSeccion();
    }

    public String getGradoUso() {
        String g = "";
        for (Persona p : getPersonasEnSolicitud()) {
            String n = p.getPersonaNombre().split(" ")[0]
                    + " " + p.getPersonaApellido().split(" ")[0];
            if (selected.getReservaComentario().split("¿¿")[0].equals(n)) {
                if (p.getEstudiante() != null) {
                    Grado gg = getGradoActualDePersonas(p);
                    g = gg != null ? getGradoNombre(gg) : "";
                }
            }
        }
        return g;
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
            context.getExternalContext().getSessionMap().put("editar", false);
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

}
