/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.SolicitudReserva;

/**
 *
 * @author delsas
 */
@Local
public interface SolicitudReservaFacadeLocal {

    void create(SolicitudReserva solicitudReserva);

    void edit(SolicitudReserva solicitudReserva);

    void remove(SolicitudReserva solicitudReserva);

    SolicitudReserva find(Object id);

    List<SolicitudReserva> findAll();

    List<SolicitudReserva> findRange(int[] range);

    int count();
    
}
