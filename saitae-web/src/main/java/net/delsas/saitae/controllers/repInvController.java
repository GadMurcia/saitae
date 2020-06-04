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
import java.util.ArrayList;
import java.util.List;
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
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.entities.AutorLibro;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.EditorialLibro;
import net.delsas.saitae.entities.Ejemplar;
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

        tipoCargos = tcFL.findAll();
        categorias = cFL.findAll();
        recursos = new ArrayList<>();
    }

    public void onTipoSelected(SelectEvent e) {
        recursos = trSelected == null ? new ArrayList<>()
                : rFL.findByTipoRecurso(trSelected.getIdtipoRecurso());
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

    public void reporte(Object doc) {
        HSSFWorkbook wb = (HSSFWorkbook) doc;
        if (trSelected.getIdtipoRecurso() == 3) {
            wb = new XLSModel().getReporteInventario(wb, categorias, tipoCargos, trSelected);

            HSSFSheet h = wb.getSheetAt(0);
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
        } else {

        }
    }
}
