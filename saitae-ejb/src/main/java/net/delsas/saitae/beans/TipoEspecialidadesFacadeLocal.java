/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.TipoEspecialidades;

/**
 *
 * @author delsas
 */
@Local
public interface TipoEspecialidadesFacadeLocal {

    void create(TipoEspecialidades tipoEspecialidades);

    void edit(TipoEspecialidades tipoEspecialidades);

    void remove(TipoEspecialidades tipoEspecialidades);

    TipoEspecialidades find(Object id);

    List<TipoEspecialidades> findAll();

    List<TipoEspecialidades> findRange(int[] range);

    int count();
    
}
