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
     * con el id proporcionado.
     *
     * @param idEstudiante
     * @return java.util.List net.delsas.saitae.entities.CitaPsicologia
     */
    public List<CitaPsicologia> findByEstudiante(Integer idEstudiante);

    /**
     * devuelve una lista con las citas marcadas con el estado proporcionado.
     *
     * @param estado
     * @return java.util.List net.delsas.saitae.entities.CitaPsicologia
     */
    public List<CitaPsicologia> findByEstado(String estado);

}
