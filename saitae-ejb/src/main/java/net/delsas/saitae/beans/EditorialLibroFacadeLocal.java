/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.EditorialLibro;

/**
 *
 * @author delsas
 */
@Local
public interface EditorialLibroFacadeLocal {

    void create(EditorialLibro editorialLibro);

    void edit(EditorialLibro editorialLibro);

    void remove(EditorialLibro editorialLibro);

    EditorialLibro find(Object id);

    List<EditorialLibro> findAll();

    List<EditorialLibro> findRange(int[] range);

    int count();
    
    List<EditorialLibro> findByIdRecruso(Object idRecurso);
    
}
