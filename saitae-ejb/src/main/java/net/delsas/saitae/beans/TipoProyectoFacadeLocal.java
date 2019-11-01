/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoProyecto;

/**
 *
 * @author delsas
 */
@Local
public interface TipoProyectoFacadeLocal {

    void create(TipoProyecto tipoProyecto);

    void edit(TipoProyecto tipoProyecto);

    void remove(TipoProyecto tipoProyecto);

    TipoProyecto find(Object id);

    List<TipoProyecto> findAll();

    List<TipoProyecto> findRange(int[] range);

    int count();
    
}
