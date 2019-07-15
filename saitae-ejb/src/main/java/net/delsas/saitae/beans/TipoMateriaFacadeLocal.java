/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoMateria;

/**
 *
 * @author delsas
 */
@Local
public interface TipoMateriaFacadeLocal {

    void create(TipoMateria tipoMateria);

    void edit(TipoMateria tipoMateria);

    void remove(TipoMateria tipoMateria);

    TipoMateria find(Object id);

    List<TipoMateria> findAll();

    List<TipoMateria> findRange(int[] range);

    int count();
    
}
