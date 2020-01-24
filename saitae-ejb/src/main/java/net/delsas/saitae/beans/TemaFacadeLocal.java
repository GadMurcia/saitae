/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Tema;

/**
 *
 * @author delsas
 */
@Local
public interface TemaFacadeLocal {

    void create(Tema tema);

    void edit(Tema tema);

    void remove(Tema tema);

    Tema find(Object id);

    List<Tema> findAll();

    List<Tema> findRange(int[] range);

    int count();
    
}
