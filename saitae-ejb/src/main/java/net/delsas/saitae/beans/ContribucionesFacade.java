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
import net.delsas.saitae.entities.Contribuciones;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
@Stateless
public class ContribucionesFacade extends AbstractFacade<Contribuciones> implements ContribucionesFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContribucionesFacade() {
        super(Contribuciones.class);
    }

    @Override
    public List<Contribuciones> findByAño(Integer año) {
        return em.createNamedQuery("Contribuciones.findByAño")
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Contribuciones> findByGrado(GradoPK gpk) {
        return em.createNamedQuery("Contribuciones.findByGrado")
                .setParameter("gPK", gpk)
                .getResultList();
    }

}
