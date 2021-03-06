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
import net.delsas.saitae.entities.GradoEvaluacion;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
@Stateless
public class GradoEvaluacionFacade extends AbstractFacade<GradoEvaluacion> implements GradoEvaluacionFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GradoEvaluacionFacade() {
        super(GradoEvaluacion.class);
    }

    @Override
    public List<GradoEvaluacion> findByGradoPK(GradoPK pk) {
        return em.createNamedQuery("GradoEvaluacion.findByGradoPK")
                .setParameter("pk", pk)
                .getResultList();
    }

}
