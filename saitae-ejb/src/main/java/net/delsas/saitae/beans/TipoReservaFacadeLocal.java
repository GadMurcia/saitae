/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoReserva;

/**
 *
 * @author delsas
 */
@Local
public interface TipoReservaFacadeLocal {

    void create(TipoReserva tipoReserva);

    void edit(TipoReserva tipoReserva);

    void remove(TipoReserva tipoReserva);

    TipoReserva find(Object id);

    List<TipoReserva> findAll();

    List<TipoReserva> findRange(int[] range);

    int count();
    
}
