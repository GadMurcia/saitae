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
public class EjemplarPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idRecurso")
    private int idRecurso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ejemplarCorrelativo")
    private int ejemplarCorrelativo;

    public EjemplarPK() {
    }

    public EjemplarPK(int idRecurso, int ejemplarCorrelativo) {
        this.idRecurso = idRecurso;
        this.ejemplarCorrelativo = ejemplarCorrelativo;
    }

    public int getIdRecurso() {
        return idRecurso;
    }

    public void setIdRecurso(int idRecurso) {
        this.idRecurso = idRecurso;
    }

    public int getEjemplarCorrelativo() {
        return ejemplarCorrelativo;
    }

    public void setEjemplarCorrelativo(int ejemplarCorrelativo) {
        this.ejemplarCorrelativo = ejemplarCorrelativo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idRecurso;
        hash += (int) ejemplarCorrelativo;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EjemplarPK)) {
            return false;
        }
        EjemplarPK other = (EjemplarPK) object;
        if (this.idRecurso != other.idRecurso) {
            return false;
        }
        if (this.ejemplarCorrelativo != other.ejemplarCorrelativo) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EjemplarPK[ idRecurso=" + idRecurso + ", ejemplarCorrelativo=" + ejemplarCorrelativo + " ]";
    }
    
}
