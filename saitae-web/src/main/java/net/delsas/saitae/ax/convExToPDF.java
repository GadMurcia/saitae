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

/**
 *
 * @author delsas
 */
import java.io.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.*;
import java.util.Iterator;
import com.lowagie.text.Document;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import javax.faces.context.FacesContext;

public class convExToPDF {

    public Document conv(HSSFWorkbook my_xls_workbook, String nombre, FacesContext fc) throws Exception {
        HSSFSheet my_worksheet = my_xls_workbook.getSheetAt(0);
        // To iterate over the rows
        Iterator<Row> rowIterator = my_worksheet.iterator();
        //We will create output PDF document objects at this point
        Document iText_xls_2_pdf = new Document();
        PdfWriter.getInstance(iText_xls_2_pdf, fc.getExternalContext().getResponseOutputStream());
        iText_xls_2_pdf.open();
        PdfPTable my_table = new PdfPTable(2);
        PdfPCell table_cell;
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
            Iterator<Cell> cellIterator = row.cellIterator();
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                switch (cell.getCellType()) {
                    case NUMERIC:
                        table_cell = new PdfPCell(new Phrase((float) cell.getNumericCellValue()));
                        break;
                    case STRING:
                        table_cell = new PdfPCell(new Phrase(cell.getStringCellValue()));
                        break;
                    case FORMULA:
                        table_cell = new PdfPCell(new Phrase(cell.getCellFormula()));
                        break;
                    case BOOLEAN:
                        table_cell = new PdfPCell(new Phrase(cell.getBooleanCellValue() ? "Verdadero" : "Falso"));
                        break;
                    case BLANK:
                    case _NONE:
                    case ERROR:
                    default:
                        table_cell = new PdfPCell(new Phrase(""));
                }
                my_table.addCell(table_cell);
            }
        }
        iText_xls_2_pdf.setPageSize(iText_xls_2_pdf.getPageSize().rotate());
        iText_xls_2_pdf.add(my_table);
        return iText_xls_2_pdf;
    }
}
