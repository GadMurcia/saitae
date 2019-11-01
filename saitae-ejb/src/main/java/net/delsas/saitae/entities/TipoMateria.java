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
@Table(name = "tipoMateria", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoMateria.findAll", query = "SELECT t FROM TipoMateria t")
    , @NamedQuery(name = "TipoMateria.findByIdtipoMateria", query = "SELECT t FROM TipoMateria t WHERE t.idtipoMateria = :idtipoMateria")
    , @NamedQuery(name = "TipoMateria.findByTipoMateriaNombre", query = "SELECT t FROM TipoMateria t WHERE t.tipoMateriaNombre = :tipoMateriaNombre")
    , @NamedQuery(name = "TipoMateria.findByTipoMateriaComentario", query = "SELECT t FROM TipoMateria t WHERE t.tipoMateriaComentario = :tipoMateriaComentario")})
public class TipoMateria implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "tipoMateriaNombre")
    private String tipoMateriaNombre;
    @Size(max = 145)
    @Column(name = "tipoMateriaComentario")
    private String tipoMateriaComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoMateria")
    private Integer idtipoMateria;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoMateria")
    private List<Materia> materiaList;

    public TipoMateria() {
    }

    public TipoMateria(Integer idtipoMateria) {
        this.idtipoMateria = idtipoMateria;
    }

    public TipoMateria(Integer idtipoMateria, String tipoMateriaNombre) {
        this.idtipoMateria = idtipoMateria;
        this.tipoMateriaNombre = tipoMateriaNombre;
    }

    public Integer getIdtipoMateria() {
        return idtipoMateria;
    }

    public void setIdtipoMateria(Integer idtipoMateria) {
        this.idtipoMateria = idtipoMateria;
    }


    @XmlTransient
    public List<Materia> getMateriaList() {
        return materiaList;
    }

    public void setMateriaList(List<Materia> materiaList) {
        this.materiaList = materiaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoMateria != null ? idtipoMateria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoMateria)) {
            return false;
        }
        TipoMateria other = (TipoMateria) object;
        if ((this.idtipoMateria == null && other.idtipoMateria != null) || (this.idtipoMateria != null && !this.idtipoMateria.equals(other.idtipoMateria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoMateria[ idtipoMateria=" + idtipoMateria + " ]";
    }

    public String getTipoMateriaNombre() {
        return tipoMateriaNombre;
    }

    public void setTipoMateriaNombre(String tipoMateriaNombre) {
        this.tipoMateriaNombre = tipoMateriaNombre;
    }

    public String getTipoMateriaComentario() {
        return tipoMateriaComentario;
    }

    public void setTipoMateriaComentario(String tipoMateriaComentario) {
        this.tipoMateriaComentario = tipoMateriaComentario;
    }
    
}
