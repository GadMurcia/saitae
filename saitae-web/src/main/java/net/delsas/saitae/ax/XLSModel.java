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

import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Color;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 *
 * @author delsas
 */
public class XLSModel {

    private Auxiliar ax;

    public XLSModel() {
        ax = new Auxiliar();
    }

    public HSSFWorkbook agrgarDatos(HSSFWorkbook doc, List<ReporteMatricula> datos) {
        HSSFSheet hoja = doc.getSheetAt(0);
        int nr = hoja.getLastRowNum();
        for (ReporteMatricula rm : datos) {
            nr++;
            HSSFRow r = hoja.createRow(nr);
            HSSFCell ca = r.createCell(0);
            
            HSSFCellStyle st = doc.createCellStyle();
            st.setAlignment(HorizontalAlignment.LEFT);
            st.setBorderBottom(BorderStyle.MEDIUM);
            st.setBorderTop(BorderStyle.MEDIUM);
            st.setBorderLeft(BorderStyle.MEDIUM);
            st.setBorderRight(BorderStyle.MEDIUM);
            ca.setCellValue(ax.getModalidadNombre(rm.getModalidad()));            
            hoja.addMergedRegion(new CellRangeAddress(nr, nr, 0, 19));
            ca.setCellStyle(st);
            for (MatriculaSeccion ms : rm.getMats()) {
                System.out.println(ms);
                nr++;
                r = hoja.createRow(nr);
                HSSFCell c0 = r.createCell(0);
                c0.setCellValue(ax.getGradoNombre(ms.getPk()));
                c0 = r.createCell(1);
                c0.setCellValue(1);
                c0 = r.createCell(2);
                c0.setCellValue(1);
                c0 = r.createCell(3);
                c0.setCellValue(1);
                c0 = r.createCell(4);
                c0.setCellValue(ms.getMatriculaM());
                c0 = r.createCell(5);
                c0.setCellValue(ms.getMatriculaF());
                c0 = r.createCell(6);
                c0.setCellValue(ms.getMatriculaM());
                c0 = r.createCell(7);
                c0.setCellValue(ms.getMatriculaF());
                c0 = r.createCell(8);
                c0.setCellFormula(String.format("E%d+F%d", nr+1, nr+1));
                c0 = r.createCell(9);
                c0.setCellValue(ms.getRetiradosM());
                c0 = r.createCell(10);
                c0.setCellValue(ms.getRetiradosF());
                c0 = r.createCell(11);
                c0.setCellValue(ms.getSobreEdadM());
                c0 = r.createCell(12);
                c0.setCellValue(ms.getSobreEdadF());
                c0 = r.createCell(13);
                c0.setCellValue(ms.getRepitenciaM());
                c0 = r.createCell(14);
                c0.setCellValue(ms.getRepitenciaF());
                c0 = r.createCell(15);
                c0.setCellValue(0);
                c0 = r.createCell(16);
                c0.setCellValue(0);
                c0 = r.createCell(17);
                c0.setCellFormula(String.format("G%d-J%d", nr+1, nr+1));
                c0 = r.createCell(18);
                c0.setCellFormula(String.format("H%d-L%d", nr+1, nr+1));
                c0 = r.createCell(19);
                c0.setCellFormula(String.format("R%d+S%d", nr+1, nr+1));
            }
        }
        return doc;
    }

}
