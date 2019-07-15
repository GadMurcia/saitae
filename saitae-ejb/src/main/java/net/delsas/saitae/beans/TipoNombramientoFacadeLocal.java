/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoNombramiento;

/**
 *
 * @author delsas
 */
@Local
public interface TipoNombramientoFacadeLocal {

    void create(TipoNombramiento tipoNombramiento);

    void edit(TipoNombramiento tipoNombramiento);

    void remove(TipoNombramiento tipoNombramiento);

    TipoNombramiento find(Object id);

    List<TipoNombramiento> findAll();

    List<TipoNombramiento> findRange(int[] range);

    int count();
    
}
