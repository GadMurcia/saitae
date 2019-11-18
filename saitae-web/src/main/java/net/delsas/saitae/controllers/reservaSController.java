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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.beans.TipoProyectoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipoReservaRecursoFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.SolicitudReserva;
import net.delsas.saitae.entities.TipoProyecto;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import org.primefaces.PrimeFaces;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;

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
        reserva.setReservaEntrega(new Date());
        reserva.setReservaDevolucion(new Date());
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
        } else {
            onRowCancel(event);
        }
        limpia();
        System.out.println(event.getComponent().getClientId());
        PrimeFaces.current().ajax().update(":form:alumnos");
    }

    public void onRowCancel(RowEditEvent event) {
        if (event.getObject() != null) {
            estudiantes.remove(estudiantes.indexOf(event.getObject()));
        }
        this.limpia();
        System.out.println(event.getComponent().getClientId());
        PrimeFaces.current().ajax().update(":form:alumnos");
    }

    void limpia() {
        try {
            estudiantes.stream().filter((e) -> (e.getPersona().getIdpersona() == 0)).map((e) -> {
                estudiantes.remove(e);
                return e;
            }).map((e) -> {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Estudiante no encontrado",
                        "El estudiante con NIE " + e.getIdestudiante() + " No fue encontrado, por lo que se retira de la lista."));
                return e;
            }).forEachOrdered((_item) -> {
                PrimeFaces.current().ajax().update(":form0:msgs");
            });
        } catch (Exception e) {

        }
    }

    public void guardar() {
        System.out.println(reserva);
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

}
