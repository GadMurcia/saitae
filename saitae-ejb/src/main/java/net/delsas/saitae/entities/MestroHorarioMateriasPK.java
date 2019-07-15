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
public class MestroHorarioMateriasPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idMaestro")
    private int idMaestro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idMateria")
    private int idMateria;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idHorario")
    private int idHorario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "diaSemana")
    private String diaSemana;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idGrado")
    private int idGrado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "seccionGrado")
    private String seccionGrado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "a\u00f1oGrado")
    @Temporal(TemporalType.DATE)
    private Date añoGrado;

    public MestroHorarioMateriasPK() {
    }

    public MestroHorarioMateriasPK(int idMaestro, int idMateria, int idHorario, String diaSemana, int idGrado, String seccionGrado, Date añoGrado) {
        this.idMaestro = idMaestro;
        this.idMateria = idMateria;
        this.idHorario = idHorario;
        this.diaSemana = diaSemana;
        this.idGrado = idGrado;
        this.seccionGrado = seccionGrado;
        this.añoGrado = añoGrado;
    }

    public int getIdMaestro() {
        return idMaestro;
    }

    public void setIdMaestro(int idMaestro) {
        this.idMaestro = idMaestro;
    }

    public int getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public String getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(String diaSemana) {
        this.diaSemana = diaSemana;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public String getSeccionGrado() {
        return seccionGrado;
    }

    public void setSeccionGrado(String seccionGrado) {
        this.seccionGrado = seccionGrado;
    }

    public Date getAñoGrado() {
        return añoGrado;
    }

    public void setAñoGrado(Date añoGrado) {
        this.añoGrado = añoGrado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idMaestro;
        hash += (int) idMateria;
        hash += (int) idHorario;
        hash += (diaSemana != null ? diaSemana.hashCode() : 0);
        hash += (int) idGrado;
        hash += (seccionGrado != null ? seccionGrado.hashCode() : 0);
        hash += (añoGrado != null ? añoGrado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MestroHorarioMateriasPK)) {
            return false;
        }
        MestroHorarioMateriasPK other = (MestroHorarioMateriasPK) object;
        if (this.idMaestro != other.idMaestro) {
            return false;
        }
        if (this.idMateria != other.idMateria) {
            return false;
        }
        if (this.idHorario != other.idHorario) {
            return false;
        }
        if ((this.diaSemana == null && other.diaSemana != null) || (this.diaSemana != null && !this.diaSemana.equals(other.diaSemana))) {
            return false;
        }
        if (this.idGrado != other.idGrado) {
            return false;
        }
        if ((this.seccionGrado == null && other.seccionGrado != null) || (this.seccionGrado != null && !this.seccionGrado.equals(other.seccionGrado))) {
            return false;
        }
        if ((this.añoGrado == null && other.añoGrado != null) || (this.añoGrado != null && !this.añoGrado.equals(other.añoGrado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MestroHorarioMateriasPK[ idMaestro=" + idMaestro + ", idMateria=" + idMateria + ", idHorario=" + idHorario + ", diaSemana=" + diaSemana + ", idGrado=" + idGrado + ", seccionGrado=" + seccionGrado + ", a\u00f1oGrado=" + añoGrado + " ]";
    }
    
}
