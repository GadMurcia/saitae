/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author delsas
 */
@Embeddable
public class CapacitacionesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    private int idMaestro;
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.DATE)
    private Date fechaCapacitaciones;

    public CapacitacionesPK() {
    }

    public CapacitacionesPK(int idMaestro, Date fechaCapacitaciones) {
        this.idMaestro = idMaestro;
        this.fechaCapacitaciones = fechaCapacitaciones;
    }

    public int getIdMaestro() {
        return idMaestro;
    }

    public void setIdMaestro(int idMaestro) {
        this.idMaestro = idMaestro;
    }

    public Date getFechaCapacitaciones() {
        return fechaCapacitaciones;
    }

    public void setFechaCapacitaciones(Date fechaCapacitaciones) {
        this.fechaCapacitaciones = fechaCapacitaciones;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idMaestro;
        hash += (fechaCapacitaciones != null ? fechaCapacitaciones.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CapacitacionesPK)) {
            return false;
        }
        CapacitacionesPK other = (CapacitacionesPK) object;
        if (this.idMaestro != other.idMaestro) {
            return false;
        }
        if ((this.fechaCapacitaciones == null && other.fechaCapacitaciones != null) || (this.fechaCapacitaciones != null && !this.fechaCapacitaciones.equals(other.fechaCapacitaciones))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.CapacitacionesPK[ idMaestro=" + idMaestro + ", fechaCapacitaciones=" + fechaCapacitaciones + " ]";
    }
    
}
