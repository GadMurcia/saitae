/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Autor;

/**
 *
 * @author delsas
 */
@Local
public interface AutorFacadeLocal {

    void create(Autor autor);

    void edit(Autor autor);

    void remove(Autor autor);

    Autor find(Object id);

    List<Autor> findAll();

    List<Autor> findRange(int[] range);

    int count();
    
}
