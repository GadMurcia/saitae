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
public class ReservaDetallePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idreserva")
    private int idreserva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idRecurso")
    private int idRecurso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ejemplarCorrelativo")
    private int ejemplarCorrelativo;

    public ReservaDetallePK() {
    }

    public ReservaDetallePK(int idreserva, int idRecurso, int ejemplarCorrelativo) {
        this.idreserva = idreserva;
        this.idRecurso = idRecurso;
        this.ejemplarCorrelativo = ejemplarCorrelativo;
    }

    public int getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
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
        hash += (int) idreserva;
        hash += (int) idRecurso;
        hash += (int) ejemplarCorrelativo;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReservaDetallePK)) {
            return false;
        }
        ReservaDetallePK other = (ReservaDetallePK) object;
        if (this.idreserva != other.idreserva) {
            return false;
        }
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
        return "net.delsas.saitae.entities.ReservaDetallePK[ idreserva=" + idreserva + ", idRecurso=" + idRecurso + ", ejemplarCorrelativo=" + ejemplarCorrelativo + " ]";
    }
    
}
