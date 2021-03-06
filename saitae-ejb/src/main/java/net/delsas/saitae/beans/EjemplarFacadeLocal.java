/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Collection;
import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Ejemplar;

/**
 *
 * @author delsas
 */
@Local
public interface EjemplarFacadeLocal {

    void create(Ejemplar ejemplar);

    void edit(Ejemplar ejemplar);

    void remove(Ejemplar ejemplar);

    Ejemplar find(Object id);

    List<Ejemplar> findAll();

    List<Ejemplar> findRange(int[] range);

    int count();
    
    /**
     * Retorna la lista de correlativos de ejemplares para el recurso identificado por el id dado.
     * @param idRecurso
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findCorrelativosByIdRecurso(int idRecurso);

    public List<Ejemplar> findEjemplaresByIdRecurso(Integer idrecurso);
    
}
