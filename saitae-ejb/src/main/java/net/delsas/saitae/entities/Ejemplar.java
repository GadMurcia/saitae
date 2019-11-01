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
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "ejemplar", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ejemplar.findAll", query = "SELECT e FROM Ejemplar e")
    , @NamedQuery(name = "Ejemplar.findByIdRecurso", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarPK.idRecurso = :idRecurso")
    , @NamedQuery(name = "Ejemplar.findByEjemplarCorrelativo", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarPK.ejemplarCorrelativo = :ejemplarCorrelativo")
    , @NamedQuery(name = "Ejemplar.findByEjemplarAnioDeIngreso", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarAnioDeIngreso = :ejemplarAnioDeIngreso")
    , @NamedQuery(name = "Ejemplar.findByEjemplarComentario", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarComentario = :ejemplarComentario")})
public class Ejemplar implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ejemplarAnioDeIngreso")
    private int ejemplarAnioDeIngreso;
    @Size(max = 145)
    @Column(name = "ejemplarComentario")
    private String ejemplarComentario;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EjemplarPK ejemplarPK;
    @JoinColumn(name = "idRecurso", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ejemplar")
    private List<ReservaDetalle> reservaDetalleList;

    public Ejemplar() {
    }

    public Ejemplar(EjemplarPK ejemplarPK) {
        this.ejemplarPK = ejemplarPK;
    }

    public Ejemplar(EjemplarPK ejemplarPK, int ejemplarAnioDeIngreso) {
        this.ejemplarPK = ejemplarPK;
        this.ejemplarAnioDeIngreso = ejemplarAnioDeIngreso;
    }

    public Ejemplar(int idRecurso, int ejemplarCorrelativo) {
        this.ejemplarPK = new EjemplarPK(idRecurso, ejemplarCorrelativo);
    }

    public EjemplarPK getEjemplarPK() {
        return ejemplarPK;
    }

    public void setEjemplarPK(EjemplarPK ejemplarPK) {
        this.ejemplarPK = ejemplarPK;
    }


    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    @XmlTransient
    public List<ReservaDetalle> getReservaDetalleList() {
        return reservaDetalleList;
    }

    public void setReservaDetalleList(List<ReservaDetalle> reservaDetalleList) {
        this.reservaDetalleList = reservaDetalleList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ejemplarPK != null ? ejemplarPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ejemplar)) {
            return false;
        }
        Ejemplar other = (Ejemplar) object;
        if ((this.ejemplarPK == null && other.ejemplarPK != null) || (this.ejemplarPK != null && !this.ejemplarPK.equals(other.ejemplarPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Ejemplar[ ejemplarPK=" + ejemplarPK + " ]";
    }

    public int getEjemplarAnioDeIngreso() {
        return ejemplarAnioDeIngreso;
    }

    public void setEjemplarAnioDeIngreso(int ejemplarAnioDeIngreso) {
        this.ejemplarAnioDeIngreso = ejemplarAnioDeIngreso;
    }

    public String getEjemplarComentario() {
        return ejemplarComentario;
    }

    public void setEjemplarComentario(String ejemplarComentario) {
        this.ejemplarComentario = ejemplarComentario;
    }
    
}
