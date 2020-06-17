/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
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
    @NamedQuery(name = "PeriodoReportePsicologia.findByFechaInicio", query = "SELECT p FROM PeriodoReportePsicologia p WHERE p.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "PeriodoReportePsicologia.findByFechaFin", query = "SELECT p FROM PeriodoReportePsicologia p WHERE p.fechaFin = :fechaFin"),
    @NamedQuery(name = "PeriodoReportePsicologia.findPeriodoByAño", query = "SELECT p FROM PeriodoReportePsicologia p WHERE FUNCTION('YEAR' , p.fechaInicio) = :año AND FUNCTION('YEAR' , p.fechaFin) = :año AND p.estado = true ORDER BY 1 ASC"),
    @NamedQuery(name = "PeriodoReportePsicologia.findPeriodosNoPublicosByAño", query = "SELECT p FROM PeriodoReportePsicologia p WHERE FUNCTION('YEAR' , p.fechaInicio) = :año AND FUNCTION('YEAR' , p.fechaFin) = :año AND p.estado = false ORDER BY 1 ASC")
})
public class PeriodoReportePsicologia implements Serializable {

    @EmbeddedId
    private PeriodoReportePsicologiaPK periodoReportePsicologiaPK;
    
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.DATE)
    private Date fechaFin;
    @Basic(optional = false)
    @NotNull
    private boolean estado;

    private static final long serialVersionUID = 1L;

    public PeriodoReportePsicologia() {
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
}
