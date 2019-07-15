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
@Table(name = "capacitaciones", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Capacitaciones.findAll", query = "SELECT c FROM Capacitaciones c")
    , @NamedQuery(name = "Capacitaciones.findByIdMaestro", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionesPK.idMaestro = :idMaestro")
    , @NamedQuery(name = "Capacitaciones.findByFechaCapacitaciones", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionesPK.fechaCapacitaciones = :fechaCapacitaciones")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionCategoria", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionCategoria = :capacitacionCategoria")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionArea", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionArea = :capacitacionArea")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionNombre", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionNombre = :capacitacionNombre")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionCertificado", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionCertificado = :capacitacionCertificado")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionPatrocinador", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionPatrocinador = :capacitacionPatrocinador")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionModalidad", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionModalidad = :capacitacionModalidad")
    , @NamedQuery(name = "Capacitaciones.findByCapacitacionComentario", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionComentario = :capacitacionComentario")})
public class Capacitaciones implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CapacitacionesPK capacitacionesPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "capacitacionCategoria")
    private String capacitacionCategoria;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "capacitacionArea")
    private String capacitacionArea;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "capacitacionNombre")
    private String capacitacionNombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "capacitacionCertificado")
    private boolean capacitacionCertificado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "capacitacionPatrocinador")
    private String capacitacionPatrocinador;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "capacitacionModalidad")
    private String capacitacionModalidad;
    @Size(max = 145)
    @Column(name = "capacitacionComentario")
    private String capacitacionComentario;
    @JoinColumn(name = "idMaestro", referencedColumnName = "idmaestro", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Maestro maestro;

    public Capacitaciones() {
    }

    public Capacitaciones(CapacitacionesPK capacitacionesPK) {
        this.capacitacionesPK = capacitacionesPK;
    }

    public Capacitaciones(CapacitacionesPK capacitacionesPK, String capacitacionCategoria, String capacitacionArea, String capacitacionNombre, boolean capacitacionCertificado, String capacitacionPatrocinador, String capacitacionModalidad) {
        this.capacitacionesPK = capacitacionesPK;
        this.capacitacionCategoria = capacitacionCategoria;
        this.capacitacionArea = capacitacionArea;
        this.capacitacionNombre = capacitacionNombre;
        this.capacitacionCertificado = capacitacionCertificado;
        this.capacitacionPatrocinador = capacitacionPatrocinador;
        this.capacitacionModalidad = capacitacionModalidad;
    }

    public Capacitaciones(int idMaestro, Date fechaCapacitaciones) {
        this.capacitacionesPK = new CapacitacionesPK(idMaestro, fechaCapacitaciones);
    }

    public CapacitacionesPK getCapacitacionesPK() {
        return capacitacionesPK;
    }

    public void setCapacitacionesPK(CapacitacionesPK capacitacionesPK) {
        this.capacitacionesPK = capacitacionesPK;
    }

    public String getCapacitacionCategoria() {
        return capacitacionCategoria;
    }

    public void setCapacitacionCategoria(String capacitacionCategoria) {
        this.capacitacionCategoria = capacitacionCategoria;
    }

    public String getCapacitacionArea() {
        return capacitacionArea;
    }

    public void setCapacitacionArea(String capacitacionArea) {
        this.capacitacionArea = capacitacionArea;
    }

    public String getCapacitacionNombre() {
        return capacitacionNombre;
    }

    public void setCapacitacionNombre(String capacitacionNombre) {
        this.capacitacionNombre = capacitacionNombre;
    }

    public boolean getCapacitacionCertificado() {
        return capacitacionCertificado;
    }

    public void setCapacitacionCertificado(boolean capacitacionCertificado) {
        this.capacitacionCertificado = capacitacionCertificado;
    }

    public String getCapacitacionPatrocinador() {
        return capacitacionPatrocinador;
    }

    public void setCapacitacionPatrocinador(String capacitacionPatrocinador) {
        this.capacitacionPatrocinador = capacitacionPatrocinador;
    }

    public String getCapacitacionModalidad() {
        return capacitacionModalidad;
    }

    public void setCapacitacionModalidad(String capacitacionModalidad) {
        this.capacitacionModalidad = capacitacionModalidad;
    }

    public String getCapacitacionComentario() {
        return capacitacionComentario;
    }

    public void setCapacitacionComentario(String capacitacionComentario) {
        this.capacitacionComentario = capacitacionComentario;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (capacitacionesPK != null ? capacitacionesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Capacitaciones)) {
            return false;
        }
        Capacitaciones other = (Capacitaciones) object;
        if ((this.capacitacionesPK == null && other.capacitacionesPK != null) || (this.capacitacionesPK != null && !this.capacitacionesPK.equals(other.capacitacionesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Capacitaciones[ capacitacionesPK=" + capacitacionesPK + " ]";
    }
    
}
