/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Contribuciones;

/**
 *
 * @author delsas
 */
@Local
public interface ContribucionesFacadeLocal {

    void create(Contribuciones contribuciones);

    void edit(Contribuciones contribuciones);

    void remove(Contribuciones contribuciones);

    Contribuciones find(Object id);

    List<Contribuciones> findAll();

    List<Contribuciones> findRange(int[] range);

    int count();
    
}
