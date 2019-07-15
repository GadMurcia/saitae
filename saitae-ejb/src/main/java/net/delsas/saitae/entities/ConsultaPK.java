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
public class ConsultaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idestudiante")
    private int idestudiante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaHoraConsulta")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHoraConsulta;

    public ConsultaPK() {
    }

    public ConsultaPK(int idestudiante, Date fechaHoraConsulta) {
        this.idestudiante = idestudiante;
        this.fechaHoraConsulta = fechaHoraConsulta;
    }

    public int getIdestudiante() {
        return idestudiante;
    }

    public void setIdestudiante(int idestudiante) {
        this.idestudiante = idestudiante;
    }

    public Date getFechaHoraConsulta() {
        return fechaHoraConsulta;
    }

    public void setFechaHoraConsulta(Date fechaHoraConsulta) {
        this.fechaHoraConsulta = fechaHoraConsulta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idestudiante;
        hash += (fechaHoraConsulta != null ? fechaHoraConsulta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ConsultaPK)) {
            return false;
        }
        ConsultaPK other = (ConsultaPK) object;
        if (this.idestudiante != other.idestudiante) {
            return false;
        }
        if ((this.fechaHoraConsulta == null && other.fechaHoraConsulta != null) || (this.fechaHoraConsulta != null && !this.fechaHoraConsulta.equals(other.fechaHoraConsulta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ConsultaPK[ idestudiante=" + idestudiante + ", fechaHoraConsulta=" + fechaHoraConsulta + " ]";
    }
    
}
