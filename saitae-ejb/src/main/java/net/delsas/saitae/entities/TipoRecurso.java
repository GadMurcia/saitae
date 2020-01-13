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
@Table(name = "tipoRecurso", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoRecurso.findAll", query = "SELECT t FROM TipoRecurso t")
    , @NamedQuery(name = "TipoRecurso.findByIdtipoRecurso", query = "SELECT t FROM TipoRecurso t WHERE t.idtipoRecurso = :idtipoRecurso")
    , @NamedQuery(name = "TipoRecurso.findByTipoRecursoNombre", query = "SELECT t FROM TipoRecurso t WHERE t.tipoRecursoNombre = :tipoRecursoNombre")
    , @NamedQuery(name = "TipoRecurso.findByTipoRecursoComentario", query = "SELECT t FROM TipoRecurso t WHERE t.tipoRecursoComentario = :tipoRecursoComentario")})
public class TipoRecurso implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "tipoRecursoNombre")
    private String tipoRecursoNombre;
    @Size(max = 140)
    @Column(name = "tipoRecursoComentario")
    private String tipoRecursoComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoRecurso")
    private Integer idtipoRecurso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTipoRecurso")
    private List<Recurso> recursoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoRecurso")
    private List<Reserva> reservaList;

    public TipoRecurso() {
    }

    public TipoRecurso(Integer idtipoRecurso) {
        this.idtipoRecurso = idtipoRecurso;
    }

    public TipoRecurso(Integer idtipoRecurso, String tipoRecursoNombre) {
        this.idtipoRecurso = idtipoRecurso;
        this.tipoRecursoNombre = tipoRecursoNombre;
    }

    public Integer getIdtipoRecurso() {
        return idtipoRecurso;
    }

    public void setIdtipoRecurso(Integer idtipoRecurso) {
        this.idtipoRecurso = idtipoRecurso;
    }


    @XmlTransient
    public List<Recurso> getRecursoList() {
        return recursoList;
    }

    public void setRecursoList(List<Recurso> recursoList) {
        this.recursoList = recursoList;
    }    

    @XmlTransient
    public List<Reserva> getReservaList() {
        return reservaList;
    }

    public void setReservaList(List<Reserva> reservaList) {
        this.reservaList = reservaList;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.idtipoRecurso);
        hash = 89 * hash + Objects.hashCode(this.tipoRecursoNombre);
        hash = 89 * hash + Objects.hashCode(this.tipoRecursoComentario);
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
        final TipoRecurso other = (TipoRecurso) obj;
        if (!Objects.equals(this.tipoRecursoNombre, other.tipoRecursoNombre)) {
            return false;
        }
        if (!Objects.equals(this.tipoRecursoComentario, other.tipoRecursoComentario)) {
            return false;
        }
        return Objects.equals(this.idtipoRecurso, other.idtipoRecurso);
    }

    @Override
    public String toString() {
        return "TipoRecurso{" + "idtipoRecurso=" + idtipoRecurso + ", tipoRecursoNombre=" + tipoRecursoNombre + ", tipoRecursoComentario=" + tipoRecursoComentario + ", recursoList=" + recursoList + ", reservaList=" + reservaList + '}';
    }

    public String getTipoRecursoNombre() {
        return tipoRecursoNombre;
    }

    public void setTipoRecursoNombre(String tipoRecursoNombre) {
        this.tipoRecursoNombre = tipoRecursoNombre;
    }

    public String getTipoRecursoComentario() {
        return tipoRecursoComentario;
    }

    public void setTipoRecursoComentario(String tipoRecursoComentario) {
        this.tipoRecursoComentario = tipoRecursoComentario;
    }
}
