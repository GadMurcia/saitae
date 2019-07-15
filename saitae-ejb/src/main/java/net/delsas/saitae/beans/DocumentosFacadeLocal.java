/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Documentos;

/**
 *
 * @author delsas
 */
@Local
public interface DocumentosFacadeLocal {

    void create(Documentos documentos);

    void edit(Documentos documentos);

    void remove(Documentos documentos);

    Documentos find(Object id);

    List<Documentos> findAll();

    List<Documentos> findRange(int[] range);

    int count();
    
}
