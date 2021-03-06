/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.ExpedientePS;

/**
 *
 * @author delsas
 */
@Local
public interface ExpedientePSFacadeLocal {

    void create(ExpedientePS expedientePS);

    void edit(ExpedientePS expedientePS);

    void remove(ExpedientePS expedientePS);

    ExpedientePS find(Object id);

    List<ExpedientePS> findAll();

    List<ExpedientePS> findRange(int[] range);

    int count();
    
}
