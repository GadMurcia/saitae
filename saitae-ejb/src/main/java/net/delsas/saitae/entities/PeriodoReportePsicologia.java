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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "periodoReportePsicologia",catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PeriodoReportePsicologia.findAll", query = "SELECT p FROM PeriodoReportePsicologia p"),
    @NamedQuery(name = "PeriodoReportePsicologia.findByFechaInicio", query = "SELECT p FROM PeriodoReportePsicologia p WHERE p.periodoReportePsicologiaPK.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "PeriodoReportePsicologia.findByFechaFin", query = "SELECT p FROM PeriodoReportePsicologia p WHERE p.periodoReportePsicologiaPK.fechaFin = :fechaFin"),
    @NamedQuery(name = "PeriodoReportePsicologia.findPeriodoByAño", query = "SELECT p FROM PeriodoReportePsicologia p WHERE FUNCTION('YEAR' , p.periodoReportePsicologiaPK.fechaInicio) = :año AND FUNCTION('YEAR' , p.periodoReportePsicologiaPK.fechaFin) = :año AND p.estado = true ORDER BY 1 ASC"),
    @NamedQuery(name = "PeriodoReportePsicologia.findPeriodosNoPublicosByAño", query = "SELECT p FROM PeriodoReportePsicologia p WHERE FUNCTION('YEAR' , p.periodoReportePsicologiaPK.fechaInicio) = :año AND FUNCTION('YEAR' , p.periodoReportePsicologiaPK.fechaFin) = :año AND p.estado = false ORDER BY 1 ASC")
})
public class PeriodoReportePsicologia implements Serializable {

    @EmbeddedId
    private PeriodoReportePsicologiaPK periodoReportePsicologiaPK;
    
//    @Basic(optional = false)
//    @NotNull
//    @Temporal(TemporalType.DATE)
//    private Date fechaInicio;
//    @Basic(optional = false)
//    @NotNull
//    @Temporal(TemporalType.DATE)
//    private Date fechaFin;
    @Basic(optional = false)
    @NotNull
    private boolean estado;

    private static final long serialVersionUID = 1L;

    public PeriodoReportePsicologia() {
    }

    public PeriodoReportePsicologia(PeriodoReportePsicologiaPK periodoReportePsicologiaPK, boolean estado) {
        this.periodoReportePsicologiaPK = periodoReportePsicologiaPK;
        this.estado = estado;
    }

    public PeriodoReportePsicologiaPK getPeriodoReportePsicologiaPK() {
        return periodoReportePsicologiaPK;
    }

    public void setPeriodoReportePsicologiaPK(PeriodoReportePsicologiaPK periodoReportePsicologiaPK) {
        this.periodoReportePsicologiaPK = periodoReportePsicologiaPK;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.periodoReportePsicologiaPK);
        hash = 59 * hash + (this.estado ? 1 : 0);
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
        final PeriodoReportePsicologia other = (PeriodoReportePsicologia) obj;
        if (this.estado != other.estado) {
            return false;
        }
        return Objects.equals(this.periodoReportePsicologiaPK, other.periodoReportePsicologiaPK);
    }

    @Override
    public String toString() {
        return "PeriodoReportePsicologia{" + "periodoReportePsicologiaPK=" + periodoReportePsicologiaPK + ", estado=" + estado + '}';
    }
}
