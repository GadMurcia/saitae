/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoRecurso;

/**
 *
 * @author delsas
 */
@Local
public interface TipoRecursoFacadeLocal {

    void create(TipoRecurso tipoRecurso);

    void edit(TipoRecurso tipoRecurso);

    void remove(TipoRecurso tipoRecurso);

    TipoRecurso find(Object id);

    List<TipoRecurso> findAll();

    List<TipoRecurso> findRange(int[] range);

    int count();
    
}
