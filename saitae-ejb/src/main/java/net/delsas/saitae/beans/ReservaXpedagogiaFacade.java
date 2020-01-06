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
import net.delsas.saitae.entities.ProyectoPedagogico;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaXpedagogia;

/**
 *
 * @author delsas
 */
@Stateless
public class ReservaXpedagogiaFacade extends AbstractFacade<ReservaXpedagogia> implements ReservaXpedagogiaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReservaXpedagogiaFacade() {
        super(ReservaXpedagogia.class);
    }

    @Override
    public List<ProyectoPedagogico> findProyectoByIdReserva(Integer idReserva) {
        return em.createNamedQuery("ReservaXpedagogia.findProyectoByIdReserva")
                .setParameter("idReserva", idReserva)
                .getResultList();
    }
    
    @Override
    public List<Reserva> findReservaByIdProyecto(Integer idproyecto) {
        return em.createNamedQuery("ReservaXpedagogia.findReservaByIdProyecto")
                .setParameter("idProyecto", idproyecto)
                .getResultList();
    }

}
