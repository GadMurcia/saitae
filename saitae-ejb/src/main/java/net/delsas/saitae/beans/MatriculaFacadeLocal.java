/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Local
public interface MatriculaFacadeLocal {

    void create(Matricula matricula);

    void edit(Matricula matricula);

    void remove(Matricula matricula);

    Matricula find(Object id);

    List<Matricula> findAll();

    List<Matricula> findRange(int[] range);

    int count();

    /**
     * Genera una lista de estudiantes matriculados en el grado especificado.
     *
     * @param pk
     * @return java.utilList net.delsas.saitae.entities.Estudiante
     */
    public List<Persona> findMatriculaByGrado(GradoPK pk);

    public List<Matricula> findAllNewEstudent(GradoPK pk);

    /**
     * Devuelve una lista de los grados en los que el estudiante ha estado
     * inscrito.
     *
     * @param idEstudiante
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñoByidEstudiante(Integer idEstudiante);

    /**
     * Devuelve una lista de grados en los que el estudiante ha estado inscrito
     * en el año indicado.
     *
     * @param año
     * @param idEstudiante
     * @return java.util.List net.delsa.saitae.entities.GradoPK
     */
    public List<GradoPK> findGradopkByidEstudianteAndAño(Integer año, Integer idEstudiante);

    /**
     * Devuelve una lista de las matriculas que tiene el estudiante
     *
     * @param idestudiante
     * @return java.util.List net.delsas.saitae.entities.Matricula
     */
    public List<Matricula> findByIdmatricula(Integer idestudiante);

    /**
     * Devuelve el historial de grados en los que el alumno ha estado
     * matriculado
     *
     * @param idEstudiante
     * @return java.util.List net.delsas.saitae.entities.Grado
     */
    public List<Grado> findGradoByidEstudiante(Integer idEstudiante);

    /**
     * Devuelve la cantidad de alumnos activos y matriculados en el año
     * proporcionado
     *
     * @param año
     * @return java.lang.Integer
     */
    public long countActivos(Integer año);

}
