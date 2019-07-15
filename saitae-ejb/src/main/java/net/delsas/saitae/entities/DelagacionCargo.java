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
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "delagacionCargo", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DelagacionCargo.findAll", query = "SELECT d FROM DelagacionCargo d")
    , @NamedQuery(name = "DelagacionCargo.findByIddelagacionCargo", query = "SELECT d FROM DelagacionCargo d WHERE d.iddelagacionCargo = :iddelagacionCargo")
    , @NamedQuery(name = "DelagacionCargo.findByFechaInicio", query = "SELECT d FROM DelagacionCargo d WHERE d.fechaInicio = :fechaInicio")
    , @NamedQuery(name = "DelagacionCargo.findByFechaFin", query = "SELECT d FROM DelagacionCargo d WHERE d.fechaFin = :fechaFin")
    , @NamedQuery(name = "DelagacionCargo.findByDelagacionCargoComentario", query = "SELECT d FROM DelagacionCargo d WHERE d.delagacionCargoComentario = :delagacionCargoComentario")})
public class DelagacionCargo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "iddelagacionCargo")
    private Integer iddelagacionCargo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaInicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaFin")
    @Temporal(TemporalType.DATE)
    private Date fechaFin;
    @Size(max = 45)
    @Column(name = "delagacionCargoComentario")
    private String delagacionCargoComentario;
    @JoinColumn(name = "idpersona", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona idpersona;
    @JoinColumn(name = "idTipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne(optional = false)
    private TipoPersona idTipoPersona;

    public DelagacionCargo() {
    }

    public DelagacionCargo(Integer iddelagacionCargo) {
        this.iddelagacionCargo = iddelagacionCargo;
    }

    public DelagacionCargo(Integer iddelagacionCargo, Date fechaInicio, Date fechaFin) {
        this.iddelagacionCargo = iddelagacionCargo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
    }

    public Integer getIddelagacionCargo() {
        return iddelagacionCargo;
    }

    public void setIddelagacionCargo(Integer iddelagacionCargo) {
        this.iddelagacionCargo = iddelagacionCargo;
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

    public String getDelagacionCargoComentario() {
        return delagacionCargoComentario;
    }

    public void setDelagacionCargoComentario(String delagacionCargoComentario) {
        this.delagacionCargoComentario = delagacionCargoComentario;
    }

    public Persona getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(Persona idpersona) {
        this.idpersona = idpersona;
    }

    public TipoPersona getIdTipoPersona() {
        return idTipoPersona;
    }

    public void setIdTipoPersona(TipoPersona idTipoPersona) {
        this.idTipoPersona = idTipoPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddelagacionCargo != null ? iddelagacionCargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DelagacionCargo)) {
            return false;
        }
        DelagacionCargo other = (DelagacionCargo) object;
        if ((this.iddelagacionCargo == null && other.iddelagacionCargo != null) || (this.iddelagacionCargo != null && !this.iddelagacionCargo.equals(other.iddelagacionCargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.DelagacionCargo[ iddelagacionCargo=" + iddelagacionCargo + " ]";
    }
    
}
