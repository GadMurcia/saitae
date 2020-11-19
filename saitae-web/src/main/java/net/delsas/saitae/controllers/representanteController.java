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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.primefaces.component.datatable.DataTable;
import org.primefaces.component.export.ExportConfiguration;
import org.primefaces.component.export.Exporter;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
public class representanteController extends Auxiliar implements Serializable {

    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    private List<Grado> grados;
    private GradoPK id;
    private List<Estudiante> representantes;

    @PostConstruct
    public void init() {
        grados = gFL.getPorAñoYActivo(getAñoActual());
        representantes = new ArrayList<>();
        id = grados.isEmpty() ? null : grados.get(0).getGradoPK();
        selectAño(null);
    }

    public void selectAño(SelectEvent event) {
        representantes.clear();
        if (id != null) {
            mFL.findByGradoPK(id).forEach((m) -> {
                representantes.add(m.getEstudiante());
            });
        }
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public List<Estudiante> getRepresentantes() {
        Collections.sort(representantes, (Estudiante m1, Estudiante m2)
                -> String.CASE_INSENSITIVE_ORDER.compare(getNombreCompletoPersona(m1.getEstudianteRepresentante().getPersona()), getNombreCompletoPersona(m2.getEstudianteRepresentante().getPersona())));
        return Collections.unmodifiableList(representantes);
    }

    public GradoPK getId() {
        return id;
    }

    public void setId(GradoPK id) {
        this.id = id;
    }

    public void postProcessXLSp(Object document) {
        HSSFWorkbook wb = (HSSFWorkbook) document;
        wb = new XLSModel().getReporteRepresentantes(wb, mFL.findByGradoPK(id), id);
    }

    public Exporter<DataTable> getPdfExporter() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            try {
                PdfPTable t = new PdfPTable(11);
                t.setWidthPercentage(100);
                t.addCell(getTextCell("Nómina de representantes. \t" + getGradoNombre(id), 9, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getCellWithImagen(fc, "intexM.jpeg", 2, 1, false, 15, PdfPCell.ALIGN_CENTER));

                t.addCell(getTextCell("DUI", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Nombre del Representante", 3, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Nombre del estudiante", 3, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));

                representantes.forEach(r -> {
                    t.addCell(getTextCell(getDui(r.getEstudianteRepresentante().getPersona()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getNombreCompletoPersona(r.getEstudianteRepresentante().getPersona()), 3, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getNombreCompletoPersona(r.getPersona()), 3, 1, false, true, 13, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                });
                OutputStream os = getOutputStream(fc, ec, "application/pdf");
                Document pdf = new Document(PageSize.LEGAL.rotate());
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
