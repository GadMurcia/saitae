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
@Table(name = "solicitudReserva", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SolicitudReserva.findAll", query = "SELECT s FROM SolicitudReserva s")
    , @NamedQuery(name = "SolicitudReserva.findByIdRecurso", query = "SELECT s FROM SolicitudReserva s WHERE s.solicitudReservaPK.idRecurso = :idRecurso")
    , @NamedQuery(name = "SolicitudReserva.findBySolicitudReservaComentario", query = "SELECT s FROM SolicitudReserva s WHERE s.solicitudReservaComentario = :solicitudReservaComentario")
    , @NamedQuery(name = "SolicitudReserva.findByIdReserva", query = "SELECT s FROM SolicitudReserva s WHERE s.solicitudReservaPK.idReserva = :idReserva")})
public class SolicitudReserva implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected SolicitudReservaPK solicitudReservaPK;
    @Size(max = 145)
    @Column(name = "solicitudReservaComentario")
    private String solicitudReservaComentario;
    @JoinColumn(name = "idReserva", referencedColumnName = "idreserva", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Reserva reserva;
    @JoinColumn(name = "idRecurso", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;

    public SolicitudReserva() {
    }

    public SolicitudReserva(SolicitudReservaPK solicitudReservaPK) {
        this.solicitudReservaPK = solicitudReservaPK;
    }

    public SolicitudReserva(int idRecurso, int idReserva) {
        this.solicitudReservaPK = new SolicitudReservaPK(idRecurso, idReserva);
    }

    public SolicitudReservaPK getSolicitudReservaPK() {
        return solicitudReservaPK;
    }

    public void setSolicitudReservaPK(SolicitudReservaPK solicitudReservaPK) {
        this.solicitudReservaPK = solicitudReservaPK;
    }

    public String getSolicitudReservaComentario() {
        return solicitudReservaComentario;
    }

    public void setSolicitudReservaComentario(String solicitudReservaComentario) {
        this.solicitudReservaComentario = solicitudReservaComentario;
    }

    public Reserva getReserva() {
        return reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }

    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (solicitudReservaPK != null ? solicitudReservaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SolicitudReserva)) {
            return false;
        }
        SolicitudReserva other = (SolicitudReserva) object;
        if ((this.solicitudReservaPK == null && other.solicitudReservaPK != null) || (this.solicitudReservaPK != null && !this.solicitudReservaPK.equals(other.solicitudReservaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.SolicitudReserva[ solicitudReservaPK=" + solicitudReservaPK + " ]";
    }
    
}
