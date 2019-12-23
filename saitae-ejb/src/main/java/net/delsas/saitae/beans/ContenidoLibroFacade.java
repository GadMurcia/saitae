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
import net.delsas.saitae.entities.ContenidoLibro;
import net.delsas.saitae.entities.Recurso;

/**
 *
 * @author delsas
 */
@Stateless
public class ContenidoLibroFacade extends AbstractFacade<ContenidoLibro> implements ContenidoLibroFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContenidoLibroFacade() {
        super(ContenidoLibro.class);
    }
    
    @Override
    public List<Recurso> findLibroByContenidoNombre(String contenido){
        return em.createNamedQuery("ContenidoLibro.findLikeContenidoLibroNombre")
                .setParameter("contenidoLibroNombre", contenido)
                .getResultList();
    }
    
    @Override
    public List<Recurso> findRecursoBynombre(String nombre){
        return em.createNamedQuery("Recurso.findLikeNombre")
                .setParameter("nombre", nombre)
                .setParameter("tipoRecurso", 3)
                .getResultList();
    }
    
    @Override
    public List<Recurso> findLibroByAutorNombre(String autorNombre){
        return em.createNamedQuery("AutorLibro.findLikeAutorNomre")
                .setParameter("autorNombre", autorNombre)
                .getResultList();
    }
    
}
