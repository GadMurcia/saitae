/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Contribuciones;
import net.delsas.saitae.entities.GradoPK;

/**
 *
 * @author delsas
 */
@Local
public interface ContribucionesFacadeLocal {

    void create(Contribuciones contribuciones);

    void edit(Contribuciones contribuciones);

    void remove(Contribuciones contribuciones);

    Contribuciones find(Object id);

    List<Contribuciones> findAll();

    List<Contribuciones> findRange(int[] range);

    int count();

    /**
     * DEvuelve una lista con todas las contribuciones que se han hecho en el
     * año proporcionado.
     *
     * @param año
     * @return java.util.LList net.delsas.saite.entities.Contribuciones
     */
    public List<Contribuciones> findByAño(Integer año);

    /**
     * Devuelve una lista con las contribuciones realizadas para el prago
     * proporcionado.
     *
     * @param gpk
     * @return java.util.LList net.delsas.saite.entities.Contribuciones
     */
    public List<Contribuciones> findByGrado(GradoPK gpk);

}
