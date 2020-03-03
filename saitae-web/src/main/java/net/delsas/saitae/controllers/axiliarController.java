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

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.Persona;
import org.primefaces.component.export.ExcelOptions;
import org.primefaces.component.export.PDFOptions;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class axiliarController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    private static Persona p = new Persona(0);
    private Integer tipo;
    private List<Grado> grados;
    private List<Materia> materias;
    private List<Horario> horarios;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private MateriaFacadeLocal mFL;
    @EJB
    private HorarioFacadeLocal hFL;

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> list;
        try {
            (new Auxiliar()).setDui(query, getP());
            list = tipo != 100
                    ? pfl.getPersonaByLikeIdAndType(getP().getIdpersona(), tipo)
                    : pfl.getAdminsByLikeId(getP().getIdpersona());
            list.forEach((o) -> {
                results.add(o.getPersonaNombre() + " "
                        + o.getPersonaApellido() + "=>" + o.getIdpersona().toString().substring(1));
            });

        } catch (Exception m) {
            System.out.println(m.getMessage());
        }
        return results;
    }

    public void setTipo(Integer t) {
        tipo = t;
    }

    public void onItemSelect(SelectEvent event) {
        p = new Persona(0);
        try {
            String x[] = event.getObject().toString().split("=>");
            (new Auxiliar()).setDui(x.length > 1 ? x[1] : x[0], p);
            p = pfl.find(p.getIdpersona());
        } catch (Exception o) {
            System.out.println("Error en (new prueba()).onItemSelect: " + o.getMessage());
        }
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage("Carga de datos", "Cargados los datos de " + p.getPersonaNombre() + " " + p.getPersonaApellido()));
    }

    public List<String> completeTextRep(String query) {
        tipo = 9;
        return completeText(query);
    }

    public List<String> completeTextPad(String query) {
        tipo = 11;
        return completeText(query);
    }

    public List<String> completeTextMad(String query) {
        tipo = 10;
        return completeText(query);
    }

    public List<String> completeTextEst(String query) {
        tipo = 8;
        return completeText(query);
    }

    public List<String> completeTextMae(String query) {
        tipo = 4;
        return completeText(query);
    }

    public List<String> completeTextAdm(String query) {
        tipo = 100;
        return completeText(query);
    }

    /**
     * @return the p
     */
    public static Persona getP() {
        return p;
    }

    /**
     * @param aP the p to set
     */
    public static void setP(Persona aP) {
        p = aP;
    }

    public String getGradoNombre(Grado g) {
        return getGradoNombre(g.getGradoPK());
    }

    public String getDateString(Date d) {
        return new SimpleDateFormat("dd/MM/yyyy").format(d);
    }

    public String getNombreCompleto(Persona p) {
        return getNombreCompletoPersona(p);
    }

    public String getNombreCorto(Persona p) {
        return getNombreCortoPersona(p);
    }

    public List<Grado> getGrados() {
        grados = gFL.getPorAñoYActivo(getAñoActual());
        return grados;
    }

    public List<Materia> getMaterias() {
        materias = mFL.findAll();
        return materias;
    }

    public List<Horario> getHorarios() {
        horarios = hFL.findAll();
        return horarios;
    }

    public ExcelOptions getExcelOpt() {
        ExcelOptions excelOpt = new ExcelOptions();
        excelOpt.setFacetBgColor("#c0f588");
        excelOpt.setFacetFontSize("14");
        excelOpt.setFacetFontColor("#000000");
        excelOpt.setFacetFontStyle("BOLD");
        excelOpt.setCellFontColor("#000000");
        excelOpt.setCellFontSize("12");
        return excelOpt;
    }

    public PDFOptions getPDFOpt() {
        PDFOptions excelOpt = new PDFOptions();
        excelOpt.setFacetBgColor("#c0f588");
        excelOpt.setFacetFontSize("14");
        excelOpt.setFacetFontColor("#000000");
        excelOpt.setFacetFontStyle("BOLD");
        excelOpt.setCellFontColor("#000000");
        excelOpt.setCellFontSize("12");
        return excelOpt;
    }

}
