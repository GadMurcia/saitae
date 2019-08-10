/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Ejemplar;

/**
 *
 * @author delsas
 */
@Local
public interface EjemplarFacadeLocal {

    void create(Ejemplar ejemplar);

    void edit(Ejemplar ejemplar);

    void remove(Ejemplar ejemplar);

    Ejemplar find(Object id);

    List<Ejemplar> findAll();

    List<Ejemplar> findRange(int[] range);

    int count();
    
    List<Ejemplar> findByIdRecruso(Object idRecurso);
    
}
