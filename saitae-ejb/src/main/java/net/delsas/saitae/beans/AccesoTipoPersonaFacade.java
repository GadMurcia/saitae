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
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
@Stateless
public class AccesoTipoPersonaFacade extends AbstractFacade<AccesoTipoPersona> implements AccesoTipoPersonaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccesoTipoPersonaFacade() {
        super(AccesoTipoPersona.class);
    }

    @Override
    public List<TipoPersona> findTipoPersonaPermitidos(Acceso a) {
        return em.createNamedQuery("AccesoTipoPersona.findTipoPersonaByAccesoUrl")
                .setParameter("idacceso", a.getIdacceso())
                .getResultList();
    }
    
    @Override
    public List<Acceso> findAccesoByIdTipoPersona(Integer idTipoPersona){
        return em.createNamedQuery("AccesoTipoPersona.findAccesoByIdTipoPersona")
                .setParameter("idTipoPersona", idTipoPersona)
                .getResultList();
    }

}
