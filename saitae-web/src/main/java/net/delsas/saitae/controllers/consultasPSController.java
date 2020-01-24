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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.CitaPsicologiaFacadeLocal;
import net.delsas.saitae.beans.ConsultaFacadeLocal;
import net.delsas.saitae.beans.ExpedientePSFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.CitaPsicologia;
import net.delsas.saitae.entities.Consulta;
import net.delsas.saitae.entities.ExpedientePS;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
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
public class consultasPSController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ConsultaFacadeLocal conFL;
    @EJB
    private ExpedientePSFacadeLocal exFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private CitaPsicologiaFacadeLocal cpsFL;
    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private MatriculaFacadeLocal mFL;

    private List<Consulta> consultasAnteriores;

    private FacesMessage m;
    private Auxiliar ax;
    private Persona usuario;
    private CitaPsicologia cita;
    private ExpedientePS expediente;
    private Consulta consulta, selected;
    private boolean editar;
    private boolean renderizar;
    private boolean renderizar2;
    private String nomEs;

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
                renderizar = true;
                renderizar2 = true;
                initVariables();
                notificarInicio();
            } else {
                nomEs = "";
                PrimeFaces.current().executeScript("PF('Dbus').show();");
                PrimeFaces.current().ajax().update("h1");
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
        expediente.setEstudiante(cita.getEstudiante1());
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

    public List<SelectItem> getDepartamentos() {
        return ax.getDepartamentoLista(expediente.getEstudiante().getPersona());
    }

    public List<SelectItem> getMunicipios() {
        return ax.getMunicipioLista(expediente.getEstudiante().getPersona());
    }

    public String getDep() {
        return ax.getDepartamento(expediente.getEstudiante().getPersona());
    }

    public String getMun() {
        return ax.getMunicipio(expediente.getEstudiante().getPersona());
    }

    public void guardarExp() {
        String pv = expediente.getExpedientePsPersonasVivien();
        if (pv != null && pv.split("").length > 0) {
            if (exFL.find(expediente.getIdEstudiante()) != null) {
                exFL.edit(expediente);
            } else {
                exFL.create(expediente);
            }
            m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Modificaciones realizadas",
                    "Los datos del expediene del alumno se han modificado con éxito.");
            postRender();
            PrimeFaces.current().ajax().update("form");
        }
    }

    public Consulta getSelected() {
        return selected;
    }

    public void setSelected(Consulta selected) {
        this.selected = selected;
    }

    public void guardarConsulta() {
        Consulta ctr = conFL.find(consulta.getConsultaPK());
        cpsFL.remove(cita);
        cita.getCitaPsicologiaPK().setFechaSolicitada(new Date());
        cpsFL.create(cita);
        consulta.getConsultaPK().setFechaHoraConsulta(cita.getCitaPsicologiaPK().getFechaSolicitada());
        consulta.setCitaPsicologia(cita);
        if (ctr == null) {
            conFL.create(consulta);
        } else {
            conFL.edit(consulta);
        }
        cita.setConsulta(consulta);
        cita.setEstado("T");
        cpsFL.edit(cita);
        expediente.setConsultaList(expediente.getConsultaList() == null
                ? new ArrayList<>() : expediente.getConsultaList());
        expediente.getConsultaList().add(consulta);
        expediente.setExpedientePSComentario("");
        exFL.edit(expediente);
        Persona p = expediente.getEstudiante().getPersona();
        ax.persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), "admCitasPs<form",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Sesión de consulta terminada",
                                "La sesión de consulta psicológica con "
                                + (p.getPersonaSexo() ? "la" : "el")
                                + " estudiante "
                                + p.getPersonaNombre().split(" ")[0]
                                + " " + p.getPersonaApellido().split(" ")[0] + " ha terminado.")),
                usuario, notiFL, notificacion);
        ax.persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), "citasPSH<form",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Sesión de consulta terminada",
                                "La sesión de consulta con "
                                + (usuario.getPersonaSexo() ? "la psicóloga " : "el psicólogo")
                                + " lic. " + usuario.getPersonaNombre().split(" ")[0]
                                + " " + usuario.getPersonaApellido().split(" ")[0] + " ha terminado.")),
                p, notiFL, notificacion);
        redirigir(new FacesMessage(FacesMessage.SEVERITY_INFO,
                "Fin de la sesión de consulta.",
                "La sesión ha terminado. Todos los datos se han actualizado."));
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> list = pFL.getPersonaByLikeNombreAndType(query, 8);
        list.forEach((p) -> {
            results.add(p.getPersonaNombre() + " " + p.getPersonaApellido() + ", NIE:  " + p.getIdpersona());
        });
        if (results.isEmpty()) {
            results.add("No hay resultados.");
        }
        return results;
    }

    public void soloExpediente() {
        cpsFL.remove(cita);
        renderizar = true;
        renderizar2 = false;
        editar = false;
        PrimeFaces.current().executeScript("PF('Dbus').hide();");
    }

    public void continuar() {
        renderizar2 = true;
        editar = true;
        notificarInicio();
        m = new FacesMessage(FacesMessage.SEVERITY_INFO, "Sesión creada exitosamente",
                "Esta es una sesión en donde el estudiante no ha solicitado previamente su atención. "
                + "El estudiante recibirá una notificación.");
        postRender();
        PrimeFaces.current().executeScript("PF('Dbus').hide();");
    }

    public void onItemSelect(SelectEvent event) {
        String t = (String) event.getObject();
        String tt[] = t.split(", NIE:  ");
        if (tt.length < 2) {
            cancelar();
        } else {
            nomEs = tt[0];
            Persona est = pFL.find(Integer.valueOf(tt[1]));
            cita = new CitaPsicologia(est.getIdpersona(), new Date());
            cita.setEstado("A");
            cita.setFechaSolicitud(cita.getCitaPsicologiaPK().getFechaSolicitada());
            cita.setEstudiante1(est.getEstudiante());
            cpsFL.create(cita);
            editar = false;
            renderizar = true;
            renderizar2 = false;
            initVariables();
            PrimeFaces.current().ajax().update("form");
        }
    }

    public void cancelar() {
        if (cita != null) {
            cpsFL.remove(cita);
        }
        redirigir(new FacesMessage(FacesMessage.SEVERITY_WARN,
                "Saliendo del módulo de consultas.",
                "Como no se seleccionó el expediente de un alumno, no puede continuar viendo el "
                + "módulo de consultas psicológicas. Seleccione un expediente, antes de continuar."));
    }

    private void redirigir(FacesMessage fm) {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("ms", fm);
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect("admCitasPs.intex");
        } catch (IOException ex) {
            m = fm;
            postRender();
        }
    }

    public boolean isRenderizar() {
        return renderizar;
    }

    public boolean isRenderizar2() {
        return renderizar2;
    }

    public boolean isVerBotones() {
        return (cita != null && cita.getCitaPsicologiaPK() != null);
    }

    public String getNomEs() {
        return nomEs;
    }

    public void setNomEs(String nomEs) {
        this.nomEs = nomEs;
    }

    private void notificarInicio() {
        ax.persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), "citasPSH<form",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Sesión de consulta iniciada",
                                "La sesión de consulta con "
                                + (usuario.getPersonaSexo() ? "la psicóloga " : "el psicólogo")
                                + " lic. " + usuario.getPersonaNombre().split(" ")[0]
                                + " " + usuario.getPersonaApellido().split(" ")[0] + " ha iniciado.")),
                cita.getEstudiante1().getPersona(), notiFL, notificacion);
    }

    public String getGrado() {
        int a = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
        int e = expediente == null ? 0 : expediente.getIdEstudiante();
        Matricula ma = mFL.find(new MatriculaPK(e, a));
        GradoPK pk = ma == null ? new GradoPK(0, "", "", 0) : ma.getGrado().getGradoPK();
        String h = (pk.getIdgrado() == 1 ? "Primero" : (pk.getIdgrado() == 2 ? "Segundo" : (pk.getIdgrado() == 3 ? "Tercero" : "")));
        h += " " + (pk.getGradoModalidad().equals("C") ? "Contador" : (pk.getGradoModalidad().equals("S") ? "Secretariado" : (pk.getGradoModalidad().equals("G") ? "General" : "")));
        h += " " + pk.getGradoSeccion();
        return h; 
    }

    public String getDateToString(Date d) {
        return d == null ? "" : new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d);
    }
}
