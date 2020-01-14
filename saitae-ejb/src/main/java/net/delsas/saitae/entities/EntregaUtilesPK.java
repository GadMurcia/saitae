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
    @Column(name = "idEstudiante")
    private int idEstudiante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "a\u00f1o")
    private int año;

    public EntregaUtilesPK() {
    }

    public EntregaUtilesPK(int idEstudiante, int año) {
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
        int hash = 7;
        hash = 37 * hash + this.idEstudiante;
        hash = 37 * hash + this.año;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final EntregaUtilesPK other = (EntregaUtilesPK) obj;
        if (this.idEstudiante != other.idEstudiante) {
            return false;
        }
        return this.año == other.año;
    }

    @Override
    public String toString() {
        return "EntregaUtilesPK{" + "idEstudiante=" + idEstudiante + ", a\u00f1o=" + año + '}';
    }
}
