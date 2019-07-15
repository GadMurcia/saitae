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
public class GradoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idgrado")
    private int idgrado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "gradoSeccion")
    private String gradoSeccion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gradoA\u00f1o")
    @Temporal(TemporalType.DATE)
    private Date gradoAño;

    public GradoPK() {
    }

    public GradoPK(int idgrado, String gradoSeccion, Date gradoAño) {
        this.idgrado = idgrado;
        this.gradoSeccion = gradoSeccion;
        this.gradoAño = gradoAño;
    }

    public int getIdgrado() {
        return idgrado;
    }

    public void setIdgrado(int idgrado) {
        this.idgrado = idgrado;
    }

    public String getGradoSeccion() {
        return gradoSeccion;
    }

    public void setGradoSeccion(String gradoSeccion) {
        this.gradoSeccion = gradoSeccion;
    }

    public Date getGradoAño() {
        return gradoAño;
    }

    public void setGradoAño(Date gradoAño) {
        this.gradoAño = gradoAño;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idgrado;
        hash += (gradoSeccion != null ? gradoSeccion.hashCode() : 0);
        hash += (gradoAño != null ? gradoAño.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GradoPK)) {
            return false;
        }
        GradoPK other = (GradoPK) object;
        if (this.idgrado != other.idgrado) {
            return false;
        }
        if ((this.gradoSeccion == null && other.gradoSeccion != null) || (this.gradoSeccion != null && !this.gradoSeccion.equals(other.gradoSeccion))) {
            return false;
        }
        if ((this.gradoAño == null && other.gradoAño != null) || (this.gradoAño != null && !this.gradoAño.equals(other.gradoAño))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.GradoPK[ idgrado=" + idgrado + ", gradoSeccion=" + gradoSeccion + ", gradoA\u00f1o=" + gradoAño + " ]";
    }
    
}
