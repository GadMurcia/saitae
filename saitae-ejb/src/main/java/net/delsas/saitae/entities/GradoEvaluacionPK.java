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
public class GradoEvaluacionPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idGrado")
    private int idGrado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "gradoSeccion")
    private String gradoSeccion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gradoAño")
    private int gradoAño;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "gradoModalidad")
    private String gradoModalidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaEvaluacion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaEvaluacion;

    public GradoEvaluacionPK() {
    }

    public GradoEvaluacionPK(int idGrado, String gradoSeccion, int gradoAño, String gradoModalidad, Date fechaEvaluacion) {
        this.idGrado = idGrado;
        this.gradoSeccion = gradoSeccion;
        this.gradoAño = gradoAño;
        this.gradoModalidad = gradoModalidad;
        this.fechaEvaluacion = fechaEvaluacion;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public String getGradoSeccion() {
        return gradoSeccion;
    }

    public void setGradoSeccion(String gradoSeccion) {
        this.gradoSeccion = gradoSeccion;
    }

    public int getGradoAño() {
        return gradoAño;
    }

    public void setGradoAño(int gradoAño) {
        this.gradoAño = gradoAño;
    }

    public String getGradoModalidad() {
        return gradoModalidad;
    }

    public void setGradoModalidad(String gradoModalidad) {
        this.gradoModalidad = gradoModalidad;
    }

    public Date getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(Date fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idGrado;
        hash += (gradoSeccion != null ? gradoSeccion.hashCode() : 0);
        hash += (int) gradoAño;
        hash += (gradoModalidad != null ? gradoModalidad.hashCode() : 0);
        hash += (fechaEvaluacion != null ? fechaEvaluacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GradoEvaluacionPK)) {
            return false;
        }
        GradoEvaluacionPK other = (GradoEvaluacionPK) object;
        if (this.idGrado != other.idGrado) {
            return false;
        }
        if ((this.gradoSeccion == null && other.gradoSeccion != null) || (this.gradoSeccion != null && !this.gradoSeccion.equals(other.gradoSeccion))) {
            return false;
        }
        if (this.gradoAño != other.gradoAño) {
            return false;
        }
        if ((this.gradoModalidad == null && other.gradoModalidad != null) || (this.gradoModalidad != null && !this.gradoModalidad.equals(other.gradoModalidad))) {
            return false;
        }
        return !((this.fechaEvaluacion == null && other.fechaEvaluacion != null) || (this.fechaEvaluacion != null && !this.fechaEvaluacion.equals(other.fechaEvaluacion)));
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.GradoEvaluacionPK[ idGrado=" + idGrado + ", gradoSeccion=" + gradoSeccion + ", gradoA\u00f1o=" + gradoAño + ", gradoModalidad=" + gradoModalidad + ", fechaEvaluacion=" + fechaEvaluacion + " ]";
    }
    
}
