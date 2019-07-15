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
public class MatriculaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idmatricula")
    private int idmatricula;
    @Basic(optional = false)
    @NotNull
    @Column(name = "matriculaNivel")
    private int matriculaNivel;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "matriculaSeccion")
    private String matriculaSeccion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "matriculaAnyo")
    @Temporal(TemporalType.DATE)
    private Date matriculaAnyo;

    public MatriculaPK() {
    }

    public MatriculaPK(int idmatricula, int matriculaNivel, String matriculaSeccion, Date matriculaAnyo) {
        this.idmatricula = idmatricula;
        this.matriculaNivel = matriculaNivel;
        this.matriculaSeccion = matriculaSeccion;
        this.matriculaAnyo = matriculaAnyo;
    }

    public int getIdmatricula() {
        return idmatricula;
    }

    public void setIdmatricula(int idmatricula) {
        this.idmatricula = idmatricula;
    }

    public int getMatriculaNivel() {
        return matriculaNivel;
    }

    public void setMatriculaNivel(int matriculaNivel) {
        this.matriculaNivel = matriculaNivel;
    }

    public String getMatriculaSeccion() {
        return matriculaSeccion;
    }

    public void setMatriculaSeccion(String matriculaSeccion) {
        this.matriculaSeccion = matriculaSeccion;
    }

    public Date getMatriculaAnyo() {
        return matriculaAnyo;
    }

    public void setMatriculaAnyo(Date matriculaAnyo) {
        this.matriculaAnyo = matriculaAnyo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idmatricula;
        hash += (int) matriculaNivel;
        hash += (matriculaSeccion != null ? matriculaSeccion.hashCode() : 0);
        hash += (matriculaAnyo != null ? matriculaAnyo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MatriculaPK)) {
            return false;
        }
        MatriculaPK other = (MatriculaPK) object;
        if (this.idmatricula != other.idmatricula) {
            return false;
        }
        if (this.matriculaNivel != other.matriculaNivel) {
            return false;
        }
        if ((this.matriculaSeccion == null && other.matriculaSeccion != null) || (this.matriculaSeccion != null && !this.matriculaSeccion.equals(other.matriculaSeccion))) {
            return false;
        }
        if ((this.matriculaAnyo == null && other.matriculaAnyo != null) || (this.matriculaAnyo != null && !this.matriculaAnyo.equals(other.matriculaAnyo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MatriculaPK[ idmatricula=" + idmatricula + ", matriculaNivel=" + matriculaNivel + ", matriculaSeccion=" + matriculaSeccion + ", matriculaAnyo=" + matriculaAnyo + " ]";
    }
    
}
