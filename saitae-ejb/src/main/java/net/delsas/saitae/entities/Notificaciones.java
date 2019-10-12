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
    , @NamedQuery(name = "Notificaciones.findByComentario", query = "SELECT n FROM Notificaciones n WHERE n.comentario = :comentario")})
public class Notificaciones implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 140)
    @Column(name = "notificacionCuerpo")
    private String notificacionCuerpo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 140)
    @Column(name = "notificacionTitulo")
    private String notificacionTitulo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vista")
    private boolean vista;
    @Size(max = 150)
    @Column(name = "comentario")
    private String comentario;
    @JoinColumn(name = "destinatario", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona destinatario;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaHora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;

    public Notificaciones() {
    }

    public Notificaciones(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public Notificaciones(String notificacionCuerpo, String notificacionTitulo, boolean vista, String comentario, Persona destinatario, Date fechaHora) {
        this.notificacionCuerpo = notificacionCuerpo;
        this.notificacionTitulo = notificacionTitulo;
        this.vista = vista;
        this.comentario = comentario;
        this.destinatario = destinatario;
        this.fechaHora = fechaHora;
    }

    

    public Date getFechaHora() {
        return fechaHora;
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

    public String getNotificacionCuerpo() {
        return notificacionCuerpo;
    }

    public void setNotificacionCuerpo(String notificacionCuerpo) {
        this.notificacionCuerpo = notificacionCuerpo;
    }

    public String getNotificacionTitulo() {
        return notificacionTitulo;
    }

    public void setNotificacionTitulo(String notificacionTitulo) {
        this.notificacionTitulo = notificacionTitulo;
    }

    public boolean getVista() {
        return vista;
    }

    public void setVista(boolean vista) {
        this.vista = vista;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Persona getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(Persona destinatario) {
        this.destinatario = destinatario;
    }
    
}
