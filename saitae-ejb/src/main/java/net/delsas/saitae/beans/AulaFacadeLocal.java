/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Aula;

/**
 *
 * @author delsas
 */
@Local
public interface AulaFacadeLocal {

    void create(Aula aula);

    void edit(Aula aula);

    void remove(Aula aula);

    Aula find(Object id);

    List<Aula> findAll();

    List<Aula> findRange(int[] range);

    int count();
    
}
