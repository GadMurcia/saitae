/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.MaestoCargo;

/**
 *
 * @author delsas
 */
@Local
public interface MaestoCargoFacadeLocal {

    void create(MaestoCargo maestoCargo);

    void edit(MaestoCargo maestoCargo);

    void remove(MaestoCargo maestoCargo);

    MaestoCargo find(Object id);

    List<MaestoCargo> findAll();

    List<MaestoCargo> findRange(int[] range);

    int count();

    /**
     * Devuelve una lista de cargos para el maestro identificado por el id proporcionado
     * @param id
     * @return java.util.List net.delsas.saitae.entities.MaestoCargo
     */
    public List<MaestoCargo> getMaestroCargoByIdMaestro(Integer id);
    
}
