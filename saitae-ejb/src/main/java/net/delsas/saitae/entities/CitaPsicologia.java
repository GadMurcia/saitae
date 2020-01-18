/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "citaPsicologia", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CitaPsicologia.findAll", query = "SELECT c FROM CitaPsicologia c"),
    @NamedQuery(name = "CitaPsicologia.findByEstudiante", query = "SELECT c FROM CitaPsicologia c WHERE c.citaPsicologiaPK.estudiante = :estudiante"),
    @NamedQuery(name = "CitaPsicologia.findByFechaSolicitada", query = "SELECT c FROM CitaPsicologia c WHERE c.citaPsicologiaPK.fechaSolicitada = :fechaSolicitada"),
    @NamedQuery(name = "CitaPsicologia.findByFechaSolicitud", query = "SELECT c FROM CitaPsicologia c WHERE c.fechaSolicitud = :fechaSolicitud"),
    @NamedQuery(name = "CitaPsicologia.findByComentarios", query = "SELECT c FROM CitaPsicologia c WHERE c.comentarios = :comentarios"),
    @NamedQuery(name = "CitaPsicologia.findByEstado", query = "SELECT c FROM CitaPsicologia c WHERE c.estado = :estado"),
    @NamedQuery(name = "CitaPsicologia.findByEstadoAndIdEstudiante", query = "SELECT c FROM CitaPsicologia c WHERE c.estado = :estado AND c.citaPsicologiaPK.estudiante = :idEstudiante"),
    @NamedQuery(name = "CitaPsicologia.findConsultados", query = "SELECT c FROM CitaPsicologia c WHERE c.consulta != NULL")})
public class CitaPsicologia implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CitaPsicologiaPK citaPsicologiaPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaSolicitud")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaSolicitud;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "estado")
    private String estado;
    @Size(max = 145)
    @Column(name = "motivo")
    private String motivo;
    @Size(max = 140)
    @Column(name = "comentarios")
    private String comentarios;
    @JoinColumn(name = "estudiante", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Estudiante estudiante1;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "citaPsicologia")
    private Consulta consulta;

    public CitaPsicologia() {
    }

    public CitaPsicologia(CitaPsicologiaPK citaPsicologiaPK) {
        this.citaPsicologiaPK = citaPsicologiaPK;
    }

    public CitaPsicologia(CitaPsicologiaPK citaPsicologiaPK, Date fechaSolicitud) {
        this.citaPsicologiaPK = citaPsicologiaPK;
        this.fechaSolicitud = fechaSolicitud;
    }

    public CitaPsicologia(int estudiante, Date fechaSolicitada) {
        this.citaPsicologiaPK = new CitaPsicologiaPK(estudiante, fechaSolicitada);
    }

    public CitaPsicologiaPK getCitaPsicologiaPK() {
        return citaPsicologiaPK;
    }

    public void setCitaPsicologiaPK(CitaPsicologiaPK citaPsicologiaPK) {
        this.citaPsicologiaPK = citaPsicologiaPK;
    }

    public Date getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(Date fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public Estudiante getEstudiante1() {
        return estudiante1;
    }

    public void setEstudiante1(Estudiante estudiante1) {
        this.estudiante1 = estudiante1;
    }

    public Consulta getConsulta() {
        return consulta;
    }

    public void setConsulta(Consulta consulta) {
        this.consulta = consulta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.citaPsicologiaPK);
        hash = 37 * hash + Objects.hashCode(this.fechaSolicitud);
        hash = 37 * hash + Objects.hashCode(this.motivo);
        hash = 37 * hash + Objects.hashCode(this.estado);
        hash = 37 * hash + Objects.hashCode(this.comentarios);
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
        final CitaPsicologia other = (CitaPsicologia) obj;
        if (!Objects.equals(this.estado, other.estado)) {
            return false;
        }
        if (!Objects.equals(this.motivo, other.motivo)) {
            return false;
        }
        if (!Objects.equals(this.comentarios, other.comentarios)) {
            return false;
        }
        if (!Objects.equals(this.citaPsicologiaPK, other.citaPsicologiaPK)) {
            return false;
        }
        return Objects.equals(this.fechaSolicitud, other.fechaSolicitud);
    }

    @Override
    public String toString() {
        return "CitaPsicologia{" + "citaPsicologiaPK=" + citaPsicologiaPK + ", fechaSolicitud=" + fechaSolicitud + ", estado=" + estado + ", motivo=" + motivo + '}';
    }
}
