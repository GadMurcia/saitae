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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.Consulta;

/**
 *
 * @author delsas
 */
@Stateless
public class ConsultaFacade extends AbstractFacade<Consulta> implements ConsultaFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConsultaFacade() {
        super(Consulta.class);
    }

    @Override
    public List<String> findMotivosByConsulta(Date fi, Date ff, Integer id) {
        Date f = formatearFEchas(ff, 1), i = formatearFEchas(fi, 0);
        return em.createNamedQuery("Consulta.findMotivosByConsulta")
                .setParameter("fi", i)
                .setParameter("ff", f)
                .setParameter("id", id)
                .getResultList();
    }

    @Override
    public List<Integer> findIdEstudianteByPeriodo(Date fi, Date ff) {
        Date f = formatearFEchas(ff, 1), i = formatearFEchas(fi, 0);
        return em.createNamedQuery("Consulta.findIdEstudianteByPeriodo")
                .setParameter("fi", i)
                .setParameter("ff", f)
                .getResultList();
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
