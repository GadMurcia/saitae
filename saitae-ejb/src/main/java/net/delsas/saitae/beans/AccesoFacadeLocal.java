/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Acceso;

/**
 *
 * @author delsas
 */
@Local
public interface AccesoFacadeLocal {

    void create(Acceso acceso);

    void edit(Acceso acceso);

    void remove(Acceso acceso);

    Acceso find(Object id);

    List<Acceso> findAll();

    List<Acceso> findRange(int[] range);

    int count();

    /**
     *Busca un acceso en la base de datos saitae por medio de su url Relativa
     * @param url
     * @return Acceso
     */
    public Acceso getAccesoByUrl(String url);
    
}
