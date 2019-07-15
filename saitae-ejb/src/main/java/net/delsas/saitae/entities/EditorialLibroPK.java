/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author delsas
 */
@Embeddable
public class EditorialLibroPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ideditorial")
    private int ideditorial;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idLibro")
    private int idLibro;

    public EditorialLibroPK() {
    }

    public EditorialLibroPK(int ideditorial, int idLibro) {
        this.ideditorial = ideditorial;
        this.idLibro = idLibro;
    }

    public int getIdeditorial() {
        return ideditorial;
    }

    public void setIdeditorial(int ideditorial) {
        this.ideditorial = ideditorial;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) ideditorial;
        hash += (int) idLibro;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EditorialLibroPK)) {
            return false;
        }
        EditorialLibroPK other = (EditorialLibroPK) object;
        if (this.ideditorial != other.ideditorial) {
            return false;
        }
        if (this.idLibro != other.idLibro) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EditorialLibroPK[ ideditorial=" + ideditorial + ", idLibro=" + idLibro + " ]";
    }
    
}
