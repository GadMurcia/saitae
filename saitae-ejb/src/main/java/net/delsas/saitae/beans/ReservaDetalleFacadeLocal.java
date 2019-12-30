/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaDetalle;

/**
 *
 * @author delsas
 */
@Local
public interface ReservaDetalleFacadeLocal {

    void create(ReservaDetalle reservaDetalle);

    void edit(ReservaDetalle reservaDetalle);

    void remove(ReservaDetalle reservaDetalle);

    ReservaDetalle find(Object id);

    List<ReservaDetalle> findAll();

    List<ReservaDetalle> findRange(int[] range);

    int count();
    
    /**
     * retorna un objeto reserva identificado por el id proporcionado.
     * @param id
     * @return net.delsas.saitae.Reserva
     */
    public Reserva findReservaByIdReserva(Integer id);
    
}
