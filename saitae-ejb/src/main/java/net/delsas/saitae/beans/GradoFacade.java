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
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
@Stateless
public class GradoFacade extends AbstractFacade<Grado> implements GradoFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GradoFacade() {
        super(Grado.class);
    }

    @Override
    public List<String> getModalidadPorAño(int año) {
        return em.createNamedQuery("Grado.findModalidadByaño")
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Integer> getIdPorAñoyModalidad(int año, String modalidad) {
        return em.createNamedQuery("Grado.findIDByañoAndModalidad")
                .setParameter("año", año)
                .setParameter("modalidad", modalidad)
                .getResultList();
    }

    @Override
    public List<String> getSeccionPorAñoModalidadyId(int año, String modalidad, int idgrado) {
        return em.createNamedQuery("Grado.findSeccionByAñoModId")
                .setParameter("año", año)
                .setParameter("modalidad", modalidad)
                .setParameter("idgrado", idgrado)
                .getResultList();
    }

    @Override
    public List<Grado> getPorAñoYActivo(int año) {
        return em.createNamedQuery("Grado.findByañoAndActivo").setParameter("año", año).getResultList();
    }

    @Override
    public List<Integer> findAños() {
        return em.createNamedQuery("Grado.findAños").getResultList();
    }

    @Override
    public List<Grado> findByGradoAño(Integer año) {
        return em.createNamedQuery("Grado.findByGradoAño")
                .setParameter("gradoAño", año)
                .getResultList();
    }

    @Override
    public List<Grado> findByidMaestro(Integer idMaestro) {
        return em.createNamedQuery("Grado.findByidMaestro")
                .setParameter("idMaestro", idMaestro)
                .getResultList();
    }

    @Override
    public Grado findByidMaestroAndAño(Integer idMaestro, Integer año) {
        List<Grado> rs = em.createNamedQuery("Grado.findByidMaestroAndAño")
                .setParameter("año", año)
                .setParameter("idMaestro", idMaestro)
                .getResultList();
        return rs.isEmpty() ? null : rs.get(0);
    }
}
