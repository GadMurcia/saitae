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
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.CitaPsicologiaFacadeLocal;
import net.delsas.saitae.beans.ConsultaFacadeLocal;
import net.delsas.saitae.beans.PeriodoReportePsicologiaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.ReportePsicologiaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.PeriodoReportePsicologia;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.ReportePsicologia;
import net.delsas.saitae.entities.ReportePsicologiaPK;
import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class RepPSController extends Auxiliar implements Serializable {

    //beans
    @EJB
    private ReportePsicologiaFacadeLocal rpsFL;
    @EJB
    private PeriodoReportePsicologiaFacadeLocal prpsFL;
    @EJB
    private ConsultaFacadeLocal cFL;
    @EJB
    private CitaPsicologiaFacadeLocal cpsFL;
    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;

    //listas
    private List<PeriodoReportePsicologia> periodos;
    private List<PeriodoReportePsicologia> periodosNoPublicos;
    private List<ReportePsicologia> reportes;
    private List<ReportePsicologia> reportesNoPublicos;
    private List<ReportePsicologia> reportesPorRealizar;

    //variables
    private Integer año;
    private PeriodoReportePsicologia periodoSel;
    private PeriodoReportePsicologia periodoNPSel;
    private ReportePsicologia reporteSel;
    private Date fechaInicio;
    private Date fechaFin;
    private boolean estado;
    private Persona usuario;
    private String pagina;
    private String motivos = "";
    private FacesContext context;

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
                return;
            }
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado",
                            ex.getMessage() == null ? "Error de causa desconocida." : ex.getMessage()));
        }
        año = new Auxiliar().getAñoActual();
        periodos = new ArrayList<>();
        periodosNoPublicos = new ArrayList<>();
        reportes = new ArrayList<>();
        reportesNoPublicos = new ArrayList<>();
        reportesPorRealizar = new ArrayList<>();
//        fechaInicio = new Date();
//        fechaFin = new Date();
        estado = false;
    }

    public void onPeriodoSelect(SelectEvent e) {
        switch (e.getComponent().getId()) {
            case "pern"://no publicos
                reportesNoPublicos = periodoNPSel == null
                        ? new ArrayList<>()
                        : rpsFL.findByPeriodo(periodoNPSel.getFechaInicio(), periodoNPSel.getFechaFin(), false);
                estado = false;
                break;
            case "per"://publicos
                reportes = periodoSel == null
                        ? new ArrayList<>()
                        : rpsFL.findByPeriodo(periodoSel.getFechaInicio(), periodoSel.getFechaInicio(), true);
                break;
            default:
                System.out.println(e.getComponent().getClientId());
                reportes.clear();
                reportesNoPublicos.clear();
        }
    }

    public void onPeriodoNSelect(AjaxBehaviorEvent e) {
        if (fechaInicio != null && fechaFin != null && !fechaFin.before(fechaInicio) && !fechaInicio.after(fechaFin)) {
            reportesPorRealizar.clear();
            cFL.findIdEstudianteByPeriodo(fechaInicio, fechaFin).forEach(id -> {
                motivos = "";
                cFL.findMotivosByConsulta(fechaInicio, fechaFin, id).forEach(m -> {
                    motivos += "* " + m + ".\n";
                });
                ReportePsicologia rp = new ReportePsicologia(new ReportePsicologiaPK(fechaInicio, fechaFin, id),
                        cpsFL.countConsultadas(fechaInicio, fechaFin, id),
                        cpsFL.countSolicitadas(fechaInicio, fechaFin, id),
                        motivos);
                rp.setEstudiante1(pFL.find(id).getEstudiante());
                rp.setPsicologo(usuario);
                if (rpsFL.find(rp.getReportePsicologiaPK()) == null) {
                    reportesPorRealizar.add(rp);
                }
            });
            motivos = "";
        } else {
            FacesContext.getCurrentInstance().addMessage("form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Fechas no válidas",
                            "Debe asegurarse de seleccionar una fecha y que la inicial "
                            + "no sea porterior a la final ni que ésta sea anterior a la inicial."));
        }
        PrimeFaces.current().ajax().update("form0:msgs");
    }

    public List<PeriodoReportePsicologia> getPeriodos() {
        periodos = prpsFL.findPeriodoByAño(año);
        return periodos;
    }

    public List<ReportePsicologia> getReportes() {
//        reportes = periodoSel == null
//                ? new ArrayList<>()
//                : rpsFL.findByPeriodo(periodoSel.getFechaInicio(), periodoSel.getFechaInicio(), true);
        return reportes;
    }

    public List<ReportePsicologia> getReportesNoPublicos() {
//        reportesNoPublicos = periodoNPSel == null
//                ? new ArrayList<>()
//                : rpsFL.findByPeriodo(periodoNPSel.getFechaInicio(), periodoNPSel.getFechaInicio(), false);
        return reportesNoPublicos;
    }

    public PeriodoReportePsicologia getPeriodoSel() {
        return periodoSel;
    }

    public void setPeriodoSel(PeriodoReportePsicologia periodoSel) {
        this.periodoSel = periodoSel;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public List<PeriodoReportePsicologia> getPeriodosNoPublicos() {
//        periodosNoPublicos = prpsFL.findPeriodosNoPublicosByaño(año);
        return periodosNoPublicos;
    }

    public PeriodoReportePsicologia getPeriodoNPSel() {
        return periodoNPSel;
    }

    public void setPeriodoNPSel(PeriodoReportePsicologia periodoNPSel) {
        this.periodoNPSel = periodoNPSel;
    }

    public String getFechasPeriodo(PeriodoReportePsicologia ps) {
        return ps == null ? ""
                : "Desde " + new SimpleDateFormat("dd/MM/yyyy").format(ps.getFechaInicio())
                + " hasta " + new SimpleDateFormat("dd/MM/yyyy").format(ps.getFechaFin());
    }

    public ReportePsicologia getReporteSel() {
        return reporteSel;
    }

    public void setReporteSel(ReportePsicologia reporteSel) {
        this.reporteSel = reporteSel;
    }

    public String getGradoEstudiante(Estudiante e) {
        String g = "";
        if (e != null && !e.getMatriculaList().isEmpty()) {
            g = getGradoNombre(e.getMatriculaList().get(e.getMatriculaList().size() - 1).getGrado().getGradoPK());
        }
        return g;
    }

    public void guardar(int i) {
        switch (i) {
            case 0: //crear reportes
                reportesPorRealizar.forEach(rp -> {
                    rp.setReportePublico(estado);
                    rpsFL.create(rp);
                });
                reportesPorRealizar.clear();
                fechaFin = null;
                fechaInicio = null;
                break;
            case 1://reportes por publicar
                reportesNoPublicos.forEach(np -> {
                    np.setReportePublico(estado);
                    rpsFL.edit(np);
                });
                reportesNoPublicos.clear();
                periodoNPSel = null;
                break;
            case 2://eliminarReporteNoPublico
                if (periodoNPSel != null) {
                    reportesNoPublicos.forEach(np -> {
                        rpsFL.remove(np);
                    });
                }
                reportesNoPublicos.clear();
                periodoNPSel = null;
                break;
            case 3://eliminarReportePublico
                if (periodoSel != null) {
                    reportes.forEach(rp -> {
                        rpsFL.remove(rp);
                    });
                }
                reportes.clear();
                periodoSel = null;
                break;
            default: //sin acción
        }
        estado = false;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public List<ReportePsicologia> getReportesPorRealizar() {
        return reportesPorRealizar;
    }
}
