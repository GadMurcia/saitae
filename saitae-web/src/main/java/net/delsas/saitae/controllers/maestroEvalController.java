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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.EvaluacionMaestro;
import net.delsas.saitae.entities.EvaluacionMaestroPK;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;
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
public class maestroEvalController implements Serializable {

    private List<Persona> maestros;
    private List<Grado> grados;
    private List<Materia> materias;
    private List<Horario> horarios;
    private Persona usuario;
    private Persona persona;
    private EvaluacionMaestro evMa;

    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private MestroHorarioMateriasFacadeLocal mhmFL;
    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private MateriaFacadeLocal mFL;
    @EJB
    private HorarioFacadeLocal hFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
                .get("usuario");
        List<Integer> tps = Auxiliar.getTiposPersonas(usuario);
        boolean r = (tps.contains(1) || tps.contains(2));
        if (!r) {
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
                    .put("mensaje",
                            new FacesMessage(
                                    FacesMessage.SEVERITY_FATAL,
                                    "Falla!",
                                    "Esa vista no le está permitida."));
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
            }
            return;
        }
        maestros = pFL.getMaestros();
        horarios = hFL.findAll();
        grados = gFL.getPorAñoYActivo(Auxiliar.getAñoActual());
        materias = mFL.findAll();
    }

    private void prepararEval() {
        if (persona.getMaestro().getEvaluacionMaestroList() == null) {
            persona.getMaestro().setEvaluacionMaestroList(new ArrayList<>());
        }
        evMa = new EvaluacionMaestro(
                new EvaluacionMaestroPK(persona.getIdpersona(), new Date()));
        evMa.setMaestro(persona.getMaestro());
        evMa.setEvaluador(usuario);
        MestroHorarioMaterias h = mhmFL.finHorarioActual(
                persona.getIdpersona(),
                evMa.getEvaluacionMaestroPK().getFechaHora(),
                Auxiliar.getAñoActual());
        if (h != null) {
            evMa.setHoraInicio(h.getHorario().getHoraInicio());
            evMa.setHoraFin(h.getHorario().getHoraFin());
            evMa.setGrado(h.getGrado());
        }
    }

    public void onSelectEvent(SelectEvent e) {
        String id = e.getComponent().getId();
        switch (id) {
            case "mae":
                prepararEval();
                break;
            case "":
        }
    }

    public void guardarEval() {
        persona.getMaestro().getEvaluacionMaestroList().add(evMa);
        pFL.edit(persona);
        Auxiliar.persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), " ",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Evaluación nueva",
                                Auxiliar.getNombreCortoPersona(usuario)
                                + " ha realizado una nueva evaluación de su desempeño. "
                                + "Puede ver su historial de desempeño en la pestaña historiales del menú perfil.")),
                persona, notiFL, notificacion);
        FacesContext.getCurrentInstance().addMessage("form0:msgs",
                new FacesMessage(FacesMessage.SEVERITY_INFO, "Evaluación realizada con éxito",
                        "Puede ver el historial de evaluaciones en el panel inferior \"Historial\""));
        PrimeFaces.current().ajax().update("form0:msgs");
        prepararEval();
    }

    public void limpiar() {
        persona = null;
    }

    public List<Persona> getMaestros() {
        return maestros;
    }

    public void setMaestros(List<Persona> maestros) {
        this.maestros = maestros;
    }

    public List<Grado> getGrados() {
        return grados;
    }

    public void setGrados(List<Grado> grados) {
        this.grados = grados;
    }

    public List<Materia> getMaterias() {
        return materias;
    }

    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    public List<Horario> getHorarios() {
        return horarios;
    }

    public void setHorarios(List<Horario> horarios) {
        this.horarios = horarios;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public EvaluacionMaestro getEvMa() {
        return evMa;
    }

    public void setEvMa(EvaluacionMaestro evMa) {
        this.evMa = evMa;
    }
}
