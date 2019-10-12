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
    
    /**
     * Busca los permisos que estén en el estado indicado.
     * @param estado
     * @return java.util.List net.delsas.saitae.entities.Permisos
     */
    public List<Permisos> getPermisosPorEstado(String estado);

    /**
     * Busca los permisos pa estudiantes que estén en el estado indicado.
     * @param estado
     * @return java.util.List net.delsas.saitae.entities.Permisos
     */
    public List<Permisos> findByPEPEs(String estado);
    
}
