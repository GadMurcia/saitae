/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.CitaPsicologia;

/**
 *
 * @author delsas
 */
@Local
public interface CitaPsicologiaFacadeLocal {

    void create(CitaPsicologia citaPsicologia);

    void edit(CitaPsicologia citaPsicologia);

    void remove(CitaPsicologia citaPsicologia);

    CitaPsicologia find(Object id);

    List<CitaPsicologia> findAll();

    List<CitaPsicologia> findRange(int[] range);

    int count();

    /**
     * Devuelve una lista de citas solicitadas pro el estudiante identificado
     * con el id y año proporcionados.
     *
     * @param idEstudiante
     * @param año
     * @return java.util.List net.delsas.saitae.entities.CitaPsicologia
     */
    public List<CitaPsicologia> findByEstudiante(Integer idEstudiante, Integer año);

    /**
     * Devuelve una lista con las citas marcadas con el estado y año
     * proporcionados.
     *
     * @param estado
     * @param año
     * @return java.util.List net.delsas.saitae.entities.CitaPsicologia
     */
    public List<CitaPsicologia> findByEstado(String estado, Integer año);

    /**
     * Devuelve una lista de citas que han sido atendidas en consultas en el año
     * proporcionado.
     *
     * @param año
     * @return java.util.List net.delsas.saitae.entities.CitaPsicologia
     */
    public List<CitaPsicologia> findConsultados(Integer año);

    /**
     * Devuelve la lista con todos los años en los que se han pedido citas con
     * el psicólogo.
     *
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosGlobales();

    /**
     * Devuelve una lista con los años en los que el estudiante ha solicitado
     * citas con el psicólogo.
     *
     * @param idEstudiante
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosPersonales(Integer idEstudiante);

}
