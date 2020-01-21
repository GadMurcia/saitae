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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "editorial", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Editorial.findAll", query = "SELECT e FROM Editorial e ORDER BY e.editorialNombre ASC")
    , @NamedQuery(name = "Editorial.findByIdeditorial", query = "SELECT e FROM Editorial e WHERE e.ideditorial = :ideditorial")
    , @NamedQuery(name = "Editorial.findByEditorialNombre", query = "SELECT e FROM Editorial e WHERE e.editorialNombre = :editorialNombre")
    , @NamedQuery(name = "Editorial.findByEditorialComentarios", query = "SELECT e FROM Editorial e WHERE e.editorialComentarios = :editorialComentarios")})
public class Editorial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ideditorial")
    private Integer ideditorial;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "editorialNombre")
    private String editorialNombre;
    @Size(max = 140)
    @Column(name = "editorialComentarios")
    private String editorialComentarios;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "editorial")
    private List<EditorialLibro> editorialLibroList;

    public Editorial() {
    }

    public Editorial(Integer ideditorial) {
        this.ideditorial = ideditorial;
    }

    public Editorial(Integer ideditorial, String editorialNombre) {
        this.ideditorial = ideditorial;
        this.editorialNombre = editorialNombre;
    }

    public Integer getIdeditorial() {
        return ideditorial;
    }

    public void setIdeditorial(Integer ideditorial) {
        this.ideditorial = ideditorial;
    }

    public String getEditorialNombre() {
        return editorialNombre;
    }

    public void setEditorialNombre(String editorialNombre) {
        this.editorialNombre = editorialNombre;
    }

    public String getEditorialComentarios() {
        return editorialComentarios;
    }

    public void setEditorialComentarios(String editorialComentarios) {
        this.editorialComentarios = editorialComentarios;
    }

    @XmlTransient
    public List<EditorialLibro> getEditorialLibroList() {
        return editorialLibroList;
    }

    public void setEditorialLibroList(List<EditorialLibro> editorialLibroList) {
        this.editorialLibroList = editorialLibroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ideditorial != null ? ideditorial.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Editorial)) {
            return false;
        }
        Editorial other = (Editorial) object;
        if ((this.ideditorial == null && other.ideditorial != null) || (this.ideditorial != null && !this.ideditorial.equals(other.ideditorial))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Editorial[ ideditorial=" + ideditorial + " ]";
    }
    
}
