/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.ContenidoLibro;

/**
 *
 * @author delsas
 */
@Local
public interface ContenidoLibroFacadeLocal {

    void create(ContenidoLibro contenidoLibro);

    void edit(ContenidoLibro contenidoLibro);

    void remove(ContenidoLibro contenidoLibro);

    ContenidoLibro find(Object id);

    List<ContenidoLibro> findAll();

    List<ContenidoLibro> findRange(int[] range);

    int count();
    
}
