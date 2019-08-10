/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.AutorLibro;

/**
 *
 * @author delsas
 */
@Local
public interface AutorLibroFacadeLocal {

    void create(AutorLibro autorLibro);

    void edit(AutorLibro autorLibro);

    void remove(AutorLibro autorLibro);

    AutorLibro find(Object id);

    List<AutorLibro> findAll();

    List<AutorLibro> findRange(int[] range);

    int count();
    
    List<AutorLibro> findByIdRecruso(Object idRecurso);
    
}
