/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.EntregaUtiles;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
@Local
public interface EntregaUtilesFacadeLocal {

    void create(EntregaUtiles entregaUtiles);

    void edit(EntregaUtiles entregaUtiles);

    void remove(EntregaUtiles entregaUtiles);

    EntregaUtiles find(Object id);

    List<EntregaUtiles> findAll();

    List<EntregaUtiles> findRange(int[] range);

    int count();

    /**
     * Devuelve una Lista de las entregas que se han hecho en el año
     * proporcionado
     *
     * @param año
     * @return java.util.List net.delsas.saitae.entities.EntregaUtiles
     */
    public List<EntregaUtiles> findByAño(Integer año);

    /**
     * Devuelve una Lista de las entregas que se han hecho en el grado
     * proporcionado
     *
     * @param gPK
     * @return java.util.List net.delsas.saitae.entities.EntregaUtiles
     */
    public List<EntregaUtiles> findByGrado(GradoPK gPK);

}
