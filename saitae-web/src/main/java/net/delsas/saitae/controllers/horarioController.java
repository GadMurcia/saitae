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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.DiasEstudioFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.MestroHorarioMateriasPK;
import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class horarioController implements Serializable {

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

    private List<MestroHorarioMaterias> horario;
    private MestroHorarioMaterias selected;
    private List<Maestro> maestros;
    private List<Grado> grados;
    private List<Horario> horasClase;
    private List<DiasEstudio> dias;
    private List<Materia> materias;
    private MestroHorarioMateriasPK pk;
    private boolean edit;

    @PostConstruct
    public void init() {
        maestros = maestroFL.findAll();
        grados = gradoFL.getPorAñoYActivo(getAño());
        horasClase = horarioFL.findAll();
        dias = diasEstudioFL.findAll();
        materias = materiaFL.findAll();
        init2();
    }

    public void init2() {
        horario = mhmFL.findAllOrdered();//new ArrayList<>();         
        selected = new MestroHorarioMaterias(new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0));
        edit = false;
        pk = new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0);
    }

    public void nuevo() {
        selected = new MestroHorarioMaterias(new MestroHorarioMateriasPK(0, 0, 0, 0, 0, "", "", 0));
    }

    public void editar() {
        edit = true;
        PrimeFaces.current().ajax().update(":form", "f1");
    }

    public void eliminar() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            if (selected != null) {
                mhmFL.remove(selected);
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Eliminación exitosa.",
                        "La eliminación se llevó a cabo con éxito."));
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
            if (!mhmFL.findByhorarioAndGradoPK(selected.getHorario(), selected.getGrado().getGradoPK(), selected.getDiasEstudio()).isEmpty()
                    && (edit && (pk.getIdMateria() == selected.getMateria().getIdmateria()
                    && pk.getIdMaestro() == selected.getMaestro().getIdmaestro()))) {
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Asignación previa encontrada.",
                        "Ya hay una asignación igual a la que intenta hacer en la base de datos. "
                        + (edit ? "Elimine" : "Edite") + " ésa en vez de intentar agregarla como nueva."));
            } else if (!mhmFL.findByhorarioAndMaestro(selected.getHorario(), selected.getMaestro(), selected.getDiasEstudio()).isEmpty()
                    && (!edit && (pk.getIdMateria() == selected.getMateria().getIdmateria()
                    && gradoFL.find(new GradoPK(pk.getIdGrado(), pk.getGradoModalidad(), pk.getSeccionGrado(), pk.getAñoGrado()))
                    == selected.getGrado()))) {
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
                        "Asignación previa encontrada.",
                        "El Maestro " + selected.getMaestro().getPersona().getPersonaNombre().split(" ")[0]
                        + selected.getMaestro().getPersona().getPersonaApellido().split(" ")[0]
                        + " ya tiene una asignación el día " + selected.getDiasEstudio().getDiasEstudioNombre()
                        + " entre las horas " + getHora(selected.getHorario().getHoraInicio()) + " y "
                        + getHora(selected.getHorario().getHoraFin()) + ", por lo que no se procederá a guardar los cambios."
                        + "Se le recomienda " + (edit ? "Eliminar" : "Editar") + " la asignación en vez de intentar agregarla como nueva."));
            } else {
                MestroHorarioMaterias m = new MestroHorarioMaterias(new MestroHorarioMateriasPK());
                m.setDiasEstudio(diasEstudioFL.find(selected.getDiasEstudio().getIdDias()));
                m.setGrado(gradoFL.find(selected.getGrado().getGradoPK()));
                m.setHorario(horarioFL.find(selected.getHorario().getIdhorario()));
                m.setMaestro(maestroFL.find(selected.getMaestro().getIdmaestro()));
                m.setMateria(materiaFL.find(selected.getMateria().getIdmateria()));
                m.setMestroHorarioMateriasPK(new MestroHorarioMateriasPK(m.getMaestro().getIdmaestro(), m.getMateria().getIdmateria(), m.getHorario().getIdhorario(), m.getDiasEstudio().getIdDias(), m.getGrado().getGradoPK().getIdgrado(), m.getGrado().getGradoPK().getGradoSeccion(), m.getGrado().getGradoPK().getGradoModalidad(), m.getGrado().getGradoPK().getGradoAño()));

                selected = mhmFL.find(pk);
                if (selected!=null) {
                    mhmFL.remove(selected);

                }
                mhmFL.edit(m);
                context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Agregación exitosa.",
                        "Las modificaciones se han realizado correctamente."));

            }
            init2();
            PrimeFaces.current().ajax().update(":form:horario", "f1");
        }
    }

    public void onRowSelect(SelectEvent event) {
        this.pk = ((MestroHorarioMaterias) event.getObject()).getMestroHorarioMateriasPK();
        System.out.println("Selected!");
        setSelected((MestroHorarioMaterias) event.getObject());
    }

    public List<MestroHorarioMaterias> getHorario() {
        return Collections.unmodifiableList(horario);
    }

    public void setHorario(List<MestroHorarioMaterias> horario) {
        this.horario = horario;
    }

    public String getHora(Date hora) {
        return new SimpleDateFormat("hh:mm a").format(hora);
    }

    public String getGrado(GradoPK gr) {
        String g = "";
        g = gr.getIdgrado() + "° " + (gr.getGradoModalidad().equals("C") ? "TVC Contador"
                : (gr.getGradoModalidad().equals("S") ? "TVC Secretariado"
                : (gr.getGradoModalidad().equals("G") ? "General" : "??")))
                + " Sección " + gr.getGradoSeccion();
        return g;
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

    public int getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public boolean isEdit() {
        return edit;
    }

    public void setEdit(boolean edit) {
        this.edit = edit;
    }

}
