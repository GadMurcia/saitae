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
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.MestroHorarioMaterias;

/**
 *
 * @author delsas
 */
@Stateless
public class MestroHorarioMateriasFacade extends AbstractFacade<MestroHorarioMaterias> implements MestroHorarioMateriasFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MestroHorarioMateriasFacade() {
        super(MestroHorarioMaterias.class);
    }
    
    @Override
    public List<MestroHorarioMaterias> findByhorarioAndGradoPK(Horario horario, GradoPK gradoPK, DiasEstudio dia){
        return em.createNamedQuery("MestroHorarioMaterias.findByHorarioAndGrado")
                .setParameter("horario", horario)
                .setParameter("gradoPK", gradoPK)
                .setParameter("dia", dia)
                .getResultList();
    }
    
    @Override
    public List<MestroHorarioMaterias> findByhorarioAndMaestro(Horario horario, Maestro maestro, DiasEstudio dia){
        return em.createNamedQuery("MestroHorarioMaterias.findByHorarioAndMaestro")
                .setParameter("horario", horario)
                .setParameter("maestro", maestro)
                .setParameter("dia", dia)
                .getResultList();
    }
    
    @Override
    public List<MestroHorarioMaterias> findAllOrdered(){
        return em.createNamedQuery("MestroHorarioMaterias.findAll").getResultList();
    }
    
}
