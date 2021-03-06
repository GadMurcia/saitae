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
import net.delsas.saitae.entities.DelagacionCargo;

/**
 *
 * @author delsas
 */
@Stateless
public class DelagacionCargoFacade extends AbstractFacade<DelagacionCargo> implements DelagacionCargoFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DelagacionCargoFacade() {
        super(DelagacionCargo.class);
    }

    @Override
    public List<DelagacionCargo> getDelegacionCargoByIdPersona(Integer id) {
        return em.createNamedQuery("DelagacionCargo.findByDelagacionCargoByIdPersona")
                .setParameter("idpersona", id)
                .getResultList();
    }
}
