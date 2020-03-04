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
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.ReporteMatricula;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.util.CellRangeAddress;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class repMatriculaController extends Auxiliar implements Serializable {

    private FacesContext context;
    private Persona usuario;
    private String pagina;
    private Integer añoSelected;
    private List<ReporteMatricula> datos;
    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private MatriculaFacadeLocal mFL;

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
        añoSelected = getAñoActual();
        datos = llenar(mFL, gFL, añoSelected);
    }

    public void onSelect(SelectEvent e) {
        datos = llenar(mFL, gFL, añoSelected);
    }

    public Integer getAñoSelected() {
        return añoSelected;
    }

    public void setAñoSelected(Integer añoSelected) {
        this.añoSelected = añoSelected;
    }

    public List<ReporteMatricula> getDatos() {
        return datos;
    }

    public void postProcessXLSp(Object document) {
        HSSFWorkbook wb = (HSSFWorkbook) document;
        wb.removeSheetAt(0);
        HSSFSheet hoja = wb.createSheet("Reporte de matricula");

        HSSFRow r = hoja.createRow(1);
        HSSFCell cel = r.createCell(0);
        cel.setCellValue("Instituto Nacional 'Texistepeque'");

        r = hoja.createRow(2);
        cel = r.createCell(0);
        cel.setCellValue("Ministerio de educación");
        cel = r.createCell(4);
        cel.setCellValue("Año: " + getAñoActual());
        cel = r.createCell(9);
        cel.setCellValue("Mes: " + new SimpleDateFormat("MMMMM").format(new Date()));

        r = hoja.createRow(3);
        cel = r.createCell(0);
        cel.setCellValue("Dirección departamental de Santa Ana");
        cel = r.createCell(4);
        cel.setCellValue("Código de infraestruccura: 14753");

        r = hoja.createRow(4);
        cel = r.createCell(1);
        cel.setCellValue("ESTADÍSTICA INSTITUCIONAL");

        r = hoja.createRow(9);
        cel = r.createCell(0);
        cel.setCellValue("Año y número de secciones");
        cel = r.createCell(4);
        cel.setCellValue("Matrícula de alumnos/as");
        cel = r.createCell(8);
        cel.setCellValue("Asistencia media");
        cel = r.createCell(9);
        cel.setCellValue("Retirados");
        cel = r.createCell(11);
        cel.setCellValue("Sobre edad");
        cel = r.createCell(13);
        cel.setCellValue("Repitencia");
        cel = r.createCell(15);
        cel.setCellValue("Reprobados");
        cel = r.createCell(17);
        cel.setCellValue("Asistencia media Actual");
        cel = r.createCell(19);
        cel.setCellValue("Total");

        r = hoja.createRow(10);
        cel = r.createCell(0);
        cel.setCellValue("Modalidad de bachillerato");
        cel = r.createCell(1);
        cel.setCellValue("Secciones por turno");
        cel = r.createCell(4);
        cel.setCellValue("Mañana");
        cel = r.createCell(6);
        cel.setCellValue("Tarde");

        r = hoja.createRow(11);
        cel = r.createCell(1);
        cel.setCellValue("Mañana");
        cel = r.createCell(2);
        cel.setCellValue("Tarde");
        cel = r.createCell(3);
        cel.setCellValue("Total");
        cel = r.createCell(4);
        cel.setCellValue("M");
        cel = r.createCell(5);
        cel.setCellValue("F");
        cel = r.createCell(6);
        cel.setCellValue("M");
        cel = r.createCell(7);
        cel.setCellValue("F");
        cel = r.createCell(9);
        cel.setCellValue("M");
        cel = r.createCell(10);
        cel.setCellValue("F");
        cel = r.createCell(11);
        cel.setCellValue("M");
        cel = r.createCell(12);
        cel.setCellValue("F");
        cel = r.createCell(13);
        cel.setCellValue("M");
        cel = r.createCell(14);
        cel.setCellValue("F");
        cel = r.createCell(15);
        cel.setCellValue("M");
        cel = r.createCell(16);
        cel.setCellValue("F");
        cel = r.createCell(17);
        cel.setCellValue("M");
        cel = r.createCell(18);
        cel.setCellValue("F");

        hoja.addMergedRegion(new CellRangeAddress(1, 1, 0, 19));
        hoja.addMergedRegion(new CellRangeAddress(2, 2, 0, 3));
        hoja.addMergedRegion(new CellRangeAddress(2, 2, 4, 8));
        hoja.addMergedRegion(new CellRangeAddress(2, 2, 9, 14));
        hoja.addMergedRegion(new CellRangeAddress(3, 3, 0, 3));
        hoja.addMergedRegion(new CellRangeAddress(4, 8, 0, 0));
        hoja.addMergedRegion(new CellRangeAddress(4, 8, 1, 14));
        hoja.addMergedRegion(new CellRangeAddress(4, 8, 17, 19));
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

        wb = new XLSModel().agrgarDatos(wb, datos);
    }

    public void postProcessXLS(Object document) {
        HSSFWorkbook wb = (HSSFWorkbook) document;
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFRow header = sheet.getRow(0);

        HSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREEN.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        for (int i = 0; i < header.getPhysicalNumberOfCells(); i++) {
            HSSFCell cell = header.getCell(i);

            cell.setCellStyle(cellStyle);
        }
    }
}
