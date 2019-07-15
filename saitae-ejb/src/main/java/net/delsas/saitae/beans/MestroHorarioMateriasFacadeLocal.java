/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.MestroHorarioMaterias;

/**
 *
 * @author delsas
 */
@Local
public interface MestroHorarioMateriasFacadeLocal {

    void create(MestroHorarioMaterias mestroHorarioMaterias);

    void edit(MestroHorarioMaterias mestroHorarioMaterias);

    void remove(MestroHorarioMaterias mestroHorarioMaterias);

    MestroHorarioMaterias find(Object id);

    List<MestroHorarioMaterias> findAll();

    List<MestroHorarioMaterias> findRange(int[] range);

    int count();
    
}
