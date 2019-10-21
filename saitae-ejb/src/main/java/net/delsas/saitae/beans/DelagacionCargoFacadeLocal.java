/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.DelagacionCargo;

/**
 *
 * @author delsas
 */
@Local
public interface DelagacionCargoFacadeLocal {

    void create(DelagacionCargo delagacionCargo);

    void edit(DelagacionCargo delagacionCargo);

    void remove(DelagacionCargo delagacionCargo);

    DelagacionCargo find(Object id);

    List<DelagacionCargo> findAll();

    List<DelagacionCargo> findRange(int[] range);

    int count();

    /**
     *  Devuelve ua lista de delegaciones para el id de la persona proporcionado
     * @param id
     * @return java.util.List net.delsas.saitae.entities.DelagacionCargo
     */
    public List<DelagacionCargo> getDelegacionCargoByIdPersona(Integer id);
    
}
