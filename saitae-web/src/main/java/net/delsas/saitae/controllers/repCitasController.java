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

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.PeriodoReportePsicologiaFacadeLocal;
import net.delsas.saitae.beans.ReportePsicologiaFacadeLocal;
import net.delsas.saitae.entities.PeriodoReportePsicologia;
import net.delsas.saitae.entities.ReportePsicologia;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class repCitasController implements Serializable {

    private PeriodoReportePsicologia periodoSel;
    private List<PeriodoReportePsicologia> periodos;
    private List<ReportePsicologia> reportes;

    @EJB
    private ReportePsicologiaFacadeLocal rpFL;
    @EJB
    private PeriodoReportePsicologiaFacadeLocal prpFL;

    @PostConstruct
    public void init() {
        periodos = prpFL.findPeriodoByAño(new Auxiliar().getAñoActual());
    }

    public void onPeriodoSelected(SelectEvent e) {
        reportes = periodoSel == null
                ? new ArrayList<>()
                : rpFL.findByPeriodo(periodoSel.getPeriodoReportePsicologiaPK().getFechaInicio(),
                        periodoSel.getPeriodoReportePsicologiaPK().getFechaFin(), true);
    }

    public PeriodoReportePsicologia getPeriodoSel() {
        return periodoSel;
    }

    public void setPeriodoSel(PeriodoReportePsicologia periodoS) {
        this.periodoSel = periodoS;
    }

    public List<PeriodoReportePsicologia> getPeriodos() {
        return periodos;
    }

    public List<ReportePsicologia> getReportes() {
        return reportes;
    }
}
