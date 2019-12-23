/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.beans;

import java.util.List;
import javax.ejb.Local;
import net.delsas.saitae.entities.ContenidoLibro;
import net.delsas.saitae.entities.Recurso;

/**
 *
 * @author delsas
 */
@Local
public interface ContenidoLibroFacadeLocal {

    void create(ContenidoLibro contenidoLibro);

    void edit(ContenidoLibro contenidoLibro);

    void remove(ContenidoLibro contenidoLibro);

    ContenidoLibro find(Object id);

    List<ContenidoLibro> findAll();

    List<ContenidoLibro> findRange(int[] range);

    int count();

    /**
     * Busca los libros cuyos nombres de contenido inicien por la cadena dada
     * @param contenido
     * @return java.util.List net.delsas.saitae.entities.Recurso
     */
    public List<Recurso> findLibroByContenidoNombre(String contenido);
    
    /**
     * Busca los libros cuyos nombres inicien por la cadena dada
     * @param nombre
     * @return java.util.List net.delsas.saitae.entities.Recurso
     */
    public List<Recurso> findRecursoBynombre(String nombre);
    
    /**
     * Busca los libros cuyos nombres de autores inicien por la cadena dada
     * @param autorNombre
     * @return java.util.List net.delsas.saitae.entities.Recurso
     */
    public List<Recurso> findLibroByAutorNombre(String autorNombre);

}
