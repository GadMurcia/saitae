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
@Table(name = "reservaXpedagogia", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReservaXpedagogia.findAll", query = "SELECT r FROM ReservaXpedagogia r")
    , @NamedQuery(name = "ReservaXpedagogia.findByIdProyectoPedagogico", query = "SELECT r FROM ReservaXpedagogia r WHERE r.reservaXpedagogiaPK.idProyectoPedagogico = :idProyectoPedagogico")
    , @NamedQuery(name = "ReservaXpedagogia.findByIdReserva", query = "SELECT r FROM ReservaXpedagogia r WHERE r.reservaXpedagogiaPK.idReserva = :idReserva")
    , @NamedQuery(name = "ReservaXpedagogia.findByReservaXpedagogiaComentario", query = "SELECT r FROM ReservaXpedagogia r WHERE r.reservaXpedagogiaComentario = :reservaXpedagogiaComentario")
    , @NamedQuery(name = "ReservaXpedagogia.findProyectoByIdReserva", query = "SELECT DISTINCT r.proyectoPedagogico FROM ReservaXpedagogia r WHERE r.reservaXpedagogiaPK.idReserva = :idReserva")
    , @NamedQuery(name = "ReservaXpedagogia.findReservaByIdProyecto", query = "SELECT DISTINCT r.reserva FROM ReservaXpedagogia r WHERE r.reservaXpedagogiaPK.idProyectoPedagogico = :idProyecto")
})
public class ReservaXpedagogia implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ReservaXpedagogiaPK reservaXpedagogiaPK;
    @Size(max = 145)
    @Column(name = "reservaXpedagogiaComentario")
    private String reservaXpedagogiaComentario;
    @JoinColumn(name = "idProyectoPedagogico", referencedColumnName = "idproyectoPedagogico", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private ProyectoPedagogico proyectoPedagogico;
    @JoinColumn(name = "idReserva", referencedColumnName = "idreserva", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Reserva reserva;

    public ReservaXpedagogia() {
    }

    public ReservaXpedagogia(ReservaXpedagogiaPK reservaXpedagogiaPK) {
        this.reservaXpedagogiaPK = reservaXpedagogiaPK;
    }

    public ReservaXpedagogia(int idProyectoPedagogico, int idReserva) {
        this.reservaXpedagogiaPK = new ReservaXpedagogiaPK(idProyectoPedagogico, idReserva);
    }

    public ReservaXpedagogiaPK getReservaXpedagogiaPK() {
        return reservaXpedagogiaPK;
    }

    public void setReservaXpedagogiaPK(ReservaXpedagogiaPK reservaXpedagogiaPK) {
        this.reservaXpedagogiaPK = reservaXpedagogiaPK;
    }

    public String getReservaXpedagogiaComentario() {
        return reservaXpedagogiaComentario;
    }

    public void setReservaXpedagogiaComentario(String reservaXpedagogiaComentario) {
        this.reservaXpedagogiaComentario = reservaXpedagogiaComentario;
    }

    public ProyectoPedagogico getProyectoPedagogico() {
        return proyectoPedagogico;
    }

    public void setProyectoPedagogico(ProyectoPedagogico proyectoPedagogico) {
        this.proyectoPedagogico = proyectoPedagogico;
    }

    public Reserva getReserva() {
        return reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reservaXpedagogiaPK != null ? reservaXpedagogiaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReservaXpedagogia)) {
            return false;
        }
        ReservaXpedagogia other = (ReservaXpedagogia) object;
        if ((this.reservaXpedagogiaPK == null && other.reservaXpedagogiaPK != null) || (this.reservaXpedagogiaPK != null && !this.reservaXpedagogiaPK.equals(other.reservaXpedagogiaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ReservaXpedagogia[ reservaXpedagogiaPK=" + reservaXpedagogiaPK + " ]";
    }

}
