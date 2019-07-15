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
public class SolicitudReservaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idReserva")
    private int idReserva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idRecurso")
    private int idRecurso;

    public SolicitudReservaPK() {
    }

    public SolicitudReservaPK(int idReserva, int idRecurso) {
        this.idReserva = idReserva;
        this.idRecurso = idRecurso;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdRecurso() {
        return idRecurso;
    }

    public void setIdRecurso(int idRecurso) {
        this.idRecurso = idRecurso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idReserva;
        hash += (int) idRecurso;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SolicitudReservaPK)) {
            return false;
        }
        SolicitudReservaPK other = (SolicitudReservaPK) object;
        if (this.idReserva != other.idReserva) {
            return false;
        }
        if (this.idRecurso != other.idRecurso) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.SolicitudReservaPK[ idReserva=" + idReserva + ", idRecurso=" + idRecurso + " ]";
    }
    
}
