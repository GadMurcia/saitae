/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "materia", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Materia.findAll", query = "SELECT m FROM Materia m"),
    @NamedQuery(name = "Materia.findByIdmateria", query = "SELECT m FROM Materia m WHERE m.idmateria = :idmateria"),
    @NamedQuery(name = "Materia.findByMateriaNombre", query = "SELECT m FROM Materia m WHERE m.materiaNombre = :materiaNombre"),
    @NamedQuery(name = "Materia.findByMateriaAbreviacion", query = "SELECT m FROM Materia m WHERE m.materiaAbreviacion = :materiaAbreviacion"),
    @NamedQuery(name = "Materia.findByMateriaComentario", query = "SELECT m FROM Materia m WHERE m.materiaComentario = :materiaComentario")})
public class Materia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmateria")
    private Integer idmateria;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "materiaNombre")
    private String materiaNombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "materiaAbreviacion")
    private String materiaAbreviacion;
    @Size(max = 145)
    @Column(name = "materiaComentario")
    private String materiaComentario;
    @JoinColumn(name = "tipoMateria", referencedColumnName = "idtipoMateria")
    @ManyToOne(optional = false)
    private TipoMateria tipoMateria;

    public Materia() {
    }

    public Materia(Integer idmateria) {
        this.idmateria = idmateria;
    }

    public Materia(Integer idmateria, String materiaNombre, String materiaAbreviacion) {
        this.idmateria = idmateria;
        this.materiaNombre = materiaNombre;
        this.materiaAbreviacion = materiaAbreviacion;
    }

    public Integer getIdmateria() {
        return idmateria;
    }

    public void setIdmateria(Integer idmateria) {
        this.idmateria = idmateria;
    }

    public String getMateriaNombre() {
        return materiaNombre;
    }

    public void setMateriaNombre(String materiaNombre) {
        this.materiaNombre = materiaNombre;
    }

    public String getMateriaAbreviacion() {
        return materiaAbreviacion;
    }

    public void setMateriaAbreviacion(String materiaAbreviacion) {
        this.materiaAbreviacion = materiaAbreviacion;
    }

    public String getMateriaComentario() {
        return materiaComentario;
    }

    public void setMateriaComentario(String materiaComentario) {
        this.materiaComentario = materiaComentario;
    }

    public TipoMateria getTipoMateria() {
        return tipoMateria;
    }

    public void setTipoMateria(TipoMateria tipoMateria) {
        this.tipoMateria = tipoMateria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmateria != null ? idmateria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Materia)) {
            return false;
        }
        Materia other = (Materia) object;
        if ((this.idmateria == null && other.idmateria != null) || (this.idmateria != null && !this.idmateria.equals(other.idmateria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Materia[ idmateria=" + idmateria + " ]";
    }
    
}
