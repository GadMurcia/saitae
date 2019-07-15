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
public class PersonasReservaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idReserva")
    private int idReserva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idpersona")
    private int idpersona;

    public PersonasReservaPK() {
    }

    public PersonasReservaPK(int idReserva, int idpersona) {
        this.idReserva = idReserva;
        this.idpersona = idpersona;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(int idpersona) {
        this.idpersona = idpersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idReserva;
        hash += (int) idpersona;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PersonasReservaPK)) {
            return false;
        }
        PersonasReservaPK other = (PersonasReservaPK) object;
        if (this.idReserva != other.idReserva) {
            return false;
        }
        if (this.idpersona != other.idpersona) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.PersonasReservaPK[ idReserva=" + idReserva + ", idpersona=" + idpersona + " ]";
    }
    
}
