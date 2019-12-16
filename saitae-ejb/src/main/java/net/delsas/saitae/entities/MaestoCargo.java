/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "maestoCargo", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MaestoCargo.findAll", query = "SELECT m FROM MaestoCargo m")
    , @NamedQuery(name = "MaestoCargo.findByIdMaesto", query = "SELECT m FROM MaestoCargo m WHERE m.maestoCargoPK.idMaesto = :idMaesto")
    , @NamedQuery(name = "MaestoCargo.findByIdCargo", query = "SELECT m FROM MaestoCargo m WHERE m.maestoCargoPK.idCargo = :idCargo")
    , @NamedQuery(name = "MaestoCargo.findByIdNombramiento", query = "SELECT m FROM MaestoCargo m WHERE m.maestoCargoPK.idNombramiento = :idNombramiento")
    , @NamedQuery(name = "MaestoCargo.findByIdFinanciamiento", query = "SELECT m FROM MaestoCargo m WHERE m.maestoCargoPK.idFinanciamiento = :idFinanciamiento")
    , @NamedQuery(name = "MaestoCargo.findByFechaNombramiento", query = "SELECT m FROM MaestoCargo m WHERE m.maestoCargoPK.fechaNombramiento = :fechaNombramiento")
    , @NamedQuery(name = "MaestoCargo.findByFechaDestitucion", query = "SELECT m FROM MaestoCargo m WHERE m.fechaDestitucion = :fechaDestitucion")
    , @NamedQuery(name = "MaestoCargo.findByRazondestitucion", query = "SELECT m FROM MaestoCargo m WHERE m.razondestitucion = :razondestitucion")
    , @NamedQuery(name = "MaestoCargo.findByMaestoCargoComentario", query = "SELECT m FROM MaestoCargo m WHERE m.maestoCargoComentario = :maestoCargoComentario")})
public class MaestoCargo implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MaestoCargoPK maestoCargoPK;
    @Column(name = "fechaDestitucion")
    @Temporal(TemporalType.DATE)
    private Date fechaDestitucion;
    @Size(max = 145)
    @Column(name = "razondestitucion")
    private String razondestitucion;
    @Size(max = 145)
    @Column(name = "maestoCargoComentario")
    private String maestoCargoComentario;
    @JoinColumn(name = "idMaesto", referencedColumnName = "idmaestro", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Maestro maestro;
    @JoinColumn(name = "idCargo", referencedColumnName = "idcargo", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Cargo cargo;
    @JoinColumn(name = "idNombramiento", referencedColumnName = "idtipoNombramiento", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private TipoNombramiento tipoNombramiento;
    @JoinColumn(name = "idFinanciamiento", referencedColumnName = "idfinanciamiento", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Financiamiento financiamiento;

    public MaestoCargo() {
    }

    public MaestoCargo(MaestoCargoPK maestoCargoPK) {
        this.maestoCargoPK = maestoCargoPK;
    }

    public MaestoCargo(int idMaesto, int idCargo, int idNombramiento, int idFinanciamiento, Date fechaNombramiento) {
        this.maestoCargoPK = new MaestoCargoPK(idMaesto, idCargo, idNombramiento, idFinanciamiento, fechaNombramiento);
    }

    public MaestoCargoPK getMaestoCargoPK() {
        return maestoCargoPK;
    }

    public void setMaestoCargoPK(MaestoCargoPK maestoCargoPK) {
        this.maestoCargoPK = maestoCargoPK;
    }

    public Date getFechaDestitucion() {
        return fechaDestitucion;
    }

    public void setFechaDestitucion(Date fechaDestitucion) {
        this.fechaDestitucion = fechaDestitucion;
    }

    public String getRazondestitucion() {
        return razondestitucion;
    }

    public void setRazondestitucion(String razondestitucion) {
        this.razondestitucion = razondestitucion;
    }

    public String getMaestoCargoComentario() {
        return maestoCargoComentario;
    }

    public void setMaestoCargoComentario(String maestoCargoComentario) {
        this.maestoCargoComentario = maestoCargoComentario;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public TipoNombramiento getTipoNombramiento() {
        return tipoNombramiento;
    }

    public void setTipoNombramiento(TipoNombramiento tipoNombramiento) {
        this.tipoNombramiento = tipoNombramiento;
    }

    public Financiamiento getFinanciamiento() {
        return financiamiento;
    }

    public void setFinanciamiento(Financiamiento financiamiento) {
        this.financiamiento = financiamiento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (maestoCargoPK != null ? maestoCargoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MaestoCargo)) {
            return false;
        }
        MaestoCargo other = (MaestoCargo) object;
        if ((this.maestoCargoPK == null && other.maestoCargoPK != null) || (this.maestoCargoPK != null && !this.maestoCargoPK.equals(other.maestoCargoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MaestoCargo[ maestoCargoPK=" + maestoCargoPK + " ]";
    }
    
}
