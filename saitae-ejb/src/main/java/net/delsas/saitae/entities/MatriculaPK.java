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
public class MatriculaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idmatricula")
    private int idmatricula;
    @Basic(optional = false)
    @NotNull
    @Column(name = "matriculaAnyo")
    private int matriculaAnyo;

    public MatriculaPK() {
    }

    public MatriculaPK(int idmatricula, int matriculaAnyo) {
        this.idmatricula = idmatricula;
        this.matriculaAnyo = matriculaAnyo;
    }

    public int getIdmatricula() {
        return idmatricula;
    }

    public void setIdmatricula(int idmatricula) {
        this.idmatricula = idmatricula;
    }

    public int getMatriculaAnyo() {
        return matriculaAnyo;
    }

    public void setMatriculaAnyo(int matriculaAnyo) {
        this.matriculaAnyo = matriculaAnyo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idmatricula;
        hash += (int) matriculaAnyo;
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
        if (this.matriculaAnyo != other.matriculaAnyo) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MatriculaPK[ idmatricula=" + idmatricula + ", matriculaAnyo=" + matriculaAnyo + " ]";
    }
    
}
