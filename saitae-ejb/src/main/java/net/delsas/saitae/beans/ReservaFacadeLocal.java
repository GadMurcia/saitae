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
     * Busca y devuelve un objeto Reserva que cincide con la fecha hora proporcionada
     * @param feha_hora
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public Reserva getReservaByFechaHora(Date feha_hora);

    int count();
    
    /**
     * Devuelve una lista de objetos reserva cuyo estado concuerde con la cadena proporcionada.
     * @param estado
     * @return java.util.List net.delsas.saitae.entities.Reserva
     */
    public List<Reserva> getReservaByEstado(String estado);
    
}
