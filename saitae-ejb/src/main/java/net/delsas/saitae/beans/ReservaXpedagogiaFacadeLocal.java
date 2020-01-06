/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.ProyectoPedagogico;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaXpedagogia;

/**
 *
 * @author delsas
 */
@Local
public interface ReservaXpedagogiaFacadeLocal {

    void create(ReservaXpedagogia reservaXpedagogia);

    void edit(ReservaXpedagogia reservaXpedagogia);

    void remove(ReservaXpedagogia reservaXpedagogia);

    ReservaXpedagogia find(Object id);

    List<ReservaXpedagogia> findAll();

    List<ReservaXpedagogia> findRange(int[] range);

    int count();

    /**
     * Devuelve almenos un objeto ProyectoPedagogico si hay alguno relacionado
     * con la reserva con el id proporcionado
     *
     * @param idReserva
     * @return java.util.List net.delsas.saite.entities.ProyectoPedagogico
     */
    public List<ProyectoPedagogico> findProyectoByIdReserva(Integer idReserva);
    
    /**
     * Devuelve almenos un objeto Reserva si hay alguno relacionado
     * con el ProyectoPedagogico con el id proporcionado
     *
     * @param idproyecto 
     * @return java.util.List net.delsas.saite.entities.ProyectoPedagogico
     */
    public List<Reserva> findReservaByIdProyecto(Integer idproyecto);

}
