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
import java.text.ParseException;
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
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.Calendarizacion;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonasReservaFacadeLocal;
import net.delsas.saitae.beans.ProyectoPedagogicoFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.beans.ReservaXpedagogiaFacadeLocal;
import net.delsas.saitae.beans.SolicitudReservaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoProyectoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.ProyectoPedagogico;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaXpedagogia;
import net.delsas.saitae.entities.ReservaXpedagogiaPK;
import net.delsas.saitae.entities.SolicitudReserva;
import net.delsas.saitae.entities.SolicitudReservaPK;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class solicitudPPController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ProyectoPedagogicoFacadeLocal ppFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private HorarioFacadeLocal hrFL;
    @EJB
    private RecursoFacadeLocal reFL;
    @EJB
    private TipoRecursoFacadeLocal trFL;
    @EJB
    private TipoProyectoFacadeLocal tpFL;
    @EJB
    private TipoReservaFacadeLocal trvFL;
    @EJB
    private ReservaFacadeLocal resFL;
    @EJB
    private SolicitudReservaFacadeLocal srFL;
    @EJB
    private ReservaXpedagogiaFacadeLocal rxpFL;
    @EJB
    private PersonasReservaFacadeLocal prFL;
    @EJB
    private TipoPersonaFacadeLocal tpnFL;

    private List<Calendarizacion> calendas;
    private List<Horario> horarios;
    private List<Recurso> recDisp;
    private List<SolicitudReserva> solicitud;

    private ProyectoPedagogico proyecto;
    private Persona usuario;
    private Calendarizacion selected;
    private Calendarizacion selected2;
    private String textoDetalle;
    private boolean existe;
    private Integer jornadas;
    private boolean editar;
    private FacesMessage m;
    private Auxiliar ax;

    @PostConstruct
    public void init() {
        ax = new Auxiliar();
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        proyecto = (ProyectoPedagogico) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("proyecto");
        proyecto = proyecto == null ? new ProyectoPedagogico() : proyecto;
        try {
            editar = (boolean) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("editar");
        } catch (Exception e) {
            editar = false;
        }
        m = (FacesMessage) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("ms");
        String n = usuario.getPersonaNombre().split(" ")[0] + " " + usuario.getPersonaApellido().split(" ")[0];
        calendas = new ArrayList<>();
        horarios = hrFL.findAll();
        solicitud = new ArrayList<>();
        recDisp = reFL.findByTipoRecurso(1);
        previusAdd();
        if (proyecto.getIdproyectoPedagogico() != null) {
            jornadas = Integer.valueOf(proyecto.getProyectoPedagogicoComentario().split("¿¿")[5]);
            llenar();
        } else {
            proyecto.setProyectoPedagogicoComentario(n + "¿¿1¿¿0¿¿¿¿0¿¿1");
            jornadas = 1;
        }
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ms");
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("proyecto");
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("editar");
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    private void llenar() {
        List<Reserva> reservas = rxpFL.findReservaByIdProyecto(proyecto.getIdproyectoPedagogico());
        if (getVariasJornadas()) {
            reservas.forEach((r) -> {
                calendas.add(convCalend(r));
            });
            ordenar();
        } else {
            selected2 = convCalend(reservas.get(0));
        }
        solicitud = reservas.get(0).getSolicitudReservaList();
    }

    private Calendarizacion convCalend(Reserva r) {
        Calendarizacion c = new Calendarizacion();
        c.setFecha(r.getReservaEntrega());
        c.setHorai(getHorario("i", r.getReservaEntrega()));
        c.setHoraf(getHorario("f", r.getReservaDevolucion()));
        return c;
    }

    private Horario getHorario(String a, Date hora) {
        String h0 = getHora(hora);
        for (Horario h : horarios) {
            String h2 = getHora(a.equals("i") ? h.getHoraInicio() : h.getHoraFin());
            if (h0.equals(h2)) {
                return h;
            }
        }
        return null;
    }

    public ProyectoPedagogico getProyecto() {
        return proyecto;
    }

    public void setProyecto(ProyectoPedagogico proyecto) {
        this.proyecto = proyecto;
    }

    public String getResponsable() {
        return proyecto.getProyectoPedagogicoComentario().split("¿¿")[0];
    }

    public void setCom(Integer ind, String v) {
        String c[] = proyecto.getProyectoPedagogicoComentario().split("¿¿");
        String rr = "";
        for (Integer y = 0; y < c.length; y++) {
            rr += (y > 0 ? "¿¿" : "") + (Objects.equals(y, ind) ? v : c[y]);
        }
        proyecto.setProyectoPedagogicoComentario(rr);
        System.out.println("Se guardó " + ind + " en el indice " + ind + ". Cadena total: " + rr);
    }

    private void calendasToReservas(List<Reserva> reservas) {
        calendas.stream().map((c) -> {
            Reserva r = new Reserva();
            r.setDocente(usuario.getMaestro());
            r.setObjetivoTema(proyecto.getObjetivoGeneral());
            r.setReservaFecha(new Date());
            r.setReservaEstado("S");
            try {
                r.setReservaEntrega(new SimpleDateFormat("dd/MM/yyyy hh:mm a")
                        .parse(getFecha(c.getFecha()) + " " + getHora(c.getHorai().getHoraInicio())));
            } catch (ParseException ex) {
                r.setReservaEntrega(c.getHorai().getHoraInicio());
            }
            System.out.println(r.getReservaEntrega());
            try {
                r.setReservaDevolucion(new SimpleDateFormat("dd/MM/yyyy hh:mm a")
                        .parse(getFecha(c.getFecha()) + " " + getHora(c.getHoraf().getHoraFin())));
            } catch (ParseException ex) {
                r.setReservaDevolucion(c.getHoraf().getHoraFin());
            }
            System.out.println(r.getReservaDevolucion());
            return r;
        }).map((r) -> {
            r.setTema(proyecto.getNombreProyecto());
            return r;
        }).map((r) -> {
            r.setTipoProyecto(tpFL.find(1));
            return r;
        }).map((r) -> {
            r.setTipoRecurso(trFL.find(1));
            return r;
        }).map((r) -> {
            r.setTipoReserva(trvFL.find(2));
            return r;
        }).map((r) -> {
            r.setReservaComentario(proyecto.getProyectoPedagogicoComentario());
            return r;
        }).forEachOrdered((r) -> {
            if ((new Date()).before(r.getReservaEntrega())) {
                reservas.add(r);
            }
        });
    }

    private void persistirReservas(List<Reserva> reservas, List<Reserva> nr, List<PersonasReserva> prs, List<SolicitudReserva> srs) {
        reservas.stream().map((r) -> {
            resFL.create(r);
            List<PersonasReserva> prsi = new ArrayList<>();
            List<SolicitudReserva> sols = new ArrayList<>();
            PersonasReserva pr = new PersonasReserva(r.getIdreserva(), usuario.getIdpersona());
            pr.setPersona(usuario);
            pr.setReserva(r);
            pr.setPersonasReservaComentario("");
            prFL.create(pr);
            prs.add(pr);
            prsi.add(pr);
            solicitud.stream().map((sr) -> {
                sr.setSolicitudReservaPK(
                        new SolicitudReservaPK(sr.getRecurso().getIdrecurso(), r.getIdreserva()));
                return sr;
            }).map((sr) -> {
                sr.setReserva(r);
                return sr;
            }).map((sr) -> {
                srFL.create(sr);
                return sr;
            }).forEachOrdered((sr) -> {
                srs.add(sr);
                sols.add(sr);
            });
            r.setSolicitudReservaList(sols);
            r.setPersonasReservaList(prsi);
            return r;
        }).forEachOrdered((r) -> {
            resFL.edit(r);
            nr.add(r);
        });
    }

    private void persistirRxP(List<Reserva> reservas, List<ReservaXpedagogia> resXped) {
        reservas.stream().map((r) -> {
            ReservaXpedagogia rxp = new ReservaXpedagogia(
                    new ReservaXpedagogiaPK(proyecto.getIdproyectoPedagogico(), r.getIdreserva()));
            rxp.setReserva(r);
            return rxp;
        }).map((rxp) -> {
            rxp.setProyectoPedagogico(proyecto);
            return rxp;
        }).map((rxp) -> {
            rxp.setReservaXpedagogiaComentario("");
            return rxp;
        }).map((rxp) -> {
            rxpFL.create(rxp);
            return rxp;
        }).forEachOrdered((rxp) -> {
            resXped.add(rxp);
        });
    }

    private void eliminarSolicitudes(List<Reserva> nr) {
        List<Reserva> rs = rxpFL.findReservaByIdProyecto(proyecto.getIdproyectoPedagogico());
        rs.stream().filter((r) -> (r.getReservaEstado().equals("S") || r.getReservaEstado().equals("A"))).map((r) -> {
            r.getPersonasReservaList().forEach((pr) -> {
                prFL.remove(pr);
            });
            return r;
        }).map((r) -> {
            r.getSolicitudReservaList().forEach((sr) -> {
                srFL.remove(sr);
            });
            return r;
        }).map((r) -> {
            r.getReservaXpedagogiaList().forEach((rxp) -> {
                rxpFL.remove(rxp);
            });
            return r;
        }).map((r) -> {
            resFL.remove(r);
            return r;
        }).forEachOrdered((r) -> {
            nr.add(r);
        });
    }

    private void eliminarRepetidos(List<Reserva> reservas) {
        List<Reserva> rs = rxpFL.findReservaByIdProyecto(proyecto.getIdproyectoPedagogico());
        for (Reserva r : rs) {
            List<Reserva> rse = new ArrayList<>();
            reservas.stream().map((r2) -> {
                if (r.getReservaEntrega().equals(r2.getReservaEntrega())) {
                    rse.add(r2);
                }
                return r2;
            }).forEachOrdered((r2) -> {
                reservas.removeAll(rse);
            });
        }
    }

    public void guardar() {
        boolean va  = (getVariasJornadas() && calendas.size() < 1);
        boolean v1j = !getVariasJornadas() && selected2.isEmpty();
        boolean vr1 = solicitud.isEmpty() || solicitud.get(0).getRecurso() == null;
        List<Reserva> reservas = new ArrayList<>();
        List<Reserva> nr = new ArrayList<>();
        List<ReservaXpedagogia> resXped = new ArrayList<>();
        List<PersonasReserva> prs = new ArrayList<>();
        List<SolicitudReserva> srs = new ArrayList<>();
        if (va  || vr1 || v1j) {
            m = null;
            if (vr1) {
                m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Solicitud incompleta",
                        "Debe indicar una serie de recursos del cra a utilizar para que la solicitud"
                        + " de reserva de equipo para un proyecto pedagógico sea válida. "
                        + "Revise antes de continuar.");
            }
            if (va) {
                m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Solicitud incompleta",
                        "Debido a que ha indicado que el proyecto será en varias jornadas, debe indicar al menos"
                        + " dos jornadas en la calendarización para que la solicitud de recursos del "
                        + "cra sea válida. Revise antes de continuar.");
            }
            if (v1j) {
                m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Solicitud incompleta",
                        "No seleccionó apropadamente la fecha y/o las horas en las que "
                        + "va a realizar su proyecto. Revise antes de continuar.");
            }
            FacesContext.getCurrentInstance().addMessage(":form0:msgs", m);
            PrimeFaces.current().ajax().update(":form0:msgs");
        } else {
            try {
                if (!getVariasJornadas() && !selected2.isEmpty()) {
                    calendas.add(selected2);
                }
                if (proyecto.getIdproyectoPedagogico() == null) {
                    ppFL.create(proyecto);
                } else {
                    ppFL.edit(proyecto);
                }
                calendasToReservas(reservas);
                eliminarSolicitudes(nr);
                eliminarRepetidos(reservas);
                persistirReservas(reservas, nr, prs, srs);
                persistirRxP(reservas, resXped);

                notificar(6);
                mensaje x = new mensaje(usuario.getIdpersona(), usuario.getIdpersona(), "srCra<form",
                        new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "Solicitud" + (calendas.size() > 1 ? "es" : "") + " realizada"
                                + (calendas.size() > 1 ? "s" : ""),
                                "La" + (calendas.size() > 1 ? "s" : "") + " solicitud" + (calendas.size() > 1 ? "es" : "")
                                + " se ha" + (calendas.size() > 1 ? "n" : "")
                                + " enviado con éxitos. Recibirá una notificación del encargado del CRA"
                                + " cuando su proyecto se haya resuelto."));
                ax.persistirNotificación(x, usuario, notiFL, notificacion);
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("ms", x.getFacesmessage());
                try {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("solicitudRPP.intex");
                } catch (IOException e) {
                    init();
                    PrimeFaces.current().ajax().update(":form", ":noti");
                }
            } catch (Exception a) {
                System.out.println("Error mega grande ocurrido en solicitudPPConroller al guardar la solicitud");
                System.out.println(a.getMessage());
                init();
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error al guardar la solicitud",
                                "Ha ocurrido un error que no debiera haber sucedido. Es posible que la información"
                                + "provista contenga algún error que se ha saltado la validación."
                                + " Busque ayuda con el administrador del sistema. Vea los logs del sistema."));
                PrimeFaces.current().ajax().update(":form", ":noti");
            }
        }
    }

    public void onRowSelect(SelectEvent event) {
        System.out.println(event.getObject());
        Calendarizacion s = (Calendarizacion) event.getObject();
        selected = s;
        selected2 = new Calendarizacion(s);
    }

    public List<Calendarizacion> getCalendas() {
        return Collections.unmodifiableList(calendas);
    }

    public void setCalendas(List<Calendarizacion> calendas) {
        this.calendas = calendas;
    }

    public String getFecha(Date d) {
        return d == null ? " " : new SimpleDateFormat("dd/MM/yyyy").format(d);
    }

    public String getHora(Date d) {
        return d == null ? " " : new SimpleDateFormat("hh:mm a").format(d);
    }

    public void previusAdd() {
        selected2 = new Calendarizacion();
        textoDetalle = "Agregación";
    }

    private void ordenar() {
        if (calendas != null) {
            Collections.sort(calendas, (Calendarizacion c1, Calendarizacion c2)
                    -> c1.getFecha().hashCode() - c2.getFecha().hashCode());
            for (Integer r = 0; r < calendas.size(); r++) {
                calendas.get(r).setNumero((r + 1));
            }
        }
    }

    private boolean asignarFechas(Calendarizacion c) {
        boolean z = c.getFecha() != null && c.getHorai() != null && c.getHoraf() != null;
        if (z) {
            try {
                c.getHorai().setHoraInicio(new SimpleDateFormat("dd/MM/yyyy hh:mm a")
                        .parse(getFecha(c.getFecha()) + " " + getHora(c.getHorai().getHoraInicio())));
            } catch (ParseException ex) {

            }
            try {
                c.getHoraf().setHoraFin(new SimpleDateFormat("dd/MM/yyyy hh:mm a")
                        .parse(getFecha(c.getFecha()) + " " + getHora(c.getHoraf().getHoraFin())));
            } catch (ParseException ex) {

            }
        }
        return z;
    }

    public void agregar() {
        Date t = new Date();
        if (selected2 != null) {
            if (asignarFechas(selected2)) {
                boolean r = !t.after(selected2.getHorai().getHoraInicio()) && selected2.getHoraf().getIdhorario() >= selected2.getHorai().getIdhorario();
                if (r) {
                    calendas.add(selected2);
                    previusAdd();
                    ordenar();
                    m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios guardados",
                            "Éxito en la agregación a la calendarización");
                } else {
                    m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Error en las fechas",
                            "Revise que la fecha-hora de inicio no sea anterior a la actual "
                            + "y que la fecha-hora final no sea anterior a la inicial.");
                }
            } else {
                m = new FacesMessage(FacesMessage.SEVERITY_WARN, "Error en las fechas",
                        "No debe dejar vaíos los campos obigatorios marcados por '*'.");
            }
        } else {
            m = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Erro",
                    "llene el formulario.");
        }
        FacesContext.getCurrentInstance().addMessage(null, m);
        PrimeFaces.current().ajax().update("form0:msgs");
        m = null;
    }

    public void editar() {
        Date t = new Date();
        if (asignarFechas(selected2)) {
            boolean r = !t.after(selected2.getHorai().getHoraInicio()) && selected2.getHoraf().getIdhorario() >= selected2.getHorai().getIdhorario();
            if (r && !selected.equals(selected2)) {
                calendas.remove(selected);
                calendas.add(selected2);
                onclose();
                ordenar();
                m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Edición exitosa", "Edición Realizada con éxito.");
                PrimeFaces.current().executeScript("PF('Dpp1').hide();");
            } else {
                m = new FacesMessage(FacesMessage.SEVERITY_WARN, "No hay cambios", "No ha hecho cambios que deban guardarse.");
            }
        } else {
            m = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Campos vacíos", "Asegúrese de haber llenado todos los campos obligatorios.");
        }
        FacesContext.getCurrentInstance().addMessage(null, m);
        PrimeFaces.current().ajax().update("form");
        m = null;
    }

    public void eliminar() {
        if (selected != null) {
            calendas.remove(selected);
            onclose();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Eliminación exitosa", "Eliminación Realizada con éxito."));
            PrimeFaces.current().ajax().update("form");
            PrimeFaces.current().executeScript("PF('Dpp1').hide();");
        }
    }

    public void onclose() {
        selected = null;
        selected2 = null;
    }

    public Calendarizacion getSelected() {
        return selected;
    }

    public void setSelected(Calendarizacion selected) {
        this.selected = selected;
    }

    public Calendarizacion getSelected2() {
        return selected2;
    }

    public void setSelected2(Calendarizacion selected2) {
        this.selected2 = selected2;
    }

    public String getTextoDetalle() {
        return textoDetalle;
    }

    public void setTextoDetalle(String textoDetalle) {
        this.textoDetalle = textoDetalle;
    }

    public boolean getEstaEditando() {
        return textoDetalle == null ? false : textoDetalle.equals("Edición");
    }

    public List<Horario> getHorarios() {
        return Collections.unmodifiableList(horarios);
    }

    public void setHorarios(List<Horario> horarios) {
        this.horarios = horarios;
    }

    public String getHoras(Date d) {
        return d == null ? " " : new SimpleDateFormat("hh:mm a").format(d);
    }

    public List<Recurso> getRecDisp() {
        return Collections.unmodifiableList(recDisp);
    }

    public void setRecDisp(List<Recurso> recDisp) {
        this.recDisp = recDisp;
    }

    public List<SolicitudReserva> getSolicitud() {
        return Collections.unmodifiableList(solicitud);
    }

    public void setSolicitud(List<SolicitudReserva> solicitud) {
        this.solicitud = solicitud;
    }

    public void onRowEdit(RowEditEvent event) {
        String id = event.getComponent().getClientId();
        SolicitudReserva s = (SolicitudReserva) event.getObject();
        Integer cant;
        try {
            cant = Integer.valueOf(s.getSolicitudReservaComentario());
        } catch (NumberFormatException ex) {
            cant = -1;
        }
        if (cant <= 0 || s.getRecurso() == null) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "No se entendió la orden",
                            "Debe seleccionar un recurso y escribir una cantidad válida (superior a cero '0')"));
            PrimeFaces.current().ajax().update(":form0:msgs");
            onRowCancel(event);
        } else {
            existe = false;
            solicitud.forEach((sr) -> {
                Integer a = solicitud.indexOf(s), b = solicitud.indexOf(sr);
                if (!Objects.equals(a, b) && s.getRecurso() == sr.getRecurso()) {
                    FacesContext.getCurrentInstance().addMessage(null,
                            new FacesMessage(FacesMessage.SEVERITY_WARN, "Recurso repetido",
                                    "Ya ha agregado este recurso a la lisa de solicitud por lo que "
                                    + "no se agregará de nuevo. Modifique ése."));
                    PrimeFaces.current().ajax().update(":form0:msgs");
                    existe = true;
                }
            });
            if (existe) {
                onRowCancel(event);
            }
        }
        PrimeFaces.current().ajax().update(id);
        System.out.println(id);

    }

    public void onRowCancel(RowEditEvent event) {
        String id = event.getComponent().getClientId();
        SolicitudReserva s = (SolicitudReserva) event.getObject();
        Recurso r = s.getRecurso();
        solicitud.remove(s);
        PrimeFaces.current().ajax().update(id);
        System.out.println(id);
    }

    public void onAddNew() {
        SolicitudReserva s = new SolicitudReserva();
        s.setSolicitudReservaComentario("1");
        if (!solicitud.contains(s)) {
            solicitud.add(s);
        }
    }

    public boolean getVariasJornadas() {
        return jornadas == 2;
    }

    public Integer getJornadas() {
        return jornadas;
    }

    public void setJornadas(Integer jornadas) {
        if (jornadas != null) {
            this.jornadas = jornadas;
        }
    }

    public void jornadasSelect(SelectEvent event) {
        if (event.getComponent().getId().equals("tre")) {
            for (int i = 0; i < solicitud.size(); i++) {
                if (solicitud.get(i).getRecurso() == null) {
                    solicitud.get(i).setRecurso((Recurso) event.getObject());
                }
            }
        } else {
            jornadas = Integer.valueOf(event.getObject().toString());
            setCom(5, jornadas + "");
            if (jornadas == 1) {
                previusAdd();
            }
        }

    }

    public void onBlur(AjaxBehaviorEvent event) {
        System.out.println(event.getComponent().getId());
        System.out.println(event);
        setCom(5, jornadas + "");
        if (!getVariasJornadas()) {
            previusAdd();
        } else {
            if (!selected2.isEmpty() && calendas.isEmpty()) {
                calendas.add(selected2);
            }
        }
    }

    private void notificar(Integer idTipoPersona) {
        ax.persistirNotificación(
                new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                        + " ha solicitado recursos para proyecto pedagógico planificado."
                        + " Revise la administración de reservas para más detalles.",
                        "Nueva solicitud de recursos",
                        FacesMessage.SEVERITY_INFO,
                        usuario.getIdpersona(), "srCra<form:ap:solicitados"),
                ax.getPersonasParaNotificar(tpnFL.find(idTipoPersona)), notiFL, notificacion);
    }

    public boolean getDesactivarVistas() {
        return editar;
    }

    public void setDesactivarVistas(boolean desactivarVistas) {
        this.editar = desactivarVistas;
    }

    public List<Integer> getDisabledDays() { 
        return new Auxiliar().getDisabledDays();
    }

    public void preRender() {
        if (m != null) {
            FacesContext.getCurrentInstance().addMessage(null, m);
            m = null;
        }
    }

}
