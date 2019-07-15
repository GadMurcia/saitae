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
public class MaestoCargoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idMaesto")
    private int idMaesto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCargo")
    private int idCargo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idNombramiento")
    private int idNombramiento;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idFinanciamiento")
    private int idFinanciamiento;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaNombramiento")
    @Temporal(TemporalType.DATE)
    private Date fechaNombramiento;

    public MaestoCargoPK() {
    }

    public MaestoCargoPK(int idMaesto, int idCargo, int idNombramiento, int idFinanciamiento, Date fechaNombramiento) {
        this.idMaesto = idMaesto;
        this.idCargo = idCargo;
        this.idNombramiento = idNombramiento;
        this.idFinanciamiento = idFinanciamiento;
        this.fechaNombramiento = fechaNombramiento;
    }

    public int getIdMaesto() {
        return idMaesto;
    }

    public void setIdMaesto(int idMaesto) {
        this.idMaesto = idMaesto;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public int getIdNombramiento() {
        return idNombramiento;
    }

    public void setIdNombramiento(int idNombramiento) {
        this.idNombramiento = idNombramiento;
    }

    public int getIdFinanciamiento() {
        return idFinanciamiento;
    }

    public void setIdFinanciamiento(int idFinanciamiento) {
        this.idFinanciamiento = idFinanciamiento;
    }

    public Date getFechaNombramiento() {
        return fechaNombramiento;
    }

    public void setFechaNombramiento(Date fechaNombramiento) {
        this.fechaNombramiento = fechaNombramiento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idMaesto;
        hash += (int) idCargo;
        hash += (int) idNombramiento;
        hash += (int) idFinanciamiento;
        hash += (fechaNombramiento != null ? fechaNombramiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MaestoCargoPK)) {
            return false;
        }
        MaestoCargoPK other = (MaestoCargoPK) object;
        if (this.idMaesto != other.idMaesto) {
            return false;
        }
        if (this.idCargo != other.idCargo) {
            return false;
        }
        if (this.idNombramiento != other.idNombramiento) {
            return false;
        }
        if (this.idFinanciamiento != other.idFinanciamiento) {
            return false;
        }
        if ((this.fechaNombramiento == null && other.fechaNombramiento != null) || (this.fechaNombramiento != null && !this.fechaNombramiento.equals(other.fechaNombramiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MaestoCargoPK[ idMaesto=" + idMaesto + ", idCargo=" + idCargo + ", idNombramiento=" + idNombramiento + ", idFinanciamiento=" + idFinanciamiento + ", fechaNombramiento=" + fechaNombramiento + " ]";
    }
    
}
