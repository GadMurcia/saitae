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
@Table(name = "tipoCargo", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoCargo.findAll", query = "SELECT t FROM TipoCargo t ORDER BY t.nombre ASC")
    , @NamedQuery(name = "TipoCargo.findByIdtipoCargo", query = "SELECT t FROM TipoCargo t WHERE t.idtipoCargo = :idtipoCargo")
    , @NamedQuery(name = "TipoCargo.findByNombre", query = "SELECT t FROM TipoCargo t WHERE t.nombre = :nombre")
    , @NamedQuery(name = "TipoCargo.findByTipoCargoComentario", query = "SELECT t FROM TipoCargo t WHERE t.tipoCargoComentario = :tipoCargoComentario")})
public class TipoCargo implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 145)
    @Column(name = "tipoCargoComentario")
    private String tipoCargoComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoCargo")
    private Integer idtipoCargo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoCargo")
    private List<Recurso> recursoList;

    public TipoCargo() {
    }

    public TipoCargo(Integer idtipoCargo) {
        this.idtipoCargo = idtipoCargo;
    }

    public TipoCargo(Integer idtipoCargo, String nombre) {
        this.idtipoCargo = idtipoCargo;
        this.nombre = nombre;
    }

    public Integer getIdtipoCargo() {
        return idtipoCargo;
    }

    public void setIdtipoCargo(Integer idtipoCargo) {
        this.idtipoCargo = idtipoCargo;
    }


    @XmlTransient
    public List<Recurso> getRecursoList() {
        return recursoList;
    }

    public void setRecursoList(List<Recurso> recursoList) {
        this.recursoList = recursoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoCargo != null ? idtipoCargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoCargo)) {
            return false;
        }
        TipoCargo other = (TipoCargo) object;
        if ((this.idtipoCargo == null && other.idtipoCargo != null) || (this.idtipoCargo != null && !this.idtipoCargo.equals(other.idtipoCargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoCargo[ idtipoCargo=" + idtipoCargo + " ]";
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoCargoComentario() {
        return tipoCargoComentario;
    }

    public void setTipoCargoComentario(String tipoCargoComentario) {
        this.tipoCargoComentario = tipoCargoComentario;
    }
    
}
