/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Constancias;

/**
 *
 * @author delsas
 */
@Local
public interface ConstanciasFacadeLocal {

    void create(Constancias constancias);

    void edit(Constancias constancias);

    void remove(Constancias constancias);

    Constancias find(Object id);

    List<Constancias> findAll();

    List<Constancias> findRange(int[] range);

    int count();
    
}
