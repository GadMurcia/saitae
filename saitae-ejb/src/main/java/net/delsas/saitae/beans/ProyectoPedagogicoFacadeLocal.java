/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.ProyectoPedagogico;

/**
 *
 * @author delsas
 */
@Local
public interface ProyectoPedagogicoFacadeLocal {

    void create(ProyectoPedagogico proyectoPedagogico);

    void edit(ProyectoPedagogico proyectoPedagogico);

    void remove(ProyectoPedagogico proyectoPedagogico);

    ProyectoPedagogico find(Object id);

    List<ProyectoPedagogico> findAll();

    List<ProyectoPedagogico> findRange(int[] range);

    int count();
    
}
