/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;

/**
 *
 * @author delsas
 */
@Local
public interface TipopersonaPermisoFacadeLocal {

    void create(TipopersonaPermiso tipopersonaPermiso);

    void edit(TipopersonaPermiso tipopersonaPermiso);

    void remove(TipopersonaPermiso tipopersonaPermiso);

    TipopersonaPermiso find(Object id);

    List<TipopersonaPermiso> findAll();

    List<TipopersonaPermiso> findRange(int[] range);

    int count();

    /**
     * Devuelve una lista con todos los tipos de permisos asignados al Tipo de
     * persona indicada.
     *
     * @param idTipoPersona
     * @return java.util.List net.delsas.saitae.entities.TipoPermiso
     */
    public List<TipoPermiso> findTipoPermisoByIdtipopersona(int idTipoPersona);

}
