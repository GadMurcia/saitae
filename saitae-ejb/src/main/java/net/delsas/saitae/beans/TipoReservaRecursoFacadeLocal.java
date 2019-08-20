/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoReservaRecurso;

/**
 *
 * @author delsas
 */
@Local
public interface TipoReservaRecursoFacadeLocal {

    void create(TipoReservaRecurso tipoReservaRecurso);

    void edit(TipoReservaRecurso tipoReservaRecurso);

    void remove(TipoReservaRecurso tipoReservaRecurso);

    TipoReservaRecurso find(Object id);

    List<TipoReservaRecurso> findAll();

    List<TipoReservaRecurso> findRange(int[] range);

    int count();
    
}
