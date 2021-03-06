/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "pais", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pais.findAll", query = "SELECT p FROM Pais p")
    , @NamedQuery(name = "Pais.findByIdpais", query = "SELECT p FROM Pais p WHERE p.idpais = :idpais")
    , @NamedQuery(name = "Pais.findByPaisNombre", query = "SELECT p FROM Pais p WHERE p.paisNombre = :paisNombre")
    , @NamedQuery(name = "Pais.findByPaisComentarios", query = "SELECT p FROM Pais p WHERE p.paisComentarios = :paisComentarios")})
public class Pais implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "paisNombre")
    private String paisNombre;
    @Size(max = 140)
    @Column(name = "paisComentarios")
    private String paisComentarios;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idpais")
    private Integer idpais;
    @OneToMany(mappedBy = "pais")
    private List<Recurso> recursoList;

    public Pais() {
    }

    public Pais(Integer idpais) {
        this.idpais = idpais;
    }

    public Pais(Integer idpais, String paisNombre) {
        this.idpais = idpais;
        this.paisNombre = paisNombre;
    }

    public Integer getIdpais() {
        return idpais;
    }

    public void setIdpais(Integer idpais) {
        this.idpais = idpais;
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
        hash += (idpais != null ? idpais.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pais)) {
            return false;
        }
        Pais other = (Pais) object;
        if ((this.idpais == null && other.idpais != null) || (this.idpais != null && !this.idpais.equals(other.idpais))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Pais[ idpais=" + idpais + " ]";
    }

    public String getPaisNombre() {
        return paisNombre;
    }

    public void setPaisNombre(String paisNombre) {
        this.paisNombre = paisNombre;
    }

    public String getPaisComentarios() {
        return paisComentarios;
    }

    public void setPaisComentarios(String paisComentarios) {
        this.paisComentarios = paisComentarios;
    }
    
}
