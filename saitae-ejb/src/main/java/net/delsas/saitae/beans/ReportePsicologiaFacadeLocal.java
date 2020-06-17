/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.PeriodoReportePsicologia;
import net.delsas.saitae.entities.ReportePsicologia;

/**
 *
 * @author delsas
 */
@Local
public interface ReportePsicologiaFacadeLocal {

    void create(ReportePsicologia reportePsicologia);

    void edit(ReportePsicologia reportePsicologia);

    void remove(ReportePsicologia reportePsicologia);

    ReportePsicologia find(Object id);

    List<ReportePsicologia> findAll();

    List<ReportePsicologia> findRange(int[] range);

    int count();

    public List<ReportePsicologia> findByPeriodo(Date fi, Date ff, boolean publico);

}
