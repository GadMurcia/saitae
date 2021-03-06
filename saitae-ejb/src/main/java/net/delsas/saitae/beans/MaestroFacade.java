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
import javax.persistence.Query;
import net.delsas.saitae.entities.Maestro;

/**
 *
 * @author delsas
 */
@Stateless
public class MaestroFacade extends AbstractFacade<Maestro> implements MaestroFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaestroFacade() {
        super(Maestro.class);
    }
    
    @Override
    public List<Maestro> getLikeById(int id) {
        Query q = em.createNamedQuery("Maestro.findByLikeIdmaestro");
        q.setParameter("idmaestro", id + "");
        return q.getResultList();
}

}
