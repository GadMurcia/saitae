/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.delsas.saitae.entities.Permisos;

/**
 *
 * @author delsas
 */
@Stateless
public class PermisosFacade extends AbstractFacade<Permisos> implements PermisosFacadeLocal {

    @PersistenceContext(unitName = "net.delsas_saitae-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PermisosFacade() {
        super(Permisos.class);
    }

    @Override
    public List<Permisos> getPermisosPorEstado(String estado, Integer año) {
        return em.createNamedQuery("Permisos.findByPermisosEstado")
                .setParameter("permisoEstado", estado)
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Permisos> findByPEPEs(String estado) {
        return em.createNamedQuery("Permisos.findByPEPEs")
                .setParameter("permisoEstado", estado)
                .setParameter("tipo", 8)
                .getResultList();
    }

    @Override
    public List<Permisos> findByEstadoAndTipos(String estado, List<Integer> tipos, Integer año) {
        return em.createNamedQuery("Permisos.findByEstadoAndTipos")
                .setParameter("permisoEstado", estado)
                .setParameter("tipos", tipos)
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Permisos> findByIpPersona(Integer idPersona, Integer año) {
        return em.createNamedQuery("Permisos.findByIpPersona")
                .setParameter("ipPersona", idPersona)
                .setParameter("año", año)
                .getResultList();
    }

    @Override
    public List<Integer> findAñosGlobales() {
        return em.createNamedQuery("Permisos.findAñosGlobales")
                .getResultList();
    }

    @Override
    public List<Integer> findAñosPersona(Integer idPersona) {
        return em.createNamedQuery("Permisos.findAñosPersona")
                .setParameter("idPersona", idPersona)
                .getResultList();
    }

    @Override
    public List<Permisos> findByIpPersonaAndEstado(int idPersona, Integer año, String a) {
        return em.createNamedQuery("Permisos.findByIpPersonaAndEstado")
                .setParameter("ipPersona", idPersona)
                .setParameter("año", año)
                .setParameter("estado", a)
                .getResultList();
    }
    
    @Override
    public List<Permisos> findByIpPersonaAndEstadoAndFechas(int idPersona, Date fechaInicio, Date FechaFin, String a) {
        return em.createNamedQuery("Permisos.findByIpPersonaAndEstadoAndFechas")
                .setParameter("ipPersona", idPersona)
                .setParameter("fechaInicio", fechaInicio)
                .setParameter("fechaFin", FechaFin)
                .setParameter("estado", a)
                .getResultList();
    }
    
    @Override
    public List<Permisos> findByIpPersonaEFsTP(int idPersona, int año, String a, Integer idTipoPermiso) {
        return em.createNamedQuery("Permisos.findByIpPEFTP")
                .setParameter("ipPersona", idPersona)
                .setParameter("año", año)
                .setParameter("estado", a)
                .setParameter("idTp", idTipoPermiso)
                .getResultList();
    }
}
