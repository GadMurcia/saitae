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
    , @NamedQuery(name = "Notificaciones.findByNotificacion", query = "SELECT n FROM Notificaciones n WHERE n.notificacion = :notificacion")
    , @NamedQuery(name = "Notificaciones.findByVista", query = "SELECT n FROM Notificaciones n WHERE n.vista = :vista")
    , @NamedQuery(name = "Notificaciones.findByComentario", query = "SELECT n FROM Notificaciones n WHERE n.comentario = :comentario")})
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
    @Size(min = 1, max = 100)
    @Column(name = "notificacion")
    private String notificacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vista")
    private boolean vista;
    @Size(max = 150)
    @Column(name = "comentario")
    private String comentario;
    @JoinColumn(name = "idPersona", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona idPersona;

    public Notificaciones() {
    }

    public Notificaciones(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public Notificaciones(Date fechaHora, String notificacion, boolean vista) {
        this.fechaHora = fechaHora;
        this.notificacion = notificacion;
        this.vista = vista;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getNotificacion() {
        return notificacion;
    }

    public void setNotificacion(String notificacion) {
        this.notificacion = notificacion;
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

    public Persona getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Persona idPersona) {
        this.idPersona = idPersona;
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
