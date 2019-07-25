/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "tipoPermiso", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoPermiso.findAll", query = "SELECT t FROM TipoPermiso t")
    , @NamedQuery(name = "TipoPermiso.findByIdtipoPermiso", query = "SELECT t FROM TipoPermiso t WHERE t.idtipoPermiso = :idtipoPermiso")
    , @NamedQuery(name = "TipoPermiso.findByTipoPermisoNombre", query = "SELECT t FROM TipoPermiso t WHERE t.tipoPermisoNombre = :tipoPermisoNombre")
    , @NamedQuery(name = "TipoPermiso.findByTipoPermisoDiasMes", query = "SELECT t FROM TipoPermiso t WHERE t.tipoPermisoDiasMes = :tipoPermisoDiasMes")
    , @NamedQuery(name = "TipoPermiso.findByTipoPermisoComentarios", query = "SELECT t FROM TipoPermiso t WHERE t.tipoPermisoComentarios = :tipoPermisoComentarios")})
public class TipoPermiso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoPermiso")
    private Integer idtipoPermiso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipoPermisoNombre")
    private String tipoPermisoNombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tipoPermisoDiasMes")
    private int tipoPermisoDiasMes;
    @Size(max = 250)
    @Column(name = "tipoPermisoComentarios")
    private String tipoPermisoComentarios;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoPermiso")
    private List<TipopersonaPermiso> tipopersonaPermisoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoPermiso1")
    private List<Permisos> permisosList;

    public TipoPermiso() {
    }

    public TipoPermiso(Integer idtipoPermiso) {
        this.idtipoPermiso = idtipoPermiso;
    }

    public TipoPermiso(Integer idtipoPermiso, String tipoPermisoNombre, int tipoPermisoDiasMes) {
        this.idtipoPermiso = idtipoPermiso;
        this.tipoPermisoNombre = tipoPermisoNombre;
        this.tipoPermisoDiasMes = tipoPermisoDiasMes;
    }

    public Integer getIdtipoPermiso() {
        return idtipoPermiso;
    }

    public void setIdtipoPermiso(Integer idtipoPermiso) {
        this.idtipoPermiso = idtipoPermiso;
    }

    public String getTipoPermisoNombre() {
        return tipoPermisoNombre;
    }

    public void setTipoPermisoNombre(String tipoPermisoNombre) {
        this.tipoPermisoNombre = tipoPermisoNombre;
    }

    public int getTipoPermisoDiasMes() {
        return tipoPermisoDiasMes;
    }

    public void setTipoPermisoDiasMes(int tipoPermisoDiasMes) {
        this.tipoPermisoDiasMes = tipoPermisoDiasMes;
    }

    public String getTipoPermisoComentarios() {
        return tipoPermisoComentarios;
    }

    public void setTipoPermisoComentarios(String tipoPermisoComentarios) {
        this.tipoPermisoComentarios = tipoPermisoComentarios;
    }

    @XmlTransient
    public List<TipopersonaPermiso> getTipopersonaPermisoList() {
        return tipopersonaPermisoList;
    }

    public void setTipopersonaPermisoList(List<TipopersonaPermiso> tipopersonaPermisoList) {
        this.tipopersonaPermisoList = tipopersonaPermisoList;
    }

    @XmlTransient
    public List<Permisos> getPermisosList() {
        return permisosList;
    }

    public void setPermisosList(List<Permisos> permisosList) {
        this.permisosList = permisosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoPermiso != null ? idtipoPermiso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoPermiso)) {
            return false;
        }
        TipoPermiso other = (TipoPermiso) object;
        if ((this.idtipoPermiso == null && other.idtipoPermiso != null) || (this.idtipoPermiso != null && !this.idtipoPermiso.equals(other.idtipoPermiso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoPermiso[ idtipoPermiso=" + idtipoPermiso + " ]";
    }

}
