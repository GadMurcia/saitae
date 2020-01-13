/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "contenidoLibro", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ContenidoLibro.findAll", query = "SELECT c FROM ContenidoLibro c")
    , @NamedQuery(name = "ContenidoLibro.findByIdLibro", query = "SELECT c FROM ContenidoLibro c WHERE c.idLibro.idrecurso = :idLibro")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroNombre", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroNombre = :contenidoLibroNombre")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroPagina", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroPagina = :contenidoLibroPagina")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroIndice", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroIndice = :contenidoLibroIndice")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroPagina", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroPagina = :contenidoLibroPagina")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroNombre", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroNombre = :contenidoLibroNombre")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroComentario", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroComentario = :contenidoLibroComentario")
    , @NamedQuery(name = "ContenidoLibro.findLikeContenidoLibroNombre", query = "SELECT DISTINCT c FROM ContenidoLibro c WHERE c.contenidoLibroNombre LIKE CONCAT(:contenidoLibroNombre, '%')")
})
public class ContenidoLibro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "contenidoLibroIndice")
    private Integer contenidoLibroIndice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "contenidoLibroPagina")
    private int contenidoLibroPagina;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 145)
    @Column(name = "contenidoLibroNombre")
    private String contenidoLibroNombre;
    @Size(max = 140)
    @Column(name = "contenidoLibroComentario")
    private String contenidoLibroComentario;
    @JoinColumn(name = "idLibro", referencedColumnName = "idrecurso")
    @ManyToOne(optional = false)
    private Recurso idLibro;

    public ContenidoLibro() {
    }

    public ContenidoLibro(int contenidoLibroPagina, String contenidoLibroNombre, Recurso idLibro) {
        this.contenidoLibroPagina = contenidoLibroPagina;
        this.contenidoLibroNombre = contenidoLibroNombre;
        this.idLibro = idLibro;
    }

    public ContenidoLibro(Integer contenidoLibroIndice) {
        this.contenidoLibroIndice = contenidoLibroIndice;
    }

    public ContenidoLibro(Integer contenidoLibroIndice, int contenidoLibroPagina, String contenidoLibroNombre) {
        this.contenidoLibroIndice = contenidoLibroIndice;
        this.contenidoLibroPagina = contenidoLibroPagina;
        this.contenidoLibroNombre = contenidoLibroNombre;
    }

    public Integer getContenidoLibroIndice() {
        return contenidoLibroIndice;
    }

    public void setContenidoLibroIndice(Integer contenidoLibroIndice) {
        this.contenidoLibroIndice = contenidoLibroIndice;
    }

    public int getContenidoLibroPagina() {
        return contenidoLibroPagina;
    }

    public void setContenidoLibroPagina(int contenidoLibroPagina) {
        this.contenidoLibroPagina = contenidoLibroPagina;
    }

    public String getContenidoLibroNombre() {
        return contenidoLibroNombre;
    }

    public void setContenidoLibroNombre(String contenidoLibroNombre) {
        this.contenidoLibroNombre = contenidoLibroNombre;
    }

    public String getContenidoLibroComentario() {
        return contenidoLibroComentario;
    }

    public void setContenidoLibroComentario(String contenidoLibroComentario) {
        this.contenidoLibroComentario = contenidoLibroComentario;
    }

    public Recurso getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(Recurso idLibro) {
        this.idLibro = idLibro;
    }    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + this.contenidoLibroPagina;
        hash = 59 * hash + Objects.hashCode(this.contenidoLibroNombre);
        hash = 59 * hash + Objects.hashCode(this.contenidoLibroComentario);
        hash = 59 * hash + Objects.hashCode(this.idLibro);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ContenidoLibro other = (ContenidoLibro) obj;
        if (this.contenidoLibroPagina != other.contenidoLibroPagina) {
            return false;
        }
        if (!Objects.equals(this.contenidoLibroNombre, other.contenidoLibroNombre)) {
            return false;
        }
        if (!Objects.equals(this.contenidoLibroComentario, other.contenidoLibroComentario)) {
            return false;
        }
        return Objects.equals(this.idLibro, other.idLibro);
    }

    @Override
    public String toString() {
        return "ContenidoLibro{" + "contenidoLibroPagina=" + contenidoLibroPagina + ", contenidoLibroNombre=" + contenidoLibroNombre + ", idLibro=" + idLibro + '}';
    }
}
