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
public class ContribucionesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idEstudiante")
    private int idEstudiante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "a\u00f1o")
    private int año;

    public ContribucionesPK() {
    }

    public ContribucionesPK(int idEstudiante, int año) {
        this.idEstudiante = idEstudiante;
        this.año = año;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idEstudiante;
        hash += (int) año;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContribucionesPK)) {
            return false;
        }
        ContribucionesPK other = (ContribucionesPK) object;
        if (this.idEstudiante != other.idEstudiante) {
            return false;
        }
        if (this.año != other.año) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ContribucionesPK[ idEstudiante=" + idEstudiante + ", a\u00f1o=" + año + " ]";
    }
    
}
