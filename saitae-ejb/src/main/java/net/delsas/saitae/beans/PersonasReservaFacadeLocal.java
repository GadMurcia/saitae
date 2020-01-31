/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.Reserva;

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
     *
     * @param id
     * @return java.util.List net.delsas.saitae.entities.PersonasReserva
     */
    public List<PersonasReserva> findByIdReserva(Integer id);

    /**
     * Devuelve una lista de las reservas solicitadas por la persona con id y en
     * el año proporcionados.
     *
     * @param idPersona
     * @param año
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public List<Reserva> findReservaByIdpersona(Integer idPersona, Integer año);

    /**
     * Devuelve una lista de todos los años en los que la persona identificada
     * con el id ha hecho reservas.
     *
     * @param idPersona
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosPersonasles(Integer idPersona);

}
