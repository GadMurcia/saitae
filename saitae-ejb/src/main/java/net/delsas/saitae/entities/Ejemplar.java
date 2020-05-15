/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
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
    @NamedQuery(name = "Ejemplar.findAll", query = "SELECT e FROM Ejemplar e"),
    @NamedQuery(name = "Ejemplar.findByIdRecurso", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarPK.idRecurso = :idRecurso"),
    @NamedQuery(name = "Ejemplar.findByEjemplarCorrelativo", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarPK.ejemplarCorrelativo = :ejemplarCorrelativo"),
    @NamedQuery(name = "Ejemplar.findByEjemplarAnioDeIngreso", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarAnioDeIngreso = :ejemplarAnioDeIngreso"),
    @NamedQuery(name = "Ejemplar.findByEjemplarComentario", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarComentario = :ejemplarComentario"),
    @NamedQuery(name = "Ejemplar.findCorrelativoByIdRecurso", query = "SELECT e.ejemplarPK.ejemplarCorrelativo FROM Ejemplar e WHERE e.ejemplarPK.idRecurso = :idRecurso"),
    @NamedQuery(name = "Ejemplar.findByEjemplarMarca", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarMarca = :ejemplarMarca"),
    @NamedQuery(name = "Ejemplar.findByEjemplarSerie", query = "SELECT e FROM Ejemplar e WHERE e.ejemplarSerie = :ejemplarSerie"),})
public class Ejemplar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EjemplarPK ejemplarPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ejemplarAnioDeIngreso")
    private int ejemplarAnioDeIngreso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ejemplarActivo")
    private boolean ejemplarActivo;
    @Size(max = 150)
    @Column(name = "ejemplarMarca")
    private String ejemplarMarca;
    @Size(max = 150)
    @Column(name = "ejemplarSerie")
    private String ejemplarSerie;
    @Size(max = 145)
    @Column(name = "ejemplarComentario")
    private String ejemplarComentario;
    @JoinColumn(name = "idRecurso", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ejemplar")
    private List<ReservaDetalle> reservaDetalleList;

    public Ejemplar() {
    }

    public Ejemplar(EjemplarPK ejemplarPK) {
        this.ejemplarPK = ejemplarPK;
        this.ejemplarActivo = true;
    }

    public Ejemplar(EjemplarPK ejemplarPK, int ejemplarAnioDeIngreso, boolean ejemplarActivo) {
        this.ejemplarPK = ejemplarPK;
        this.ejemplarAnioDeIngreso = ejemplarAnioDeIngreso;
        this.ejemplarActivo = ejemplarActivo;
    }

    public Ejemplar(int idRecurso, int ejemplarCorrelativo) {
        this.ejemplarPK = new EjemplarPK(idRecurso, ejemplarCorrelativo);
        this.ejemplarActivo = true;
    }

    public EjemplarPK getEjemplarPK() {
        return ejemplarPK;
    }

    public void setEjemplarPK(EjemplarPK ejemplarPK) {
        this.ejemplarPK = ejemplarPK;
    }

    public int getEjemplarAnioDeIngreso() {
        return ejemplarAnioDeIngreso;
    }

    public void setEjemplarAnioDeIngreso(int ejemplarAnioDeIngreso) {
        this.ejemplarAnioDeIngreso = ejemplarAnioDeIngreso;
    }

    public boolean getEjemplarActivo() {
        return ejemplarActivo;
    }

    public void setEjemplarActivo(boolean ejemplarActivo) {
        this.ejemplarActivo = ejemplarActivo;
    }

    public String getEjemplarMarca() {
        return ejemplarMarca;
    }

    public void setEjemplarMarca(String ejemplarMarca) {
        this.ejemplarMarca = ejemplarMarca;
    }

    public String getEjemplarSerie() {
        return ejemplarSerie;
    }

    public void setEjemplarSerie(String ejemplarSerie) {
        this.ejemplarSerie = ejemplarSerie;
    }

    public String getEjemplarComentario() {
        return ejemplarComentario;
    }

    public void setEjemplarComentario(String ejemplarComentario) {
        this.ejemplarComentario = ejemplarComentario;
    }

    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    @XmlTransient
    public List<ReservaDetalle> getReservaDetalleList() {
        return this.reservaDetalleList;
    }

    public void setReservaDetalleList(List<ReservaDetalle> reservaDetalleList) {
        this.reservaDetalleList = reservaDetalleList;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.ejemplarPK);
        hash = 41 * hash + this.ejemplarAnioDeIngreso;
        hash = 41 * hash + (this.ejemplarActivo ? 1 : 0);
        hash = 41 * hash + Objects.hashCode(this.ejemplarMarca);
        hash = 41 * hash + Objects.hashCode(this.ejemplarSerie);
        hash = 41 * hash + Objects.hashCode(this.ejemplarComentario);
        hash = 41 * hash + Objects.hashCode(this.recurso);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Ejemplar other = (Ejemplar) obj;
        if (this.ejemplarAnioDeIngreso != other.ejemplarAnioDeIngreso) {
            return false;
        }
        if (this.ejemplarActivo != other.ejemplarActivo) {
            return false;
        }
        if (!Objects.equals(this.ejemplarMarca, other.ejemplarMarca)) {
            return false;
        }
        if (!Objects.equals(this.ejemplarSerie, other.ejemplarSerie)) {
            return false;
        }
        if (!Objects.equals(this.ejemplarComentario, other.ejemplarComentario)) {
            return false;
        }
        if (!Objects.equals(this.ejemplarPK, other.ejemplarPK)) {
            return false;
        }
        return Objects.equals(this.recurso, other.recurso);
    }

    @Override
    public String toString() {
        return "Ejemplar{" + "ejemplarPK=" + ejemplarPK + ", ejemplarAnioDeIngreso=" + ejemplarAnioDeIngreso + ", ejemplarActivo=" + ejemplarActivo + ", ejemplarMarca=" + ejemplarMarca + ", ejemplarSerie=" + ejemplarSerie + ", ejemplarComentario=" + ejemplarComentario + ", recurso=" + recurso + '}';
    }
}
