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
import net.delsas.saitae.entities.SolicitudReserva;

/**
 *
 * @author delsas
 */
@Stateless
public class SolicitudReservaFacade extends AbstractFacade<SolicitudReserva> implements SolicitudReservaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SolicitudReservaFacade() {
        super(SolicitudReserva.class);
    }
    
    @Override
    public List<SolicitudReserva> findByIdReserva(Integer id){
        return em.createNamedQuery("SolicitudReserva.findByIdReserva")
                .setParameter("idReserva", id)
                .getResultList();
    }
    
}
