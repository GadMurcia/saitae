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
import net.delsas.saitae.entities.EvaluacionMaestro;

/**
 *
 * @author delsas
 */
@Stateless
public class EvaluacionMaestroFacade extends AbstractFacade<EvaluacionMaestro> implements EvaluacionMaestroFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EvaluacionMaestroFacade() {
        super(EvaluacionMaestro.class);
    }

    @Override
    public List<EvaluacionMaestro> findByIdMaestro(Integer idMaestro) {
        return em.createNamedQuery("EvaluacionMaestro.findByIdMaestro")
                .setParameter("idMaestro", idMaestro)
                .getResultList();
    }

}
