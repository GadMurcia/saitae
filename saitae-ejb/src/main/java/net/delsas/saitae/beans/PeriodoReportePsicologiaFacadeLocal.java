/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.PeriodoReportePsicologia;

/**
 *
 * @author delsas
 */
@Local
public interface PeriodoReportePsicologiaFacadeLocal {

    PeriodoReportePsicologia find(Object id);

    List<PeriodoReportePsicologia> findAll();

    List<PeriodoReportePsicologia> findRange(int[] range);

    int count();

    public List<PeriodoReportePsicologia> findPeriodoByAño(Integer año);

    public List<PeriodoReportePsicologia> findPeriodosNoPublicosByaño(Integer año);
}
