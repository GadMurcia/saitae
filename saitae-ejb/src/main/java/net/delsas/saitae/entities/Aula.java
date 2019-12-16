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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "aula", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Aula.findAll", query = "SELECT a FROM Aula a")
    , @NamedQuery(name = "Aula.findByIdaula", query = "SELECT a FROM Aula a WHERE a.idaula = :idaula")
    , @NamedQuery(name = "Aula.findByAulaComentario", query = "SELECT a FROM Aula a WHERE a.aulaComentario = :aulaComentario")})
public class Aula implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idaula")
    private Integer idaula;
    @Size(max = 145)
    @Column(name = "aulaComentario")
    private String aulaComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "aulaGrado")
    private List<Grado> gradoList;
    @JoinColumn(name = "zonaAula", referencedColumnName = "idzona")
    @ManyToOne(optional = false)
    private Zona zonaAula;

    public Aula() {
    }

    public Aula(Integer idaula) {
        this.idaula = idaula;
    }

    public Integer getIdaula() {
        return idaula;
    }

    public void setIdaula(Integer idaula) {
        this.idaula = idaula;
    }

    public String getAulaComentario() {
        return aulaComentario;
    }

    public void setAulaComentario(String aulaComentario) {
        this.aulaComentario = aulaComentario;
    }

    @XmlTransient
    public List<Grado> getGradoList() {
        return gradoList;
    }

    public void setGradoList(List<Grado> gradoList) {
        this.gradoList = gradoList;
    }

    public Zona getZonaAula() {
        return zonaAula;
    }

    public void setZonaAula(Zona zonaAula) {
        this.zonaAula = zonaAula;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idaula != null ? idaula.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Aula)) {
            return false;
        }
        Aula other = (Aula) object;
        if ((this.idaula == null && other.idaula != null) || (this.idaula != null && !this.idaula.equals(other.idaula))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Aula[ idaula=" + idaula + " ]";
    }
    
}
