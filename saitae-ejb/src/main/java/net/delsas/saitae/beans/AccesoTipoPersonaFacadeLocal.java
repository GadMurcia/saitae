/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
@Local
public interface AccesoTipoPersonaFacadeLocal {

    void create(AccesoTipoPersona accesoTipoPersona);

    void edit(AccesoTipoPersona accesoTipoPersona);

    void remove(AccesoTipoPersona accesoTipoPersona);

    AccesoTipoPersona find(Object id);

    List<AccesoTipoPersona> findAll();

    List<AccesoTipoPersona> findRange(int[] range);

    int count();

    /**
     * Busca Los tipos de personas que están habilitados para ver los accesos
     * proporcionados en la lista
     *
     * @param as
     * @return java.util.List net.delsas.saitae.entities.Acceso
     */
    public List<TipoPersona> findTipoPersonaPermitidos(List<Acceso> as);

    /**
     * Devuelve una lista de accesos para el tipo de personas identificado por
     * el id proporcionado.
     *
     * @param idTipoPersona
     * @return java.util.List net.delsas.saitae.entities.Acceso
     */
    public List<Acceso> findAccesoByIdTipoPersona(Integer idTipoPersona);

}
