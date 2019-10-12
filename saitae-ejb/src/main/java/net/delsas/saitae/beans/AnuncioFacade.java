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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.TipoPersona;

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
        Date d;
        try {
            d = (new SimpleDateFormat("dd-MM-yyyy").parse(new SimpleDateFormat("dd-MM-yyyy").format(new Date())));
        } catch (ParseException e) {
            d = new Date();
        }
        return em.createNamedQuery("Anuncio.findAnunciosActivos")
                .setParameter("fecha", d)
                .getResultList();
    }

    @Override
    public List<Anuncio> getAnunciosInactivos() {
        Date d;
        try {
            d = (new SimpleDateFormat("dd-MM-yyyy").parse(new SimpleDateFormat("dd-MM-yyyy").format(new Date())));
        } catch (ParseException e) {
            d = new Date();
        }
        return em.createNamedQuery("Anuncio.findAnunciosInactivos")
                .setParameter("fecha", d)
                .getResultList();
    }

    @Override
    public List<Anuncio> getAnunciosActivosParaTodos() {
        Date d;
        try {
            d = (new SimpleDateFormat("dd-MM-yyyy").parse(new SimpleDateFormat("dd-MM-yyyy").format(new Date())));
        } catch (ParseException e) {
            d = new Date();
        }
        return em.createNamedQuery("Anuncio.findAnunciosParaTodos")
                .setParameter("tipo", null)
                .setParameter("fecha", d)
                .getResultList();
    }

    @Override
    public List<Anuncio> getAnunciosActivosParaUnTipo(TipoPersona tipo) {
        Date d;
        try {
            d = (new SimpleDateFormat("dd-MM-yyyy").parse(new SimpleDateFormat("dd-MM-yyyy").format(new Date())));
        } catch (ParseException e) {
            d = new Date();
        }
        return em.createNamedQuery("Anuncio.findAnunciosParaTodos")
                .setParameter("tipo", tipo)
                .setParameter("fecha", d)
                .getResultList();
    }
}
