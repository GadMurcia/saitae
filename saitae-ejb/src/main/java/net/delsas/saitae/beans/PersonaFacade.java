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
import javax.persistence.Query;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Stateless
public class PersonaFacade extends AbstractFacade<Persona> implements PersonaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PersonaFacade() {
        super(Persona.class);
    }
    
    /**
     *Devuelve una lista de objetos persona cuyos id inicien por el proporcionado en el parámetro id
     * @param id
     * @return
     */
    @Override
    public List<Persona> getByLikeId(int id){
        Query q = em.createNamedQuery("Persona.findByLikeIdpersona").setParameter("idpersona", id+"");
        return q.getResultList();
    }
    
}
