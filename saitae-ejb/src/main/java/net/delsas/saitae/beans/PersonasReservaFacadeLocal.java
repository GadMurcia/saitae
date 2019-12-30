/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.PersonasReserva;

/**
 *
 * @author delsas
 */
@Local
public interface PersonasReservaFacadeLocal {

    void create(PersonasReserva personasReserva);

    void edit(PersonasReserva personasReserva);

    void remove(PersonasReserva personasReserva);

    PersonasReserva find(Object id);

    List<PersonasReserva> findAll();

    List<PersonasReserva> findRange(int[] range);

    int count();

    /**
     * Retorna una lista de las personas involucradas en la reserva de equipo.
     * @param id
     * @return java.util.List net.delsas.saitae.entities.PersonasReserva
     */
    public List<PersonasReserva> findByIdReserva(Integer id);
    
}
