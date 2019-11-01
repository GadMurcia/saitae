/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
    , @NamedQuery(name = "ContenidoLibro.findByIdLibro", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroPK.idLibro = :idLibro")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroNombre", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroPK.contenidoLibroNombre = :contenidoLibroNombre")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroPagina", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroPK.contenidoLibroPagina = :contenidoLibroPagina")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroIndice", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroIndice = :contenidoLibroIndice")
    , @NamedQuery(name = "ContenidoLibro.findByContenidoLibroComentario", query = "SELECT c FROM ContenidoLibro c WHERE c.contenidoLibroComentario = :contenidoLibroComentario")})
public class ContenidoLibro implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "contenidoLibroIndice")
    private int contenidoLibroIndice;
    @Size(max = 140)
    @Column(name = "contenidoLibroComentario")
    private String contenidoLibroComentario;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ContenidoLibroPK contenidoLibroPK;
    @JoinColumn(name = "idLibro", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;

    public ContenidoLibro() {
    }

    public ContenidoLibro(ContenidoLibroPK contenidoLibroPK) {
        this.contenidoLibroPK = contenidoLibroPK;
    }

    public ContenidoLibro(ContenidoLibroPK contenidoLibroPK, int contenidoLibroIndice) {
        this.contenidoLibroPK = contenidoLibroPK;
        this.contenidoLibroIndice = contenidoLibroIndice;
    }

    public ContenidoLibro(int idLibro, String contenidoLibroNombre, int contenidoLibroPagina) {
        this.contenidoLibroPK = new ContenidoLibroPK(idLibro, contenidoLibroNombre, contenidoLibroPagina);
    }

    public ContenidoLibroPK getContenidoLibroPK() {
        return contenidoLibroPK;
    }

    public void setContenidoLibroPK(ContenidoLibroPK contenidoLibroPK) {
        this.contenidoLibroPK = contenidoLibroPK;
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
        hash += (contenidoLibroPK != null ? contenidoLibroPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContenidoLibro)) {
            return false;
        }
        ContenidoLibro other = (ContenidoLibro) object;
        if ((this.contenidoLibroPK == null && other.contenidoLibroPK != null) || (this.contenidoLibroPK != null && !this.contenidoLibroPK.equals(other.contenidoLibroPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ContenidoLibro[ contenidoLibroPK=" + contenidoLibroPK + " ]";
    }

    public int getContenidoLibroIndice() {
        return contenidoLibroIndice;
    }

    public void setContenidoLibroIndice(int contenidoLibroIndice) {
        this.contenidoLibroIndice = contenidoLibroIndice;
    }

    public String getContenidoLibroComentario() {
        return contenidoLibroComentario;
    }

    public void setContenidoLibroComentario(String contenidoLibroComentario) {
        this.contenidoLibroComentario = contenidoLibroComentario;
    }
    
}
