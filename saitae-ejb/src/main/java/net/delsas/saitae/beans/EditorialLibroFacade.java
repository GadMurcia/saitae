/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.EditorialLibro;

/**
 *
 * @author delsas
 */
@Stateless
public class EditorialLibroFacade extends AbstractFacade<EditorialLibro> implements EditorialLibroFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EditorialLibroFacade() {
        super(EditorialLibro.class);
    }
    
}
