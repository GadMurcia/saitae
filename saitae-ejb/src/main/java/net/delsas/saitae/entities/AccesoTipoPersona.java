/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "accesoTipoPersona", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccesoTipoPersona.findAll", query = "SELECT a FROM AccesoTipoPersona a")
    , @NamedQuery(name = "AccesoTipoPersona.findByIdacceso", query = "SELECT a FROM AccesoTipoPersona a WHERE a.idacceso = :idacceso")
    , @NamedQuery(name = "AccesoTipoPersona.findByAccesoTipoPersonaComentario", query = "SELECT a FROM AccesoTipoPersona a WHERE a.accesoTipoPersonaComentario = :accesoTipoPersonaComentario")})
public class AccesoTipoPersona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idacceso")
    private Integer idacceso;
    @Size(max = 140)
    @Column(name = "accesoTipoPersonaComentario")
    private String accesoTipoPersonaComentario;
    @JoinColumn(name = "idacceso", referencedColumnName = "idacceso", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Acceso acceso;
    @JoinColumn(name = "idTipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne(optional = false)
    private TipoPersona idTipoPersona;

    public AccesoTipoPersona() {
    }

    public AccesoTipoPersona(Integer idacceso) {
        this.idacceso = idacceso;
    }

    public Integer getIdacceso() {
        return idacceso;
    }

    public void setIdacceso(Integer idacceso) {
        this.idacceso = idacceso;
    }

    public String getAccesoTipoPersonaComentario() {
        return accesoTipoPersonaComentario;
    }

    public void setAccesoTipoPersonaComentario(String accesoTipoPersonaComentario) {
        this.accesoTipoPersonaComentario = accesoTipoPersonaComentario;
    }

    public Acceso getAcceso() {
        return acceso;
    }

    public void setAcceso(Acceso acceso) {
        this.acceso = acceso;
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
        hash += (idacceso != null ? idacceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccesoTipoPersona)) {
            return false;
        }
        AccesoTipoPersona other = (AccesoTipoPersona) object;
        if ((this.idacceso == null && other.idacceso != null) || (this.idacceso != null && !this.idacceso.equals(other.idacceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.AccesoTipoPersona[ idacceso=" + idacceso + " ]";
    }
    
}
