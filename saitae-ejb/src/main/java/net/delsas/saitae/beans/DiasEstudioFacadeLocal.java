/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.DiasEstudio;

/**
 *
 * @author delsas
 */
@Local
public interface DiasEstudioFacadeLocal {

    void create(DiasEstudio diasEstudio);

    void edit(DiasEstudio diasEstudio);

    void remove(DiasEstudio diasEstudio);

    DiasEstudio find(Object id);

    List<DiasEstudio> findAll();

    List<DiasEstudio> findRange(int[] range);

    int count();
    
}
