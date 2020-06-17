/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.PeriodoReportePsicologia;
import net.delsas.saitae.entities.ReportePsicologia;

/**
 *
 * @author delsas
 */
@Stateless
public class ReportePsicologiaFacade extends AbstractFacade<ReportePsicologia> implements ReportePsicologiaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReportePsicologiaFacade() {
        super(ReportePsicologia.class);
    }

    @Override
    public List<ReportePsicologia> findByPeriodo(Date fi, Date ff, boolean  publico) {
        return em.createNamedQuery("ReportePsicologia.findByPeriodo")
                .setParameter("fechaInicio", fi)
                .setParameter("fechaFin", ff)
                .setParameter("pub", publico)
                .getResultList();
    }    
}
