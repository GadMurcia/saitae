/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
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
     * Busca en la base de datos la existencia de un horario asignado en un grado y dia especificados
     * @param horario
     * @param gradoPK
     * @param dia
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias 
     */
    public List<MestroHorarioMaterias> findByhorarioAndGradoPK(Horario horario, GradoPK gradoPK, DiasEstudio dia);
    
    /**
     * Busca en la base de datos la existencia de un horario asignado a un maestro en un grado especificados
     * @param horario
     * @param maestro
     * @param dia
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias 
     */
    public List<MestroHorarioMaterias> findByhorarioAndMaestro(Horario horario, Maestro maestro, DiasEstudio dia);
    
    /**
     * Obtiene una lista de maestrosHorarioMaterias ordenada por días, horario, materia, grado, y maestro
     * @return java.util.List net.delsas.saitae.entities.MestroHorarioMaterias
     */
    public List<MestroHorarioMaterias> findAllOrdered();
}
