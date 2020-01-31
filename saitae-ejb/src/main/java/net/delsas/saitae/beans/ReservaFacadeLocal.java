/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Reserva;

/**
 *
 * @author delsas
 */
@Local
public interface ReservaFacadeLocal {

    void create(Reserva reserva);

    void edit(Reserva reserva);

    void remove(Reserva reserva);

    Reserva find(Object id);

    List<Reserva> findAll();

    List<Reserva> findRange(int[] range);

    /**
     * Busca y devuelve un objeto Reserva que cincide con la fecha hora
     * proporcionada
     *
     * @param feha_hora
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public Reserva getReservaByFechaHora(Date feha_hora);

    int count();

    /**
     * Devuelve una lista de objetos reserva cuyo estado concuerde con la cadena
     * y el año proporcionados.
     *
     * @param estado
     * @param año
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public List<Reserva> getReservaByEstado(String estado, Integer año);

    /**
     * retorna una lista de reservas que concuerden con el estado, el id del
     * tipo de recurso y el año proporcionados
     *
     * @param estado
     * @param idTipoRecurso
     * @param año
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public List<Reserva> findByEstadoAndIdTipoRecurso(String estado, Integer idTipoRecurso, Integer año);

    /**
     * Genera una lista con las reservas en las que la persona identificada con
     * el id proporcionado está relacionada.
     *
     * @param idpersona
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public List<Reserva> getReservaByIdUsuario(Integer idpersona);

    /**
     * Devuelve una lista de años en los que se han hecho resrvas
     *
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosGlobales();

}
