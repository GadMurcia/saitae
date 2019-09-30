/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.Anuncio;

/**
 *
 * @author delsas
 */
@Stateless
public class AnuncioFacade extends AbstractFacade<Anuncio> implements AnuncioFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AnuncioFacade() {
        super(Anuncio.class);
    }

    @Override
    public List<Anuncio> getAnunciosActivos() {
        Date d = null;
        try {
            d = (new SimpleDateFormat("dd-MM-yyyy").parse(new SimpleDateFormat("dd-MM-yyyy").format(new Date())));
        } catch (ParseException e) {}
        return em.createNamedQuery("Anuncio.findAnunciosActivos")
                .setParameter("fecha", d==null ? new Date() : d)
                .getResultList();
    }

    @Override
    public List<Anuncio> getAnunciosInactivos() {
        Date d = null;
        try {
            d = (new SimpleDateFormat("dd-MM-yyyy").parse(new SimpleDateFormat("dd-MM-yyyy").format(new Date())));
        } catch (ParseException e) {}
        return em.createNamedQuery("Anuncio.findAnunciosInactivos")
                .setParameter("fecha", d==null ? new Date() : d)
                .getResultList();
    }

    @Override
    public List<Anuncio> getAnunciosParaTodos() {
        return em.createNamedQuery("Anuncio.findAnunciosParaTodos")
                .getResultList();
    }
}
