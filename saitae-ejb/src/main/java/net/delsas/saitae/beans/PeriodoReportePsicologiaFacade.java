/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.PeriodoReportePsicologia;

/**
 *
 * @author delsas
 */
@Stateless
public class PeriodoReportePsicologiaFacade extends AbstractFacade<PeriodoReportePsicologia> implements PeriodoReportePsicologiaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PeriodoReportePsicologiaFacade() {
        super(PeriodoReportePsicologia.class);
    }

    @Override
    public List<PeriodoReportePsicologia> findPeriodoByAño(Integer año) {
        return em.createNamedQuery("PeriodoReportePsicologia.findPeriodoByAño")
                .setParameter("año", año)
                .getResultList();
    }
    
    @Override
    public List<PeriodoReportePsicologia> findPeriodosNoPublicosByaño(Integer año) {
        return em.createNamedQuery("PeriodoReportePsicologia.findPeriodosNoPublicosByAño")
                .setParameter("año", año)
                .getResultList();
    }
}
