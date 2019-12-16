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
@Table(name = "tipoPersona", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoPersona.findAll", query = "SELECT t FROM TipoPersona t")
    , @NamedQuery(name = "TipoPersona.findByIdtipoPersona", query = "SELECT t FROM TipoPersona t WHERE t.idtipoPersona = :idtipoPersona")
    , @NamedQuery(name = "TipoPersona.findByTipoPersonaNombre", query = "SELECT t FROM TipoPersona t WHERE t.tipoPersonaNombre = :tipoPersonaNombre")
    , @NamedQuery(name = "TipoPersona.findByTipoPersonaComentario", query = "SELECT t FROM TipoPersona t WHERE t.tipoPersonaComentario = :tipoPersonaComentario")})
public class TipoPersona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoPersona")
    private Integer idtipoPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipoPersonaNombre")
    private String tipoPersonaNombre;
    @Size(max = 145)
    @Column(name = "tipoPersonaComentario")
    private String tipoPersonaComentario;
    @OneToMany(mappedBy = "anuncioTipoPersona")
    private List<Anuncio> anuncioList;
    @OneToMany(mappedBy = "cargoTipoPersona")
    private List<Cargo> cargoList;
    @OneToMany(mappedBy = "tipoPersona")
    private List<Persona> personaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTipoPersona")
    private List<DelagacionCargo> delagacionCargoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoPersona")
    private List<AccesoTipoPersona> accesoTipoPersonaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoPersona")
    private List<TipopersonaPermiso> tipopersonaPermisoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoPersona")
    private List<Permisos> permisosList;

    public TipoPersona() {
    }

    public TipoPersona(Integer idtipoPersona) {
        this.idtipoPersona = idtipoPersona;
    }

    public TipoPersona(Integer idtipoPersona, String tipoPersonaNombre) {
        this.idtipoPersona = idtipoPersona;
        this.tipoPersonaNombre = tipoPersonaNombre;
    }

    public Integer getIdtipoPersona() {
        return idtipoPersona;
    }

    public void setIdtipoPersona(Integer idtipoPersona) {
        this.idtipoPersona = idtipoPersona;
    }

    public String getTipoPersonaNombre() {
        return tipoPersonaNombre;
    }

    public void setTipoPersonaNombre(String tipoPersonaNombre) {
        this.tipoPersonaNombre = tipoPersonaNombre;
    }

    public String getTipoPersonaComentario() {
        return tipoPersonaComentario;
    }

    public void setTipoPersonaComentario(String tipoPersonaComentario) {
        this.tipoPersonaComentario = tipoPersonaComentario;
    }

    @XmlTransient
    public List<Anuncio> getAnuncioList() {
        return anuncioList;
    }

    public void setAnuncioList(List<Anuncio> anuncioList) {
        this.anuncioList = anuncioList;
    }

    @XmlTransient
    public List<Cargo> getCargoList() {
        return cargoList;
    }

    public void setCargoList(List<Cargo> cargoList) {
        this.cargoList = cargoList;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @XmlTransient
    public List<DelagacionCargo> getDelagacionCargoList() {
        return delagacionCargoList;
    }

    public void setDelagacionCargoList(List<DelagacionCargo> delagacionCargoList) {
        this.delagacionCargoList = delagacionCargoList;
    }

    @XmlTransient
    public List<AccesoTipoPersona> getAccesoTipoPersonaList() {
        return accesoTipoPersonaList;
    }

    public void setAccesoTipoPersonaList(List<AccesoTipoPersona> accesoTipoPersonaList) {
        this.accesoTipoPersonaList = accesoTipoPersonaList;
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
        hash += (idtipoPersona != null ? idtipoPersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoPersona)) {
            return false;
        }
        TipoPersona other = (TipoPersona) object;
        if ((this.idtipoPersona == null && other.idtipoPersona != null) || (this.idtipoPersona != null && !this.idtipoPersona.equals(other.idtipoPersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoPersona[ idtipoPersona=" + idtipoPersona + " ]";
    }
    
}
