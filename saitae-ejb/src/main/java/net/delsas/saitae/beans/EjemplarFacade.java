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
import net.delsas.saitae.entities.Ejemplar;

/**
 *
 * @author delsas
 */
@Stateless
public class EjemplarFacade extends AbstractFacade<Ejemplar> implements EjemplarFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EjemplarFacade() {
        super(Ejemplar.class);
    }

    @Override
    public List<Integer> findCorrelativosByIdRecurso(int idRecurso) {
        return em.createNamedQuery("Ejemplar.findCorrelativoByIdRecurso")
                .setParameter("idRecurso", idRecurso)
                .getResultList();
    }

    @Override
    public List<Ejemplar> findEjemplaresByIdRecurso(Integer idrecurso) {
        return em.createNamedQuery("Ejemplar.findByIdRecurso")
                .setParameter("idRecurso", idrecurso)
                .getResultList();
    }

}
