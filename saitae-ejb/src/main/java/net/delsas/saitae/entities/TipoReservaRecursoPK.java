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
public class TipoReservaRecursoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "tipoReserva")
    private int tipoReserva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tipoRecurso")
    private int tipoRecurso;

    public TipoReservaRecursoPK() {
    }

    public TipoReservaRecursoPK(int tipoReserva, int tipoRecurso) {
        this.tipoReserva = tipoReserva;
        this.tipoRecurso = tipoRecurso;
    }

    public int getTipoReserva() {
        return tipoReserva;
    }

    public void setTipoReserva(int tipoReserva) {
        this.tipoReserva = tipoReserva;
    }

    public int getTipoRecurso() {
        return tipoRecurso;
    }

    public void setTipoRecurso(int tipoRecurso) {
        this.tipoRecurso = tipoRecurso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) tipoReserva;
        hash += (int) tipoRecurso;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoReservaRecursoPK)) {
            return false;
        }
        TipoReservaRecursoPK other = (TipoReservaRecursoPK) object;
        if (this.tipoReserva != other.tipoReserva) {
            return false;
        }
        if (this.tipoRecurso != other.tipoRecurso) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoReservaRecursoPK[ tipoReserva=" + tipoReserva + ", tipoRecurso=" + tipoRecurso + " ]";
    }
    
}
