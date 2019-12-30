/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "reservaDetalle", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReservaDetalle.findAll", query = "SELECT r FROM ReservaDetalle r")
    , @NamedQuery(name = "ReservaDetalle.findByIdRecurso", query = "SELECT r FROM ReservaDetalle r WHERE r.reservaDetallePK.idRecurso = :idRecurso")
    , @NamedQuery(name = "ReservaDetalle.findByEjemplarCorrelativo", query = "SELECT r FROM ReservaDetalle r WHERE r.reservaDetallePK.ejemplarCorrelativo = :ejemplarCorrelativo")
    , @NamedQuery(name = "ReservaDetalle.findByReservaDetalleComentario", query = "SELECT r FROM ReservaDetalle r WHERE r.reservaDetalleComentario = :reservaDetalleComentario")
    , @NamedQuery(name = "ReservaDetalle.findByIdReserva", query = "SELECT r FROM ReservaDetalle r WHERE r.reservaDetallePK.idReserva = :idReserva")
    , @NamedQuery(name = "ReservaDetalle.findReservaByIdReserva", query = "SELECT DISTINCT r.reserva FROM ReservaDetalle r WHERE r.reservaDetallePK.idReserva = :idReserva")
})
public class ReservaDetalle implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ReservaDetallePK reservaDetallePK;
    @Size(max = 145)
    @Column(name = "reservaDetalleComentario")
    private String reservaDetalleComentario;
    @JoinColumn(name = "idReserva", referencedColumnName = "idreserva", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Reserva reserva;
    @JoinColumns({
        @JoinColumn(name = "idRecurso", referencedColumnName = "idRecurso", insertable = false, updatable = false)
        , @JoinColumn(name = "ejemplarCorrelativo", referencedColumnName = "ejemplarCorrelativo", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Ejemplar ejemplar;

    public ReservaDetalle() {
    }

    public ReservaDetalle(ReservaDetallePK reservaDetallePK) {
        this.reservaDetallePK = reservaDetallePK;
    }

    public ReservaDetalle(int idRecurso, int ejemplarCorrelativo, int idReserva) {
        this.reservaDetallePK = new ReservaDetallePK(idRecurso, ejemplarCorrelativo, idReserva);
    }

    public ReservaDetallePK getReservaDetallePK() {
        return reservaDetallePK;
    }

    public void setReservaDetallePK(ReservaDetallePK reservaDetallePK) {
        this.reservaDetallePK = reservaDetallePK;
    }

    public String getReservaDetalleComentario() {
        return reservaDetalleComentario;
    }

    public void setReservaDetalleComentario(String reservaDetalleComentario) {
        this.reservaDetalleComentario = reservaDetalleComentario;
    }

    public Reserva getReserva() {
        return reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }

    public Ejemplar getEjemplar() {
        return ejemplar;
    }

    public void setEjemplar(Ejemplar ejemplar) {
        this.ejemplar = ejemplar;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reservaDetallePK != null ? reservaDetallePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReservaDetalle)) {
            return false;
        }
        ReservaDetalle other = (ReservaDetalle) object;
        if ((this.reservaDetallePK == null && other.reservaDetallePK != null) || (this.reservaDetallePK != null && !this.reservaDetallePK.equals(other.reservaDetallePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ReservaDetalle[ reservaDetallePK=" + reservaDetallePK + " ]";
    }

}
