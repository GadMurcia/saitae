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

import com.lowagie.text.Image;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;

/**
 *
 * @author delsas
 */
public class XLSModel {
     
   private Auxiliar ax;
    
    public XLSModel() {
        ax = new Auxiliar();
    }
    
    public HSSFWorkbook getReporteMAtricula(HSSFWorkbook doc, List<ReporteMatricula> datos, String ruta) {
        doc.removeSheetAt(0);
        HSSFSheet hoja = doc.createSheet("Reporte de matricula");
        
        HSSFCellStyle st = doc.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
        st.setVerticalAlignment(VerticalAlignment.CENTER);
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
        
        try {
            int index;
            System.out.println(ruta);
            try (InputStream is = new FileInputStream(ruta)) {
                byte[] bs = IOUtils.toByteArray(is);
                index = doc.addPicture(bs, Workbook.PICTURE_TYPE_PNG);
            }
            CreationHelper ch = doc.getCreationHelper();
            Drawing d = hoja.createDrawingPatriarch();
            ClientAnchor c = ch.createClientAnchor();
            c.setCol1(0);
            c.setRow1(4);
            Picture p = d.createPicture(c, index);
            p.resize(5, 3);
        } catch (IOException e) {
            System.out.println(e);
        }
        
        cel = r.createCell(1);
        cel.setCellValue("ESTADÍSTICA INSTITUCIONAL");
        cel.setCellStyle(st);
        
        st = doc.createCellStyle();
        st.setAlignment(HorizontalAlignment.CENTER);
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
        int nr = hoja.getLastRowNum();
        for (ReporteMatricula rm : datos) {
            nr++;
            r = hoja.createRow(nr);
            HSSFCell ca = r.createCell(0);
            
            st = doc.createCellStyle();
            st.setAlignment(HorizontalAlignment.LEFT);
            st.setVerticalAlignment(VerticalAlignment.CENTER);
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
            hoja.addMergedRegion(new CellRangeAddress(nr, nr, 0, 19));
            ca.setCellStyle(st);
            
            for (MatriculaSeccion ms : rm.getMats()) {
                st = doc.createCellStyle();
                st.setAlignment(HorizontalAlignment.CENTER);
                st.setVerticalAlignment(VerticalAlignment.CENTER);
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
                c0.setCellFormula(String.format("G%d-J%d-Q%d", nr + 1, nr + 1, nr + 1));
                c0.setCellStyle(st);
                c0 = r.createCell(18);
                c0.setCellFormula(String.format("H%d-L%d-P%d", nr + 1, nr + 1, nr + 1));
                c0.setCellStyle(st);
                c0 = r.createCell(19);
                c0.setCellFormula(String.format("R%d+S%d", nr + 1, nr + 1));
                c0.setCellStyle(st);
            }
        }
        
        Integer[] vals = new Integer[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        for (ReporteMatricula rm : datos) {
            rm.getMats().stream().map((ms) -> {
                vals[0] += 0;
                vals[1] += 1;
                vals[2] += 1;
                vals[3] += 1;
                vals[4] += ms.getMatriculaM();
                return ms;
            }).map((ms) -> {
                vals[5] += ms.getMatriculaF();
                return ms;
            }).map((ms) -> {
                vals[6] += ms.getMatriculaM();
                return ms;
            }).map((ms) -> {
                vals[7] += ms.getMatriculaF();
                return ms;
            }).map((ms) -> {
                vals[8] += ms.getMatriculaF() + ms.getMatriculaM();
                return ms;
            }).map((ms) -> {
                vals[9] += ms.getRetiradosM();
                return ms;
            }).map((ms) -> {
                vals[10] += ms.getRetiradosF();
                return ms;
            }).map((ms) -> {
                vals[11] += ms.getSobreEdadM();
                return ms;
            }).map((ms) -> {
                vals[12] += ms.getSobreEdadF();
                return ms;
            }).map((ms) -> {
                vals[13] += ms.getRepitenciaM();
                return ms;
            }).map((ms) -> {
                vals[14] += ms.getRepitenciaF();
                return ms;
            }).map((_item) -> {
                vals[15] += 0;
                return _item;
            }).map((_item) -> {
                vals[16] += 0;
                return _item;
            }).map((_item) -> {
                vals[17] += vals[4] - vals[9];
                return _item;
            }).map((_item) -> {
                vals[18] += vals[5] - vals[10];
                return _item;
            }).forEachOrdered((_item) -> {
                vals[19] += vals[17] + vals[18];
            });
        }
        
        r = hoja.createRow(hoja.getLastRowNum() + 1);
        cel = r.createCell(0);
        cel.setCellValue("Total General Institucional");
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
        
        hoja.autoSizeColumn(0, true);
        hoja.autoSizeColumn(8, true);
        hoja.setZoom(80);
        return doc;
    }
    
}
