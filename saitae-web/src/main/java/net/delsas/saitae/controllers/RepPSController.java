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
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.CitaPsicologiaFacadeLocal;
import net.delsas.saitae.beans.ConsultaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PeriodoReportePsicologiaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.ReportePsicologiaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.PeriodoReportePsicologia;
import net.delsas.saitae.entities.PeriodoReportePsicologiaPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.ReportePsicologia;
import net.delsas.saitae.entities.ReportePsicologiaPK;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.behavior.ajax.AjaxBehavior;
import org.primefaces.component.datatable.DataTable;
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
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private TipoPersonaFacadeLocal tpFL;

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
    private Date fechaInicio;
    private Date fechaFin;
    private boolean estado, puedeEditar;
    private Persona usuario;
    private String pagina;
    private String motivos = "";
    private FacesContext context;
    private ReportePsicologia repSelected;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), pFL))) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                context.getExternalContext().redirect("perfil.intex");
                return;
            }
        } catch (Exception ex) {
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
        estado = false;
    }

    public void onPeriodoSelect(SelectEvent e) {
        switch (e.getComponent().getId()) {
            case "pern"://no publicos
                reportesNoPublicos = periodoNPSel == null
                        ? new ArrayList<>()
                        : rpsFL.findByPeriodo(
                                periodoNPSel.getPeriodoReportePsicologiaPK().getFechaInicio(),
                                periodoNPSel.getPeriodoReportePsicologiaPK().getFechaFin(),
                                false);
                break;
            case "per"://publicos
                reportes = periodoSel == null
                        ? new ArrayList<>()
                        : rpsFL.findByPeriodo(
                                periodoSel.getPeriodoReportePsicologiaPK().getFechaInicio(),
                                periodoSel.getPeriodoReportePsicologiaPK().getFechaFin(),
                                true);
                break;
            default:
        }
        System.out.println(e.getComponent().getClientId());
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
                if (rpsFL.find(rp.getReportePsicologiaPK()) == null) {
                    rp.setEstudiante1(pFL.find(id).getEstudiante());
                    rp.setPsicologo(usuario);
                    rp.setDiagnostico("");
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
        periodos.clear();
        prpsFL.findPeriodoByAño(año).stream().filter((pe) -> (!periodos.contains(pe))).forEachOrdered((pe) -> {
            periodos.add(pe);
        });
        return periodos;
    }

    public List<ReportePsicologia> getReportes() {
        return reportes;
    }

    public List<ReportePsicologia> getReportesNoPublicos() {
        return reportesNoPublicos;
    }

    public PeriodoReportePsicologia getPeriodoSel() {
        if (periodoSel != null && !periodos.contains(periodoSel)) {
            periodoSel = null;
            DataTable dt = new DataTable();
            dt.setId("per");
            onPeriodoSelect(new SelectEvent(dt,
                    new AjaxBehavior(), periodoSel
            ));
        }
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
        periodosNoPublicos.clear();
        prpsFL.findPeriodosNoPublicosByaño(año).stream().filter((pe) -> (!periodosNoPublicos.contains(pe))).forEachOrdered((pe) -> {
            periodosNoPublicos.add(pe);
        });
        return periodosNoPublicos;
    }

    public PeriodoReportePsicologia getPeriodoNPSel() {
        if (periodoNPSel != null && !periodosNoPublicos.contains(periodoNPSel)) {
            periodoNPSel = null;
            DataTable dt = new DataTable();
            dt.setId("pern");
            onPeriodoSelect(new SelectEvent(dt,
                    new AjaxBehavior(), periodoNPSel
            ));
        }
        return periodoNPSel;
    }

    public void setPeriodoNPSel(PeriodoReportePsicologia periodoNPSel) {
        this.periodoNPSel = periodoNPSel;
    }

    public String getFechasPeriodo(PeriodoReportePsicologia ps) {
        return ps == null ? ""
                : "Desde " + new SimpleDateFormat("dd/MM/yyyy").format(ps.getPeriodoReportePsicologiaPK().getFechaInicio())
                + " hasta " + new SimpleDateFormat("dd/MM/yyyy").format(ps.getPeriodoReportePsicologiaPK().getFechaFin());
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
                PeriodoReportePsicologia pnr = new PeriodoReportePsicologia(
                        new PeriodoReportePsicologiaPK(fechaInicio, fechaFin), false);
                reportesPorRealizar.forEach(rp -> {
                    rp.setReportePublico(estado);
                    try {
                        rpsFL.create(rp);
                    } catch (Exception e) {
                        FacesContext.getCurrentInstance().addMessage("form0",
                                new FacesMessage(FacesMessage.SEVERITY_WARN, "Choque de reportes",
                                        "Los datos ingresados para el estudiante "
                                        + getNombreCortoPersona(rp.getEstudiante1().getPersona())
                                        + " para el periodo comprendido "
                                        + getFechasPeriodo(pnr) + " ya han sido agregados "
                                        + "por otro usuario, por lo que no se incluyen en este reporte."));
                        PrimeFaces.current().ajax().update("form0");
                    }
                });
                if (!reportesPorRealizar.isEmpty()) {
                    if (estado) {
                        notificarReporteCitas(new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "nuevo reporte de citas psicológicas",
                                getNombreCortoPersona(usuario) + " ha publicado un nuevo reporte sobre las citas"
                                + " atendidas en el consultorio de psicología."
                                + " Reporte " + getFechasPeriodo(pnr)),
                                new Integer[]{2, 14});
                    } else {
                        notificarReporteCitas(new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "nuevo reporte de citas psicológicas",
                                getNombreCortoPersona(usuario) + " ha creado un nuevo reporte sobre las citas"
                                + " atendidas en el consultorio de psicología. Este reporte aun no es público."
                                + " Reporte " + getFechasPeriodo(pnr)),
                                new Integer[]{14});
                    }
                }
                reportesPorRealizar.clear();
                fechaFin = null;
                fechaInicio = null;
                break;
            case 1://reportes por publicar
                reportesNoPublicos.forEach(np -> {
                    np.setReportePublico(estado);
                    np.setPsicologo(usuario);
                    rpsFL.edit(np);
                });
                if (!reportesNoPublicos.isEmpty()) {
                    if (estado) {
                        notificarReporteCitas(new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "nuevo reporte de citas psicológicas",
                                getNombreCortoPersona(usuario) + " ha publicado un nuevo reporte sobre las citas"
                                + " atendidas en el consultorio de psicología."
                                + " Reporte " + getFechasPeriodo(periodoNPSel)), new Integer[]{2, 14});
                    } else {
                        notificarReporteCitas(new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "nuevo reporte de citas psicológicas",
                                getNombreCortoPersona(usuario) + " ha modificado un reporte sobre las citas"
                                + " atendidas en el consultorio de psicología. Este reporte aun no es público."
                                + " Reporte " + getFechasPeriodo(periodoNPSel)),
                                new Integer[]{14});
                    }
                }
                reportesNoPublicos.clear();
                periodoNPSel = null;
                break;

            case 2://eliminarReporteNoPublico
                if (periodoNPSel != null) {
                    reportesNoPublicos.forEach(np -> {
                        rpsFL.remove(np);
                    });
                    if (!reportesNoPublicos.isEmpty()) {
                        notificarReporteCitas(new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "Reporte de citas psicológicas eliminado",
                                getNombreCortoPersona(usuario) + " ha eliminado un reporte sobre las citas"
                                + " atendidas en el consultorio de psicología. Este reporte no era público."
                                + " Reporte " + getFechasPeriodo(periodoNPSel)),
                                new Integer[]{14});
                    }
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
                if (!reportes.isEmpty()) {
                    notificarReporteCitas(new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Reporte de citas psicológicas eliminado",
                            getNombreCortoPersona(usuario) + " ha eliminado un reporte sobre las citas"
                            + " atendidas en el consultorio de psicología."
                            + " Reporte " + getFechasPeriodo(periodoSel)),
                            new Integer[]{2, 14});
                }
                reportes.clear();
                periodoSel = null;
                break;
            case 4:
                reportesPorRealizar.clear();
                fechaFin = null;
                fechaInicio = null;
                FacesContext.getCurrentInstance().addMessage("form0",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Edición cancelada", "Los datos no se guardaron"));
                PrimeFaces.current().ajax().update("form0");
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

    public boolean getEsDoctor() {
        return usuario == null ? false
                : (usuario.getTipoPersona().getIdtipoPersona().equals(1) ? true
                : (new Integer(14)).equals(usuario.getTipoPersona().getIdtipoPersona()));
    }

    private void notificarReporteCitas(FacesMessage fm, Integer[] tp) {
        List<Persona> ppn = new ArrayList<>();
        for (Integer t : tp) {
            getPersonasParaNotificar(tpFL.find(t))
                    .stream().filter(p -> !ppn.contains(p))
                    .forEachOrdered(ppn::add);
        }
        persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), "CPsReporte<form", fm),
                ppn,
                notiFL, notificacion);
    }

    public ReportePsicologia getRepSelected() {
        return repSelected;
    }

    public void setRepSelected(ReportePsicologia repSelected) {
        this.repSelected = repSelected;
    }

    public void reporte(Object doc) {
        HSSFWorkbook wb = (HSSFWorkbook) doc;
        wb.removeSheetAt(0);
        HSSFSheet h = wb.createSheet("Reporte área psicológica");
        int tam = h.getColumnWidth(0);

        HSSFRow r = h.createRow(0);
        HSSFCell c = r.createCell(0);
        c.setCellValue("Instituto Nacional Texistepeque");
        c.setCellStyle(getStyle(wb, 16, true, false, true));
        h.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));

        r = h.createRow(1);
        c = r.createCell(0);
        c.setCellValue("Reporte de las atenciones realizadas en el área psicológica");
        c.setCellStyle(getStyle(wb, 14, true, false, true));
        h.addMergedRegion(new CellRangeAddress(1, 1, 0, 2));

        r = h.createRow(3);
        c = r.createCell(0);
        c.setCellValue("Periodo del reporte");
        c.setCellStyle(getStyle(wb, 12, false, false, false));
        h.addMergedRegion(new CellRangeAddress(3, 3, 0, 1));
        c = r.createCell(2);
        c.setCellValue(getFechasPeriodo(periodoSel));
        c.setCellStyle(getStyle(wb, 12, false, false, false));

        r = h.createRow(4);
        c = r.createCell(0);
        c.setCellValue("Fecha de Impresión");
        c.setCellStyle(getStyle(wb, 12, false, false, false));
        h.addMergedRegion(new CellRangeAddress(4, 4, 0, 1));
        c = r.createCell(2);
        c.setCellValue((new SimpleDateFormat("EEEEE  dd/MM/yyyy").format(new Date())).toUpperCase());
        c.setCellStyle(getStyle(wb, 12, false, false, false));

        r = h.createRow(5);
        c = r.createCell(0);
        c.setCellValue("Psicólogo");
        c.setCellStyle(getStyle(wb, 12, false, false, false));
        h.addMergedRegion(new CellRangeAddress(5, 5, 0, 1));
        c = r.createCell(2);
        c.setCellValue(getNombreCompletoPersona(reportes.get(0).getPsicologo()));
        c.setCellStyle(getStyle(wb, 12, false, false, false));

        int nr = 7;
        for (ReportePsicologia rp : reportes) {
            r = h.createRow(nr);
            c = r.createCell(0);
            c.setCellValue(getNombreCompletoPersona(rp.getEstudiante1().getPersona()));
            h.addMergedRegion(new CellRangeAddress(nr, nr, 0, 2));
            c.setCellStyle(getStyle(wb, 13, true, true, false));

            r = h.createRow(nr + 1);
            c = r.createCell(1);
            c.setCellValue("Grado");
            c.setCellStyle(getStyle(wb, 12, true, true, false));
            c = r.createCell(2);
            c.setCellValue(getGradoEstudiante(rp.getEstudiante1()));
            c.setCellStyle(getStyle(wb, 12, false, true, false));

            r = h.createRow(nr + 2);
            c = r.createCell(1);
            c.setCellValue("Citas solicitadas");
            c.setCellStyle(getStyle(wb, 12, true, true, false));
            c = r.createCell(2);
            c.setCellValue(rp.getNCitasSolicitadas());
            c.setCellStyle(getStyle(wb, 12, false, true, false));

            r = h.createRow(nr + 3);
            c = r.createCell(1);
            c.setCellValue("Consultas realizadas");
            c.setCellStyle(getStyle(wb, 12, true, true, false));
            c = r.createCell(2);
            c.setCellValue(rp.getNConsultas());
            c.setCellStyle(getStyle(wb, 12, false, true, false));

            r = h.createRow(nr + 4);
            c = r.createCell(1);
            c.setCellValue("Motivos de las consultas");
            c.setCellStyle(getStyle(wb, 12, true, true, false));
            c = r.createCell(2);
            c.setCellValue(rp.getMotivos());
            c.setCellStyle(getStyle(wb, 12, false, true, false));

            r = h.createRow(nr + 5);
            c = r.createCell(1);
            c.setCellValue("Comentarios del psicólogo");
            c.setCellStyle(getStyle(wb, 12, true, true, false));
            c = r.createCell(2);
            c.setCellValue(rp.getDiagnostico());
            c.setCellStyle(getStyle(wb, 12, false, true, false));

            nr += 6;
        }
        h.setColumnWidth(1, tam * 3);
        h.setColumnWidth(2, tam * 7);
    }

    private HSSFCellStyle getStyle(HSSFWorkbook wb, int tamaño, boolean negrita, boolean bordes, boolean centrado) {
        HSSFCellStyle st = wb.createCellStyle();
        HSSFFont f = wb.createFont();
        f.setFontHeightInPoints((short) tamaño);
        f.setFontName("courier 10 pitch");
        f.setBold(negrita);
        st.setAlignment(centrado ? HorizontalAlignment.CENTER : HorizontalAlignment.LEFT);
        if (bordes) {
            st.setBorderBottom(BorderStyle.THIN);
            st.setBorderLeft(BorderStyle.THIN);
            st.setBorderRight(BorderStyle.THIN);
            st.setBorderTop(BorderStyle.THIN);
        }
        st.setFont(f);
        return st;
    }

    public boolean isPuedeEditar() {
        return puedeEditar;
    }

    public void setPuedeEditar(boolean puedeEditar) {
        this.puedeEditar = puedeEditar;
    }

}
