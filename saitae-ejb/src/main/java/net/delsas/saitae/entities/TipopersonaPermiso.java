/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "tipopersonaPermiso", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipopersonaPermiso.findAll", query = "SELECT t FROM TipopersonaPermiso t")
    , @NamedQuery(name = "TipopersonaPermiso.findByIdtipopersona", query = "SELECT t FROM TipopersonaPermiso t WHERE t.tipopersonaPermisoPK.idtipopersona = :idtipopersona")
    , @NamedQuery(name = "TipopersonaPermiso.findByIdtipoPermiso", query = "SELECT t FROM TipopersonaPermiso t WHERE t.tipopersonaPermisoPK.idtipoPermiso = :idtipoPermiso")
    , @NamedQuery(name = "TipopersonaPermiso.findByTipopersonaPermisoComentario", query = "SELECT t FROM TipopersonaPermiso t WHERE t.tipopersonaPermisoComentario = :tipopersonaPermisoComentario")})
public class TipopersonaPermiso implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TipopersonaPermisoPK tipopersonaPermisoPK;
    @Size(max = 45)
    @Column(name = "tipopersonaPermisoComentario")
    private String tipopersonaPermisoComentario;
    @JoinColumn(name = "idtipopersona", referencedColumnName = "idtipoPersona", insertable = true, updatable = true)
    @ManyToOne(optional = false)
    private TipoPersona tipoPersona;
    @JoinColumn(name = "idtipoPermiso", referencedColumnName = "idtipoPermiso", insertable = true, updatable = true)
    @ManyToOne(optional = false)
    private TipoPermiso tipoPermiso;

    public TipopersonaPermiso() {
    }

    public TipopersonaPermiso(TipopersonaPermisoPK tipopersonaPermisoPK) {
        this.tipopersonaPermisoPK = tipopersonaPermisoPK;
    }

    public TipopersonaPermiso(int idtipopersona, int idtipoPermiso) {
        this.tipopersonaPermisoPK = new TipopersonaPermisoPK(idtipopersona, idtipoPermiso);
    }

    public TipopersonaPermisoPK getTipopersonaPermisoPK() {
        return tipopersonaPermisoPK;
    }

    public void setTipopersonaPermisoPK(TipopersonaPermisoPK tipopersonaPermisoPK) {
        this.tipopersonaPermisoPK = tipopersonaPermisoPK;
    }

    public String getTipopersonaPermisoComentario() {
        return tipopersonaPermisoComentario;
    }

    public void setTipopersonaPermisoComentario(String tipopersonaPermisoComentario) {
        this.tipopersonaPermisoComentario = tipopersonaPermisoComentario;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public TipoPermiso getTipoPermiso() {
        return tipoPermiso;
    }

    public void setTipoPermiso(TipoPermiso tipoPermiso) {
        this.tipoPermiso = tipoPermiso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tipopersonaPermisoPK != null ? tipopersonaPermisoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipopersonaPermiso)) {
            return false;
        }
        TipopersonaPermiso other = (TipopersonaPermiso) object;
        if ((this.tipopersonaPermisoPK == null && other.tipopersonaPermisoPK != null) || (this.tipopersonaPermisoPK != null && !this.tipopersonaPermisoPK.equals(other.tipopersonaPermisoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipopersonaPermiso[ tipopersonaPermisoPK=" + tipopersonaPermisoPK + " ]";
    }
    
}
