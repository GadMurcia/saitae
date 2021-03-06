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
import net.delsas.saitae.entities.MaestoCargo;

/**
 *
 * @author delsas
 */
@Stateless
public class MaestoCargoFacade extends AbstractFacade<MaestoCargo> implements MaestoCargoFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaestoCargoFacade() {
        super(MaestoCargo.class);
    }
    
    @Override
    public List<MaestoCargo> getMaestroCargoByIdMaestro(Integer id){
        return em.createNamedQuery("MaestoCargo.findByIdMaesto")
                .setParameter("idMaesto", id)
                .getResultList();
    }
    
}
