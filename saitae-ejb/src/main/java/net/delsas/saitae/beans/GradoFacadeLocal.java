/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Grado;

/**
 *
 * @author delsas
 */
@Local
public interface GradoFacadeLocal {

    void create(Grado grado);

    void edit(Grado grado);

    void remove(Grado grado);

    Grado find(Object id);

    List<Grado> findAll();

    List<Grado> findRange(int[] range);

    int count();

    /**
     * Lista de años, modalidades y secciones registradas para el un año.
     *
     * @param año
     * @return lista de modalidades
     */
    public List<String> getModalidadPorAño(int año);

    /**
     * Busca los id de los años para la modalidad proporcionada en el año
     * lectivo indicado.
     *
     * @param año
     * @param modalidad
     * @return Lista de años
     */
    public List<Integer> getIdPorAñoyModalidad(int año, String modalidad);

    /**
     * Busca una lista de secciones activas para el grado y modalidad provistas
     * en el año seleccionado.
     *
     * @param año
     * @param modalidad
     * @param idgrado
     * @return lista de Secciones activas.
     */
    public List<String> getSeccionPorAñoModalidadyId(int año, String modalidad, int idgrado);

    /**
     * Genera una lista con los grados activos para el año proporcionado
     *
     * @param año
     * @return Lista de grados
     */
    public List<Grado> getPorAñoYActivo(int año);

    /**
     * Retorna una lista con todos los años registrados para los grados.
     *
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAños();

    /**
     * Retorna una lista de grados para el año proporcionado
     *
     * @param año
     * @return java.util.List net.delsas.saitae.entities.Grado
     */
    public List<Grado> findByGradoAño(Integer año);

    /**
     * Devuelve ua lista de grados en los que el maestro identificado por el id
     * proporcionado es guía.
     *
     * @param idMaestro
     * @return java.util.List net.delsas.saitae.entities.Grado
     */
    public List<Grado> findByidMaestro(Integer idMaestro);

}
