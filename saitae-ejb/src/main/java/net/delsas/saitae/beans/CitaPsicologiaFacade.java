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
import net.delsas.saitae.entities.CitaPsicologia;

/**
 *
 * @author delsas
 */
@Stateless
public class CitaPsicologiaFacade extends AbstractFacade<CitaPsicologia> implements CitaPsicologiaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CitaPsicologiaFacade() {
        super(CitaPsicologia.class);
    }

    @Override
    public List<CitaPsicologia> findByEstudiante(Integer idEstudiante) {
        return em.createNamedQuery("CitaPsicologia.findByEstudiante")
                .setParameter("estudiante", idEstudiante)
                .getResultList();
    }
    
    @Override
    public List<CitaPsicologia> findByEstado(String estado) {
        return em.createNamedQuery("CitaPsicologia.findByEstado")
                .setParameter("estado", estado)
                .getResultList();
    }
    
    @Override
    public List<CitaPsicologia> findConsultados(){
        return em.createNamedQuery("CitaPsicologia.findConsultados").getResultList();
    }

}
