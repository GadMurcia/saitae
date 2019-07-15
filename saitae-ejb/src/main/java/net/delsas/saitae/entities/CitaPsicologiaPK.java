/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author delsas
 */
@Embeddable
public class CitaPsicologiaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "estudiante")
    private int estudiante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaSolicitada")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaSolicitada;

    public CitaPsicologiaPK() {
    }

    public CitaPsicologiaPK(int estudiante, Date fechaSolicitada) {
        this.estudiante = estudiante;
        this.fechaSolicitada = fechaSolicitada;
    }

    public int getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(int estudiante) {
        this.estudiante = estudiante;
    }

    public Date getFechaSolicitada() {
        return fechaSolicitada;
    }

    public void setFechaSolicitada(Date fechaSolicitada) {
        this.fechaSolicitada = fechaSolicitada;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) estudiante;
        hash += (fechaSolicitada != null ? fechaSolicitada.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CitaPsicologiaPK)) {
            return false;
        }
        CitaPsicologiaPK other = (CitaPsicologiaPK) object;
        if (this.estudiante != other.estudiante) {
            return false;
        }
        if ((this.fechaSolicitada == null && other.fechaSolicitada != null) || (this.fechaSolicitada != null && !this.fechaSolicitada.equals(other.fechaSolicitada))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.CitaPsicologiaPK[ estudiante=" + estudiante + ", fechaSolicitada=" + fechaSolicitada + " ]";
    }
    
}
