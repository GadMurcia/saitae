/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.Reserva;

/**
 *
 * @author delsas
 */
@Stateless
public class ReservaFacade extends AbstractFacade<Reserva> implements ReservaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReservaFacade() {
        super(Reserva.class);
    }

    @Override
    public Reserva getReservaByFechaHora(Date feha_hora) {
        return (Reserva) em.createNamedQuery("Reserva.findByReservaFecha")
                .setParameter("reservaFecha", feha_hora)
                .getSingleResult();
    }

    @Override
    public List<Reserva> getReservaByEstado(String estado) {
        return em.createNamedQuery("Reserva.findByReservaEstado")
                .setParameter("reservaEstado", estado)
                .getResultList();
    }
    
    @Override
    public List<Reserva> findByEstadoAndIdTipoRecurso(String estado, Integer idTipoRecurso){
        return em.createNamedQuery("Reserva.findByEstadoAndIdTipoRecurso")
                .setParameter("estado", estado)
                .setParameter("idTipoRecurso", idTipoRecurso)
                .getResultList();
    }
}
