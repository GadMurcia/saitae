/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "autor", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Autor.findAll", query = "SELECT a FROM Autor a")
    , @NamedQuery(name = "Autor.findByIdautor", query = "SELECT a FROM Autor a WHERE a.idautor = :idautor")
    , @NamedQuery(name = "Autor.findByAutorNombre", query = "SELECT a FROM Autor a WHERE a.autorNombre = :autorNombre")
    , @NamedQuery(name = "Autor.findByAutorComentario", query = "SELECT a FROM Autor a WHERE a.autorComentario = :autorComentario")})
public class Autor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idautor")
    private Integer idautor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "autorNombre")
    private String autorNombre;
    @Size(max = 140)
    @Column(name = "autorComentario")
    private String autorComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "autor")
    private List<AutorLibro> autorLibroList;

    public Autor() {
    }

    public Autor(Integer idautor) {
        this.idautor = idautor;
    }

    public Autor(Integer idautor, String autorNombre) {
        this.idautor = idautor;
        this.autorNombre = autorNombre;
    }

    public Integer getIdautor() {
        return idautor;
    }

    public void setIdautor(Integer idautor) {
        this.idautor = idautor;
    }

    public String getAutorNombre() {
        return autorNombre;
    }

    public void setAutorNombre(String autorNombre) {
        this.autorNombre = autorNombre;
    }

    public String getAutorComentario() {
        return autorComentario;
    }

    public void setAutorComentario(String autorComentario) {
        this.autorComentario = autorComentario;
    }

    @XmlTransient
    public List<AutorLibro> getAutorLibroList() {
        return autorLibroList;
    }

    public void setAutorLibroList(List<AutorLibro> autorLibroList) {
        this.autorLibroList = autorLibroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idautor != null ? idautor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Autor)) {
            return false;
        }
        Autor other = (Autor) object;
        if ((this.idautor == null && other.idautor != null) || (this.idautor != null && !this.idautor.equals(other.idautor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Autor[ idautor=" + idautor + " ]";
    }
    
}
