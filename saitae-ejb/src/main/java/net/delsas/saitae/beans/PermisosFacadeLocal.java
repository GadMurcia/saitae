/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Permisos;

/**
 *
 * @author delsas
 */
@Local
public interface PermisosFacadeLocal {

    void create(Permisos permisos);

    void edit(Permisos permisos);

    void remove(Permisos permisos);

    Permisos find(Object id);

    List<Permisos> findAll();

    List<Permisos> findRange(int[] range);

    int count();
    
}
