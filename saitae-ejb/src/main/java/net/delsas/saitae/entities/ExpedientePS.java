/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "expedientePS", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ExpedientePS.findAll", query = "SELECT e FROM ExpedientePS e")
    , @NamedQuery(name = "ExpedientePS.findByIdEstudiante", query = "SELECT e FROM ExpedientePS e WHERE e.idEstudiante = :idEstudiante")
    , @NamedQuery(name = "ExpedientePS.findByExpedientePsPersonasVivien", query = "SELECT e FROM ExpedientePS e WHERE e.expedientePsPersonasVivien = :expedientePsPersonasVivien")
    , @NamedQuery(name = "ExpedientePS.findByExpedientePSComentario", query = "SELECT e FROM ExpedientePS e WHERE e.expedientePSComentario = :expedientePSComentario")})
public class ExpedientePS implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "ExpedientePsPersonasVivien")
    private String expedientePsPersonasVivien;
    @Size(max = 140)
    @Column(name = "expedientePSComentario")
    private String expedientePSComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEstudiante")
    private Integer idEstudiante;
    @OneToMany(mappedBy = "consultaExpediente")
    private List<Consulta> consultaList;
    @JoinColumn(name = "idEstudiante", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Estudiante estudiante;

    public ExpedientePS() {
    }

    public ExpedientePS(Integer idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public ExpedientePS(Integer idEstudiante, String expedientePsPersonasVivien) {
        this.idEstudiante = idEstudiante;
        this.expedientePsPersonasVivien = expedientePsPersonasVivien;
    }

    public Integer getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(Integer idEstudiante) {
        this.idEstudiante = idEstudiante;
    }


    @XmlTransient
    public List<Consulta> getConsultaList() {
        return consultaList;
    }

    public void setConsultaList(List<Consulta> consultaList) {
        this.consultaList = consultaList;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstudiante != null ? idEstudiante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExpedientePS)) {
            return false;
        }
        ExpedientePS other = (ExpedientePS) object;
        if ((this.idEstudiante == null && other.idEstudiante != null) || (this.idEstudiante != null && !this.idEstudiante.equals(other.idEstudiante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ExpedientePS[ idEstudiante=" + idEstudiante + " ]";
    }

    public String getExpedientePsPersonasVivien() {
        return expedientePsPersonasVivien;
    }

    public void setExpedientePsPersonasVivien(String expedientePsPersonasVivien) {
        this.expedientePsPersonasVivien = expedientePsPersonasVivien;
    }

    public String getExpedientePSComentario() {
        return expedientePSComentario;
    }

    public void setExpedientePSComentario(String expedientePSComentario) {
        this.expedientePSComentario = expedientePSComentario;
    }
    
}
