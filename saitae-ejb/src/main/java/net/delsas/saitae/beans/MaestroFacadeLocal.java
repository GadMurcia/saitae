/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Maestro;

/**
 *
 * @author delsas
 */
@Local
public interface MaestroFacadeLocal {

    void create(Maestro maestro);

    void edit(Maestro maestro);

    void remove(Maestro maestro);

    Maestro find(Object id);

    List<Maestro> findAll();

    List<Maestro> findRange(int[] range);

    int count();
    
    public List<Maestro> getLikeById(int id);
    
}
