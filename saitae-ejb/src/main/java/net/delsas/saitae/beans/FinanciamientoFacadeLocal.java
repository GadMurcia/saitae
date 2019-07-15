/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Financiamiento;

/**
 *
 * @author delsas
 */
@Local
public interface FinanciamientoFacadeLocal {

    void create(Financiamiento financiamiento);

    void edit(Financiamiento financiamiento);

    void remove(Financiamiento financiamiento);

    Financiamiento find(Object id);

    List<Financiamiento> findAll();

    List<Financiamiento> findRange(int[] range);

    int count();
    
}
