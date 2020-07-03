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

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
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
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
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
    @EJB
    private PersonaFacadeLocal pFL;

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
        ExternalContext ex = FacesContext.getCurrentInstance().getExternalContext();
        String logo = ex.getRealPath("") + File.separator + "resources" + File.separator + "img" + File.separator;
        HSSFWorkbook wb = new XLSModel().getReporteMAtricula((HSSFWorkbook) document, datos, logo);

        List<Persona> directores = pFL.findByIdTipo(2);
        if (!directores.isEmpty()) {
            HSSFCellStyle st = wb.createCellStyle();
            st.setAlignment(HorizontalAlignment.LEFT);
            st.setVerticalAlignment(VerticalAlignment.CENTER);
            HSSFSheet s = wb.getSheetAt(0);
            int nr = s.getLastRowNum();
            nr += 3;
            HSSFRow r = s.createRow(nr);
            HSSFCell c = r.createCell(1);
            c.setCellValue("F.");
            c.setCellStyle(st);
            st = wb.createCellStyle();
            st.setAlignment(HorizontalAlignment.CENTER);
            st.setVerticalAlignment(VerticalAlignment.CENTER);
            r = s.createRow(nr + 1);
            c = r.createCell(1);
            c.setCellValue(getNombreCompletoPersona(directores.get(0)));
            c.setCellStyle(st);
            r = s.createRow(nr + 2);
            c = r.createCell(1);
            c.setCellValue("Director" + (directores.get(0).getPersonaSexo() ? "a" : ""));
            c.setCellStyle(st);

            s.addMergedRegion(new CellRangeAddress(nr + 2, nr + 2, 1, 7));
            s.addMergedRegion(new CellRangeAddress(nr + 1, nr + 1, 1, 7));
            s.addMergedRegion(new CellRangeAddress(nr, nr, 1, 7));
            s.setZoom(75, 100);
        }
    }

    public Integer[] getSubtotal(String modalidad) {
        Integer[] vals = new Integer[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        datos.stream().filter((rm) -> (rm.getModalidad().equalsIgnoreCase(modalidad))).forEachOrdered((rm) -> {
            new XLSModel().total(vals, rm.getMats());
        });
        return vals;
    }

    public Integer[] getTotal() {
        Integer[] vals = new Integer[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        XLSModel c = new XLSModel();
        datos.stream().forEachOrdered((rm) -> {
            c.total(vals, rm.getMats());
        });
        return vals;
    }
}
