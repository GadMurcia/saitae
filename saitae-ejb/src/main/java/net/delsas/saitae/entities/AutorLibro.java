/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "autorLibro", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AutorLibro.findAll", query = "SELECT a FROM AutorLibro a")
    , @NamedQuery(name = "AutorLibro.findByIdautor", query = "SELECT a FROM AutorLibro a WHERE a.autorLibroPK.idautor = :idautor")
    , @NamedQuery(name = "AutorLibro.findByIdLibro", query = "SELECT a FROM AutorLibro a WHERE a.autorLibroPK.idLibro = :idLibro")
    , @NamedQuery(name = "AutorLibro.findByAutorLibrocComentario", query = "SELECT a FROM AutorLibro a WHERE a.autorLibrocComentario = :autorLibrocComentario")
    , @NamedQuery(name = "AutorLibro.findLikeAutorNomre", query = "SELECT DISTINCT a FROM AutorLibro a WHERE a.autor.autorNombre LIKE CONCAT(:autorNombre, '%')")
})
public class AutorLibro implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AutorLibroPK autorLibroPK;
    @Size(max = 145)
    @Column(name = "autorLibrocComentario")
    private String autorLibrocComentario;
    @JoinColumn(name = "idautor", referencedColumnName = "idautor", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Autor autor;
    @JoinColumn(name = "idLibro", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;

    public AutorLibro() {
    }

    public AutorLibro(AutorLibroPK autorLibroPK) {
        this.autorLibroPK = autorLibroPK;
    }

    public AutorLibro(int idautor, int idLibro) {
        this.autorLibroPK = new AutorLibroPK(idautor, idLibro);
    }

    public AutorLibroPK getAutorLibroPK() {
        return autorLibroPK;
    }

    public void setAutorLibroPK(AutorLibroPK autorLibroPK) {
        this.autorLibroPK = autorLibroPK;
    }

    public String getAutorLibrocComentario() {
        return autorLibrocComentario;
    }

    public void setAutorLibrocComentario(String autorLibrocComentario) {
        this.autorLibrocComentario = autorLibrocComentario;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (autorLibroPK != null ? autorLibroPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AutorLibro)) {
            return false;
        }
        AutorLibro other = (AutorLibro) object;
        if ((this.autorLibroPK == null && other.autorLibroPK != null) || (this.autorLibroPK != null && !this.autorLibroPK.equals(other.autorLibroPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.AutorLibro[ autorLibroPK=" + autorLibroPK + " ]";
    }

}
