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
import net.delsas.saitae.entities.EntregaUtiles;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
@Stateless
public class EntregaUtilesFacade extends AbstractFacade<EntregaUtiles> implements EntregaUtilesFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EntregaUtilesFacade() {
        super(EntregaUtiles.class);
    }

    @Override
    public List<EntregaUtiles> findByAño(Integer año) {
        return em.createNamedQuery("EntregaUtiles.findByAño")
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<EntregaUtiles> findByGrado(GradoPK gPK) {
        return em.createNamedQuery("EntregaUtiles.findByGrado")
                .setParameter("gPK", gPK)
                .getResultList();
    }

}
