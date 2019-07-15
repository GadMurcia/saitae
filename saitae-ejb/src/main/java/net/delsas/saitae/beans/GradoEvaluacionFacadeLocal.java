/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.GradoEvaluacion;

/**
 *
 * @author delsas
 */
@Local
public interface GradoEvaluacionFacadeLocal {

    void create(GradoEvaluacion gradoEvaluacion);

    void edit(GradoEvaluacion gradoEvaluacion);

    void remove(GradoEvaluacion gradoEvaluacion);

    GradoEvaluacion find(Object id);

    List<GradoEvaluacion> findAll();

    List<GradoEvaluacion> findRange(int[] range);

    int count();
    
}
