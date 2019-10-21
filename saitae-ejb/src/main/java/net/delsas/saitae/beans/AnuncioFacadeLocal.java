/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
@Local
public interface AnuncioFacadeLocal {

    void create(Anuncio anuncio);

    void edit(Anuncio anuncio);

    void remove(Anuncio anuncio);

    Anuncio find(Object id);

    List<Anuncio> findAll();

    List<Anuncio> findRange(int[] range);

    int count();
    
    /**
     *  Obtiene todos los anuncios que están activos a la fecha actual.
     * @return java.util.List net.delsas.saitae.entities.Anuncio
     */
    public List<Anuncio> getAnunciosActivos();

    /**
     *  Obtiene todos los anuncios que ya no se mostrarán en la vista del sistema.
     * @return java.util.List net.delsas.saitae.entities.Anuncio
     */
    public List<Anuncio> getAnunciosInactivos();
    
    /**
     * Obtiene todos los anuncios que sean para todos los usuarios.
     * @return java.util.List net.delsas.saitae.entities.Anuncio
     */
    public List<Anuncio> getAnunciosActivosParaTodos();
    
    /**
     * Obtiene todos los anuncios que sean para el tipo de usuario especificado.
     * @param tipo
     * @return java.util.List net.delsas.saitae.entities.Anuncio
     */
    public List<Anuncio> getAnunciosActivosParaUnTipo(TipoPersona tipo);
    
}
