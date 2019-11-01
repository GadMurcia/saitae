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
@Table(name = "editorialLibro", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EditorialLibro.findAll", query = "SELECT e FROM EditorialLibro e")
    , @NamedQuery(name = "EditorialLibro.findByIdeditorial", query = "SELECT e FROM EditorialLibro e WHERE e.editorialLibroPK.ideditorial = :ideditorial")
    , @NamedQuery(name = "EditorialLibro.findByIdLibro", query = "SELECT e FROM EditorialLibro e WHERE e.editorialLibroPK.idLibro = :idLibro")
    , @NamedQuery(name = "EditorialLibro.findByEditorialLibroComentario", query = "SELECT e FROM EditorialLibro e WHERE e.editorialLibroComentario = :editorialLibroComentario")})
public class EditorialLibro implements Serializable {

    @Size(max = 145)
    @Column(name = "editorialLibroComentario")
    private String editorialLibroComentario;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EditorialLibroPK editorialLibroPK;
    @JoinColumn(name = "ideditorial", referencedColumnName = "ideditorial", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Editorial editorial;
    @JoinColumn(name = "idLibro", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;

    public EditorialLibro() {
    }

    public EditorialLibro(EditorialLibroPK editorialLibroPK) {
        this.editorialLibroPK = editorialLibroPK;
    }

    public EditorialLibro(int ideditorial, int idLibro) {
        this.editorialLibroPK = new EditorialLibroPK(ideditorial, idLibro);
    }

    public EditorialLibroPK getEditorialLibroPK() {
        return editorialLibroPK;
    }

    public void setEditorialLibroPK(EditorialLibroPK editorialLibroPK) {
        this.editorialLibroPK = editorialLibroPK;
    }


    public Editorial getEditorial() {
        return editorial;
    }

    public void setEditorial(Editorial editorial) {
        this.editorial = editorial;
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
        hash += (editorialLibroPK != null ? editorialLibroPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EditorialLibro)) {
            return false;
        }
        EditorialLibro other = (EditorialLibro) object;
        if ((this.editorialLibroPK == null && other.editorialLibroPK != null) || (this.editorialLibroPK != null && !this.editorialLibroPK.equals(other.editorialLibroPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EditorialLibro[ editorialLibroPK=" + editorialLibroPK + " ]";
    }

    public String getEditorialLibroComentario() {
        return editorialLibroComentario;
    }

    public void setEditorialLibroComentario(String editorialLibroComentario) {
        this.editorialLibroComentario = editorialLibroComentario;
    }
    
}
