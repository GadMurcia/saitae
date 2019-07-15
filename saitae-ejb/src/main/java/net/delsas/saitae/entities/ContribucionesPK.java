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
public class ContribucionesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaHora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    @Basic(optional = false)
    @NotNull
    @Column(name = "mes")
    private int mes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "a\u00f1o")
    @Temporal(TemporalType.DATE)
    private Date año;

    public ContribucionesPK() {
    }

    public ContribucionesPK(Date fechaHora, int mes, Date año) {
        this.fechaHora = fechaHora;
        this.mes = mes;
        this.año = año;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public Date getAño() {
        return año;
    }

    public void setAño(Date año) {
        this.año = año;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fechaHora != null ? fechaHora.hashCode() : 0);
        hash += (int) mes;
        hash += (año != null ? año.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContribucionesPK)) {
            return false;
        }
        ContribucionesPK other = (ContribucionesPK) object;
        if ((this.fechaHora == null && other.fechaHora != null) || (this.fechaHora != null && !this.fechaHora.equals(other.fechaHora))) {
            return false;
        }
        if (this.mes != other.mes) {
            return false;
        }
        if ((this.año == null && other.año != null) || (this.año != null && !this.año.equals(other.año))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ContribucionesPK[ fechaHora=" + fechaHora + ", mes=" + mes + ", a\u00f1o=" + año + " ]";
    }
    
}
