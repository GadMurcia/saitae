/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "horario", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Horario.findAll", query = "SELECT h FROM Horario h")
    , @NamedQuery(name = "Horario.findByIdhorario", query = "SELECT h FROM Horario h WHERE h.idhorario = :idhorario")
    , @NamedQuery(name = "Horario.findByHoraInicio", query = "SELECT h FROM Horario h WHERE h.horaInicio = :horaInicio")
    , @NamedQuery(name = "Horario.findByHoraFin", query = "SELECT h FROM Horario h WHERE h.horaFin = :horaFin")
    , @NamedQuery(name = "Horario.findByHorarioComentario", query = "SELECT h FROM Horario h WHERE h.horarioComentario = :horarioComentario")})
public class Horario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idhorario")
    private Integer idhorario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaInicio")
    @Temporal(TemporalType.TIME)
    private Date horaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaFin")
    @Temporal(TemporalType.TIME)
    private Date horaFin;
    @Size(max = 145)
    @Column(name = "horarioComentario")
    private String horarioComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "horario")
    private List<MestroHorarioMaterias> mestroHorarioMateriasList;

    public Horario() {
    }

    public Horario(Integer idhorario) {
        this.idhorario = idhorario;
    }

    public Horario(Integer idhorario, Date horaInicio, Date horaFin) {
        this.idhorario = idhorario;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public Integer getIdhorario() {
        return idhorario;
    }

    public void setIdhorario(Integer idhorario) {
        this.idhorario = idhorario;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public String getHorarioComentario() {
        return horarioComentario;
    }

    public void setHorarioComentario(String horarioComentario) {
        this.horarioComentario = horarioComentario;
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
        int hash = 3;
        hash = 79 * hash + Objects.hashCode(this.idhorario);
        hash = 79 * hash + Objects.hashCode(this.horaInicio);
        hash = 79 * hash + Objects.hashCode(this.horaFin);
        hash = 79 * hash + Objects.hashCode(this.horarioComentario);
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
        final Horario other = (Horario) obj;
        if (!Objects.equals(this.horarioComentario, other.horarioComentario)) {
            return false;
        }
        if (!Objects.equals(this.idhorario, other.idhorario)) {
            return false;
        }
        if (!Objects.equals(this.horaInicio, other.horaInicio)) {
            return false;
        }
        return Objects.equals(this.horaFin, other.horaFin);
    }

    @Override
    public String toString() {
        return "Horario{" + "idhorario=" + idhorario + ", horaInicio=" + horaInicio + ", horaFin=" + horaFin + ", horarioComentario=" + horarioComentario + '}';
    }
}
