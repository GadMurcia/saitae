/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "notificaciones", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Notificaciones.findAll", query = "SELECT n FROM Notificaciones n")
    , @NamedQuery(name = "Notificaciones.findByFechaHora", query = "SELECT n FROM Notificaciones n WHERE n.fechaHora = :fechaHora")
    , @NamedQuery(name = "Notificaciones.findByNotificacionTitulo", query = "SELECT n FROM Notificaciones n WHERE n.notificacionTitulo = :titulo")
    , @NamedQuery(name = "Notificaciones.findByVista", query = "SELECT n FROM Notificaciones n WHERE n.vista = :vista")
    , @NamedQuery(name = "Notificaciones.findByIdPersona", query = "SELECT n FROM Notificaciones n WHERE n.destinatario.idpersona = :idpersona")
})
public class Notificaciones implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaHora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 140)
    @Column(name = "notificacionTitulo")
    private String notificacionTitulo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 140)
    @Column(name = "notificacionCuerpo")
    private String notificacionCuerpo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vista")
    private boolean vista;
    @Size(max = 145)
    @Column(name = "notificacionComentario")
    private String notificacionComentario;
    @JoinColumn(name = "destinatario", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona destinatario;
    @JoinColumn(name = "remitente", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona remitente;

    public Notificaciones() {
    }

    public Notificaciones(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public Notificaciones(Date fechaHora, String notificacionTitulo, String notificacionCuerpo, boolean vista) {
        this.fechaHora = fechaHora;
        this.notificacionTitulo = notificacionTitulo;
        this.notificacionCuerpo = notificacionCuerpo;
        this.vista = vista;
    }

    public Notificaciones(Date fechaHora, String notificacionTitulo, String notificacionCuerpo, boolean vista, String notificacionComentario, Persona destinatario, Persona remitente) {
        this.fechaHora = fechaHora;
        this.notificacionTitulo = notificacionTitulo;
        this.notificacionCuerpo = notificacionCuerpo;
        this.vista = vista;
        this.destinatario = destinatario;
        this.remitente = remitente;
        this.notificacionComentario = notificacionComentario;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getNotificacionTitulo() {
        return notificacionTitulo;
    }

    public void setNotificacionTitulo(String notificacionTitulo) {
        this.notificacionTitulo = notificacionTitulo;
    }

    public String getNotificacionCuerpo() {
        return notificacionCuerpo;
    }

    public void setNotificacionCuerpo(String notificacionCuerpo) {
        this.notificacionCuerpo = notificacionCuerpo;
    }

    public boolean getVista() {
        return vista;
    }

    public void setVista(boolean vista) {
        this.vista = vista;
    }

    public String getNotificacionComentario() {
        return notificacionComentario;
    }

    public void setNotificacionComentario(String notificacionComentario) {
        this.notificacionComentario = notificacionComentario;
    }

    public Persona getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(Persona destinatario) {
        this.destinatario = destinatario;
    }

    public Persona getRemitente() {
        return remitente;
    }

    public void setRemitente(Persona remitente) {
        this.remitente = remitente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fechaHora != null ? fechaHora.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notificaciones)) {
            return false;
        }
        Notificaciones other = (Notificaciones) object;
        if ((this.fechaHora == null && other.fechaHora != null) || (this.fechaHora != null && !this.fechaHora.equals(other.fechaHora))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Notificaciones[ fechaHora=" + fechaHora + " ]";
    }

}
