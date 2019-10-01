/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "diasEstudio", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DiasEstudio.findAll", query = "SELECT d FROM DiasEstudio d")
    , @NamedQuery(name = "DiasEstudio.findByIdDias", query = "SELECT d FROM DiasEstudio d WHERE d.idDias = :idDias")
    , @NamedQuery(name = "DiasEstudio.findByDiasEstudioNombre", query = "SELECT d FROM DiasEstudio d WHERE d.diasEstudioNombre = :diasEstudioNombre")
    , @NamedQuery(name = "DiasEstudio.findByDiasEstudioComentario", query = "SELECT d FROM DiasEstudio d WHERE d.diasEstudioComentario = :diasEstudioComentario")})
public class DiasEstudio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idDias")
    private Integer idDias;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "diasEstudioNombre")
    private String diasEstudioNombre;
    @Size(max = 140)
    @Column(name = "diasEstudioComentario")
    private String diasEstudioComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "diasEstudio")
    private List<MestroHorarioMaterias> mestroHorarioMateriasList;

    public DiasEstudio() {
    }

    public DiasEstudio(Integer idDias) {
        this.idDias = idDias;
    }

    public DiasEstudio(Integer idDias, String diasEstudioNombre) {
        this.idDias = idDias;
        this.diasEstudioNombre = diasEstudioNombre;
    }

    public Integer getIdDias() {
        return idDias;
    }

    public void setIdDias(Integer idDias) {
        this.idDias = idDias;
    }

    public String getDiasEstudioNombre() {
        return diasEstudioNombre;
    }

    public void setDiasEstudioNombre(String diasEstudioNombre) {
        this.diasEstudioNombre = diasEstudioNombre;
    }

    public String getDiasEstudioComentario() {
        return diasEstudioComentario;
    }

    public void setDiasEstudioComentario(String diasEstudioComentario) {
        this.diasEstudioComentario = diasEstudioComentario;
    }

    @XmlTransient
    public List<MestroHorarioMaterias> getMestroHorarioMateriasList() {
        return mestroHorarioMateriasList;
    }

    public void setMestroHorarioMateriasList(List<MestroHorarioMaterias> mestroHorarioMateriasList) {
        this.mestroHorarioMateriasList = mestroHorarioMateriasList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDias != null ? idDias.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DiasEstudio)) {
            return false;
        }
        DiasEstudio other = (DiasEstudio) object;
        if ((this.idDias == null && other.idDias != null) || (this.idDias != null && !this.idDias.equals(other.idDias))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.DiasEstudio[ idDias=" + idDias + " ]";
    }
    
}
