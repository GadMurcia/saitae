/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Horario;

/**
 *
 * @author delsas
 */
@Local
public interface HorarioFacadeLocal {

    void create(Horario horario);

    void edit(Horario horario);

    void remove(Horario horario);

    Horario find(Object id);

    List<Horario> findAll();

    List<Horario> findRange(int[] range);

    int count();
    
}
