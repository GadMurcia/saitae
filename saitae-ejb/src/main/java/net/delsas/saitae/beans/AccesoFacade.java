/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.Acceso;

/**
 *
 * @author delsas
 */
@Stateless
public class AccesoFacade extends AbstractFacade<Acceso> implements AccesoFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccesoFacade() {
        super(Acceso.class);
    }
    
    @Override
    public Acceso getAccesoByUrl(String url){
        return (Acceso) em.createNamedQuery("Acceso.findByAccesourl").setParameter("url", url).getSingleResult();
}
    
}
