/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoCargo;

/**
 *
 * @author delsas
 */
@Local
public interface TipoCargoFacadeLocal {

    void create(TipoCargo tipoCargo);

    void edit(TipoCargo tipoCargo);

    void remove(TipoCargo tipoCargo);

    TipoCargo find(Object id);

    List<TipoCargo> findAll();

    List<TipoCargo> findRange(int[] range);

    int count();
    
}
