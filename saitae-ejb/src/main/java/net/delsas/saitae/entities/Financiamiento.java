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
@Table(name = "financiamiento", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Financiamiento.findAll", query = "SELECT f FROM Financiamiento f ORDER BY f.financiamientoNombre ASC")
    , @NamedQuery(name = "Financiamiento.findByIdfinanciamiento", query = "SELECT f FROM Financiamiento f WHERE f.idfinanciamiento = :idfinanciamiento")
    , @NamedQuery(name = "Financiamiento.findByFinanciamientoNombre", query = "SELECT f FROM Financiamiento f WHERE f.financiamientoNombre = :financiamientoNombre")
    , @NamedQuery(name = "Financiamiento.findByFinanciamientoComentario", query = "SELECT f FROM Financiamiento f WHERE f.financiamientoComentario = :financiamientoComentario")})
public class Financiamiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idfinanciamiento")
    private Integer idfinanciamiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "financiamientoNombre")
    private String financiamientoNombre;
    @Size(max = 145)
    @Column(name = "financiamientoComentario")
    private String financiamientoComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "financiamiento")
    private List<MaestoCargo> maestoCargoList;

    public Financiamiento() {
    }

    public Financiamiento(Integer idfinanciamiento) {
        this.idfinanciamiento = idfinanciamiento;
    }

    public Financiamiento(Integer idfinanciamiento, String financiamientoNombre) {
        this.idfinanciamiento = idfinanciamiento;
        this.financiamientoNombre = financiamientoNombre;
    }

    public Integer getIdfinanciamiento() {
        return idfinanciamiento;
    }

    public void setIdfinanciamiento(Integer idfinanciamiento) {
        this.idfinanciamiento = idfinanciamiento;
    }

    public String getFinanciamientoNombre() {
        return financiamientoNombre;
    }

    public void setFinanciamientoNombre(String financiamientoNombre) {
        this.financiamientoNombre = financiamientoNombre;
    }

    public String getFinanciamientoComentario() {
        return financiamientoComentario;
    }

    public void setFinanciamientoComentario(String financiamientoComentario) {
        this.financiamientoComentario = financiamientoComentario;
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
        hash += (idfinanciamiento != null ? idfinanciamiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Financiamiento)) {
            return false;
        }
        Financiamiento other = (Financiamiento) object;
        if ((this.idfinanciamiento == null && other.idfinanciamiento != null) || (this.idfinanciamiento != null && !this.idfinanciamiento.equals(other.idfinanciamiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Financiamiento[ idfinanciamiento=" + idfinanciamiento + " ]";
    }
    
}
