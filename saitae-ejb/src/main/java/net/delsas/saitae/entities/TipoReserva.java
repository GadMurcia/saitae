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
@Table(name = "tipoReserva", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoReserva.findAll", query = "SELECT t FROM TipoReserva t")
    , @NamedQuery(name = "TipoReserva.findByIdtipoReserva", query = "SELECT t FROM TipoReserva t WHERE t.idtipoReserva = :idtipoReserva")
    , @NamedQuery(name = "TipoReserva.findByTipoReservaNombre", query = "SELECT t FROM TipoReserva t WHERE t.tipoReservaNombre = :tipoReservaNombre")
    , @NamedQuery(name = "TipoReserva.findByTipoReservaComentario", query = "SELECT t FROM TipoReserva t WHERE t.tipoReservaComentario = :tipoReservaComentario")})
public class TipoReserva implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "tipoReservaNombre")
    private String tipoReservaNombre;
    @Size(max = 100)
    @Column(name = "tipoReservaComentario")
    private String tipoReservaComentario;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoReserva")
    private Integer idtipoReserva;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoReserva")
    private List<TipoReservaRecurso> tipoReservaRecursoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoReserva")
    private List<Reserva> reservaList;

    public TipoReserva() {
    }

    public TipoReserva(Integer idtipoReserva) {
        this.idtipoReserva = idtipoReserva;
    }

    public TipoReserva(Integer idtipoReserva, String tipoReservaNombre) {
        this.idtipoReserva = idtipoReserva;
        this.tipoReservaNombre = tipoReservaNombre;
    }

    public Integer getIdtipoReserva() {
        return idtipoReserva;
    }

    public void setIdtipoReserva(Integer idtipoReserva) {
        this.idtipoReserva = idtipoReserva;
    }


    @XmlTransient
    public List<TipoReservaRecurso> getTipoReservaRecursoList() {
        return tipoReservaRecursoList;
    }

    public void setTipoReservaRecursoList(List<TipoReservaRecurso> tipoReservaRecursoList) {
        this.tipoReservaRecursoList = tipoReservaRecursoList;
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
        int hash = 0;
        hash += (idtipoReserva != null ? idtipoReserva.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoReserva)) {
            return false;
        }
        TipoReserva other = (TipoReserva) object;
        if ((this.idtipoReserva == null && other.idtipoReserva != null) || (this.idtipoReserva != null && !this.idtipoReserva.equals(other.idtipoReserva))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoReserva[ idtipoReserva=" + idtipoReserva + " ]";
    }

    public String getTipoReservaNombre() {
        return tipoReservaNombre;
    }

    public void setTipoReservaNombre(String tipoReservaNombre) {
        this.tipoReservaNombre = tipoReservaNombre;
    }

    public String getTipoReservaComentario() {
        return tipoReservaComentario;
    }

    public void setTipoReservaComentario(String tipoReservaComentario) {
        this.tipoReservaComentario = tipoReservaComentario;
    }
    
}
