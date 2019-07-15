/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Anuncio;

/**
 *
 * @author delsas
 */
@Local
public interface AnuncioFacadeLocal {

    void create(Anuncio anuncio);

    void edit(Anuncio anuncio);

    void remove(Anuncio anuncio);

    Anuncio find(Object id);

    List<Anuncio> findAll();

    List<Anuncio> findRange(int[] range);

    int count();
    
}
