/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
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

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idnotificacion")
    private Integer idnotificacion;
    @Basic(optional = false)
    @NotNull()
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
    @Size(min = 1, max = 300)
    @Column(name = "notificacionCuerpo")
    private String notificacionCuerpo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vista")
    private boolean vista;
    @Size(max = 145)
    @Column(name = "notificacionComentario")
    private String notificacionComentario;
    private static final long serialVersionUID = 1L;
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

    
    public Notificaciones(Integer idnotificación) {
        this.idnotificacion = idnotificación;
    }

    public Notificaciones(Integer idnotificación, Date fechaHora, String notificacionTitulo, String notificacionCuerpo, boolean vista) {
        this.idnotificacion = idnotificación;
        this.fechaHora = fechaHora;
        this.notificacionTitulo = notificacionTitulo;
        this.notificacionCuerpo = notificacionCuerpo;
        this.vista = vista;
    }

    public Integer getIdnotificación() {
        return idnotificacion;
    }

    public void setIdnotificación(Integer idnotificación) {
        this.idnotificacion = idnotificación;
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

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 71 * hash + Objects.hashCode(this.idnotificacion);
        hash = 71 * hash + Objects.hashCode(this.fechaHora);
        hash = 71 * hash + Objects.hashCode(this.notificacionTitulo);
        hash = 71 * hash + Objects.hashCode(this.notificacionCuerpo);
        hash = 71 * hash + (this.vista ? 1 : 0);
        hash = 71 * hash + Objects.hashCode(this.notificacionComentario);
        hash = 71 * hash + Objects.hashCode(this.destinatario);
        hash = 71 * hash + Objects.hashCode(this.remitente);
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
        final Notificaciones other = (Notificaciones) obj;
        if (this.vista != other.vista) {
            return false;
        }
        if (!Objects.equals(this.notificacionTitulo, other.notificacionTitulo)) {
            return false;
        }
        if (!Objects.equals(this.notificacionCuerpo, other.notificacionCuerpo)) {
            return false;
        }
        if (!Objects.equals(this.notificacionComentario, other.notificacionComentario)) {
            return false;
        }
        if (!Objects.equals(this.idnotificacion, other.idnotificacion)) {
            return false;
        }
        if (!Objects.equals(this.fechaHora, other.fechaHora)) {
            return false;
        }
        if (!Objects.equals(this.destinatario, other.destinatario)) {
            return false;
        }
        return Objects.equals(this.remitente, other.remitente);
    }

    @Override
    public String toString() {
        return "Notificaciones{" + "idnotificacion=" + idnotificacion + ", fechaHora=" + fechaHora + ", notificacionTitulo=" + notificacionTitulo + ", notificacionCuerpo=" + notificacionCuerpo + ", vista=" + vista + ", notificacionComentario=" + notificacionComentario + ", destinatario=" + destinatario + ", remitente=" + remitente + '}';
    }

}
