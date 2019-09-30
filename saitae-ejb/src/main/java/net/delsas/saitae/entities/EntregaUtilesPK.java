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
public class EntregaUtilesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idEntregante")
    private int idEntregante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEstudiante")
    private int idEstudiante;

    public EntregaUtilesPK() {
    }

    public EntregaUtilesPK(int idEntregante, int idEstudiante) {
        this.idEntregante = idEntregante;
        this.idEstudiante = idEstudiante;
    }

    public int getIdEntregante() {
        return idEntregante;
    }

    public void setIdEntregante(int idEntregante) {
        this.idEntregante = idEntregante;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idEntregante;
        hash += (int) idEstudiante;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EntregaUtilesPK)) {
            return false;
        }
        EntregaUtilesPK other = (EntregaUtilesPK) object;
        if (this.idEntregante != other.idEntregante) {
            return false;
        }
        if (this.idEstudiante != other.idEstudiante) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EntregaUtilesPK[ idEntregante=" + idEntregante + ", idEstudiante=" + idEstudiante + " ]";
    }
    
}
