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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.EjemplarFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.EjemplarPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
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
public class repInvController extends Auxiliar implements Serializable {

    private List<TipoRecurso> tipoRecursos;
    private TipoRecurso trSelected;
    private List<Recurso> recursos;
    private List<TipoCargo> tipoCargos;
    private List<Categoria> categorias;
    private List<Ejemplar> ejemplares;
    private FacesContext context;
    private String pagina;
    private Persona usuario;

    @EJB
    private TipoRecursoFacadeLocal trFL;
    @EJB
    private RecursoFacadeLocal rFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private TipoCargoFacadeLocal tcFL;
    @EJB
    private CategoriaFacadeLocal cFL;
    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private EjemplarFacadeLocal eFL;

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
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
                return;
            }
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado",
                            ex.getMessage() == null ? "Error de causa desconocida." : ex.getMessage()));
        }

        tipoCargos = tcFL.findAll();
        categorias = cFL.findAll();
        recursos = new ArrayList<>();
        ejemplares = new ArrayList<>();
    }

    public void onTipoSelected(SelectEvent e) {
        ejemplares.clear();
        recursos = trSelected == null ? new ArrayList<>()
                : rFL.findByTipoRecurso(trSelected.getIdtipoRecurso());
        if (trSelected != null && !trSelected.getIdtipoRecurso().equals(3)) {
            recursos.forEach(r -> {
                r.setEjemplarList(eFL.findEjemplaresByIdRecurso(r.getIdrecurso()));
                r.getEjemplarList().forEach(e0 -> {
                    e0.setRecurso(r);
                });
                ejemplares.addAll(r.getEjemplarList());
            });
        }
    }

    public List<TipoRecurso> getTipoRecursos() {
        tipoRecursos = trFL.findAll();
        return tipoRecursos;
    }

    public void setTipoRecursos(List<TipoRecurso> tipoRecursos) {
        this.tipoRecursos = tipoRecursos;
    }

    public TipoRecurso getTrSelected() {
        return trSelected;
    }

    public void setTrSelected(TipoRecurso trSelected) {
        this.trSelected = trSelected;
    }

    public List<Recurso> getRecursos() {
        return recursos;
    }

    public void setRecursos(List<Recurso> recursos) {
        this.recursos = recursos;
    }

    public String getEditoriales(List<EditorialLibro> es) {
        String g = "";
        if (es != null) {
            for (EditorialLibro e : es) {
                g += (g.isEmpty() ? "" : ", ") + e.getEditorial().getEditorialNombre();
            }
        }
        return g;
    }

    public String getAutores(List<AutorLibro> as) {
        String g = "";
        if (as != null) {
            for (AutorLibro a : as) {
                g += (g.isEmpty() ? "" : ", ") + a.getAutor().getAutorNombre();
            }
        }
        return g;
    }

    public String getCorrelativos(List<Ejemplar> es) {
        String g = "";
        if (es != null) {
            for (Ejemplar e : es) {
                g += (g.isEmpty() ? "" : ", ") + e.getEjemplarPK().getEjemplarCorrelativo();
            }
        }
        return g;
    }

    public Double getTotalGeneral() {
        double t = 0.0;
        t = recursos.stream().map((r) -> (getTotalRecurso(r))).reduce(t, (accumulador, valor) -> accumulador + valor);
        t = Math.round(t * 100);
        t = t / 100;
        return t;
    }

    public Double getTotalRecurso(Recurso r) {
        if (r == null) {
            return 0.0;
        }
        double t = r.getValorUnitario().doubleValue() * r.getEjemplarList().size();
        t = Math.round(t * 100);
        t = t / 100;
        return t;
    }

    public List<TipoCargo> getTipoCargos() {
        return tipoCargos;
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public Recurso getRecursoDelEjemplar(Ejemplar e) {
        return e.getRecurso();
    }

    public boolean isVerInvBiblio() {
        return trSelected != null && trSelected.getIdtipoRecurso().equals(3) && !recursos.isEmpty();
    }

    public boolean isVerInvCRA() {
        return trSelected != null && !trSelected.getIdtipoRecurso().equals(3) && !ejemplares.isEmpty();
    }

    public void reporte(Object doc) {
        HSSFWorkbook wb = new XLSModel().getReporteInventario((HSSFWorkbook) doc, categorias, tipoCargos, trSelected);
        HSSFSheet h = wb.getSheetAt(0);

        if (trSelected.getIdtipoRecurso().equals(3)) {
            int i = h.getLastRowNum();
            i += 3;
            HSSFRow r = h.createRow(i);
            HSSFCell c = r.createCell(0);
            c.setCellValue("Consejo Directivo Escolar");

            r = h.createRow(i + 4);
            c = r.createCell(2);
            c.setCellValue("F.");
            c = r.createCell(3);
            c.setCellValue("F.");
            c = r.createCell(5);
            c.setCellValue("F.");
            c = r.createCell(7);
            c.setCellValue("F.");

            r = h.createRow(i + 6);
            c = r.createCell(2);
            c.setCellValue("Presidente CDE");
            c = r.createCell(3);
            c.setCellValue("Secretario/a CDE");
            c = r.createCell(5);
            c.setCellValue("Encargado/a de compras");
            c = r.createCell(7);
            c.setCellValue("Coordinador de AI");

            h.getRow(i + 6).cellIterator().forEachRemaining((c0) -> {
                c0.getCellStyle().setAlignment(HorizontalAlignment.CENTER);
            });

            h.addMergedRegion(new CellRangeAddress(i, i, 0, trSelected.getIdtipoRecurso().equals(3) ? 12 : 8));
            h.addMergedRegion(new CellRangeAddress(i + 6, i + 6, 3, 4));
            h.addMergedRegion(new CellRangeAddress(i + 6, i + 6, 5, 6));
            h.addMergedRegion(new CellRangeAddress(i + 6, i + 6, 7, 8));

        }
        int g = h.getColumnWidth(0);
        h.setColumnWidth(0, g * 2);
        h.setColumnWidth(1, g * (trSelected.getIdtipoRecurso().equals(3) ? 3 : 4));
        h.setColumnWidth(2, g * 4);
        h.setColumnWidth(3, g * (trSelected.getIdtipoRecurso().equals(3) ? 4 : 2));
        h.setColumnWidth(4, g * 2);
        h.setColumnWidth(5, g * 2);
        h.setColumnWidth(6, g * 2);
        h.setColumnWidth(7, g * 2);
        if (trSelected.getIdtipoRecurso().equals(3)) {
            h.setColumnWidth(8, g * 2);
            h.setColumnWidth(9, g * 2);
        }
        h.setZoom(75, 100);
        h.setVerticallyCenter(true);
    }

    public List<Ejemplar> getEjemplares() {
        return ejemplares;
    }

    public String CodToString(Object i, int a, boolean recurrente) {
        String r[] = i.toString().split("");
        String s = "";
        int y = a;
        for (int q = 0; q < r.length; q++) {
            s += (recurrente
                    ? (q == 0 ? ""
                            : (q % y == 0 ? "-" : ""))
                    : ((s.split("").length == y
                    ? "-" : ""))) + r[q];
            y = recurrente ? (q == 0 ? y : (q % y == 0 ? y + a : y)) : y;
        }
        return s;
    }

    public String ejemplarCod(EjemplarPK pk) {
        return pk == null ? "" : pk.getIdRecurso() + "" + pk.getEjemplarCorrelativo() + "";
    }

    public Exporter<DataTable> getPdfExporterCra() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            try {
                PdfPTable t = new PdfPTable(10);

                t.addCell(getCellWithImagen(fc, "mined.png", 2, 1, false, 8, PdfPCell.ALIGN_CENTER));
                t.addCell(getTextCell("Inventario de Equipo \n" + ((trSelected == null) ? "" : trSelected.getTipoRecursoNombre()), 6, 1, false, false, 24, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getCellWithImagen(fc, "intexM.jpeg", 2, 1, false, 25, PdfPCell.ALIGN_CENTER));

                t.addCell(getTextCell("Nombre del Centro Educativo:", 3, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Instituto Nacional \"Texistepeque\"", 4, 1, false, false, 12, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Dirección Postal: Colonia Mónchez y Herrera frente a Carretera Internacional CA-12N, Km. 83 12.", 3, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_JUSTIFIED, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("TELEFAX:", 1, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("2470-0219", 2, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Municipio: Texistepeque", 2, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Departamento: Santa Ana", 2, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Código de la Institución: 14753", 3, 2, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("FECHA: ", 1, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Texistepeque, " + new SimpleDateFormat("dd/MM/YYYY").format(new Date()), 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Distrito Educativo: 02-19", 2, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("\n\n", 10, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("Código", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Nombre", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Marca", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Serie", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Año", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Estado Físico", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Valor unitario (US$)", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Tipo de Valor", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                ejemplares.stream().map((e) -> {
                    t.addCell(getTextCell(e.getEjemplarPK().getIdRecurso() + "-" + e.getEjemplarPK().getEjemplarCorrelativo(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).map((e) -> {
                    t.addCell(getTextCell(e.getRecurso().getNombre(), 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).map((e) -> {
                    t.addCell(getTextCell(e.getEjemplarMarca(), 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).map((e) -> {
                    t.addCell(getTextCell(e.getEjemplarSerie(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).map((e) -> {
                    t.addCell(getTextCell(e.getEjemplarAnioDeIngreso() + "", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).map((e) -> {
                    t.addCell(getTextCell((e.getRecurso().getEstadoFisico().equals("B") ? "BUENO" : (e.getRecurso().getEstadoFisico().equals("R") ? "REGULAR" : "")), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).map((e) -> {
                    t.addCell(getTextCell(e.getRecurso().getValorUnitario() + "", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    return e;
                }).forEachOrdered((e) -> {
                    t.addCell(getTextCell(e.getRecurso().getTipoValor(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
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

    public Exporter<DataTable> getPdfExporterBib() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            Document pdf;
            PdfWriter writer;
            try {
                PdfPTable t = new PdfPTable(16);

                t.addCell(getCellWithImagen(fc, "mined.png", 2, 1, false, 8, PdfPCell.ALIGN_CENTER));
                t.addCell(getTextCell("Inventario de Equipo \n" + ((trSelected == null) ? "" : trSelected.getTipoRecursoNombre()), 12, 1, false, false, 24, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getCellWithImagen(fc, "intexM.jpeg", 2, 1, false, 25, PdfPCell.ALIGN_CENTER));

                t.addCell(getTextCell("Nombre del Centro Educativo:", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Instituto Nacional \"Texistepeque\"", 7, 1, false, false, 12, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Dirección Postal: Colonia Mónchez y Herrera frente a Carretera Internacional CA-12N, Km. 83 12.", 5, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("Telefax:", 1, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("2470-0219", 2, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Municipio: Texistepeque", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Departamento: Santa Ana", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("", 5, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("FECHA: ", 1, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Texistepeque, " + new SimpleDateFormat("dd/MM/YYYY").format(new Date()), 5, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Distrito Educativo: 02-19", 5, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Código de la Institución: 14753", 5, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("", 11, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("TIPOS DE CARGOS", 5, 1, false, false, 12, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                tipoCargos.forEach(tc -> {
                    t.addCell(getTextCell("", 11, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(tc.getNombre(), 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("1-" + tc.getIdtipoCargo(), 1, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                });

                t.addCell(getTextCell("\n\n", 16, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("Cargo", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Código", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Correlativos", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Nombre", 3, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Autor", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Editorial", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("País", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Estado Físico", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("N° de ejemplares", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Valor unitario (USD)", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Valor Total (USD)", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Tipo de Valor", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                recursos.forEach(r -> {
                    t.addCell(getTextCell("1-" + r.getTipoCargo().getIdtipoCargo(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("" + r.getIdrecurso(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getCorrelativos(r.getEjemplarList()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(r.getNombre(), 3, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getAutores(r.getAutorLibroList()), 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getEditoriales(r.getEditorialLibroList()), 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(r.getPais().getPaisNombre(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(r.getEstadoFisico().equals("B") ? "Bueno" : (r.getEstadoFisico().equals("R") ? "Regular" : ""), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("" + r.getEjemplarList().size(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("" + r.getValorUnitario(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("" + (r.getEjemplarList().size() * r.getValorUnitario()), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(r.getTipoValor(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                });
                t.addCell(getTextCell("VALOR TOTAL DEL INVENTARIO", 14, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_RIGHT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("USD $" + getTotalGeneral(), 2, 1, false, true, 12, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("\n\n\n\n", 16, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Consejo Directivo Escolar", 16, 1, false, false, 12, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("\n\n\n\n", 16, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("\n\n\n\n", 16, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("Presidente CDE", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Secretaria CDE", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Encargada/o de compras", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Coordinador AI", 4, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                OutputStream os = getOutputStream(fc, ec, "application/pdf");
                pdf = new Document(PageSize.LEGAL.rotate());
                writer = PdfWriter.getInstance(pdf, os);
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
