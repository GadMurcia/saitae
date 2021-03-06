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
import net.delsas.saitae.ax.horarioGlobal;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.DiasEstudioFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.MestroHorarioMateriasPK;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class horarioController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private DiasEstudioFacadeLocal diasEstudioFL;
    @EJB
    private HorarioFacadeLocal horarioFL;
    @EJB
    private MateriaFacadeLocal materiaFL;
    @EJB
    private GradoFacadeLocal gradoFL;
    @EJB
    private MaestroFacadeLocal maestroFL;
    @EJB
    private MestroHorarioMateriasFacadeLocal mhmFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;

    private List<MestroHorarioMaterias> horario;
    private List<horarioGlobal> horario2;
    private horarioGlobal horario2Selected;
    private Integer añoSelected;
    private List<Integer> añosDisponibles;
    private MestroHorarioMaterias selected;
    private List<Maestro> maestros;
    private List<Grado> grados;
    private List<Horario> horasClase;
    private List<DiasEstudio> dias;
    private List<Materia> materias;
    private DiasEstudio diaSelected;
    private MestroHorarioMateriasPK pk;
    private boolean edit;
    private Persona us;

    @PostConstruct
    public void init() {
        maestros = maestroFL.findAll();
        grados = gradoFL.getPorAñoYActivo(getAño());
        horasClase = horarioFL.findAll();
        dias = diasEstudioFL.findAll();
        materias = materiaFL.findAll();
        us = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        añoSelected = getAño();
        diaSelected = dias.get(0);
        añosDisponibles = getAñosParaMostrar(5);
        horario = new ArrayList<>();
        init2();
    }

    public void init2() {
        selected = new MestroHorarioMaterias(new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0));
        selected.setDiasEstudio(diaSelected);
        edit = false;
        pk = new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0);
    }

    public void nuevo() {
        selected = new MestroHorarioMaterias(new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0));
    }

    public void editar() {
        edit = true;
    }

    public void eliminar() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            if (selected != null) {
                mhmFL.remove(selected);
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Eliminación exitosa.",
                        "La eliminación se llevó a cabo con éxito."));
                persistirNotificación(
                        new mensaje(selected.getMaestro().getIdmaestro(), us.getIdpersona(),
                                "horario<form<<horarioCl<form",
                                new FacesMessage(FacesMessage.SEVERITY_INFO,
                                        "Se ha eliminado una nueva hora clase del horario",
                                        "Elimnación: " + selected.getDiasEstudio().getDiasEstudioNombre() + " "
                                        + getHora(selected.getHorario().getHoraInicio()) + " - "
                                        + getHora(selected.getHorario().getHoraFin())
                                        + ". Materia: " + selected.getMateria().getMateriaNombre()
                                        + ". Profesor: " + selected.getMaestro().getPersona().getPersonaNombre() + " "
                                        + getNombreCortoPersona(selected.getMaestro().getPersona()) + ". Grado: "
                                        + getGrado(selected.getGrado().getGradoPK()))),
                        selected.getMaestro().getPersona(),
                        notiFL, notificacion);
            } else {
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "No se encuentra la orden.",
                        "Al parecer no se seleccionó nada."));
            }
        } catch (Exception e) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "No es posible proceder con la eliminación.",
                    "Seguramente ya había datos que dependían de la asignación de horario seleccionada."
                    + " Por lo que no es posible continuar con su eiminación."));
        }
        init2();
        PrimeFaces.current().ajax().update(":form:horario", "f1");
    }

    public void guardar() {
        FacesContext context = FacesContext.getCurrentInstance();
        if (selected != null) {
            pk = selected.getMestroHorarioMateriasPK();
            selected.setMestroHorarioMateriasPK(new MestroHorarioMateriasPK(selected.getMaestro().getIdmaestro(), selected.getMateria().getIdmateria(), selected.getHorario().getIdhorario(), selected.getDiasEstudio().getIdDias(), selected.getGrado().getGradoPK().getIdgrado(), selected.getGrado().getGradoPK().getGradoSeccion(), selected.getGrado().getGradoPK().getGradoModalidad(), selected.getGrado().getGradoPK().getGradoAño()));
            List<MestroHorarioMaterias> e = mhmFL.findByhorarioAndGradoPK(selected.getHorario(), selected.getGrado().getGradoPK(), selected.getDiasEstudio());
            List<MestroHorarioMaterias> x = mhmFL.findByhorarioAndMaestro(selected.getHorario(), selected.getMaestro(), selected.getDiasEstudio());
            if (!e.isEmpty() && !e.get(0).getMestroHorarioMateriasPK().equals(pk)) {
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Asignación previa encontrada.",
                        "Ya hay una asignación igual a la que intenta hacer para el grado "
                        + getGrado(selected.getGrado().getGradoPK()) + ". "
                        + (edit ? "Elimine" : "Edite") + " ésa en vez de intentar agregarla como nueva."));
            } else if (!x.isEmpty() && !x.get(0).getMestroHorarioMateriasPK().equals(pk)) {
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Asignación previa encontrada.",
                        "El Maestro " + selected.getMaestro().getPersona().getPersonaNombre().split(" ")[0]
                        + selected.getMaestro().getPersona().getPersonaApellido().split(" ")[0]
                        + " ya tiene una asignación el día " + selected.getDiasEstudio().getDiasEstudioNombre()
                        + " entre las horas " + getHora(selected.getHorario().getHoraInicio()) + " y "
                        + getHora(selected.getHorario().getHoraFin())
                        + ", por lo que no se procederá a guardar los cambios."
                        + "Se le recomienda " + (edit ? "Eliminar" : "Editar")
                        + " la asignación en vez de intentar agregarla como nueva."));
            } else {
                MestroHorarioMaterias m = new MestroHorarioMaterias(new MestroHorarioMateriasPK());
                m.setDiasEstudio(diasEstudioFL.find(selected.getDiasEstudio().getIdDias()));
                m.setGrado(gradoFL.find(selected.getGrado().getGradoPK()));
                m.setHorario(horarioFL.find(selected.getHorario().getIdhorario()));
                m.setMaestro(maestroFL.find(selected.getMaestro().getIdmaestro()));
                m.setMateria(materiaFL.find(selected.getMateria().getIdmateria()));
                m.setMestroHorarioMateriasPK(
                        new MestroHorarioMateriasPK(
                                m.getMaestro().getIdmaestro(),
                                m.getMateria().getIdmateria(),
                                m.getHorario().getIdhorario(),
                                m.getDiasEstudio().getIdDias(),
                                m.getGrado().getGradoPK().getIdgrado(),
                                m.getGrado().getGradoPK().getGradoModalidad(),
                                m.getGrado().getGradoPK().getGradoSeccion(),
                                m.getGrado().getGradoPK().getGradoAño()));
                if (edit) {
                    selected = mhmFL.find(pk);
                    mhmFL.remove(selected);
                    PrimeFaces.current().executeScript("PF('Deditar').hide(); PF('Dhorario').hide();");
                }
                mhmFL.create(m);
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Agregación exitosa.",
                        "Las modificaciones se han realizado correctamente."));
                persistirNotificación(
                        new mensaje(m.getMaestro().getIdmaestro(), us.getIdpersona(),
                                "horario<form<<horarioCl<form",
                                new FacesMessage(FacesMessage.SEVERITY_INFO,
                                        (edit ? "Seha editado el horario"
                                                : "Se ha agregado una nueva hora clase al horario"),
                                        (!edit ? "Agregación: " : "Modificación: ")
                                        + m.getDiasEstudio().getDiasEstudioNombre() + " "
                                        + getHora(m.getHorario().getHoraInicio()) + " - "
                                        + getHora(m.getHorario().getHoraFin())
                                        + " Materia: " + m.getMateria().getMateriaNombre()
                                        + ". Profesor: "
                                        + getNombreCortoPersona(m.getMaestro().getPersona())
                                        + ". Grado: " + getGrado(m.getGrado().getGradoPK()))),
                        m.getMaestro().getPersona(),
                        notiFL, notificacion);
                init2();
            }
        }
    }

    public void onRowSelect(SelectEvent event) {
        if ("horario".equals(event.getComponent().getId())) {
            horarioGlobal gl = (horarioGlobal) event.getObject();
            horario = new ArrayList<>();
            if (gl.getComercios().getA1() != null) {
                horario.add(mhmFL.find(gl.getComercios().getA1()));
            }
            if (gl.getComercios().getB1() != null) {
                horario.add(mhmFL.find(gl.getComercios().getB1()));
            }
            if (gl.getComercios().getA2() != null) {
                horario.add(mhmFL.find(gl.getComercios().getA2()));
            }
            if (gl.getComercios().getB2() != null) {
                horario.add(mhmFL.find(gl.getComercios().getB2()));
            }
            if (gl.getComercios().getA3() != null) {
                horario.add(mhmFL.find(gl.getComercios().getA3()));
            }
            if (gl.getComercios().getB3() != null) {
                horario.add(mhmFL.find(gl.getComercios().getB3()));
            }
            if (gl.getGenerales().getA1() != null) {
                horario.add(mhmFL.find(gl.getGenerales().getA1()));
            }
            if (gl.getGenerales().getB1() != null) {
                horario.add(mhmFL.find(gl.getGenerales().getB1()));
            }
            if (gl.getGenerales().getA2() != null) {
                horario.add(mhmFL.find(gl.getGenerales().getA2()));
            }
            if (gl.getGenerales().getB2() != null) {
                horario.add(mhmFL.find(gl.getGenerales().getB2()));
            }
        }
    }

    public List<MestroHorarioMaterias> getHorario() {
        return Collections.unmodifiableList(horario);
    }

    public String getHora(Date hora) {
        return hora == null ? "" : new SimpleDateFormat("hh:mm a").format(hora);
    }

    public String getGrado(GradoPK gr) {
        return getGradoNombre(gr);
    }

    public MestroHorarioMaterias getSelected() {
        return selected;
    }

    public void setSelected(MestroHorarioMaterias selected) {
        this.selected = selected;
    }

    public List<Maestro> getMaestros() {
        return Collections.unmodifiableList(maestros);
    }

    public void setMaestros(List<Maestro> maestros) {
        this.maestros = maestros;
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public void setGrados(List<Grado> grados) {
        this.grados = grados;
    }

    public List<Horario> getHorasClase() {
        return Collections.unmodifiableList(horasClase);
    }

    public void setHorasClase(List<Horario> horasClase) {
        this.horasClase = horasClase;
    }

    public List<DiasEstudio> getDias() {
        return Collections.unmodifiableList(dias);
    }

    public void setDias(List<DiasEstudio> dias) {
        this.dias = dias;
    }

    public List<Materia> getMaterias() {
        return Collections.unmodifiableList(materias);
    }

    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    public Integer getAño() {
        return getAñoActual();
    }

    public boolean isEdit() {
        return edit;
    }

    public void setEdit(boolean edit) {
        this.edit = edit;
    }

    public void onAñoSelected(SelectEvent e) {
    }

    public Integer getAñoSelected() {
        return añoSelected;
    }

    public void setAñoSelected(Integer añoSelected) {
        this.añoSelected = añoSelected;
    }

    public List<Integer> getAñosDisponibles() {
        return Collections.unmodifiableList(añosDisponibles);
    }

    public List<horarioGlobal> getHorario2() {
        horario2 = llenar(añoSelected, horasClase, diaSelected, mhmFL, gradoFL);
        return horario2;
    }

    public void setHorario2(List<horarioGlobal> horario2) {
        this.horario2 = horario2;
    }

    public DiasEstudio getDiaSelected() {
        return diaSelected;
    }

    public void setDiaSelected(DiasEstudio diaSelected) {
        this.diaSelected = diaSelected;
    }

    public horarioGlobal getHorario2Selected() {
        return horario2Selected;
    }

    public void setHorario2Selected(horarioGlobal horario2Selected) {
//        this.selected = horario2Selected == null ? null
//                : mhmFL.find(new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0));
        this.horario2Selected = horario2Selected;
    }

    public Materia getMateria(Integer id) {
        return materiaFL.find(id == null ? 0 : id);
    }

    public String getNombreCorto(Integer m) {
        return m == null ? "" : getNombreCortoPersona(maestroFL.find(m).getPersona());
    }

    public String getAccion(boolean ac) {
        edit = ac;
        return (ac ? "Edición" : "Eliminación");
    }

    public String nombreGrado(Integer n, String m, String s, Integer a) {
        return getGrado(new GradoPK(n, m, s, a));
    }

    public boolean disabled(horarioGlobal hg) {
        List<Integer> dis = new ArrayList<>();
        dis.add(3);
        dis.add(6);
        dis.add(9);
        dis.add(12);
        return hg == null ? false : dis.contains(hg.getHora().getIdhorario());
    }

}
