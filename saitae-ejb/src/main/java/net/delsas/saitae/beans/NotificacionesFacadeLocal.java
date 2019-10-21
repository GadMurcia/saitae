/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Notificaciones;

/**
 *
 * @author delsas
 */
@Local
public interface NotificacionesFacadeLocal {

    void create(Notificaciones notificaciones);

    void edit(Notificaciones notificaciones);

    void remove(Notificaciones notificaciones);

    Notificaciones find(Object id);

    List<Notificaciones> findAll();

    List<Notificaciones> findRange(int[] range);

    int count();

    /**
     * DEVUELVE UNA LISTA DE NOTIFICACIONES CUYO DESTINATARIO SE IDENTIFICA MEDIANTE EL ID PROPORCIONADO
     * @param id
     * @return java.util.List net.delsas.saitae.entities.Notificaciones
     */
    public List<Notificaciones> getNotificacionesByIdDestinatario(Integer id);
    
}
