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
public class AutorLibroPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idautor")
    private int idautor;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idLibro")
    private int idLibro;

    public AutorLibroPK() {
    }

    public AutorLibroPK(int idautor, int idLibro) {
        this.idautor = idautor;
        this.idLibro = idLibro;
    }

    public int getIdautor() {
        return idautor;
    }

    public void setIdautor(int idautor) {
        this.idautor = idautor;
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
        hash += (int) idautor;
        hash += (int) idLibro;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AutorLibroPK)) {
            return false;
        }
        AutorLibroPK other = (AutorLibroPK) object;
        if (this.idautor != other.idautor) {
            return false;
        }
        if (this.idLibro != other.idLibro) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.AutorLibroPK[ idautor=" + idautor + ", idLibro=" + idLibro + " ]";
    }
    
}
