/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Consulta;

/**
 *
 * @author delsas
 */
@Local
public interface ConsultaFacadeLocal {

    void create(Consulta consulta);

    void edit(Consulta consulta);

    void remove(Consulta consulta);

    Consulta find(Object id);

    List<Consulta> findAll();

    List<Consulta> findRange(int[] range);

    int count();

    /**
     * Devuelve los motivos de las consultas en el preiodo indicado
     *
     * @param fi
     * @param ff
     * @param id
     * @return java.util.List java.lang.String
     */
    public List<String> findMotivosByConsulta(Date fi, Date ff, Integer id);

    /**
     * Devuelve una lista con los ids de los estudiantes a los que se ha
     * atendido en el consultorio en el periodo proporcionado
     *
     * @param fi
     * @param ff
     * @return java.util.List java.lang.Integer
     */
    public List<Integer> findIdEstudianteByPeriodo(Date fi, Date ff);
}
