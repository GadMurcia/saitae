/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Editorial;

/**
 *
 * @author delsas
 */
@Local
public interface EditorialFacadeLocal {

    void create(Editorial editorial);

    void edit(Editorial editorial);

    void remove(Editorial editorial);

    Editorial find(Object id);

    List<Editorial> findAll();

    List<Editorial> findRange(int[] range);

    int count();
    
}
