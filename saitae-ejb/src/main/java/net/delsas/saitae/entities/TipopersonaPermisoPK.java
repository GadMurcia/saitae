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
public class TipopersonaPermisoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idtipopersona")
    private int idtipopersona;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idtipoPermiso")
    private int idtipoPermiso;

    public TipopersonaPermisoPK() {
    }

    public TipopersonaPermisoPK(int idtipopersona, int idtipoPermiso) {
        this.idtipopersona = idtipopersona;
        this.idtipoPermiso = idtipoPermiso;
    }

    public int getIdtipopersona() {
        return idtipopersona;
    }

    public void setIdtipopersona(int idtipopersona) {
        this.idtipopersona = idtipopersona;
    }

    public int getIdtipoPermiso() {
        return idtipoPermiso;
    }

    public void setIdtipoPermiso(int idtipoPermiso) {
        this.idtipoPermiso = idtipoPermiso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idtipopersona;
        hash += (int) idtipoPermiso;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipopersonaPermisoPK)) {
            return false;
        }
        TipopersonaPermisoPK other = (TipopersonaPermisoPK) object;
        if (this.idtipopersona != other.idtipopersona) {
            return false;
        }
        if (this.idtipoPermiso != other.idtipoPermiso) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipopersonaPermisoPK[ idtipopersona=" + idtipopersona + ", idtipoPermiso=" + idtipoPermiso + " ]";
    }
    
}
