/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoSueldos;

/**
 *
 * @author delsas
 */
@Local
public interface TipoSueldosFacadeLocal {

    void create(TipoSueldos tipoSueldos);

    void edit(TipoSueldos tipoSueldos);

    void remove(TipoSueldos tipoSueldos);

    TipoSueldos find(Object id);

    List<TipoSueldos> findAll();

    List<TipoSueldos> findRange(int[] range);

    int count();
    
}
