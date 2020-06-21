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
import java.util.Objects;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.ContenidoLibroFacadeLocal;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonasReservaFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.beans.SolicitudReservaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoProyectoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipoReservaRecursoFacadeLocal;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.ContenidoLibro;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.SolicitudReserva;
import net.delsas.saitae.entities.SolicitudReservaPK;
import net.delsas.saitae.entities.TipoProyecto;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipoReservaRecurso;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class reservaSController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ReservaFacadeLocal resFL;
    @EJB
    private TipoRecursoFacadeLocal trFL;
    @EJB
    private RecursoFacadeLocal recursoFL;
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    @EJB
    private GradoFacadeLocal gradoFL;
    @EJB
    private MestroHorarioMateriasFacadeLocal mhmFL;
    @EJB
    private TipoProyectoFacadeLocal tProyectoFL;
    @EJB
    private TipoReservaRecursoFacadeLocal trrFL;
    @EJB
    private EstudianteFacadeLocal estFL;
    @EJB
    private TipoPersonaFacadeLocal tpFL;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private PersonasReservaFacadeLocal prFL;
    @EJB
    private SolicitudReservaFacadeLocal srFL;
    @Inject
    @Push
    private PushContext notificacion;

    private List<TipoRecurso> tiporList;
    private List<SolicitudReserva> solicitud;
    private List<Recurso> recursos;
    private List<TipoReserva> tiposReserva;
    private List<Maestro> maestros;
    private List<Materia> materias;
    private List<TipoProyecto> tProyectos;
    private List<Estudiante> estudiantes;
    private List<Grado> grados;
    private List<SelectItem> usadoPorList;

    private TipoRecurso tp;
    private Persona usuario;
    private Grado grado;
    private Maestro maestro;
    private Reserva reserva;

    private Integer usos;
    private boolean cra;
    private boolean lab;
    private boolean bib;
    private boolean alumnos;
    private Date fecha;
    private Date hi;
    private Date hf;
    private String tema;
    private String objetivo;

    //para busquedas de libros
    private boolean xTitulo;
    private boolean xAutor;
    private boolean xContenido;
    private Date fechaf;
    private String busqueda;
    private SolicitudReserva srtabla;
    private Recurso libroSeleccionado;
    private boolean mst;
    @EJB
    private ContenidoLibroFacadeLocal contenidoFL;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance()
                .getExternalContext().getSessionMap().get("usuario");
        newReserva();
        recursos = new ArrayList<>();
        tiporList = trFL.findAll();
        cra = false;
        lab = false;
        bib = false;
        alumnos = false;
        tiposReserva = tipoReservaFL.findAll();
        grados = gradoFL.findAll();
        maestros = new ArrayList<>();
        materias = new ArrayList<>();
        tProyectos = tProyectoFL.findAll();
        estudiantes = new ArrayList<>();
        usos = 0;
        tema = "";
        objetivo = "";
        tp = null;
        solicitud = new ArrayList<>();
        grado = null;
        fecha = fechaf = hi = hf = null;
        xAutor = xContenido = false;
        xTitulo = true;
        libroSeleccionado = new Recurso();
        busqueda = "";
        srtabla = new SolicitudReserva();
        mst = false;
        usadoPorList = new ArrayList<>();
        SelectItem x1 = new SelectItem("1", "Docente");
        SelectItem x2 = new SelectItem("4", "Personal (No académico)");
        usadoPorList.add(x1);
        usadoPorList.add(new SelectItem("2", "Estudiante"));
        usadoPorList.add(new SelectItem("3", "Grupo de estudiantes"));
        usadoPorList.add(x2);
        if (!usuario.getTipoPersona().getIdtipoPersona().equals(1)) {
            tProyectos.remove(0);
            if (!usuario.getTipoPersona().getIdtipoPersona().equals(8)) {
                tiporList.remove(1);
                tProyectos.remove(0);
                if (usuario.getTipoPersona().getIdtipoPersona().equals(4)) {
                    grados = new ArrayList<>();
                    usuario.getMaestro().getMestroHorarioMateriasList().stream()
                            .filter((mhm) -> (mhm.getGrado().getGradoPK()
                            .getGradoAño() == getAño())).forEachOrdered((mhm) -> {
                        grados.add(mhm.getGrado());
                    });
                }
            } else {
                grados = new ArrayList<>();
                usuario.getEstudiante().getMatriculaList().stream()
                        .filter((m) -> (m.getGrado().getGradoPK().getGradoAño() == getAño()))
                        .forEachOrdered((m) -> {
                            grados.add(m.getGrado());
                        });
                tProyectos.remove(1);
                usadoPorList.remove(x1);
                usadoPorList.remove(x2);
            }
        }
    }

    private Integer getAño() {
        return getAñoActual();
    }

    public boolean getUsoenAula() {
        TipoReserva tres = reserva.getTipoReserva();
        boolean dif = false;
        if (tres != null) {
            dif = tres.getIdtipoReserva().equals(3);
        }
        if (!dif) {
            reserva.setDocente(null);
            reserva.setMaeria(null);
            grado = null;
        }
        return dif;
    }

    public String getGradoNombre(Grado g) {
        if (g == null) {
            return "";
        }
        return getGradoNombre(g.getGradoPK());
    }

    public void newReserva() {
        reserva = new Reserva(0);
        reserva.setReservaFecha(new Date());
        reserva.setObjetivoTema(" ");
        reserva.setTema(" ");
        reserva.setPersonasReservaList(new ArrayList<>());
        reserva.setReservaComentario("0¿¿0¿¿0¿¿¿¿0");
        setResponsable(usuario.getPersonaNombre().split(" ")[0] + " "
                + usuario.getPersonaApellido().split(" ")[0]);
    }

    public void tipoRecursoSelect(SelectEvent event) {
        init();
        tp = ((TipoRecurso) event.getObject());
        reserva.setTipoRecurso(tp);
        if (tp != null) {
            cra = tp.getIdtipoRecurso() == 1;
            lab = tp.getIdtipoRecurso() == 2;
            bib = tp.getIdtipoRecurso() == 3;
            if (lab) {
                reserva.setTipoReserva(tipoReservaFL.find(1));
                recursos = trrFL.findRecursoByTipoRecursoAndTipoReserva(tp.getIdtipoRecurso(),
                        reserva.getTipoReserva().getIdtipoReserva());
                setUsadoPor("3");
            } else if (bib) {
                setUsadoPor(usuario.getTipoPersona().getIdtipoPersona() == 8 ? "2"
                        : (usuario.getTipoPersona().getIdtipoPersona() == 4 ? "1" : "4"));
                tiposReserva = tipoReservaFL.findAll();
            } else if (cra) {
                if (usuario.getTipoPersona().getIdtipoPersona().equals(8)) {
                    tiposReserva.remove(3);
                }
            }
        } else {
            cra = false;
            lab = false;
            bib = false;
        }
        alumnos = false;
    }

    public void usosSelect(SelectEvent event) {
        usos = event.getObject() != null ? Integer.valueOf(event.getObject().toString()) : 0;
        setUsadoPor(usos + "");
        alumnos = usos == 3;
    }

    public void tipoReservaSelect(SelectEvent event) {
        reserva.setTipoReserva((TipoReserva) event.getObject());
        recursos.clear();
        if (tp != null && reserva.getTipoReserva() != null) {
            recursos = trrFL.findRecursoByTipoRecursoAndTipoReserva(tp.getIdtipoRecurso(),
                    reserva.getTipoReserva().getIdtipoReserva());
        }
        List<Recurso> recAEliminar = new ArrayList<>();
        List<Recurso> recAConservar = getReservaDetalle();
        recAConservar.stream().filter((r) -> (!recursos.contains(r))).forEachOrdered((r) -> {
            recAEliminar.add(r);
        });
        recAEliminar.forEach((r) -> {
            recAConservar.remove(r);
        });
        setReservaDetalle(recAConservar);
        if (recAEliminar.size() > 0) {
            FacesContext.getCurrentInstance().addMessage(":form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Eliminación de los recursos de la lista",
                            "Se han eliminado los recursos que no tienen permitido el "
                            + reserva.getTipoReserva().getTipoReservaNombre() + "."));
            PrimeFaces.current().ajax().update(":form", ":form0:msgs");
        }
    }

    public void gradoSelect(SelectEvent event) {
        grado = (Grado) event.getObject();
        if (grado != null) {
            maestros = mhmFL.findMaestroByGradopk(grado.getGradoPK());
        }
    }

    public void maestroSelect(SelectEvent event) {
        maestro = (Maestro) event.getObject();
        if (maestro != null && grado != null) {
            materias = mhmFL.findMateriaByIdMaestroAndGradoPK(grado.getGradoPK(), maestro.getIdmaestro());
        }
    }

    public void materiaSelect(SelectEvent event) {
        Materia m = (Materia) event.getObject();
        reserva.setMaeria(m);
    }

    public void tipoProyectoSelect(SelectEvent event) {
        TipoProyecto p = (TipoProyecto) event.getObject();
        reserva.setTipoProyecto(p);
    }

    public void onBlur(AjaxBehaviorEvent event) {
        xTitulo = getParametro() == 1;
    }

    public void onAddNew(String id) {
        switch (id) {
            case "es":
                Estudiante e = new Estudiante();
                e.setPersona(new Persona());
                estudiantes.add(e);
                break;
            case "art":
                SolicitudReserva s = new SolicitudReserva();
                s.setSolicitudReservaComentario("1");
                solicitud.add(s);
                break;
            default:
        }

    }
    boolean existe;

    public void onRowEdit(RowEditEvent event) {
        switch (event.getComponent().getId()) {
            case "alumnos":
            case "alumnosl":
                Estudiante e = (Estudiante) event.getObject();
                if (e.getPersona().getPersonaNombre() == null) {
                    e.setPersona(new Persona(0));
                    new Auxiliar().setDui("" + e.getIdestudiante(), e.getPersona());
                }
                e = estFL.find(e.getPersona().getIdpersona());
                if (e != null) {
                    if (estudiantes.contains(e)) {
                        FacesContext.getCurrentInstance().addMessage(":not:msgs",
                                new FacesMessage(FacesMessage.SEVERITY_WARN, "Estudiante ya está en la lista",
                                        "Posiblemente ha ingresado erróneamente el NIE del estudiante. Ingréselo de nuevo."));
                        PrimeFaces.current().ajax().update(":not:msgs");
                        onRowCancel(event);
                    } else {
                        estudiantes.add(e);
                        limpia();
                    }
                } else {
                    FacesContext.getCurrentInstance().addMessage(":not:msgs",
                            new FacesMessage(FacesMessage.SEVERITY_ERROR, "Estudiante no encontrado",
                                    "Posiblemente ha ingresado erróneamente el NIE del estudiante. Ingréselo de nuevo."));
                    PrimeFaces.current().ajax().update(":not:msgs");
                    onRowCancel(event);
                }
                break;
            case "art":
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
                PrimeFaces.current().ajax().update(event.getComponent().getClientId());
                break;
            default:
        }

    }

    public void onRowCancel(RowEditEvent event) {
        switch (event.getComponent().getId()) {
            case "alumnos":
            case "alumnosl":
                if (event.getObject() != null) {
                    estudiantes.remove(estudiantes.indexOf(event.getObject()));
                }
                this.limpia();
                break;
            case "art":
                SolicitudReserva s = (SolicitudReserva) event.getObject();
                Recurso r = s.getRecurso();
                solicitud.remove(s);
                PrimeFaces.current().ajax().update(event.getComponent().getClientId());
                break;
            case "libros":
                srtabla = (SolicitudReserva) event.getObject();
                eliminarDeLista();
                break;
            default:
        }
    }

    void limpia() {
        try {
            estudiantes.stream().filter((e) -> (!e.getEstudianteEsEstudiante())).forEachOrdered((e) -> {
                estudiantes.remove(e);
            });
            PrimeFaces.current().ajax().update("form:alumnos");
        } catch (Exception e) {

        }
    }

    public void guardar() {
        if (fecha == null || (bib ? fechaf : fecha) == null || hi == null || hf == null) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Error en la reserva",
                            "Al parecer, no ha seleccionado bien las fechas."
                            + " Por favos, revise e intente de nuevo."));
            PrimeFaces.current().ajax().update(":not:msgs");
        } else {
            try {
                reserva.setReservaEntrega(new SimpleDateFormat("dd/MM/yyyy HH:mm a")
                        .parse(new SimpleDateFormat("dd/MM/yyyy").format(fecha) + " "
                                + new SimpleDateFormat("HH:mm a").format(hi)));
            } catch (ParseException ex) {
                reserva.setReservaEntrega(hi);
            }
            try {
                reserva.setReservaDevolucion(new SimpleDateFormat("dd/MM/yyyy HH:mm a")
                        .parse(new SimpleDateFormat("dd/MM/yyyy").format(bib ? fechaf : fecha) + " "
                                + new SimpleDateFormat("HH:mm a").format(hf)));
            } catch (ParseException ex) {
                reserva.setReservaDevolucion(hf);
            }
            reserva.setTema(tema);
            reserva.setObjetivoTema(objetivo);
            reserva.setReservaEstado("S");
            boolean lleno = getUsadoPor().equals("3") ? !estudiantes.isEmpty() : true;
            if (reserva.getReservaEntrega().after(reserva.getReservaFecha())
                    && reserva.getReservaDevolucion().after(reserva.getReservaEntrega())
                    && !getUsadoPor().equals("0") && solicitud.size() > 0 && lleno) {
                reserva.setIdreserva(null);
                resFL.create(reserva);
                List<PersonasReserva> pr = new ArrayList<>();
                if (!getUsadoPor().equals("3")) {
                    PersonasReserva e = new PersonasReserva(reserva.getIdreserva(), usuario.getIdpersona());
                    e.setPersona(usuario);
                    e.setReserva(reserva);
                    e.setPersonasReservaComentario("");
                    pr.add(e);
                } else {
                    if (usuario.getTipoPersona().getIdtipoPersona() == 8
                            && !estudiantes.contains(usuario.getEstudiante())) {
                        estudiantes.add(usuario.getEstudiante());
                    }
                    estudiantes.stream().map((es) -> {
                        PersonasReserva e = new PersonasReserva(reserva.getIdreserva(), es.getIdestudiante());
                        e.setPersona(es.getPersona());
                        return e;
                    }).map((e) -> {
                        e.setReserva(reserva);
                        return e;
                    }).map((e) -> {
                        e.setPersonasReservaComentario("");
                        return e;
                    }).forEachOrdered((e) -> {
                        pr.add(e);
                    });
                }
                List<Persona> solicitantes = new ArrayList<>();
                pr.stream().map((prs) -> {
                    prFL.create(prs);
                    return prs;
                }).forEachOrdered((prs) -> {
                    solicitantes.add(prs.getPersona());
                });
                persistirNotificación(
                        new mensaje(0, usuario.getIdpersona(), "solicitudH<form",
                                new FacesMessage(FacesMessage.SEVERITY_INFO,
                                        "Solicitud exitosa", "Su solicitud de recursos de "
                                        + tp.getTipoRecursoNombre()
                                        + " ha sido guardada con éxito. Recibirá una notificación "
                                        + "cuando sea aprobada por el encargado de área correspondiente.")),
                        solicitantes, notiFL, notificacion);
                solicitud.stream().map((s) -> {
                    s.setReserva(reserva);
                    return s;
                }).map((s) -> {
                    s.setSolicitudReservaComentario(
                            s.getSolicitudReservaComentario() == null ? "1"
                            : s.getSolicitudReservaComentario());
                    return s;
                }).map((s) -> {
                    s.setSolicitudReservaPK(
                            new SolicitudReservaPK(s.getRecurso().getIdrecurso(), reserva.getIdreserva()));
                    return s;
                }).forEachOrdered((s) -> {
                    try {
                        srFL.create(s);
                    } catch (Exception ex) {
                    }
                });
                Integer id = tp.getIdtipoRecurso();
                id = id == 1 ? 6 : (id == 2 ? 7 : (id == 3 ? 5 : 0));
                persistirNotificación(
                        new mensaje(0, usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                                + " ha solicitado recursos", "Nueva solicitud de recursos",
                                FacesMessage.SEVERITY_INFO,
                                usuario.getIdpersona(), "srCra<form:ap:solicitados"),
                        getPersonasParaNotificar(tpFL.find(id)),
                        notiFL, notificacion);
                if (!solicitantes.contains(usuario)) {
                    FacesContext.getCurrentInstance().addMessage(":not:msgs",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                                    "La solicitud se ha registrado con éxito. Las notificaciones "
                                    + "se han enviado a los estudiantes que usted ha indicado."));
                    PrimeFaces.current().ajax().update(":not:msgs");
                }
                init();
                PrimeFaces.current().ajax().update(":form", ":noti");
            } else {
                String cuerpo = (solicitud.isEmpty() ? "Asegúrese de haber solicitado recursos."
                        : (!lleno ? "Asegúrese de haber llenado la tabla con los estudiantes que está en el grupo"
                                : "Asegúrese de haber seleccionado fechas válidas y que las fechas "
                                + "de inicio del uso y del final no sea anterior a la fecha actual."));
                FacesContext.getCurrentInstance().addMessage(":not:msgs",
                        new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error en la reserva", cuerpo));
                PrimeFaces.current().ajax().update(":not:msgs");
            }
        }
    }

    public List<SolicitudReserva> getSolicitud() {
        return Collections.unmodifiableList(solicitud);
    }

    public void setSolicitud(List<SolicitudReserva> solicitud) {
        this.solicitud = solicitud;
    }

    public List<Recurso> getRecursos() {
        return Collections.unmodifiableList(recursos);
    }

    public void setRecursos(List<Recurso> recursos) {
        this.recursos = recursos;
    }

    public List<TipoReserva> getTiposReserva() {
        return Collections.unmodifiableList(tiposReserva);
    }

    public void setTiposReserva(List<TipoReserva> tr) {
        tiposReserva = tr;
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public Grado getGrado() {
        return grado;
    }

    public void setGrado(Grado grado) {
        this.grado = grado;
    }

    public List<Maestro> getMaestros() {
        return Collections.unmodifiableList(maestros);
    }

    public List<Materia> getMaterias() {
        return Collections.unmodifiableList(materias);
    }

    public List<TipoProyecto> getTProyectos() {
        return Collections.unmodifiableList(tProyectos);
    }

    public boolean isAlumnos() {
        return alumnos;
    }

    public List<Estudiante> getEstudiantes() {
        return Collections.unmodifiableList(estudiantes);
    }

    public void setEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }

    public List<TipoRecurso> getTiporList() {
        return Collections.unmodifiableList(tiporList);
    }

    public Reserva getReserva() {
        return reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }

    public boolean isCra() {
        return cra;
    }

    public boolean isLab() {
        return lab;
    }

    public boolean isBib() {
        return bib;
    }

    public TipoRecurso getTp() {
        return tp;
    }

    public void setTp(TipoRecurso tp) {
        this.tp = tp;
    }

    public void setReservaDetalle(List<Recurso> recs) {
        solicitud.clear();
        recs.stream().map((r) -> {
            SolicitudReserva s = new SolicitudReserva(0, r.getIdrecurso());
            s.setRecurso(r);
            return s;
        }).forEachOrdered((s) -> {
            solicitud.add(s);
        });
    }

    public List<Recurso> getReservaDetalle() {
        List<Recurso> r = new ArrayList<>();
        if (solicitud == null) {
            return r;
        }
        solicitud.forEach((s) -> {
            r.add(s.getRecurso());
        });
        return r;
    }

    public Integer getUsos() {
        return usos;
    }

    public void setUsos(Integer usos) {
        this.usos = usos;
    }

    public void setResponsable(String resp) {
        setCom(0, resp);
    }

    public String getResponsable() {
        return reserva.getReservaComentario().split("¿¿")[0];
    }

    public Integer getNumeroPractica() {
        return Integer.valueOf(reserva.getReservaComentario().split("¿¿")[2]);
    }

    public void setNumeroPractica(Integer n) {
        setCom(2, n + "");
    }

    public void setCom(Integer ind, String v) {
        reserva.setReservaComentario(setComentario(ind, v, reserva.getReservaComentario()));
    }

    public void setUsadoPor(String usadoPor) {
        setCom(1, usadoPor);
    }

    public String getUsadoPor() {
        return reserva.getReservaComentario().split("¿¿")[1];
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHi() {
        return hi;
    }

    public void setHi(Date hi) {
        this.hi = hi;
    }

    public Date getHf() {
        return hf;
    }

    public void setHf(Date hf) {
        this.hf = hf;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public boolean getXTitulo() {
        return xTitulo;
    }

    public void setxTitulo(boolean xTitulo) {
        this.xTitulo = xTitulo;
    }

    public boolean getXAutor() {
        return xAutor;
    }

    public void setxAutor(boolean xAutor) {
        this.xAutor = xAutor;
    }

    public boolean getXContenido() {
        return xContenido;
    }

    public void setxContenido(boolean xContenido) {
        this.xContenido = xContenido;
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        if (xTitulo) {
            List<Recurso> l = contenidoFL.findRecursoBynombre(query);
            l.forEach((r) -> {
                String a = getAutoresLibros(r);
                results.add(r.getNombre()
                        + "    Autor" + (a.split(", ").length > 1 ? "es: " : ": ") + a
                        + "    Código: " + r.getIdrecurso());
            });
        } else if (xAutor) {
            List<AutorLibro> l = contenidoFL.findLibroByAutorNombre(query);
            l.forEach((r) -> {
                results.add(r.getAutor().getAutorNombre()
                        + "    Libro: " + r.getRecurso().getNombre()
                        + "    Código: " + r.getRecurso().getIdrecurso());
            });
        } else if (xContenido) {
            List<ContenidoLibro> l = contenidoFL.findLibroByContenidoNombre(query);
            l.forEach((r) -> {
                results.add(r.getContenidoLibroNombre()
                        + "    Libro: " + r.getIdLibro().getNombre()
                        + "    Código: " + r.getIdLibro().getIdrecurso());
            });
        }
        if (results.isEmpty()) {
            results.add("No se han encontrado resultados.");
        }
        return results;
    }

    public void onItemSelect(SelectEvent event) {
        if (event.getComponent().getId().equals("tres")) {
            reserva.setTipoReserva((TipoReserva) event.getObject());
            List<SolicitudReserva> listaEliminar = new ArrayList<>();
            int d = solicitud.size();
            solicitud.stream().filter((sr) -> (!getMismoTR(sr.getRecurso()))).forEachOrdered((sr) -> {
                listaEliminar.add(sr);
            });
            listaEliminar.forEach((sr) -> {
                solicitud.remove(sr);
            });
            if (solicitud.size() < d) {
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Cambio del tipo de reserva",
                                "Se eliminaron de la lista a reservar los libros que "
                                + "no concuerdan con el tipo de reserva seleccionado."));
                PrimeFaces.current().ajax().update(":form0:msgs");
            }
        } else {
            if (!event.getObject().toString().equals("No se han encontrado resultados.")) {
                String[] x = event.getObject().toString().split("   ");
                Integer id = Integer.valueOf(x[2].split(": ")[1]);
                libroSeleccionado = recursoFL.find(id);
            } else {
            }
            busqueda = "";
        }
        mst = getMismoTR(libroSeleccionado);
    }

    public String getBusqueda() {
        return busqueda;
    }

    public void setBusqueda(String busqueda) {
        this.busqueda = busqueda;
    }

    public Recurso getLibroSeleccionado() {
        return libroSeleccionado;
    }

    public void setLibroSeleccionado(Recurso libroSeleccionado) {
        this.libroSeleccionado = libroSeleccionado;
    }

    public int getParametro() {
        return (xTitulo ? 1 : (xAutor ? 2 : (xContenido ? 3 : 1)));
    }

    public void setParametro(int p) {
        xTitulo = p == 1;
        xAutor = p == 2;
        xContenido = p == 3;
    }

    public Date getFechaf() {
        return fechaf;
    }

    public void setFechaf(Date fechaf) {
        this.fechaf = fechaf;
    }

    public String getAutoresLibros(Recurso r) {
        String a = "";
        List<AutorLibro> all = r.getAutorLibroList() == null ? new ArrayList<>() : r.getAutorLibroList();
        for (AutorLibro al : all) {
            a += (a.split("").length > 1 ? ", " : "") + al.getAutor().getAutorNombre();
        }
        return a;
    }

    public String getTiposReservaLibro(Recurso r) {
        String t = "";
        List<TipoReservaRecurso> trsrl = r.getTipoReservaRecursoList() == null ? new ArrayList<>() : r.getTipoReservaRecursoList();
        for (TipoReservaRecurso trsr : trsrl) {
            t += (t.split("").length > 1 ? ", " : "") + trsr.getTipoReserva1().getTipoReservaNombre();
        }
        return t;
    }

    public String getEditorialesLibro(Recurso r) {
        String e = "";
        List<EditorialLibro> ell = r.getEditorialLibroList() == null ? new ArrayList<>() : r.getEditorialLibroList();
        for (EditorialLibro el : ell) {
            e += (e.split("").length > 1 ? ", " : "") + el.getEditorial().getEditorialNombre();
        }
        return e;
    }

    public boolean getMismoTR(Recurso r) {
        List<Integer> trl = new ArrayList<>();
        if (r.getTipoReservaRecursoList() != null) {
            r.getTipoReservaRecursoList().forEach((trr) -> {
                trl.add(trr.getTipoReserva1().getIdtipoReserva());
            });
        }
        if (reserva.getTipoReserva() == null) {
            return false;
        } else {
            return trl.contains(reserva.getTipoReserva().getIdtipoReserva());
        }
    }

    public void agregarLibroLista() {
        SolicitudReserva s = new SolicitudReserva();
        s.setRecurso(libroSeleccionado);
        s.setReserva(reserva);
        s.setSolicitudReservaComentario("1");
        if (!solicitud.contains(s)) {
            solicitud.add(s);
            libroSeleccionado = new Recurso();
            mst = false;
        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Advertencia",
                            "El libro " + s.getRecurso().getNombre() + " ya está en la lista, "
                            + "por lo que no se procede a su agregación."));
            PrimeFaces.current().ajax().update(":form0:msgs");
        }
    }

    public SolicitudReserva getSrtabla() {
        return srtabla;
    }

    public void setSrtabla(SolicitudReserva srtabla) {
        this.srtabla = srtabla;
    }

    public void onRowSelect(SelectEvent event) {
        SolicitudReserva sl = (SolicitudReserva) event.getObject();
        if (sl != null) {
            libroSeleccionado = sl.getRecurso();
            mst = false;
        }
    }

    public void onRowUnselect(UnselectEvent event) {
        libroSeleccionado = new Recurso();
        mst = false;
    }

    public void eliminarDeLista() {
        libroSeleccionado = new Recurso();
        mst = false;
        if (srtabla != null && solicitud.contains(srtabla)) {
            solicitud.remove(srtabla);
        }
        srtabla = null;
    }

    public boolean getMst() {
        return mst;
    }

    public boolean getVerTexto() {
        return (!mst && libroSeleccionado != null && libroSeleccionado.getIdrecurso() != null);
    }

    public List<SelectItem> getUsadoPorList() {
        return Collections.unmodifiableList(usadoPorList);
    }

    public void setUsadoPorList(List<SelectItem> usadoPorList) {
        this.usadoPorList = usadoPorList;
    }

    public List<Integer> getInvalidDays() {
        return getDisabledDays();
    }
}
