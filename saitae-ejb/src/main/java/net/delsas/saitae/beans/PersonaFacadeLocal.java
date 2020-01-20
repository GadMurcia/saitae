/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Local
public interface PersonaFacadeLocal {

    void create(Persona persona);

    void edit(Persona persona);

    void remove(Persona persona);

    Persona find(Object id);

    List<Persona> findAll();

    List<Persona> findRange(int[] range);

    int count();

    /**
     * Devuelve una lista de las personas cuyos ids inicien por el id
     * proporcionado.
     *
     * @param id
     * @return java.util.List net.delsas.saitae.entities.Persona
     */
    public List<Persona> getByLikeId(int id);

    /**
     * Devueve una lista de todas las personas excluyendo a los estudiates,
     * padres y madres
     *
     * @return java.util.List net.delsas.saitae.entities.Persona
     */
    public List<Persona> getPlantel();

    /**
     * Devuelve una lista de las personas cuyos tipos sean maestro
     *
     * @return java.util.List net.delsas.saitae.entities.Persona
     */
    public List<Persona> getMaestros();

    /**
     * Devuelve una lista de personas cuyos ids inicien por el id proporcionado
     * y que sean del tipo de persona identificado por el tipo proporcionado.
     *
     * @param likeId
     * @param LikeTipo
     * @return java.util.List net.delsas.saitae.entities.Persona
     */
    public List<Persona> getPersonaByLikeIdAndType(int likeId, int LikeTipo);

    /**
     * Devuelve una lista de administradores de área cuyos ids inicien por el id
     * proporcionado
     *
     * @param id
     * @return java.util.List net.delsas.saitae.entities.Persona
     */
    public List<Persona> getAdminsByLikeId(int id);

    /**
     * Devuelve una lista de personas cuyo nombre inicie por la cadena
     * LikeNombre y con tipo igual al LikeTipo proporcionados
     *
     * @param LikeNombre
     * @param LikeTipo
     * @return java.util.List net.delsas.saitae.entities.Persona
     */
    public List<Persona> getPersonaByLikeNombreAndType(String LikeNombre, int LikeTipo);

}
