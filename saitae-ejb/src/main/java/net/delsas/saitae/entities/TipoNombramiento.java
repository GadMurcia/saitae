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
@Table(name = "tipoNombramiento", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoNombramiento.findAll", query = "SELECT t FROM TipoNombramiento t ORDER BY t.tipoNombramientoNombre ASC")
    , @NamedQuery(name = "TipoNombramiento.findByIdtipoNombramiento", query = "SELECT t FROM TipoNombramiento t WHERE t.idtipoNombramiento = :idtipoNombramiento")
    , @NamedQuery(name = "TipoNombramiento.findByTipoNombramientoNombre", query = "SELECT t FROM TipoNombramiento t WHERE t.tipoNombramientoNombre = :tipoNombramientoNombre")
    , @NamedQuery(name = "TipoNombramiento.findByTipoNombramientoCoemntario", query = "SELECT t FROM TipoNombramiento t WHERE t.tipoNombramientoCoemntario = :tipoNombramientoCoemntario")})
public class TipoNombramiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoNombramiento")
    private Integer idtipoNombramiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "tipoNombramientoNombre")
    private String tipoNombramientoNombre;
    @Size(max = 145)
    @Column(name = "tipoNombramientoCoemntario")
    private String tipoNombramientoCoemntario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoNombramiento")
    private List<MaestoCargo> maestoCargoList;

    public TipoNombramiento() {
    }

    public TipoNombramiento(Integer idtipoNombramiento) {
        this.idtipoNombramiento = idtipoNombramiento;
    }

    public TipoNombramiento(Integer idtipoNombramiento, String tipoNombramientoNombre) {
        this.idtipoNombramiento = idtipoNombramiento;
        this.tipoNombramientoNombre = tipoNombramientoNombre;
    }

    public Integer getIdtipoNombramiento() {
        return idtipoNombramiento;
    }

    public void setIdtipoNombramiento(Integer idtipoNombramiento) {
        this.idtipoNombramiento = idtipoNombramiento;
    }

    public String getTipoNombramientoNombre() {
        return tipoNombramientoNombre;
    }

    public void setTipoNombramientoNombre(String tipoNombramientoNombre) {
        this.tipoNombramientoNombre = tipoNombramientoNombre;
    }

    public String getTipoNombramientoCoemntario() {
        return tipoNombramientoCoemntario;
    }

    public void setTipoNombramientoCoemntario(String tipoNombramientoCoemntario) {
        this.tipoNombramientoCoemntario = tipoNombramientoCoemntario;
    }

    @XmlTransient
    public List<MaestoCargo> getMaestoCargoList() {
        return maestoCargoList;
    }

    public void setMaestoCargoList(List<MaestoCargo> maestoCargoList) {
        this.maestoCargoList = maestoCargoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoNombramiento != null ? idtipoNombramiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoNombramiento)) {
            return false;
        }
        TipoNombramiento other = (TipoNombramiento) object;
        if ((this.idtipoNombramiento == null && other.idtipoNombramiento != null) || (this.idtipoNombramiento != null && !this.idtipoNombramiento.equals(other.idtipoNombramiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoNombramiento[ idtipoNombramiento=" + idtipoNombramiento + " ]";
    }
    
}
