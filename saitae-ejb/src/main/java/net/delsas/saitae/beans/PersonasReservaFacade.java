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
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.Reserva;

/**
 *
 * @author delsas
 */
@Stateless
public class PersonasReservaFacade extends AbstractFacade<PersonasReserva> implements PersonasReservaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonasReservaFacade() {
        super(PersonasReserva.class);
    }

    @Override
    public List<PersonasReserva> findByIdReserva(Integer id) {
        return em.createNamedQuery("PersonasReserva.findByIdReserva")
                .setParameter("idReserva", id)
                .getResultList();
    }

    @Override
    public List<Reserva> findReservaByIdpersona(Integer idPersona, Integer año) {
        return em.createNamedQuery("PersonasReserva.findReservaByIdpersona")
                .setParameter("idPersona", idPersona)
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Integer> findAñosPersonasles(Integer idPersona) {
        return em.createNamedQuery("PersonasReserva.findAñosPersonasles")
                .setParameter("idPersona", idPersona)
                .getResultList();
    }

}
