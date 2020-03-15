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
package net.delsas.saitae.ax;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 *
 * @author delsas
 */
public class XLSModel {

    private final Auxiliar ax = new Auxiliar();

    public XLSModel() {
    }

    public HSSFWorkbook getReporteMAtricula(HSSFWorkbook doc, List<ReporteMatricula> datos, String ruta) {
        doc.removeSheetAt(0);
        HSSFSheet hoja = doc.createSheet("Reporte de matricula");
        Integer[] vals;

        HSSFCellStyle st = doc.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
        st.setVerticalAlignment(VerticalAlignment.CENTER);
        st.setWrapText(true);
        Font f = doc.createFont();
        f.setBold(true);
        f.setFontName("arial");
        f.setFontHeightInPoints((short) 14);
        st.setFont(f);

        HSSFRow r = hoja.createRow(1);
        HSSFCell cel = r.createCell(0);
        cel.setCellValue("Instituto Nacional 'Texistepeque'");
        cel.setCellStyle(st);

        r = hoja.createRow(2);
        cel = r.createCell(0);
        cel.setCellValue("Ministerio de educación");
        cel.setCellStyle(st);
        cel = r.createCell(4);
        cel.setCellValue("Año: " + new SimpleDateFormat("yyyy").format(new Date()));
        cel.setCellStyle(st);
        cel = r.createCell(9);
        cel.setCellValue("Mes: " + new SimpleDateFormat("MMMMM").format(new Date()));
        cel.setCellStyle(st);

        r = hoja.createRow(3);
        cel = r.createCell(0);
        cel.setCellValue("Dirección departamental de Santa Ana");
        cel.setCellStyle(st);
        cel = r.createCell(4);
        cel.setCellValue("Código de infraestructura: 14753");
        cel.setCellStyle(st);

        r = hoja.createRow(4);
        ax.agregarImagenAHojaExcel(doc, hoja, 4, 1, 0, 4, ruta + "mined.png");
        ax.agregarImagenAHojaExcel(doc, hoja, 4, 2, 18, 4, ruta + "intexM.jpeg");

        cel = r.createCell(1);
        cel.setCellValue("ESTADÍSTICA INSTITUCIONAL");
        cel.setCellStyle(st);

        st = doc.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
        st.setWrapText(true);
        st.setVerticalAlignment(VerticalAlignment.CENTER);
        f = doc.createFont();
        f.setBold(true);
        f.setFontName("arial");
        f.setFontHeightInPoints((short) 12);
        st.setBorderBottom(BorderStyle.MEDIUM);
        st.setBorderTop(BorderStyle.MEDIUM);
        st.setBorderLeft(BorderStyle.MEDIUM);
        st.setBorderRight(BorderStyle.MEDIUM);
        st.setFont(f);

        r = hoja.createRow(9);
        cel = r.createCell(0);
        cel.setCellValue("Año y número de secciones");
        cel.setCellStyle(st);
        cel = r.createCell(4);
        cel.setCellValue("Matrícula de alumnos/as");
        cel.setCellStyle(st);
        cel = r.createCell(8);
        cel.setCellValue("Asistencia media");
        cel.setCellStyle(st);
        cel = r.createCell(9);
        cel.setCellValue("Retirados");
        cel.setCellStyle(st);
        cel = r.createCell(11);
        cel.setCellValue("Sobre edad");
        cel.setCellStyle(st);
        cel = r.createCell(13);
        cel.setCellValue("Repitencia");
        cel.setCellStyle(st);
        cel = r.createCell(15);
        cel.setCellValue("Reprobados");
        cel.setCellStyle(st);
        cel = r.createCell(17);
        cel.setCellValue("Asistencia media Actual");
        cel.setCellStyle(st);
        cel = r.createCell(19);
        cel.setCellValue("Total");
        cel.setCellStyle(st);

        r = hoja.createRow(10);
        cel = r.createCell(0);
        cel.setCellValue("Modalidad de bachillerato");
        cel.setCellStyle(st);
        cel = r.createCell(1);
        cel.setCellValue("Secciones por turno");
        cel.setCellStyle(st);
        cel = r.createCell(4);
        cel.setCellValue("Mañana");
        cel.setCellStyle(st);
        cel = r.createCell(6);
        cel.setCellValue("Tarde");
        cel.setCellStyle(st);

        r = hoja.createRow(11);
        cel = r.createCell(1);
        cel.setCellValue("Mañana");
        cel.setCellStyle(st);
        cel = r.createCell(2);
        cel.setCellValue("Tarde");
        cel.setCellStyle(st);
        cel = r.createCell(3);
        cel.setCellValue("Total");
        cel.setCellStyle(st);
        cel = r.createCell(4);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(5);
        cel.setCellValue("F");
        cel.setCellStyle(st);
        cel = r.createCell(6);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(7);
        cel.setCellValue("F");
        cel.setCellStyle(st);
        cel = r.createCell(9);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(10);
        cel.setCellValue("F");
        cel.setCellStyle(st);
        cel = r.createCell(11);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(12);
        cel.setCellValue("F");
        cel.setCellStyle(st);
        cel = r.createCell(13);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(14);
        cel.setCellValue("F");
        cel.setCellStyle(st);
        cel = r.createCell(15);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(16);
        cel.setCellValue("F");
        cel.setCellStyle(st);
        cel = r.createCell(17);
        cel.setCellValue("M");
        cel.setCellStyle(st);
        cel = r.createCell(18);
        cel.setCellValue("F");
        cel.setCellStyle(st);

        hoja.addMergedRegion(new CellRangeAddress(1, 1, 0, 19));
        hoja.addMergedRegion(new CellRangeAddress(2, 2, 0, 3));
        hoja.addMergedRegion(new CellRangeAddress(2, 2, 4, 8));
        hoja.addMergedRegion(new CellRangeAddress(2, 2, 9, 14));
        hoja.addMergedRegion(new CellRangeAddress(3, 3, 0, 3));
        hoja.addMergedRegion(new CellRangeAddress(3, 3, 4, 16));
        hoja.addMergedRegion(new CellRangeAddress(4, 8, 1, 16));
        hoja.addMergedRegion(new CellRangeAddress(9, 9, 0, 3));
        hoja.addMergedRegion(new CellRangeAddress(9, 9, 4, 7));
        hoja.addMergedRegion(new CellRangeAddress(9, 11, 8, 8));
        hoja.addMergedRegion(new CellRangeAddress(9, 10, 9, 10));
        hoja.addMergedRegion(new CellRangeAddress(9, 10, 11, 12));
        hoja.addMergedRegion(new CellRangeAddress(9, 10, 13, 14));
        hoja.addMergedRegion(new CellRangeAddress(9, 10, 15, 16));
        hoja.addMergedRegion(new CellRangeAddress(9, 10, 17, 18));
        hoja.addMergedRegion(new CellRangeAddress(9, 11, 19, 19));
        hoja.addMergedRegion(new CellRangeAddress(10, 10, 1, 3));
        hoja.addMergedRegion(new CellRangeAddress(10, 10, 4, 5));
        hoja.addMergedRegion(new CellRangeAddress(10, 10, 6, 7));
        hoja.addMergedRegion(new CellRangeAddress(10, 11, 0, 0));

        hoja = doc.getSheetAt(0);
        HSSFCellStyle st0 = doc.createCellStyle();
        st0.setAlignment(HorizontalAlignment.LEFT);
        st0.setVerticalAlignment(VerticalAlignment.CENTER);
        st0.setWrapText(true);
        HSSFFont f0 = doc.createFont();
        f0.setBold(true);
        f0.setFontName("arial");
        f0.setFontHeightInPoints((short) 13);
        st0.setBorderBottom(BorderStyle.MEDIUM);
        st0.setBorderTop(BorderStyle.MEDIUM);
        st0.setBorderLeft(BorderStyle.MEDIUM);
        st0.setBorderRight(BorderStyle.MEDIUM);
        st0.setFont(f0);
        int nr = hoja.getLastRowNum();
        for (ReporteMatricula rm : datos) {
            nr++;
            r = hoja.createRow(nr);
            HSSFCell ca = r.createCell(0);

            st = doc.createCellStyle();
            st.setAlignment(HorizontalAlignment.LEFT);
            st.setVerticalAlignment(VerticalAlignment.CENTER);
            st.setWrapText(true);
            st.setBorderBottom(BorderStyle.MEDIUM);
            st.setBorderTop(BorderStyle.MEDIUM);
            st.setBorderLeft(BorderStyle.MEDIUM);
            st.setBorderRight(BorderStyle.MEDIUM);

            f = doc.createFont();
            f.setBold(true);
            f.setFontHeightInPoints((short) 13);
            f.setFontName("arial");

            st.setFont(f);
            ca.setCellValue(ax.getModalidadNombre(rm.getModalidad()));
            ca.setCellStyle(st);
            hoja.addMergedRegion(new CellRangeAddress(nr, nr, 0, 19));

            for (MatriculaSeccion ms : rm.getMats()) {
                st = doc.createCellStyle();
                st.setAlignment(HorizontalAlignment.CENTER);
                st.setVerticalAlignment(VerticalAlignment.CENTER);
                st.setWrapText(true);
                st.setBorderBottom(BorderStyle.MEDIUM);
                st.setBorderTop(BorderStyle.MEDIUM);
                st.setBorderLeft(BorderStyle.MEDIUM);
                st.setBorderRight(BorderStyle.MEDIUM);
                nr++;
                r = hoja.createRow(nr);
                HSSFCell c0 = r.createCell(0);
                c0.setCellValue(ax.getGradoNombre(ms.getPk()));
                c0.setCellStyle(st);
                c0 = r.createCell(1);
                c0.setCellValue(1);
                c0.setCellStyle(st);
                c0 = r.createCell(2);
                c0.setCellValue(1);
                c0.setCellStyle(st);
                c0 = r.createCell(3);
                c0.setCellValue(1);
                c0.setCellStyle(st);
                c0 = r.createCell(4);
                c0.setCellValue(ms.getMatriculaM());
                c0.setCellStyle(st);
                c0 = r.createCell(5);
                c0.setCellValue(ms.getMatriculaF());
                c0.setCellStyle(st);
                c0 = r.createCell(6);
                c0.setCellValue(ms.getMatriculaM());
                c0.setCellStyle(st);
                c0 = r.createCell(7);
                c0.setCellValue(ms.getMatriculaF());
                c0.setCellStyle(st);
                c0 = r.createCell(8);
                c0.setCellFormula(String.format("E%d+F%d", nr + 1, nr + 1));
                c0.setCellStyle(st);
                c0 = r.createCell(9);
                c0.setCellValue(ms.getRetiradosM());
                c0.setCellStyle(st);
                c0 = r.createCell(10);
                c0.setCellValue(ms.getRetiradosF());
                c0.setCellStyle(st);
                c0 = r.createCell(11);
                c0.setCellValue(ms.getSobreEdadM());
                c0.setCellStyle(st);
                c0 = r.createCell(12);
                c0.setCellValue(ms.getSobreEdadF());
                c0.setCellStyle(st);
                c0 = r.createCell(13);
                c0.setCellValue(ms.getRepitenciaM());
                c0.setCellStyle(st);
                c0 = r.createCell(14);
                c0.setCellValue(ms.getRepitenciaF());
                c0.setCellStyle(st);
                c0 = r.createCell(15);
                c0.setCellValue(0);
                c0.setCellStyle(st);
                c0 = r.createCell(16);
                c0.setCellValue(0);
                c0.setCellStyle(st);
                c0 = r.createCell(17);
                c0.setCellFormula(String.format("G%d-J%d-P%d", nr + 1, nr + 1, nr + 1));
                c0.setCellStyle(st);
                c0 = r.createCell(18);
                c0.setCellFormula(String.format("H%d-K%d-Q%d", nr + 1, nr + 1, nr + 1));
                c0.setCellStyle(st);
                c0 = r.createCell(19);
                c0.setCellFormula(String.format("R%d+S%d", nr + 1, nr + 1));
                c0.setCellStyle(st);
            }
            Integer[] vals0 = new Integer[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            total(vals0, rm.getMats());
            nr++;
            r = hoja.createRow(nr);
            totalLinea(r, "Subtotal", st0, vals0);
        }

        vals = new Integer[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        datos.forEach((rm) -> {
            total(vals, rm.getMats());
        });

        r = hoja.createRow(hoja.getLastRowNum() + 1);
        totalLinea(r, "Total General Institucional", st0, vals);

        hoja.autoSizeColumn(0, true);
        hoja.autoSizeColumn(8, true);
        hoja.setZoom(80);
        return doc;
    }

    public void total(Integer[] vals, List<MatriculaSeccion> rm) {
        rm.stream().forEachOrdered((ms) -> {
            vals[0] += 0;
            vals[1] += 1;
            vals[2] += 1;
            vals[3] += 1;
            vals[4] += ms.getMatriculaM();
            vals[5] += ms.getMatriculaF();
            vals[6] += ms.getMatriculaM();
            vals[7] += ms.getMatriculaF();
            vals[8] += ms.getMatriculaF() + ms.getMatriculaM();
            vals[9] += ms.getRetiradosM();
            vals[10] += ms.getRetiradosF();
            vals[11] += ms.getSobreEdadM();
            vals[12] += ms.getSobreEdadF();
            vals[13] += ms.getRepitenciaM();
            vals[14] += ms.getRepitenciaF();
            vals[15] += 0;
            vals[16] += 0;
            vals[17] += ms.getMatriculaM() - ms.getRetiradosM();
            vals[18] += ms.getMatriculaF() - ms.getRetiradosF();
            vals[19] += (ms.getMatriculaM() + ms.getMatriculaF()) - (ms.getRetiradosM() + ms.getRetiradosF());
        });
    }

    private void totalLinea(HSSFRow r, String titulo, HSSFCellStyle st, Integer[] vals) {
        HSSFCell cel = r.createCell(0);
        cel.setCellValue(titulo);
        cel.setCellStyle(st);
        cel = r.createCell(1);
        cel.setCellValue(vals[1]);
        cel.setCellStyle(st);
        cel = r.createCell(2);
        cel.setCellValue(vals[2]);
        cel.setCellStyle(st);
        cel = r.createCell(3);
        cel.setCellValue(vals[3]);
        cel.setCellStyle(st);
        cel = r.createCell(4);
        cel.setCellValue(vals[4]);
        cel.setCellStyle(st);
        cel = r.createCell(5);
        cel.setCellValue(vals[5]);
        cel.setCellStyle(st);
        cel = r.createCell(6);
        cel.setCellValue(vals[6]);
        cel.setCellStyle(st);
        cel = r.createCell(7);
        cel.setCellValue(vals[7]);
        cel.setCellStyle(st);
        cel = r.createCell(8);
        cel.setCellValue(vals[8]);
        cel.setCellStyle(st);
        cel = r.createCell(9);
        cel.setCellValue(vals[9]);
        cel.setCellStyle(st);
        cel = r.createCell(10);
        cel.setCellValue(vals[10]);
        cel.setCellStyle(st);
        cel = r.createCell(11);
        cel.setCellValue(vals[11]);
        cel.setCellStyle(st);
        cel = r.createCell(12);
        cel.setCellValue(vals[12]);
        cel.setCellStyle(st);
        cel = r.createCell(13);
        cel.setCellValue(vals[13]);
        cel.setCellStyle(st);
        cel = r.createCell(14);
        cel.setCellValue(vals[14]);
        cel.setCellStyle(st);
        cel = r.createCell(15);
        cel.setCellValue(vals[15]);
        cel.setCellStyle(st);
        cel = r.createCell(16);
        cel.setCellValue(vals[16]);
        cel.setCellStyle(st);
        cel = r.createCell(17);
        cel.setCellValue(vals[17]);
        cel.setCellStyle(st);
        cel = r.createCell(18);
        cel.setCellValue(vals[18]);
        cel.setCellStyle(st);
        cel = r.createCell(19);
        cel.setCellValue(vals[19]);
        cel.setCellStyle(st);
    }

    public HSSFWorkbook getReporteRepresentantes(HSSFWorkbook wb, List<Matricula> datos, GradoPK id) {
        wb.removeSheetAt(0);
        HSSFSheet h1 = wb.createSheet(ax.getGradoNombre(id));

        HSSFCellStyle st = wb.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
        st.setVerticalAlignment(VerticalAlignment.CENTER);
        st.setWrapText(true);
        Font f = wb.createFont();
        f.setBold(true);
        f.setFontName("arial");
        f.setFontHeightInPoints((short) 16);
        st.setFont(f);

        HSSFRow r = h1.createRow(2);
        HSSFCell c = r.createCell(0);
        c.setCellValue("Nómina de Representantes de " + ax.getGradoNombre(id));
        c.setCellStyle(st);
        h1.addMergedRegion(new CellRangeAddress(2, 3, 0, 3));

        st = wb.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
        st.setVerticalAlignment(VerticalAlignment.CENTER);
        st.setBorderTop(BorderStyle.MEDIUM);
        st.setBorderBottom(BorderStyle.MEDIUM);
        st.setBorderLeft(BorderStyle.MEDIUM);
        st.setBorderRight(BorderStyle.MEDIUM);
        st.setWrapText(true);
        f = wb.createFont();
        f.setBold(true);
        f.setFontName("arial");
        f.setFontHeightInPoints((short) 14);
        st.setFont(f);

        r = h1.createRow(4);
        c = r.createCell(0);
        c.setCellValue("DUI");
        c.setCellStyle(st);
        c = r.createCell(1);
        c.setCellValue("Nombre del representante");
        c.setCellStyle(st);
        c = r.createCell(2);
        c.setCellValue("Nombre del alumno");
        c.setCellStyle(st);
        c = r.createCell(3);
        c.setCellValue("Firma");
        c.setCellStyle(st);

        final HSSFCellStyle st0 = wb.createCellStyle();
        st0.setAlignment(HorizontalAlignment.LEFT);
        st0.setVerticalAlignment(VerticalAlignment.CENTER);
        st0.setBorderTop(BorderStyle.MEDIUM);
        st0.setBorderBottom(BorderStyle.MEDIUM);
        st0.setBorderLeft(BorderStyle.MEDIUM);
        st0.setBorderRight(BorderStyle.MEDIUM);
        st0.setWrapText(true);
        f = wb.createFont();
        f.setBold(false);
        f.setFontName("arial");
        f.setFontHeightInPoints((short) 12);
        st0.setFont(f);

        Collections.sort(datos, (Matricula m1, Matricula m2)
                -> String.CASE_INSENSITIVE_ORDER.compare(ax.getNombreCompletoPersona(m1.getEstudiante().getEstudianteRepresentante().getPersona()), ax.getNombreCompletoPersona(m2.getEstudiante().getEstudianteRepresentante().getPersona())));
        datos.forEach((m) -> {
            int nr = h1.getLastRowNum() + 1;
            HSSFRow r0 = h1.createRow(nr);
            HSSFCell c0 = r0.createCell(0);
            c0.setCellValue(ax.getDui(m.getEstudiante().getEstudianteRepresentante().getPersona()));
            c0.setCellStyle(st0);
            c0 = r0.createCell(1);
            c0.setCellValue(ax.getNombreCompletoPersona(m.getEstudiante().getEstudianteRepresentante().getPersona()));
            c0.setCellStyle(st0);
            c0 = r0.createCell(2);
            c0.setCellValue(ax.getNombreCompletoPersona(m.getEstudiante().getPersona()));
            c0.setCellStyle(st0);
            c0 = r0.createCell(3);
            c0.setCellValue("");
            c0.setCellStyle(st0);
        });
        h1.autoSizeColumn(0);
        h1.autoSizeColumn(1);
        h1.autoSizeColumn(2);
        h1.setColumnWidth(3, 9000);

        return wb;
    }

    public HSSFWorkbook getReportePlantel(HSSFWorkbook wb) {
        proceso(wb, null, "Plantel Institucional INTEX " + ax.getAñoActual(), 3);
        return wb;
    }

    public HSSFWorkbook getReporteNominaAlumnos(HSSFWorkbook wb, GradoPK grado) {
        proceso(wb, grado, "Nómina de alumnos", 2);
        return wb;
    }

    private void copiarDatos(HSSFSheet h, HSSFWorkbook wb) {
        HSSFSheet h0 = wb.getSheetAt(0);
        h0.iterator().forEachRemaining((r0) -> {
            int nr = h.getLastRowNum() + 1;
            HSSFRow r1 = h.createRow(nr);
            r0.cellIterator().forEachRemaining((c0) -> {
                HSSFCell c1 = r1.createCell(c0.getColumnIndex());
                c1.setCellValue(c0.getStringCellValue());
                c1.setCellStyle(c0.getCellStyle());
                c1.getCellStyle().setBorderTop(BorderStyle.MEDIUM);
                c1.getCellStyle().setBorderLeft(BorderStyle.MEDIUM);
                c1.getCellStyle().setBorderRight(BorderStyle.MEDIUM);
                c1.getCellStyle().setBorderBottom(BorderStyle.MEDIUM);
                c1.getCellStyle().setWrapText(true);
                c1.getCellStyle().setVerticalAlignment(VerticalAlignment.CENTER);
            });
        });
    }

    public HSSFWorkbook getReporteContribucion(HSSFWorkbook wb, GradoPK PK) {
        proceso(wb, PK, "Listado de moradores del pago de la contribución para el grado", 2);
        return wb;
    }

    private void proceso(HSSFWorkbook wb, GradoPK pk, String nombre, int colM) {
        HSSFSheet h = wb.createSheet(nombre);
        HSSFRow r = h.createRow(0);
        HSSFCell c = r.createCell(0);
        c.setCellValue(nombre + " " + ax.getGradoNombre(pk));

        HSSFCellStyle st = wb.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
        st.setVerticalAlignment(VerticalAlignment.CENTER);
        st.setWrapText(true);
        Font f = wb.createFont();
        f.setBold(true);
        f.setFontName("arial");
        f.setFontHeightInPoints((short) 16);
        st.setFont(f);

        c.setCellStyle(st);
        h.createRow(1);

        copiarDatos(h, wb);

        h.addMergedRegion(new CellRangeAddress(0, 1, 0, colM));
        for (int i = 0; i <= colM; i++) {
            h.setColumnWidth(i, 10000);
        }
        wb.removeSheetAt(0);
    }

    public HSSFWorkbook getReporteInventario(HSSFWorkbook wb, List<Categoria> categorias, List<TipoCargo> tipoCargos, TipoRecurso tr) {
        HSSFSheet h = wb.createSheet("Inventario");

        HSSFRow r = h.createRow(1);
        HSSFCell c = r.createCell(0);
        c.setCellValue("NOMBRE DEL CENTRO EDUCATIVO:");
        c = r.createCell(2);
        c.setCellValue("INSTITUTO NACIONAL TEXISTEPEQUE");
        c = r.createCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5);
        c.setCellValue("DIRECCIÓN POSTAL: Colonia Mónchez y Herrera frente a Carretera Internacional CA-12N, Km. 83 12.");

        r = h.createRow(2);
        c = r.createCell(0);
        c.setCellValue("TELEFAX:");
        c = r.createCell(1);
        c.setCellValue("2470-0219");
        c = r.createCell(2);
        c.setCellValue("MUNICIPIO: TEXISTEPEQUE");
        c = r.createCell(3);
        c.setCellValue("DEPARTAMENTO: SANTA ANA");
        c = r.createCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5);
        c.setCellValue("CÓDIGO DE INSTITUCIÓN: 14753");

        r = h.createRow(3);
        c = r.createCell(0);
        c.setCellValue("FECHA: ");
        c = r.createCell(1);
        c.setCellValue("Texistepeque, " + new SimpleDateFormat("dd/MMMMM/yyyy").format(new Date()));
        c = r.createCell(3);
        c.setCellValue("DISTRITO EDUCATIVO: 02-19");
        c = r.createCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5);
        c.setCellValue("TIPO CARGO");

        int i = 4;
        for (TipoCargo tc : tipoCargos) {
            r = h.createRow(i);
            c = r.createCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5);
            c.setCellValue(tc.getNombre());
            c = r.createCell(tr.getIdtipoRecurso().equals(3) ? 12 : 8);
            c.setCellValue(tc.getIdtipoCargo());
            h.addMergedRegion(new CellRangeAddress(i, i, tr.getIdtipoRecurso().equals(3) ? 7 : 5, tr.getIdtipoRecurso().equals(3) ? 11 : 7));
            h.getRow(i).getCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5).getCellStyle().setAlignment(HorizontalAlignment.LEFT);
            i++;
        }
        copiarDatos(h, wb);
        wb.removeSheetAt(0);

        h.addMergedRegion(new CellRangeAddress(1, 1, 0, 1));
        h.addMergedRegion(new CellRangeAddress(1, 1, tr.getIdtipoRecurso().equals(3) ? 7 : 5, tr.getIdtipoRecurso().equals(3) ? 12 : 8));
        h.addMergedRegion(new CellRangeAddress(2, 2, 3, 4));
        h.addMergedRegion(new CellRangeAddress(2, 2, tr.getIdtipoRecurso().equals(3) ? 7 : 5, tr.getIdtipoRecurso().equals(3) ? 12 : 8));
        h.addMergedRegion(new CellRangeAddress(3, 3, 1, 2));
        h.addMergedRegion(new CellRangeAddress(3, 3, 3, 4));
        h.addMergedRegion(new CellRangeAddress(3, 3, tr.getIdtipoRecurso().equals(3) ? 7 : 5, tr.getIdtipoRecurso().equals(3) ? 12 : 8));

        h.iterator().forEachRemaining((r0) -> {
            r0.cellIterator().forEachRemaining((c0) -> {
                CellStyle cs = c0.getCellStyle();
                cs.setWrapText(true);
            });
        });

        HSSFCellStyle cs = wb.createCellStyle();
        cs.setAlignment(HorizontalAlignment.CENTER);
        h.getRow(3).getCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5).setCellStyle(cs);
        cs = wb.createCellStyle();
        cs.setAlignment(HorizontalAlignment.LEFT);
        h.getRow(1).getCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5).setCellStyle(cs);
        h.getRow(2).getCell(tr.getIdtipoRecurso().equals(3) ? 7 : 5).setCellStyle(cs);
        return wb;
    }

}
