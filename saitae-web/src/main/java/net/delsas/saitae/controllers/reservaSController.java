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
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoProyectoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipoReservaRecursoFacadeLocal;
import net.delsas.saitae.entities.Cargo;
import net.delsas.saitae.entities.DelagacionCargo;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.SolicitudReserva;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipoProyecto;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.component.selectcheckboxmenu.SelectCheckboxMenu;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.DualListModel;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class reservaSController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ReservaFacadeLocal resFL;
    @EJB
    private TipoRecursoFacadeLocal trFL;
    private List<TipoRecurso> tiporList;
    private Reserva reserva;
    private List<SolicitudReserva> solicitud;
    private List<Recurso> recursos;
    @EJB
    private RecursoFacadeLocal recursoFL;
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    private List<TipoReserva> tiposReserva;
    private boolean cra;
    private boolean lab;
    private boolean bib;
    private boolean alumnos;
    private TipoRecurso tp;
    private Persona usuario;
    @EJB
    private GradoFacadeLocal gradoFL;
    private List<Grado> grados;
    private Grado grado;
    private List<Maestro> maestros;
    @EJB
    private MestroHorarioMateriasFacadeLocal mhmFL;
    private List<Materia> materias;
    private Maestro maestro;
    @EJB
    private TipoProyectoFacadeLocal tProyectoFL;
    private List<TipoProyecto> tProyectos;
    @EJB
    private TipoReservaRecursoFacadeLocal trrFL;
    @EJB
    private EstudianteFacadeLocal estFL;
    private List<Estudiante> estudiantes;
    private int usos;
    @EJB
    private TipoPersonaFacadeLocal tpFL;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    private HashMap<Integer, Recurso> art;

    private Date fecha;
    private Date hi;
    private Date hf;
    private String tema;
    private String objetivo;

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
        fecha = new Date();
        solicitud = new ArrayList<>();
        grado = null;
        hi = hf = null;
        art=new HashMap<>();
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

    public void newReserva() {
        reserva = new Reserva(0);
        reserva.setReservaFecha(new Date());
        reserva.setObjetivoTema(" ");
        reserva.setTema(" ");
        reserva.setPersonasReservaList(new ArrayList<>());
        reserva.setReservaComentario(" ¿¿ ¿¿ ¿¿ ");
        setResponsable(usuario.getPersonaNombre().split(" ")[0] + " "
                + usuario.getPersonaApellido().split(" ")[0]);
    }

    public void tipoRecursoSelect(SelectEvent event) {
        newReserva();
        estudiantes.clear();
        tp = ((TipoRecurso) event.getObject());
        if (tp != null) {
            cra = tp.getIdtipoRecurso() == 1;
            lab = tp.getIdtipoRecurso() == 2;
            bib = tp.getIdtipoRecurso() == 3;
        } else {
            cra = false;
            lab = false;
            bib = false;
        }
        alumnos = false;
        System.out.println(tp == null ? "No Selection" : tp);
    }

    public void usosSelect(SelectEvent event) {
        usos = event.getObject() != null ? Integer.valueOf(event.getObject().toString()) : 0;
        setUsadoPor(usos + "");
        alumnos = usos == 3;
        System.out.println(usos == 0 ? "No Selection" : usos);
    }

    public void tipoReservaSelect(SelectEvent event) {
        reserva.setTipoReserva((TipoReserva) event.getObject());
        if (tp != null && reserva.getTipoReserva() != null) {
            recursos = trrFL.findRecursoByTipoRecursoAndTipoReserva(tp.getIdtipoRecurso(),
                    reserva.getTipoReserva().getIdtipoReserva());
        }
        System.out.println("" + reserva.getTipoReserva());
    }

    public void gradoSelect(SelectEvent event) {
        grado = (Grado) event.getObject();
        if (grado != null) {
            maestros = mhmFL.findMaestroByGradopk(grado.getGradoPK());
        }
        System.out.println(grado);
    }

    public void maestroSelect(SelectEvent event) {
        maestro = (Maestro) event.getObject();
        if (maestro != null && grado != null) {
            materias = mhmFL.findMateriaByIdMaestroAndGradoPK(grado.getGradoPK(), maestro.getIdmaestro());
        }
        System.out.println(maestro);
    }

    public void materiaSelect(SelectEvent event) {
        Materia m = (Materia) event.getObject();
        reserva.setMaeria(m);
        System.out.println(m == null ? "no selection" : m.getMateriaNombre());
    }

    public void tipoProyectoSelect(SelectEvent event) {
        TipoProyecto p = (TipoProyecto) event.getObject();
        reserva.setTipoProyecto(p);
        System.out.println(p == null ? "no selection" : p.getTipoProyectoNombre());
    }

    public void onBlur(AjaxBehaviorEvent event) {
        System.out.println(event.getComponent().getId());
        System.out.println(event);
    }

    public void fechaSelect(SelectEvent event) {
        switch (event.getComponent().getId()) {
            case "fec":
                fecha = (Date) event.getObject();
                break;
            case "hi":
                hi = (Date) event.getObject();
                break;
            case "hf":
                hf = (Date) event.getObject();
                break;
            default:
        }

        System.out.println(event.getObject());
    }

    public void horasSelect(AjaxBehaviorEvent event) {
        SelectCheckboxMenu men = (SelectCheckboxMenu) event.getSource();
        Object o = men.getValue();
        System.out.println(o);
        System.out.println(event.getSource());
    }

    public void onAddNew() {
        Estudiante e = new Estudiante(0);
        e.setPersona(new Persona(0, " ", " ", false));
        estudiantes.add(e);
    }

    public void onRowEdit(RowEditEvent event) {
        Estudiante e = (Estudiante) event.getObject();
        e.setPersona(new Persona(0));
        new Auxiliar().setDui("" + e.getIdestudiante(), e.getPersona());
        e = estFL.find(e.getPersona().getIdpersona());
        if (e != null) {
            estudiantes.add(e);
            limpia();
        } else {
            onRowCancel(event);
        }
        System.out.println(event.getComponent().getClientId());
    }

    public void onRowCancel(RowEditEvent event) {
        if (event.getObject() != null) {
            estudiantes.remove(estudiantes.indexOf(event.getObject()));
        }
        this.limpia();
        System.out.println(event.getComponent().getClientId());
    }

    void limpia() {
        try {
            for (Estudiante e : estudiantes) {
                if (!e.getEstudianteEsEstudiante()) {
                    estudiantes.remove(e);
                }
            }
            PrimeFaces.current().ajax().update("form:alumnos");
        } catch (Exception e) {

        }
    }

    public void guardar() {
        System.out.println(reserva);
        try {
            reserva.setReservaEntrega(new SimpleDateFormat("dd/MM/yyyy HH:mm a")
                    .parse(new SimpleDateFormat("dd/MM/yyyy").format(fecha) + " "
                            + new SimpleDateFormat("HH:mm a").format(hi)));
        } catch (ParseException ex) {
            reserva.setReservaEntrega(hi);
        }
        try {
            reserva.setReservaDevolucion(new SimpleDateFormat("dd/MM/yyyy HH:mm a")
                    .parse(new SimpleDateFormat("dd/MM/yyyy").format(fecha) + " "
                            + new SimpleDateFormat("HH:mm a").format(hf)));
        } catch (ParseException ex) {
            reserva.setReservaDevolucion(hf);
        }
        reserva.setTema(tema);
        reserva.setObjetivoTema(objetivo);
        reserva.setReservaEstado("S");
        if (reserva.getReservaEntrega().after(reserva.getReservaFecha())
                && reserva.getReservaDevolucion().after(reserva.getReservaEntrega())) {
            reserva.setIdreserva(null);
            resFL.create(reserva);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                            "Su solicitud de recursos de " + tp.getTipoRecursoNombre()
                            + " ha sido guardada con éxito. Resivirá una notificación "
                            + "cuando sea aprobada por el encargado de área correspondiente."));
            int id = tp.getIdtipoRecurso();
            id = id == 1 ? 6 : (id == 2 ? 7 : (id == 3 ? 5 : 0));
            TipoPersona ps = tpFL.find(id);
            ArrayList<Persona> personas = new ArrayList<>();
            personas.addAll(ps.getPersonaList());
            ps.getDelegacionCargoList().forEach((dl) -> {
                personas.add(dl.getIdpersona());
            });
            ps.getCargoList().forEach((c) -> {
                c.getMaestoCargoList().forEach((mc) -> {
                    personas.add(mc.getMaestro().getPersona());
                });
            });
            mensaje x= new mensaje(0, usuario.getPersonaNombre()+" "+usuario.getPersonaApellido()
                    +" ha solicitado recursos", "Nueva solicitud de recursos", FacesMessage.SEVERITY_INFO
                    , usuario.getIdpersona(), " ");
            persistirNotificación(x, personas);
            init();
            PrimeFaces.current().ajax().update(":form", ":form0");
        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error en las fechas",
                            "Asegúrese de haber seleccionado fechas válidas y que las fechas "
                            + "de inicio del uso y del final no sea anterior a la fecha actual."));
            PrimeFaces.current().ajax().update(":form0");
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

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
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

    public int getUsos() {
        return usos;
    }

    public void setUsos(int usos) {
        this.usos = usos;
    }

    public void setResponsable(String resp) {
        String c[] = reserva.getReservaComentario().split("¿¿");
        String rr = "";
        for (int y = 0; y < c.length; y++) {
            if (y == 0) {
                rr += resp;
            } else {
                rr += "¿¿" + c[y];
            }

        }
        reserva.setReservaComentario(rr);
        System.out.println(rr);
    }

    public String getResponsable() {
        return reserva.getReservaComentario().split("¿¿")[0];
    }

    public void setUsadoPor(String usadoPor) {
        String c[] = reserva.getReservaComentario().split("¿¿");
        String rr = "";
        for (int y = 0; y < c.length; y++) {
            switch (y) {
                case 0:
                    rr += c[0];
                    break;
                case 1:
                    rr += "¿¿" + usadoPor;
                    break;
                default:
                    rr += "¿¿" + c[y];
                    break;
            }
        }
        reserva.setReservaComentario(rr);
        System.out.println(rr);
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

    private void persistirNotificación(mensaje x, ArrayList<Persona> ps) {
        ps.forEach((p) -> {
            try {
                x.setDestinatario(p.getIdpersona());
                x.getNotificacion().setFechaHora(new Date());
                sendMessage(x.toString());
                notiFL.create(x.getNotificacion());
                System.out.println("notificación enviada "+x.getNotificacion().getFechaHora());
            } catch (Exception e) {
            }
        });
    }

    @Inject
    @Push
    private PushContext notificacion;

    public void sendMessage(String message) {
        notificacion.send(message);
    }

}
