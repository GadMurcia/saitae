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
import net.delsas.saitae.entities.Consulta;

/**
 *
 * @author delsas
 */
@Stateless
public class ConsultaFacade extends AbstractFacade<Consulta> implements ConsultaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConsultaFacade() {
        super(Consulta.class);
    }

    @Override
    public List<String> findMotivosByConsulta(Date fi, Date ff, Integer id) {
        return em.createNamedQuery("Consulta.findMotivosByConsulta")
                .setParameter("fi", fi)
                .setParameter("ff", ff)
                .setParameter("id", id)
                .getResultList();
    }
    
    @Override
    public List<Integer> findIdEstudianteByPeriodo(Date fi, Date ff) {
        return em.createNamedQuery("Consulta.findIdEstudianteByPeriodo")
                .setParameter("fi", fi)
                .setParameter("ff", ff)
                .getResultList();
    }

}
