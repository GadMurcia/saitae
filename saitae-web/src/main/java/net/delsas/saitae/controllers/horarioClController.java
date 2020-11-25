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

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.ax.axHorario;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Persona;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.primefaces.component.datatable.DataTable;
import org.primefaces.component.export.ExportConfiguration;
import org.primefaces.component.export.Exporter;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class horarioClController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    private Persona usuario;
    private List<axHorario> horario;
    private List<Horario> horas;
    private Integer añoSelected;
    private List<Integer> añosDisponibles;
    private boolean estudiate;
    private GradoPK pk;

    @EJB
    private MestroHorarioMateriasFacadeLocal mhmFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private HorarioFacadeLocal hFL;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        estudiate = usuario.getTipoPersona().getIdtipoPersona().equals(8);
        añoSelected = getAño();
        List<GradoPK> grList = mFL.findGradopkByidEstudianteAndAño(añoSelected,
                estudiate ? usuario.getIdpersona() : 0);
        pk = grList.size() > 0 ? grList.get(0) : new GradoPK(0, "", "", 0);
        añosDisponibles = getAñosParaMostrar(estudiate ? 3 : 5);
        horas = hFL.findAll();
    }

    private Integer getAño() {
        return getAñoActual();
    }

    public void onAñoSelect(SelectEvent ev) {
        List<GradoPK> grList = mFL.findGradopkByidEstudianteAndAño(añoSelected,
                estudiate ? usuario.getIdpersona() : 0);
        pk = grList.size() > 0 ? grList.get(0) : new GradoPK(0, "", "", 0);
    }

    public List<axHorario> getHorario() {
        horario = new ArrayList<>();
        horas.forEach((h) -> {
            horario.add(estudiate
                    ? llenar(h, pk, mhmFL)
                    : llenar(añoSelected, h, usuario.getIdpersona(), mhmFL));
        });
        return Collections.unmodifiableList(horario);
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

    public boolean isEstudiate() {
        return estudiate;
    }

    public String getHoraToString(Date d) {
        return new SimpleDateFormat("hh:mm a").format(d);
    }

    public void postProcess(Object document) {
        HSSFWorkbook wb = (HSSFWorkbook) document;
        HSSFSheet h = wb.createSheet("Horario de clases");
        HSSFRow r = h.createRow(1);
        HSSFCell c = r.createCell(0);
        c.setCellValue("Horario de clases de " + getNombreCortoPersona(usuario));
        h.addMergedRegion(new CellRangeAddress(1, 1, 0, 7));
        new XLSModel().copiarDatos(h, wb);
        wb.removeSheetAt(0);
    }

    public Exporter<DataTable> getPdfExporter() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            try {
                PdfPTable t = new PdfPTable(9);
                t.setWidthPercentage(100);
                t.addCell(getTextCell("Horario de clases " + getAñoSelected() + "\n" + getNombreCortoPersona(usuario), 9, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("Hora", 2, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Lunes", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Martes", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Miércoles", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Jueves", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Viernes", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Sábado", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Domingo", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                horario.forEach(h -> {
                    t.addCell(getTextCell(getHoraToString(h.getHoras().getHoraInicio()) + " - " + getHoraToString(h.getHoras().getHoraFin()), 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getLunes() == null ? "Hora Libre" : (h.getLunes().getMateriaNombre() + "\n" + h.getNomL()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getMartes() == null ? "Hora Libre" : (h.getMartes().getMateriaNombre() + "\n" + h.getNomM()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getMiercoles() == null ? "Hora Libre" : (h.getMiercoles().getMateriaNombre() + "\n" + h.getNomX()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getJueves() == null ? "Hora Libre" : (h.getJueves().getMateriaNombre() + "\n" + h.getNomJ()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getViernes() == null ? "Hora Libre" : (h.getViernes().getMateriaNombre() + "\n" + h.getNomV()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getSabado() == null ? "Hora Libre" : (h.getSabado().getMateriaNombre() + "\n" + h.getNomS()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(h.getDomingo() == null ? "Hora Libre" : (h.getDomingo().getMateriaNombre() + "\n" + h.getNomD()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                });

                OutputStream os = getOutputStream(fc, ec, "application/pdf");
                Document pdf = new Document(PageSize.LETTER.rotate());
                PdfWriter writer = PdfWriter.getInstance(pdf, os);
                pdf.open();
                t.setWidthPercentage(100);
                pdf.add(t);
                pdf.setMargins(1, 1, 1, 1);
                pdf.close();
                writer.flush();
            } catch (DocumentException | IOException e) {
                Logger.getLogger(repInvController.class.getName()).log(Level.SEVERE, null, e);
            }
        };
    }

}
