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
    @Column(name = "diaSemana")
    private int diaSemana;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idGrado")
    private int idGrado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "gradoModalidad")
    private String gradoModalidad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "seccionGrado")
    private String seccionGrado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "a\u00f1oGrado")
    private int añoGrado;

    public MestroHorarioMateriasPK() {
    }

    public MestroHorarioMateriasPK(int idMaestro, int idMateria, int idHorario, int diaSemana, int idGrado, String gradoModalidad, String seccionGrado, int añoGrado) {
        this.idMaestro = idMaestro;
        this.idMateria = idMateria;
        this.idHorario = idHorario;
        this.diaSemana = diaSemana;
        this.idGrado = idGrado;
        this.gradoModalidad = gradoModalidad;
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

    public int getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(int diaSemana) {
        this.diaSemana = diaSemana;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public String getGradoModalidad() {
        return gradoModalidad;
    }

    public void setGradoModalidad(String gradoModalidad) {
        this.gradoModalidad = gradoModalidad;
    }

    public String getSeccionGrado() {
        return seccionGrado;
    }

    public void setSeccionGrado(String seccionGrado) {
        this.seccionGrado = seccionGrado;
    }

    public int getAñoGrado() {
        return añoGrado;
    }

    public void setAñoGrado(int añoGrado) {
        this.añoGrado = añoGrado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idMaestro;
        hash += (int) idMateria;
        hash += (int) idHorario;
        hash += (int) diaSemana;
        hash += (int) idGrado;
        hash += (gradoModalidad != null ? gradoModalidad.hashCode() : 0);
        hash += (seccionGrado != null ? seccionGrado.hashCode() : 0);
        hash += (int) añoGrado;
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
        if (this.diaSemana != other.diaSemana) {
            return false;
        }
        if (this.idGrado != other.idGrado) {
            return false;
        }
        if ((this.gradoModalidad == null && other.gradoModalidad != null) || (this.gradoModalidad != null && !this.gradoModalidad.equals(other.gradoModalidad))) {
            return false;
        }
        if ((this.seccionGrado == null && other.seccionGrado != null) || (this.seccionGrado != null && !this.seccionGrado.equals(other.seccionGrado))) {
            return false;
        }
        if (this.añoGrado != other.añoGrado) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MestroHorarioMateriasPK[ idMaestro=" + idMaestro + ", idMateria=" + idMateria + ", idHorario=" + idHorario + ", diaSemana=" + diaSemana + ", idGrado=" + idGrado + ", gradoModalidad=" + gradoModalidad + ", seccionGrado=" + seccionGrado + ", a\u00f1oGrado=" + añoGrado + " ]";
    }
    
}
