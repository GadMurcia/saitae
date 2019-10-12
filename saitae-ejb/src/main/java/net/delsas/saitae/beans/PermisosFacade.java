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
import net.delsas.saitae.entities.Permisos;

/**
 *
 * @author delsas
 */
@Stateless
public class PermisosFacade extends AbstractFacade<Permisos> implements PermisosFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PermisosFacade() {
        super(Permisos.class);
    }
    
    @Override
    public List<Permisos> getPermisosPorEstado(String estado){
        return em.createNamedQuery("Permisos.findByPermisosEstado")
                .setParameter("permisoEstado", estado)
                .getResultList();
}
    
    @Override
    public List<Permisos> findByPEPEs(String estado){
        return em.createNamedQuery("Permisos.findByPEPEs")
                .setParameter("permisoEstado", estado)
                .setParameter("tipo", 8)
                .getResultList();
}
}
