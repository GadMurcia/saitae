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
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.Meses;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
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
@ViewScoped
public class nominaAController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<Estudiante> nomina;
    private Estudiante Selected;
    @EJB
    private GradoFacadeLocal gradoFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    private GradoPK grado;
    private Matricula mat;

    @PostConstruct
    public void init() {
        grado = new GradoPK(0, "", "", 0);
        nomina = new ArrayList<>();
    }

    public List<Grado> getGrados() {
        return gradoFL.getPorAñoYActivo(getAñoActual());
    }

    public void onSelectItem(SelectEvent event) {
        nomina = new ArrayList<>();
        if (grado != null) {
            mFL.findMatriculaByGrado(grado).forEach((m) -> {
                nomina.add(m.getEstudiante());
            });
        }
    }

    public List<Estudiante> getNomina() {
        Collections.sort(nomina, (Estudiante m1, Estudiante m2)
                -> String.CASE_INSENSITIVE_ORDER.compare(getNombreCompletoPersona(m1.getPersona()), getNombreCompletoPersona(m2.getPersona())));
        return Collections.unmodifiableList(nomina);
    }

    public GradoPK getPK() {
        return grado;
    }

    public void setPK(GradoPK pk) {
        this.grado = pk;
    }

    public Estudiante getSelected() {
        return Selected;
    }

    public void setSelected(Estudiante Selected) {
        this.Selected = Selected;
    }

    public void onSelect(AjaxBehaviorEvent e) {
        mat = mFL.find(new MatriculaPK(Selected.getIdestudiante(), getAñoActual()));
    }

    public Matricula getMat() {
        return mat;
    }

    public void setMat(Matricula mat) {
        this.mat = mat;
    }

    public void postProcesoXLS(Object doc) {
        HSSFWorkbook wb = (HSSFWorkbook) doc;
        wb = new XLSModel().getReporteNominaAlumnos(wb, grado);

    }

    public Exporter<DataTable> getPdfExporter() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            try {
                PdfPTable t = new PdfPTable(42);
                t.setWidthPercentage(100);
                t.addCell(getTextCell("Nómina de alumnos. \t" + getGradoNombre(grado), 40, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getCellWithImagen(fc, "intexM.jpeg", 2, 1, false, 15, PdfPCell.ALIGN_CENTER));

                t.addCell(getTextCell(
                        Meses.getNombreByNumero(Integer.valueOf(new SimpleDateFormat("MM").format(new Date())))
                        + " " + new SimpleDateFormat("YYYY").format(new Date()),
                         42, 1, false, false, 13, Font.BOLD, PdfPCell.ALIGN_RIGHT, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("NIE", 5, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Nombre del estudiante", 15, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                for (int i = 0; i < 22; i++) {
                    t.addCell(getTextCell("", 1, 1, false, true, 13, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                }

                nomina.forEach(n -> {
                    t.addCell(getTextCell(n.getIdestudiante().toString().substring(1), 5, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getNombreCompletoPersona(n.getPersona()), 15, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    for (int i = 0; i < 22; i++) {
                        t.addCell(getTextCell("", 1, 1, false, true, 13, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    }
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
