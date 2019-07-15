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
public class ReservaXpedagogiaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idProyectoPedagogico")
    private int idProyectoPedagogico;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idReserva")
    private int idReserva;

    public ReservaXpedagogiaPK() {
    }

    public ReservaXpedagogiaPK(int idProyectoPedagogico, int idReserva) {
        this.idProyectoPedagogico = idProyectoPedagogico;
        this.idReserva = idReserva;
    }

    public int getIdProyectoPedagogico() {
        return idProyectoPedagogico;
    }

    public void setIdProyectoPedagogico(int idProyectoPedagogico) {
        this.idProyectoPedagogico = idProyectoPedagogico;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idProyectoPedagogico;
        hash += (int) idReserva;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReservaXpedagogiaPK)) {
            return false;
        }
        ReservaXpedagogiaPK other = (ReservaXpedagogiaPK) object;
        if (this.idProyectoPedagogico != other.idProyectoPedagogico) {
            return false;
        }
        if (this.idReserva != other.idReserva) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ReservaXpedagogiaPK[ idProyectoPedagogico=" + idProyectoPedagogico + ", idReserva=" + idReserva + " ]";
    }
    
}
