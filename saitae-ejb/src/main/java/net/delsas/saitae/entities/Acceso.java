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
@Table(name = "acceso", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Acceso.findAll", query = "SELECT a FROM Acceso a")
    , @NamedQuery(name = "Acceso.findByIdacceso", query = "SELECT a FROM Acceso a WHERE a.idacceso = :idacceso")
    , @NamedQuery(name = "Acceso.findByAccesoNombre", query = "SELECT a FROM Acceso a WHERE a.accesoNombre = :accesoNombre")
    , @NamedQuery(name = "Acceso.findByAccesourl", query = "SELECT a FROM Acceso a WHERE a.accesourl = :url")
    , @NamedQuery(name = "Acceso.findByAccesoComentario", query = "SELECT a FROM Acceso a WHERE a.accesoComentario = :accesoComentario")})
public class Acceso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idacceso")
    private Integer idacceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "accesoNombre")
    private String accesoNombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "accesourl")
    private String accesourl;
    @Size(max = 140)
    @Column(name = "accesoComentario")
    private String accesoComentario;
    @OneToMany(mappedBy = "accesoIndice")
    private List<Acceso> accesoList;
    @JoinColumn(name = "accesoIndice", referencedColumnName = "idacceso")
    @ManyToOne
    private Acceso accesoIndice;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "acceso")
    private List<AccesoTipoPersona> accesoTipoPersonaList;

    public Acceso() {
    }

    public Acceso(Integer idacceso) {
        this.idacceso = idacceso;
    }

    public Acceso(Integer idacceso, String accesoNombre, String accesourl) {
        this.idacceso = idacceso;
        this.accesoNombre = accesoNombre;
        this.accesourl = accesourl;
    }

    public Integer getIdacceso() {
        return idacceso;
    }

    public void setIdacceso(Integer idacceso) {
        this.idacceso = idacceso;
    }

    public String getAccesoNombre() {
        return accesoNombre;
    }

    public void setAccesoNombre(String accesoNombre) {
        this.accesoNombre = accesoNombre;
    }

    public String getAccesourl() {
        return accesourl;
    }

    public void setAccesourl(String accesourl) {
        this.accesourl = accesourl;
    }

    public String getAccesoComentario() {
        return accesoComentario;
    }

    public void setAccesoComentario(String accesoComentario) {
        this.accesoComentario = accesoComentario;
    }

    @XmlTransient
    public List<Acceso> getAccesoList() {
        return accesoList;
    }

    public void setAccesoList(List<Acceso> accesoList) {
        this.accesoList = accesoList;
    }

    public Acceso getAccesoIndice() {
        return accesoIndice;
    }

    public void setAccesoIndice(Acceso accesoIndice) {
        this.accesoIndice = accesoIndice;
    }

    @XmlTransient
    public List<AccesoTipoPersona> getAccesoTipoPersonaList() {
        return accesoTipoPersonaList;
    }

    public void setAccesoTipoPersonaList(List<AccesoTipoPersona> accesoTipoPersonaList) {
        this.accesoTipoPersonaList = accesoTipoPersonaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idacceso != null ? idacceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Acceso)) {
            return false;
        }
        Acceso other = (Acceso) object;
        if ((this.idacceso == null && other.idacceso != null) || (this.idacceso != null && !this.idacceso.equals(other.idacceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Acceso[ idacceso=" + idacceso + " ]";
    }
    
}
