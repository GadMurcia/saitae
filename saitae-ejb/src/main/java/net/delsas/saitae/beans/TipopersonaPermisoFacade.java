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
import net.delsas.saitae.entities.TipopersonaPermiso;

/**
 *
 * @author delsas
 */
@Stateless
public class TipopersonaPermisoFacade extends AbstractFacade<TipopersonaPermiso> implements TipopersonaPermisoFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipopersonaPermisoFacade() {
        super(TipopersonaPermiso.class);
    }

    @Override
    public List<TipopersonaPermiso> tiposPermisosPorPersona(int idTipoPersona) {
        Query q = this.getEntityManager().createNamedQuery("TipopersonaPermiso.findByIdtipopersona");
        q.setParameter("idtipopersona", idTipoPersona);
        return q.getResultList();
    }
}
