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
@Table(name = "zona", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Zona.findAll", query = "SELECT z FROM Zona z")
    , @NamedQuery(name = "Zona.findByIdzona", query = "SELECT z FROM Zona z WHERE z.idzona = :idzona")
    , @NamedQuery(name = "Zona.findByZonaNombre", query = "SELECT z FROM Zona z WHERE z.zonaNombre = :zonaNombre")
    , @NamedQuery(name = "Zona.findByZonaCoementario", query = "SELECT z FROM Zona z WHERE z.zonaCoementario = :zonaCoementario")})
public class Zona implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "zonaNombre")
    private String zonaNombre;
    @Size(max = 145)
    @Column(name = "zonaCoementario")
    private String zonaCoementario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idzona")
    private Integer idzona;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "zonaAula")
    private List<Aula> aulaList;

    public Zona() {
    }

    public Zona(Integer idzona) {
        this.idzona = idzona;
    }

    public Zona(Integer idzona, String zonaNombre) {
        this.idzona = idzona;
        this.zonaNombre = zonaNombre;
    }

    public Integer getIdzona() {
        return idzona;
    }

    public void setIdzona(Integer idzona) {
        this.idzona = idzona;
    }


    @XmlTransient
    public List<Aula> getAulaList() {
        return aulaList;
    }

    public void setAulaList(List<Aula> aulaList) {
        this.aulaList = aulaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idzona != null ? idzona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Zona)) {
            return false;
        }
        Zona other = (Zona) object;
        if ((this.idzona == null && other.idzona != null) || (this.idzona != null && !this.idzona.equals(other.idzona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Zona[ idzona=" + idzona + " ]";
    }

    public String getZonaNombre() {
        return zonaNombre;
    }

    public void setZonaNombre(String zonaNombre) {
        this.zonaNombre = zonaNombre;
    }

    public String getZonaCoementario() {
        return zonaCoementario;
    }

    public void setZonaCoementario(String zonaCoementario) {
        this.zonaCoementario = zonaCoementario;
    }
    
}
