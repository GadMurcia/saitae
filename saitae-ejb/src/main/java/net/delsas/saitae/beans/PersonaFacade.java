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
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
     * Devuelve una lista de objetos persona cuyos id inicien por el
     * proporcionado en el parámetro id
     *
     * @param id
     * @return
     */
    @Override
    public List<Persona> getByLikeId(int id) {
        return em.createNamedQuery("Persona.findByLikeIdpersona").setParameter("idpersona", id + "").getResultList();
    }

    @Override
    public List<Persona> getPlantel() {
        return em.createNamedQuery("Persona.findPlantel").getResultList();
    }

    @Override
    public List<Persona> getMaestros() {
        CriteriaQuery q = em.getCriteriaBuilder().createQuery();
        Root<Persona> r = q.from(Persona.class);
        q.select(r).where(em.getCriteriaBuilder().equal(
                r.get("tipoPersona").get("idtipoPersona"), 4));
        return em.createQuery(q).getResultList();
    }

    @Override
    public List<Persona> getPersonaByLikeIdAndType(int id, int tipo) {
        return em.createNamedQuery("Persona.findPersonaByLikeIdpersona")
                .setParameter("idpersona", id + "")
                .setParameter("idtipoPersona", tipo)
                .getResultList();
    }

    @Override
    public List<Persona> getAdminsByLikeId(int id) {
        return em.createNamedQuery("Persona.findAdministratorByLikeType").setParameter("idpersona", id + "").getResultList();
    }

    @Override
    public List<Persona> getPersonaByLikeNombreAndType(String nombre, int tipo) {
        return em.createNamedQuery("Persona.findPersonaByLikeNombreAndTipo")
                .setParameter("likeNombre", nombre)
                .setParameter("idtipoPersona", tipo)
                .getResultList();
    }

    @Override
    public List<Persona> getPersonaByLikeNombre(String nombre) {
        return em.createNamedQuery("Persona.findPersonaByLikeNombre")
                .setParameter("likeNombre", nombre)
                .getResultList();
    }

    @Override
    public List<Persona> findByIdTipo(Integer tipo) {
        return em.createNamedQuery("Persona.findByIdTipo")
                .setParameter("tipo", tipo)
                .getResultList();
    }
}
