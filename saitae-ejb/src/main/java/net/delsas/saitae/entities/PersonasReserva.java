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
@Table(name = "personasReserva", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PersonasReserva.findAll", query = "SELECT p FROM PersonasReserva p")
    , @NamedQuery(name = "PersonasReserva.findByIdReserva", query = "SELECT p FROM PersonasReserva p WHERE p.personasReservaPK.idReserva = :idReserva")
    , @NamedQuery(name = "PersonasReserva.findByIdpersona", query = "SELECT p FROM PersonasReserva p WHERE p.personasReservaPK.idpersona = :idpersona")
    , @NamedQuery(name = "PersonasReserva.findByPersonasReservaComentario", query = "SELECT p FROM PersonasReserva p WHERE p.personasReservaComentario = :personasReservaComentario")
    , @NamedQuery(name = "PersonasReserva.findReservaByIdpersona", query = "SELECT DISTINCT p.reserva FROM PersonasReserva p WHERE p.personasReservaPK.idpersona = :idPersona ORDER BY p.reserva.reservaFecha DESC , p.reserva.reservaEstado")
})
public class PersonasReserva implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PersonasReservaPK personasReservaPK;
    @Size(max = 145)
    @Column(name = "personasReservaComentario")
    private String personasReservaComentario;
    @JoinColumn(name = "idpersona", referencedColumnName = "idpersona", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Persona persona;
    @JoinColumn(name = "idReserva", referencedColumnName = "idreserva", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Reserva reserva;

    public PersonasReserva() {
    }

    public PersonasReserva(PersonasReservaPK personasReservaPK) {
        this.personasReservaPK = personasReservaPK;
    }

    public PersonasReserva(int idReserva, int idpersona) {
        this.personasReservaPK = new PersonasReservaPK(idReserva, idpersona);
    }

    public PersonasReservaPK getPersonasReservaPK() {
        return personasReservaPK;
    }

    public void setPersonasReservaPK(PersonasReservaPK personasReservaPK) {
        this.personasReservaPK = personasReservaPK;
    }

    public String getPersonasReservaComentario() {
        return personasReservaComentario;
    }

    public void setPersonasReservaComentario(String personasReservaComentario) {
        this.personasReservaComentario = personasReservaComentario;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
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
        hash += (personasReservaPK != null ? personasReservaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PersonasReserva)) {
            return false;
        }
        PersonasReserva other = (PersonasReserva) object;
        if ((this.personasReservaPK == null && other.personasReservaPK != null) || (this.personasReservaPK != null && !this.personasReservaPK.equals(other.personasReservaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.PersonasReserva[ personasReservaPK=" + personasReservaPK + " ]";
    }

}
