/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Recurso;

/**
 *
 * @author delsas
 */
@Local
public interface RecursoFacadeLocal {

    void create(Recurso recurso);

    void edit(Recurso recurso);

    void remove(Recurso recurso);

    Recurso find(Object id);

    List<Recurso> findAll();

    List<Recurso> findRange(int[] range);

    int count();

    /**
     * Devuelve lista de recursos con el tipo de recurso especificado.
     *
     * @param tipoRecurso
     * @return java.util.List net.delsas.saitae.entities.Recurso
     */
    public List<Recurso> findByTipoRecurso(Integer tipoRecurso);

}
