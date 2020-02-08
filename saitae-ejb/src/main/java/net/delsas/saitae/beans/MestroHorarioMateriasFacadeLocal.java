/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;

/**
 *
 * @author delsas
 */
@Local
public interface MestroHorarioMateriasFacadeLocal {

    void create(MestroHorarioMaterias mestroHorarioMaterias);

    void edit(MestroHorarioMaterias mestroHorarioMaterias);

    void remove(MestroHorarioMaterias mestroHorarioMaterias);

    MestroHorarioMaterias find(Object id);

    List<MestroHorarioMaterias> findAll();

    List<MestroHorarioMaterias> findRange(int[] range);

    int count();

    /**
     * Busca en la base de datos la existencia de un horario asignado en un
     * grado y dia especificados
     *
     * @param horario
     * @param gradoPK
     * @param dia
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findByhorarioAndGradoPK(Horario horario, GradoPK gradoPK, DiasEstudio dia);

    /**
     * Busca en la base de datos la existencia de un horario asignado a un
     * maestro en un grado especificados
     *
     * @param horario
     * @param maestro
     * @param dia
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findByhorarioAndMaestro(Horario horario, Maestro maestro, DiasEstudio dia);

    /**
     * Obtiene una lista de maestrosHorarioMaterias e el año proporcionado
     * ordenada por días, horario, materia, grado, y maestro
     *
     * @param año
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findAllOrdered(int año);

    /**
     * Devuelve una lista de maestros que imparten clases en el grado
     * identificado por la pk dada.
     *
     * @param pk
     * @return java.util.List net.delsas.saitae.entities.Maestro
     */
    public List<Maestro> findMaestroByGradopk(GradoPK pk);

    /**
     * Devuelve una lista de materias que el maestro identificado por su id
     * imparte en el grado identificado por su pk dados
     *
     * @param pk
     * @param idMaestro
     * @return java.util.List net.delsas.saitae.entities.Materia
     */
    public List<Materia> findMateriaByIdMaestroAndGradoPK(GradoPK pk, Integer idMaestro);

    /**
     * Devuelve una lista con los horarios para el día y grados proporcionados.
     *
     * @param idhora
     * @param gradpPK
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findByIdHoraAndGradopk(Integer idhora, GradoPK gradpPK);

    /**
     * Devuelve una lista de horarios para el día y el maestro proporcionados.
     *
     * @param año
     * @param idhora
     * @param idMaestro
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findByIdHoraAndMaestro(Integer año, Integer idhora, Integer idMaestro);

    /**
     * Devuelve una lista de años desde que el maestro tiene asignadas materias.
     *
     * @param idMaestro
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findAñosByIdMaestro(Integer idMaestro);

    /**
     * Devuelve una lista con los horarios para el día, grados y horario
     * proporcionados.
     *
     * @param idhora
     * @param gradpPK
     * @param idDia
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findByIdDiaAndGradopkAndidHora(Integer idhora, GradoPK gradpPK, Integer idDia);

    /**
     * Deuelve la asignación en la que el maestro está para el horario y año
     * proporcionados.
     *
     * @param idMaestro
     * @param fecha
     * @param año
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public MestroHorarioMaterias finHorarioActual(Integer idMaestro, Date fecha, Integer año);
}
