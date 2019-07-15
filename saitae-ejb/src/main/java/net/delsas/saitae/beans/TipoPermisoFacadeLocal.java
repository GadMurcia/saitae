/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoPermiso;

/**
 *
 * @author delsas
 */
@Local
public interface TipoPermisoFacadeLocal {

    void create(TipoPermiso tipoPermiso);

    void edit(TipoPermiso tipoPermiso);

    void remove(TipoPermiso tipoPermiso);

    TipoPermiso find(Object id);

    List<TipoPermiso> findAll();

    List<TipoPermiso> findRange(int[] range);

    int count();
    
}
