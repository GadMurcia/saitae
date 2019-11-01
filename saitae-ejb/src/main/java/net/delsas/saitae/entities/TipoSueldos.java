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
@Table(name = "tipoSueldos", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoSueldos.findAll", query = "SELECT t FROM TipoSueldos t")
    , @NamedQuery(name = "TipoSueldos.findByIdtipoSueldo", query = "SELECT t FROM TipoSueldos t WHERE t.idtipoSueldo = :idtipoSueldo")
    , @NamedQuery(name = "TipoSueldos.findByTipoSueldoNombre", query = "SELECT t FROM TipoSueldos t WHERE t.tipoSueldoNombre = :tipoSueldoNombre")
    , @NamedQuery(name = "TipoSueldos.findByTipoSueldosComentario", query = "SELECT t FROM TipoSueldos t WHERE t.tipoSueldosComentario = :tipoSueldosComentario")})
public class TipoSueldos implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "tipoSueldoNombre")
    private String tipoSueldoNombre;
    @Size(max = 145)
    @Column(name = "tipoSueldosComentario")
    private String tipoSueldosComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoSueldo")
    private Integer idtipoSueldo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maestroTipoSalario")
    private List<Maestro> maestroList;

    public TipoSueldos() {
    }

    public TipoSueldos(Integer idtipoSueldo) {
        this.idtipoSueldo = idtipoSueldo;
    }

    public TipoSueldos(Integer idtipoSueldo, String tipoSueldoNombre) {
        this.idtipoSueldo = idtipoSueldo;
        this.tipoSueldoNombre = tipoSueldoNombre;
    }

    public Integer getIdtipoSueldo() {
        return idtipoSueldo;
    }

    public void setIdtipoSueldo(Integer idtipoSueldo) {
        this.idtipoSueldo = idtipoSueldo;
    }


    @XmlTransient
    public List<Maestro> getMaestroList() {
        return maestroList;
    }

    public void setMaestroList(List<Maestro> maestroList) {
        this.maestroList = maestroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoSueldo != null ? idtipoSueldo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoSueldos)) {
            return false;
        }
        TipoSueldos other = (TipoSueldos) object;
        if ((this.idtipoSueldo == null && other.idtipoSueldo != null) || (this.idtipoSueldo != null && !this.idtipoSueldo.equals(other.idtipoSueldo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoSueldos[ idtipoSueldo=" + idtipoSueldo + " ]";
    }

    public String getTipoSueldoNombre() {
        return tipoSueldoNombre;
    }

    public void setTipoSueldoNombre(String tipoSueldoNombre) {
        this.tipoSueldoNombre = tipoSueldoNombre;
    }

    public String getTipoSueldosComentario() {
        return tipoSueldosComentario;
    }

    public void setTipoSueldosComentario(String tipoSueldosComentario) {
        this.tipoSueldosComentario = tipoSueldosComentario;
    }
    
}
