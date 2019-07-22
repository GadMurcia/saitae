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
public class AccesoTipoPersonaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idacceso")
    private int idacceso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTipoPersona")
    private int idTipoPersona;

    public AccesoTipoPersonaPK() {
    }

    public AccesoTipoPersonaPK(int idacceso, int idTipoPersona) {
        this.idacceso = idacceso;
        this.idTipoPersona = idTipoPersona;
    }

    public int getIdacceso() {
        return idacceso;
    }

    public void setIdacceso(int idacceso) {
        this.idacceso = idacceso;
    }

    public int getIdTipoPersona() {
        return idTipoPersona;
    }

    public void setIdTipoPersona(int idTipoPersona) {
        this.idTipoPersona = idTipoPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idacceso;
        hash += (int) idTipoPersona;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccesoTipoPersonaPK)) {
            return false;
        }
        AccesoTipoPersonaPK other = (AccesoTipoPersonaPK) object;
        if (this.idacceso != other.idacceso) {
            return false;
        }
        if (this.idTipoPersona != other.idTipoPersona) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.AccesoTipoPersonaPK[ idacceso=" + idacceso + ", idTipoPersona=" + idTipoPersona + " ]";
    }
    
}
