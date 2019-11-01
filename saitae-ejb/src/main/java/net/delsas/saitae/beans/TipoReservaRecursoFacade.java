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
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoReservaRecurso;

/**
 *
 * @author delsas
 */
@Stateless
public class TipoReservaRecursoFacade extends AbstractFacade<TipoReservaRecurso> implements TipoReservaRecursoFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoReservaRecursoFacade() {
        super(TipoReservaRecurso.class);
    }

    @Override
    public List<Recurso> findRecursoByTipoRecursoAndTipoReserva(Integer idTipoRecurso, Integer idTipoReserva) {
        return em.createNamedQuery("TipoReservaRecurso.findRecursoByTipoRecursoAndTipoReserva")
                .setParameter("tipoRecurso", idTipoRecurso)
                .setParameter("idTipoReserva", idTipoReserva)
                .getResultList();
    }

}
