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
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "reportePsicologia", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReportePsicologia.findAll", query = "SELECT r FROM ReportePsicologia r"),
    @NamedQuery(name = "ReportePsicologia.findByFechaInicio", query = "SELECT r FROM ReportePsicologia r WHERE r.reportePsicologiaPK.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "ReportePsicologia.findByFechaFin", query = "SELECT r FROM ReportePsicologia r WHERE r.reportePsicologiaPK.fechaFin = :fechaFin"),
    @NamedQuery(name = "ReportePsicologia.findByEstudiante", query = "SELECT r FROM ReportePsicologia r WHERE r.reportePsicologiaPK.estudiante = :estudiante"),
    @NamedQuery(name = "ReportePsicologia.findByNConsultas", query = "SELECT r FROM ReportePsicologia r WHERE r.nConsultas = :nConsultas"),
    @NamedQuery(name = "ReportePsicologia.findByNCitasSolicitadas", query = "SELECT r FROM ReportePsicologia r WHERE r.nCitasSolicitadas = :nCitasSolicitadas"),
    @NamedQuery(name = "ReportePsicologia.findByMotivos", query = "SELECT r FROM ReportePsicologia r WHERE r.motivos = :motivos"),
    @NamedQuery(name = "ReportePsicologia.findByDiagnostico", query = "SELECT r FROM ReportePsicologia r WHERE r.diagnostico = :diagnostico"),
    @NamedQuery(name = "ReportePsicologia.findByComentarios", query = "SELECT r FROM ReportePsicologia r WHERE r.comentarios = :comentarios"),
    @NamedQuery(name = "ReportePsicologia.findByPeriodo", query = "SELECT r FROM ReportePsicologia r WHERE r.reportePsicologiaPK.fechaInicio = :fechaInicio AND r.reportePsicologiaPK.fechaFin = :fechaFin AND r.reportePublico = :pub ORDER BY r.reportePsicologiaPK ASC")
})
public class ReportePsicologia implements Serializable {

    @Basic(optional = false)
    @NotNull
    private int nConsultas;
    @Basic(optional = false)
    @NotNull
    private int nCitasSolicitadas;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    private String motivos;
    @Size(max = 800)
    private String diagnostico;
    @Basic(optional = false)
    @NotNull
    private boolean reportePublico;
    @Size(max = 140)
    private String comentarios;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ReportePsicologiaPK reportePsicologiaPK;
    @JoinColumn(name = "estudiante", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Estudiante estudiante1;
    @JoinColumn(name = "psicologo", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona psicologo;

    public ReportePsicologia() {
    }

    public ReportePsicologia(ReportePsicologiaPK reportePsicologiaPK) {
        this.reportePsicologiaPK = reportePsicologiaPK;
    }

    public ReportePsicologia(ReportePsicologiaPK reportePsicologiaPK, int nConsultas, int nCitasSolicitadas, String motivos) {
        this.reportePsicologiaPK = reportePsicologiaPK;
        this.nConsultas = nConsultas;
        this.nCitasSolicitadas = nCitasSolicitadas;
        this.motivos = motivos;
    }

    public ReportePsicologia(Date fechaInicio, Date fechaFin, int estudiante) {
        this.reportePsicologiaPK = new ReportePsicologiaPK(fechaInicio, fechaFin, estudiante);
    }

    public ReportePsicologiaPK getReportePsicologiaPK() {
        return reportePsicologiaPK;
    }

    public void setReportePsicologiaPK(ReportePsicologiaPK reportePsicologiaPK) {
        this.reportePsicologiaPK = reportePsicologiaPK;
    }

    public int getNConsultas() {
        return nConsultas;
    }

    public void setNConsultas(int nConsultas) {
        this.nConsultas = nConsultas;
    }

    public int getNCitasSolicitadas() {
        return nCitasSolicitadas;
    }

    public void setNCitasSolicitadas(int nCitasSolicitadas) {
        this.nCitasSolicitadas = nCitasSolicitadas;
    }

    public String getMotivos() {
        return motivos;
    }

    public void setMotivos(String motivos) {
        this.motivos = motivos;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
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

    public Persona getPsicologo() {
        return psicologo;
    }

    public void setPsicologo(Persona psicologo) {
        this.psicologo = psicologo;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + this.nConsultas;
        hash = 31 * hash + this.nCitasSolicitadas;
        hash = 31 * hash + Objects.hashCode(this.motivos);
        hash = 31 * hash + Objects.hashCode(this.diagnostico);
        hash = 31 * hash + (this.reportePublico ? 1 : 0);
        hash = 31 * hash + Objects.hashCode(this.comentarios);
        hash = 31 * hash + Objects.hashCode(this.reportePsicologiaPK);
        hash = 31 * hash + Objects.hashCode(this.estudiante1);
        hash = 31 * hash + Objects.hashCode(this.psicologo);
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
        final ReportePsicologia other = (ReportePsicologia) obj;
        if (this.nConsultas != other.nConsultas) {
            return false;
        }
        if (this.nCitasSolicitadas != other.nCitasSolicitadas) {
            return false;
        }
        if (this.reportePublico != other.reportePublico) {
            return false;
        }
        if (!Objects.equals(this.motivos, other.motivos)) {
            return false;
        }
        if (!Objects.equals(this.diagnostico, other.diagnostico)) {
            return false;
        }
        if (!Objects.equals(this.comentarios, other.comentarios)) {
            return false;
        }
        if (!Objects.equals(this.reportePsicologiaPK, other.reportePsicologiaPK)) {
            return false;
        }
        if (!Objects.equals(this.estudiante1, other.estudiante1)) {
            return false;
        }
        return Objects.equals(this.psicologo, other.psicologo);
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ReportePsicologia[ reportePsicologiaPK=" + reportePsicologiaPK + " ]";
    }

    public boolean getReportePublico() {
        return reportePublico;
    }

    public void setReportePublico(boolean reportePublico) {
        this.reportePublico = reportePublico;
    }

}
