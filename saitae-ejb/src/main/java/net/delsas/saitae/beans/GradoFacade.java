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
    
    /**
     * Lista de años, modalidades y secciones registradas para el un año.
     * @param año
     * @return lista de modalidades
     */
    @Override
    public List<String> getModalidadPorAño(int año){
        return em.createNamedQuery("Grado.findModalidadByaño")
                .setParameter("año", año)
                .getResultList();
    }
    
    /**
     * Busca los id de los años para la modalidad proporcionada en el año lectivo indicado.
     * @param año
     * @param modalidad
     * @return Lista de años
     */
    @Override
    public List<Integer> getIdPorAñoyModalidad(int año, String modalidad){
        return em.createNamedQuery("Grado.findIDByañoAndModalidad")
                .setParameter("año", año)
                .setParameter("modalidad", modalidad)
                .getResultList();
    }
    
    /**
     * Busca una lista de secciones activas para el grado y modalidad provistas en el año seleccionado.
     * @param año
     * @param modalidad
     * @param idgrado
     * @return lista de Secciones activas.
     */
    @Override
    public List<String> getSeccionPorAñoModalidadyId(int año, String modalidad, int idgrado){
        return em.createNamedQuery("Grado.findSeccionByAñoModId")
                .setParameter("año", año)
                .setParameter("modalidad", modalidad)
                .setParameter("idgrado", idgrado)
                .getResultList();
    }

}
