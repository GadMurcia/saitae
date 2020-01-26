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
public class ConstanciasPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idConstancias")
    private int idConstancias;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaSolicitud")
    @Temporal(TemporalType.DATE)
    private Date fechaSolicitud;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tioPermiso")
    private int tioPermiso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaInicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;

    public ConstanciasPK() {
    }

    public ConstanciasPK(int idConstancias, Date fechaSolicitud, int tioPermiso, Date fechaInicio) {
        this.idConstancias = idConstancias;
        this.fechaSolicitud = fechaSolicitud;
        this.tioPermiso = tioPermiso;
        this.fechaInicio = fechaInicio;
    }

    public int getIdConstancias() {
        return idConstancias;
    }

    public void setIdConstancias(int idConstancias) {
        this.idConstancias = idConstancias;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public int getTioPermiso() {
        return tioPermiso;
    }

    public void setTioPermiso(int tioPermiso) {
        this.tioPermiso = tioPermiso;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idConstancias;
        hash += (fechaSolicitud != null ? fechaSolicitud.hashCode() : 0);
        hash += (int) tioPermiso;
        hash += (fechaInicio != null ? fechaInicio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ConstanciasPK)) {
            return false;
        }
        ConstanciasPK other = (ConstanciasPK) object;
        if (this.idConstancias != other.idConstancias) {
            return false;
        }
        if ((this.fechaSolicitud == null && other.fechaSolicitud != null) || (this.fechaSolicitud != null && !this.fechaSolicitud.equals(other.fechaSolicitud))) {
            return false;
        }
        if (this.tioPermiso != other.tioPermiso) {
            return false;
        }
        if ((this.fechaInicio == null && other.fechaInicio != null) || (this.fechaInicio != null && !this.fechaInicio.equals(other.fechaInicio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ConstanciasPK[ idConstancias=" + idConstancias + ", fechaSolicitud=" + fechaSolicitud + ", tioPermiso=" + tioPermiso + ", fechaInicio=" + fechaInicio + " ]";
    }
    
}
