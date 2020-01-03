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
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaDetalle;

/**
 *
 * @author delsas
 */
@Stateless
public class ReservaDetalleFacade extends AbstractFacade<ReservaDetalle> implements ReservaDetalleFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReservaDetalleFacade() {
        super(ReservaDetalle.class);
    }
    
    @Override
    public Reserva findReservaByIdReserva(Integer id){
        return (Reserva) em.createNamedQuery("ReservaDetalle.findReservaByIdReserva")
                .setParameter("idReserva", id)
                .getSingleResult();
    }
    
    @Override
    public List<ReservaDetalle> findByIdReserva(Integer id){
        return em.createNamedQuery("ReservaDetalle.findByIdReserva")
                .setParameter("idReserva", id)
                .getResultList();
    }
    
}
