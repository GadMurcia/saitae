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
public class PermisosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ipPersona")
    private int ipPersona;
    @Basic(optional = false)
    @NotNull
    @Column(name = "permisoFechaSolicitud")
    @Temporal(TemporalType.DATE)
    private Date permisoFechaSolicitud;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tipoPermiso")
    private int tipoPermiso;

    public PermisosPK() {
    }

    public PermisosPK(int ipPersona, Date permisoFechaSolicitud, int tipoPermiso) {
        this.ipPersona = ipPersona;
        this.permisoFechaSolicitud = permisoFechaSolicitud;
        this.tipoPermiso = tipoPermiso;
    }

    public int getIpPersona() {
        return ipPersona;
    }

    public void setIpPersona(int ipPersona) {
        this.ipPersona = ipPersona;
    }

    public Date getPermisoFechaSolicitud() {
        return permisoFechaSolicitud;
    }

    public void setPermisoFechaSolicitud(Date permisoFechaSolicitud) {
        this.permisoFechaSolicitud = permisoFechaSolicitud;
    }

    public int getTipoPermiso() {
        return tipoPermiso;
    }

    public void setTipoPermiso(int tipoPermiso) {
        this.tipoPermiso = tipoPermiso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) ipPersona;
        hash += (permisoFechaSolicitud != null ? permisoFechaSolicitud.hashCode() : 0);
        hash += (int) tipoPermiso;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PermisosPK)) {
            return false;
        }
        PermisosPK other = (PermisosPK) object;
        if (this.ipPersona != other.ipPersona) {
            return false;
        }
        if ((this.permisoFechaSolicitud == null && other.permisoFechaSolicitud != null) || (this.permisoFechaSolicitud != null && !this.permisoFechaSolicitud.equals(other.permisoFechaSolicitud))) {
            return false;
        }
        if (this.tipoPermiso != other.tipoPermiso) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.PermisosPK[ ipPersona=" + ipPersona + ", permisoFechaSolicitud=" + permisoFechaSolicitud + ", tipoPermiso=" + tipoPermiso + " ]";
    }
    
}
