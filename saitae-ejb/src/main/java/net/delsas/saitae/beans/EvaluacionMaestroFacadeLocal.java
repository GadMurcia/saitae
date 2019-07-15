/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.EvaluacionMaestro;

/**
 *
 * @author delsas
 */
@Local
public interface EvaluacionMaestroFacadeLocal {

    void create(EvaluacionMaestro evaluacionMaestro);

    void edit(EvaluacionMaestro evaluacionMaestro);

    void remove(EvaluacionMaestro evaluacionMaestro);

    EvaluacionMaestro find(Object id);

    List<EvaluacionMaestro> findAll();

    List<EvaluacionMaestro> findRange(int[] range);

    int count();
    
}
