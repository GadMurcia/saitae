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
import javax.validation.constraints.Size;

/**
 *
 * @author delsas
 */
@Embeddable
public class EvaluacionMaestroPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idMaestro")
    private int idMaestro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaHora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "gradoModalidad")
    private String gradoModalidad;

    public EvaluacionMaestroPK() {
    }

    public EvaluacionMaestroPK(int idMaestro, Date fechaHora, String gradoModalidad) {
        this.idMaestro = idMaestro;
        this.fechaHora = fechaHora;
        this.gradoModalidad = gradoModalidad;
    }

    public int getIdMaestro() {
        return idMaestro;
    }

    public void setIdMaestro(int idMaestro) {
        this.idMaestro = idMaestro;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getGradoModalidad() {
        return gradoModalidad;
    }

    public void setGradoModalidad(String gradoModalidad) {
        this.gradoModalidad = gradoModalidad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idMaestro;
        hash += (fechaHora != null ? fechaHora.hashCode() : 0);
        hash += (gradoModalidad != null ? gradoModalidad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvaluacionMaestroPK)) {
            return false;
        }
        EvaluacionMaestroPK other = (EvaluacionMaestroPK) object;
        if (this.idMaestro != other.idMaestro) {
            return false;
        }
        if ((this.fechaHora == null && other.fechaHora != null) || (this.fechaHora != null && !this.fechaHora.equals(other.fechaHora))) {
            return false;
        }
        if ((this.gradoModalidad == null && other.gradoModalidad != null) || (this.gradoModalidad != null && !this.gradoModalidad.equals(other.gradoModalidad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EvaluacionMaestroPK[ idMaestro=" + idMaestro + ", fechaHora=" + fechaHora + ", gradoModalidad=" + gradoModalidad + " ]";
    }
    
}
