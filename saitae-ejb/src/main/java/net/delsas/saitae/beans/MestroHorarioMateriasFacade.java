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
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;

/**
 *
 * @author delsas
 */
@Stateless
public class MestroHorarioMateriasFacade extends AbstractFacade<MestroHorarioMaterias> implements MestroHorarioMateriasFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MestroHorarioMateriasFacade() {
        super(MestroHorarioMaterias.class);
    }

    @Override
    public List<MestroHorarioMaterias> findByhorarioAndGradoPK(Horario horario, GradoPK gradoPK, DiasEstudio dia) {
        return em.createNamedQuery("MestroHorarioMaterias.findByHorarioAndGrado")
                .setParameter("horario", horario)
                .setParameter("gradoPK", gradoPK)
                .setParameter("dia", dia)
                .getResultList();
    }

    @Override
    public List<MestroHorarioMaterias> findByhorarioAndMaestro(Horario horario, Maestro maestro, DiasEstudio dia) {
        return em.createNamedQuery("MestroHorarioMaterias.findByHorarioAndMaestro")
                .setParameter("horario", horario)
                .setParameter("maestro", maestro)
                .setParameter("dia", dia)
                .getResultList();
    }

    @Override
    public List<MestroHorarioMaterias> findAllOrdered(int año) {
        return em.createNamedQuery("MestroHorarioMaterias.findAllOrdered")
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Maestro> findMaestroByGradopk(GradoPK pk) {
        return em.createNamedQuery("MestroHorarioMaterias.findMaestrosBygrado")
                .setParameter("gradoPK", pk)
                .getResultList();
    }

    @Override
    public List<Materia> findMateriaByIdMaestroAndGradoPK(GradoPK pk, Integer idMaestro) {
        return em.createNamedQuery("MestroHorarioMaterias.findMateriasBygradoPkAndMaestroId")
                .setParameter("gradoPK", pk)
                .setParameter("idMaestro", idMaestro)
                .getResultList();
    }

    @Override
    public List<MestroHorarioMaterias> findByIdHoraAndGradopk(Integer idhora, GradoPK gradpPK) {
        return em.createNamedQuery("MestroHorarioMaterias.findByIdDiaAndGradopk")
                .setParameter("idHora", idhora)
                .setParameter("gradoPK", gradpPK)
                .getResultList();
    }

    @Override
    public List<MestroHorarioMaterias> findByIdHoraAndMaestro(Integer año, Integer idHora, Integer idMaestro) {
        return em.createNamedQuery("MestroHorarioMaterias.findByIdDiaAndMaestro")
                .setParameter("año", año)
                .setParameter("idHora", idHora)
                .setParameter("idMaestro", idMaestro)
                .getResultList();
    }

    @Override
    public List<Integer> findAñosByIdMaestro(Integer idMaestro) {
        return em.createNamedQuery("MestroHorarioMaterias.findAñoByidMaestro")
                .setParameter("idMaestro", idMaestro)
                .getResultList();
    }

    @Override
    public List<MestroHorarioMaterias> findByIdDiaAndGradopkAndidHora(Integer idhora, GradoPK gradpPK, Integer idDia) {
        return em.createNamedQuery("MestroHorarioMaterias.findByIdDiaAndGradopkAndidHora")
                .setParameter("idHora", idhora)
                .setParameter("gradoPK", gradpPK)
                .setParameter("idDia", idDia)
                .getResultList();
    }

    @Override
    public MestroHorarioMaterias finHorarioActual(Integer idMaestro, Date fecha, Integer año) {
        fecha = fecha == null ? new Date() : fecha;
        try {
            fecha = new SimpleDateFormat("hh:mm a").parse(new SimpleDateFormat("hh:mm a").format(fecha));
        } catch (ParseException ex) {
            fecha = new Date();
        }
        List<MestroHorarioMaterias> rs = em.createNamedQuery("MestroHorarioMaterias.finHorarioActual")
                .setParameter("idMaestro", idMaestro)
                .setParameter("año", año)
                .setParameter("fecha", fecha)
                .getResultList();
        if (!rs.isEmpty()) {
            return rs.get(0);
        }
        return null;
    }

}
