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
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.ConsultaFacadeLocal;
import net.delsas.saitae.beans.ExpedientePSFacadeLocal;
import net.delsas.saitae.entities.CitaPsicologia;
import net.delsas.saitae.entities.CitaPsicologiaPK;
import net.delsas.saitae.entities.Consulta;
import net.delsas.saitae.entities.ExpedientePS;
import net.delsas.saitae.entities.Persona;
import org.primefaces.PrimeFaces;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class consultasPSController implements Serializable {

    private static final long serialVersionUID = 1L;
    private FacesMessage m;
    private Auxiliar ax;
    private Persona usuario;
    private CitaPsicologia cita;
    @EJB
    private ConsultaFacadeLocal conFL;
    @EJB
    private ExpedientePSFacadeLocal exFL;
    private List<Consulta> consultasAnteriores;
    private ExpedientePS expediente;
    private Consulta consulta;
    private boolean editar;

    @PostConstruct
    public void init() {
        ax = new Auxiliar();
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        Integer tp = usuario == null ? 0 : usuario.getTipoPersona().getIdtipoPersona();
        if (tp == 14 || tp == 1) {
            cita = (CitaPsicologia) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("cita");
            if (cita != null) {
                m = (FacesMessage) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("ms");
                editar = (boolean) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("editar");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("cita");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ms");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("editar");
                initVariables();
            } else {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("ms",
                        new FacesMessage(FacesMessage.SEVERITY_WARN,
                                "Para poder atender a un alumno; primero, el alumno debe solicitar una cita. ",
                                "Esta página sólo es accesible si usted selecciona una solicitud de cita "
                                + "aceptada e indica que va a atender al alumno solicitante."));
                try {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("admCitasPs.intex");
                } catch (IOException ex) {
                    m = new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Para poder atender a un alumno; primero, el alumno debe solicitar una cita. ",
                            "Esta página sólo es accesible si usted selecciona una solicitud de cita "
                            + "aceptada e indica que va a atender al alumno solicitante. "
                            + "Regrese a la administración de citas.");
                    postRender();
                }
            }
        } else {
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_ERROR,
                            "Esa no es una vista que usted tenga permitida. ",
                            "Esta es una vista restringida sólo para pscólogos. Regrese a su perfil."));
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("perfil.intex");
            } catch (IOException ex) {
                m = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Esa no es una vista que usted tenga permitida. ",
                        "Esta es una vista restringida sólo para pscólogos. Regrese a su perfil.");
                postRender();
            }
        }
    }

    private void initVariables() {
        expediente = exFL.find(cita.getCitaPsicologiaPK().getEstudiante());
        consultasAnteriores = expediente != null ? expediente.getConsultaList() : new ArrayList<>();
        expediente = expediente == null ? new ExpedientePS(cita.getCitaPsicologiaPK().getEstudiante()) : expediente;
        consulta = new Consulta(cita.getCitaPsicologiaPK().getEstudiante(),
                cita.getCitaPsicologiaPK().getFechaSolicitada());
        consulta.setConsultaMotivo(cita.getMotivo());
        consulta.setCitaPsicologia(cita);
        consulta.setConsultaExpediente(expediente);
        consulta.setIdPsicologo(usuario.getIdpersona());
    }

    public void postRender() {
        if (m != null) {
            FacesContext.getCurrentInstance().addMessage("form0:msgs", m);
            PrimeFaces.current().ajax().update("form0:msgs");
            m = null;
        }
    }

    public List<Consulta> getConsultasAnteriores() {
        return Collections.unmodifiableList(consultasAnteriores);
    }

    public ExpedientePS getExpediente() {
        return expediente;
    }

    public void setExpediente(ExpedientePS expediente) {
        this.expediente = expediente;
    }

    public Consulta getConsulta() {
        return consulta;
    }

    public void setConsulta(Consulta consulta) {
        this.consulta = consulta;
    }

    public boolean isEditar() {
        return editar;
    }

}
