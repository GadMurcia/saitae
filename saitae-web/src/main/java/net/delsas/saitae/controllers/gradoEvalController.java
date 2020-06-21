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
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.GradoEvaluacionFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoEvaluacion;
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
public class gradoEvalController extends Auxiliar implements Serializable {

    private List<Grado> grados;
    private Grado gradoSelected;
    private GradoEvaluacion eval;
    private GradoEvaluacion evalSelected;
    private FacesContext context;
    private Persona usuario;
    private String pagina;
    private List<GradoEvaluacion> evaluaciones;

    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private GradoEvaluacionFacadeLocal gevFL;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina))))) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            }
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado",
                            ex.getMessage() == null ? "Error de causa desconocida." : ex.getMessage()));
        }
    }

    public void onSelect(SelectEvent e) {
        nuevaEval();
    }

    private void nuevaEval() {
        if (gradoSelected != null) {
            if (gradoSelected.getGradoEvaluacionList() == null) {
                gradoSelected.setGradoEvaluacionList(new ArrayList<>());
            }
            eval = new GradoEvaluacion(gradoSelected);
            eval.setGrado(gradoSelected);
            eval.setEvaluador(usuario);
        } else {
            eval = null;
        }
    }

    public void guardarEvaluación() {
        if (eval != null) {
            gradoSelected.getGradoEvaluacionList().add(eval);
            gFL.edit(gradoSelected);
            nuevaEval();
            List<Persona> interesados = new ArrayList<>();
            gradoSelected.getMatriculaList().forEach((m) -> {
                interesados.add(m.getEstudiante().getPersona());
            });
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "gradoEvalH<form<<gradoEval<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO,
                                    "Hay una nueva evaluación de su grado",
                                    "El grado en el que usted está inscrito ha "
                                    + "sido evaluado recientemente por " + getNombreCortoPersona(usuario)
                                    + ". Vea los resultados en el historial de evaluaciones de su grado.")),
                    interesados,
                    notiFL, notificacion);
            if (gradoSelected.getGradoMaestroGuia() != null) {
                persistirNotificación(
                        new mensaje(0, usuario.getIdpersona(), "gradoEvalH<form<<gradoEval<form",
                                new FacesMessage(FacesMessage.SEVERITY_INFO,
                                        "Hay una nueva evaluación del su grado",
                                        "El grado del que usted guía ha "
                                        + "sido evaluado recientemente por " + getNombreCortoPersona(usuario)
                                        + ". Vea los resultados en el historial de evaluaciones de su grado.")),
                        gradoSelected.getGradoMaestroGuia().getPersona(),
                        notiFL, notificacion);
            }
            FacesContext.getCurrentInstance().addMessage("form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Evaluación realizada",
                            "La evaluación del grado " + getGradoNombre(gradoSelected.getGradoPK())
                            + " ha sido realizada con éxito."));
            PrimeFaces.current().ajax().update("form0:msgs");
        }
    }

    public void eliminarEva() {
        if (evalSelected != null) {
            gradoSelected.getGradoEvaluacionList().remove(evalSelected);
            gevFL.remove(evalSelected);
            gFL.edit(gradoSelected);
            evalSelected = null;
            List<Persona> interesados = new ArrayList<>();
            gradoSelected.getMatriculaList().forEach((m) -> {
                interesados.add(m.getEstudiante().getPersona());
            });
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), "gradoEvalH<form<<gradoEval<form",
                            new FacesMessage(FacesMessage.SEVERITY_INFO,
                                    "Se ha eliminado una evaluación de su grado",
                                    getNombreCortoPersona(usuario)
                                    + " ha eliminado una evaluación del grado "
                                    + "en el que usted está inscrito.")),
                    interesados,
                    notiFL, notificacion);
            if (gradoSelected.getGradoMaestroGuia() != null) {
                persistirNotificación(
                        new mensaje(0, usuario.getIdpersona(), "gradoEvalH<form<<gradoEval<form",
                                new FacesMessage(FacesMessage.SEVERITY_INFO,
                                        "Se ha eliminado una evaluación de su grado",
                                        getNombreCortoPersona(usuario)
                                        + " ha eliminado una evaluación del grado "
                                        + "que usted es guía.")),
                        gradoSelected.getGradoMaestroGuia().getPersona(),
                        notiFL, notificacion);
            }
            FacesContext.getCurrentInstance().addMessage("form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Evaluación eliminada",
                            "La evaluación del grado " + getGradoNombre(gradoSelected.getGradoPK())
                            + " ha sido eliminada con éxito."));
            PrimeFaces.current().ajax().update("form0:msgs");
        }
    }

    public List<Grado> getGrados() {
        grados = gFL.getPorAñoYActivo(getAñoActual());
        gradoSelected = grados.isEmpty() ? null : grados.get(0);
        return grados;
    }

    public Grado getGradoSelected() {
        return gradoSelected;
    }

    public void setGradoSelected(Grado gradoSelected) {
        this.gradoSelected = gradoSelected;
    }

    public GradoEvaluacion getEval() {
        return eval;
    }

    public void setEval(GradoEvaluacion eval) {
        this.eval = eval;
    }

    public GradoEvaluacion getEvalSelected() {
        return evalSelected;
    }

    public void setEvalSelected(GradoEvaluacion evalSelected) {
        this.evalSelected = evalSelected;
    }

    public List<GradoEvaluacion> getEvaluaciones() {
        evaluaciones = gradoSelected == null ? new ArrayList<>()
                : gevFL.findByGradoPK(gradoSelected.getGradoPK());
        return evaluaciones;
    }

}
