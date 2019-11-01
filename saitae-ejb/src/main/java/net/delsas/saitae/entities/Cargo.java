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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "cargo", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cargo.findAll", query = "SELECT c FROM Cargo c")
    , @NamedQuery(name = "Cargo.findByIdcargo", query = "SELECT c FROM Cargo c WHERE c.idcargo = :idcargo")
    , @NamedQuery(name = "Cargo.findByCargoNombre", query = "SELECT c FROM Cargo c WHERE c.cargoNombre = :cargoNombre")
    , @NamedQuery(name = "Cargo.findByCargoComentario", query = "SELECT c FROM Cargo c WHERE c.cargoComentario = :cargoComentario")})
public class Cargo implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "cargoNombre")
    private String cargoNombre;
    @Size(max = 145)
    @Column(name = "cargoComentario")
    private String cargoComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcargo")
    private Integer idcargo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cargo")
    private List<MaestoCargo> maestoCargoList;
    @JoinColumn(name = "cargoTipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne
    private TipoPersona cargoTipoPersona;

    public Cargo() {
    }

    public Cargo(Integer idcargo) {
        this.idcargo = idcargo;
    }

    public Cargo(Integer idcargo, String cargoNombre) {
        this.idcargo = idcargo;
        this.cargoNombre = cargoNombre;
    }

    public Integer getIdcargo() {
        return idcargo;
    }

    public void setIdcargo(Integer idcargo) {
        this.idcargo = idcargo;
    }


    @XmlTransient
    public List<MaestoCargo> getMaestoCargoList() {
        return maestoCargoList;
    }

    public void setMaestoCargoList(List<MaestoCargo> maestoCargoList) {
        this.maestoCargoList = maestoCargoList;
    }

    public TipoPersona getCargoTipoPersona() {
        return cargoTipoPersona;
    }

    public void setCargoTipoPersona(TipoPersona cargoTipoPersona) {
        this.cargoTipoPersona = cargoTipoPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcargo != null ? idcargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cargo)) {
            return false;
        }
        Cargo other = (Cargo) object;
        if ((this.idcargo == null && other.idcargo != null) || (this.idcargo != null && !this.idcargo.equals(other.idcargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Cargo[ idcargo=" + idcargo + " ]";
    }

    public String getCargoNombre() {
        return cargoNombre;
    }

    public void setCargoNombre(String cargoNombre) {
        this.cargoNombre = cargoNombre;
    }

    public String getCargoComentario() {
        return cargoComentario;
    }

    public void setCargoComentario(String cargoComentario) {
        this.cargoComentario = cargoComentario;
    }
    
}
