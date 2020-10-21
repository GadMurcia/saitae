/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Capacitaciones;

/**
 *
 * @author delsas
 */
@Local
public interface CapacitacionesFacadeLocal {

    void create(Capacitaciones capacitaciones);

    void edit(Capacitaciones capacitaciones);

    void remove(Capacitaciones capacitaciones);

    Capacitaciones find(Object id);

    List<Capacitaciones> findAll();

    List<Capacitaciones> findRange(int[] range);

    int count();

    public List<Capacitaciones> findByIdPersona(Integer idpersona);
    
}
