/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Permisos;

/**
 *
 * @author delsas
 */
@Local
public interface PermisosFacadeLocal {

    void create(Permisos permisos);

    void edit(Permisos permisos);

    void remove(Permisos permisos);

    Permisos find(Object id);

    List<Permisos> findAll();

    List<Permisos> findRange(int[] range);

    int count();

    /**
     * Busca los permisos que estén en el estado indicado.
     *
     * @param estado
     * @param año
     * @return java.util.List net.delsas.saitae.entities.Permisos
     */
    public List<Permisos> getPermisosPorEstado(String estado, Integer año);

    /**
     * Busca los permisos pa estudiantes que estén en el estado indicado.
     *
     * @param estado
     * @return java.util.List net.delsas.saitae.entities.Permisos
     */
    public List<Permisos> findByPEPEs(String estado);

    /**
     * Devuelve una lista con los permisos solicitados por la persona
     * identificaa por el id proporcionado ordenados de forma ascendente por el
     * estado del permiso.
     *
     * @param idPersona
     * @param año
     * @return
     */
    public List<Permisos> findByIpPersona(Integer idPersona, Integer año);

    /**
     * Devuelve una lista con los permisos con el estado indicado y en los que
     * los solicitantes tienen un idTipoPersona que se encuentre entre los
     * indicados en la lista
     *
     * @param estado
     * @param tiposAListar
     * @param año
     * @return java.util.List net.delsas.saitae.entities.Permisos
     */
    public List<Permisos> findByEstadoAndTipos(String estado, List<Integer> tiposAListar, Integer año);

    /**
     * devuelve una lista con todos los años en los que se han seleccionado
     * permisos;
     *
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosGlobales();

    /**
     * devuelve una lista con todos los años en los que se han seleccionado
     * permisos para la persona indicada;
     *
     * @param idPersona
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosPersona(Integer idPersona);

    public List<Permisos> findByIpPersonaAndEstado(int i, Integer añoActual, String a);

    public List<Permisos> findByIpPersonaAndEstadoAndFechas(int idPersona, Date fechaInicio, Date FechaFin, String a);

    /**
     * Devuelve una lista de permisos que le han sido aprobados a la persona
     * indicada entre las fechas proporcionadas y del tipo de permiso indicado.
     *
     * @param idPersona
     * @param año
     * @param a
     * @param idTipoPermiso
     * @return java.util.List net.delsas.entities.Permisos
     */
    public List<Permisos> findByIpPersonaEFsTP(int idPersona, int año, String a, Integer idTipoPermiso);
}
