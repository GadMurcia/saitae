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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
public class representanteController extends Auxiliar implements Serializable {

    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    private List<Grado> grados;
    private GradoPK id;
    private List<Estudiante> representantes;

    @PostConstruct
    public void init() {
        grados = gFL.getPorAñoYActivo(getAñoActual());
        representantes = new ArrayList<>();
        id = grados.isEmpty() ? null : grados.get(0).getGradoPK();
        selectAño(null);
    }

    public void selectAño(SelectEvent event) {
        representantes.clear();
        if (id != null) {
            mFL.findByGradoPK(id).forEach((m) -> {
                representantes.add(m.getEstudiante());
            });
        }
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public List<Estudiante> getRepresentantes() {
        Collections.sort(representantes, (Estudiante m1, Estudiante m2)
                -> String.CASE_INSENSITIVE_ORDER.compare(getNombreCompletoPersona(m1.getEstudianteRepresentante().getPersona()), getNombreCompletoPersona(m2.getEstudianteRepresentante().getPersona())));
        return Collections.unmodifiableList(representantes);
    }

    public GradoPK getId() {
        return id;
    }

    public void setId(GradoPK id) {
        this.id = id;
    }

    public void postProcessXLSp(Object document) {
        HSSFWorkbook wb = (HSSFWorkbook) document;
        wb = new XLSModel().getReporteRepresentantes(wb, mFL.findByGradoPK(id), id);
    }
}
