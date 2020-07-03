/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.CitaPsicologia;
import net.delsas.saitae.entities.ConsultaPK;

/**
 *
 * @author delsas
 */
@Stateless
public class CitaPsicologiaFacade extends AbstractFacade<CitaPsicologia> implements CitaPsicologiaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CitaPsicologiaFacade() {
        super(CitaPsicologia.class);
    }

    @Override
    public List<CitaPsicologia> findByEstudiante(Integer idEstudiante, Integer año) {
        return em.createNamedQuery("CitaPsicologia.findByEstudiante")
                .setParameter("estudiante", idEstudiante)
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<CitaPsicologia> findByEstado(String estado, Integer año) {
        return em.createNamedQuery("CitaPsicologia.findByEstado")
                .setParameter("estado", estado)
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<CitaPsicologia> findConsultados(Integer año) {
        return em.createNamedQuery("CitaPsicologia.findConsultados")
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Integer> findAñosGlobales() {
        return em.createNamedQuery("CitaPsicologia.findAñosGlobales").getResultList();
    }

    @Override
    public List<Integer> findAñosPersonales(Integer idEstudiante) {
        return em.createNamedQuery("CitaPsicologia.findAñosPersonales")
                .setParameter("idEstudiante", idEstudiante)
                .getResultList();
    }

    @Override
    public Integer countSolicitadas(Date fi, Date ff, Integer id) {
        Date f = formatearFEchas(ff, 1), i = formatearFEchas(fi, 0);
        return new Integer(em.createNamedQuery("CitaPsicologia.countSolicitadas")
                .setParameter("ff", f)
                .setParameter("fi", i)
                .setParameter("id", id)
                .getSingleResult().toString());
    }

    @Override
    public Integer countConsultadas(Date fi, Date ff, Integer id) {
        Date f = formatearFEchas(ff, 1), i = formatearFEchas(fi, 0);
        return new Integer(em.createNamedQuery("CitaPsicologia.countConsultadas")
                .setParameter("ff", f)
                .setParameter("fi", i)
                .setParameter("id", id)
                .getSingleResult().toString());
    }

    private Date formatearFEchas(Date a, int m) {
        Date i;
        try {
            i = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss")
                    .parse(new SimpleDateFormat("dd/MM/yyyy").format(a)
                            + (m == 1 ? " 23:59:59" : " 00:00:00"));
        } catch (ParseException ex) {
            i = a;
        }
        return i;
    }
}
