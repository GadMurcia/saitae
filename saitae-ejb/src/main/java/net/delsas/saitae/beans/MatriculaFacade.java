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
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Stateless
public class MatriculaFacade extends AbstractFacade<Matricula> implements MatriculaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MatriculaFacade() {
        super(Matricula.class);
    }
    
    @Override
    public List<Persona> findMatriculaByGrado(GradoPK pk) {
        return em.createNamedQuery("Matricula.findEstudiantesByGrado")
                .setParameter("gradoPK", pk)
                .getResultList();
}
    
    @Override
    public List<Matricula> findAllNewEstudent(GradoPK pk){
        return em.createNamedQuery("Matricula.findAllNew")
                .setParameter("mod", pk.getGradoModalidad())
                .setParameter("idgrado", pk.getIdgrado())
                .getResultList();
    }

}
