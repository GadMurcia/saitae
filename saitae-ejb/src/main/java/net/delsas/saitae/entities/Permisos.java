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
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
@Table(name = "permisos", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Permisos.findAll", query = "SELECT p FROM Permisos p")
    , @NamedQuery(name = "Permisos.findByIpPersona", query = "SELECT p FROM Permisos p WHERE p.permisosPK.ipPersona = :ipPersona")
    , @NamedQuery(name = "Permisos.findByPermisoFechaSolicitud", query = "SELECT p FROM Permisos p WHERE p.permisosPK.permisoFechaSolicitud = :permisoFechaSolicitud")
    , @NamedQuery(name = "Permisos.findByTipoPermiso", query = "SELECT p FROM Permisos p WHERE p.permisosPK.tipoPermiso = :tipoPermiso")
    , @NamedQuery(name = "Permisos.findByPermisoFechaInicio", query = "SELECT p FROM Permisos p WHERE p.permisosPK.permisoFechaInicio = :permisoFechaInicio")
    , @NamedQuery(name = "Permisos.findByPermisoFechafin", query = "SELECT p FROM Permisos p WHERE p.permisoFechafin = :permisoFechafin")
    , @NamedQuery(name = "Permisos.findByPermisosMotivo", query = "SELECT p FROM Permisos p WHERE p.permisosMotivo = :permisosMotivo")
    , @NamedQuery(name = "Permisos.findByPermisosEstado", query = "SELECT p FROM Permisos p WHERE p.permisosEstado = :permisoEstado ORDER BY p.permisosPK.permisoFechaSolicitud ASC")
    , @NamedQuery(name = "Permisos.findByPermisosComentario", query = "SELECT p FROM Permisos p WHERE p.permisosComentario = :permisosComentario")})
public class Permisos implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PermisosPK permisosPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "permisoFechafin")
    @Temporal(TemporalType.DATE)
    private Date permisoFechafin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "permisosMotivo")
    private String permisosMotivo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "permisosEstado")
    private String permisosEstado;
    @Size(max = 250)
    @Column(name = "permisosComentario")
    private String permisosComentario;
    @JoinColumn(name = "ipPersona", referencedColumnName = "idpersona", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Persona persona;
    @JoinColumn(name = "tipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne(optional = false)
    private TipoPersona tipoPersona;
    @JoinColumn(name = "permisosSolicitante", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona permisosSolicitante;
    @JoinColumn(name = "tipoPermiso", referencedColumnName = "idtipoPermiso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private TipoPermiso tipoPermiso1;

    public Permisos() {
    }

    public Permisos(PermisosPK permisosPK) {
        this.permisosPK = permisosPK;
    }

    public Permisos(PermisosPK permisosPK, Date permisoFechafin, String permisosMotivo, String permisosEstado) {
        this.permisosPK = permisosPK;
        this.permisoFechafin = permisoFechafin;
        this.permisosMotivo = permisosMotivo;
        this.permisosEstado = permisosEstado;
    }

    public Permisos(int ipPersona, Date permisoFechaSolicitud, int tipoPermiso, Date permisoFechaInicio) {
        this.permisosPK = new PermisosPK(ipPersona, permisoFechaSolicitud, tipoPermiso, permisoFechaInicio);
    }

    public PermisosPK getPermisosPK() {
        return permisosPK;
    }

    public void setPermisosPK(PermisosPK permisosPK) {
        this.permisosPK = permisosPK;
    }

    public Date getPermisoFechafin() {
        return permisoFechafin;
    }

    public void setPermisoFechafin(Date permisoFechafin) {
        this.permisoFechafin = permisoFechafin;
    }

    public String getPermisosMotivo() {
        return permisosMotivo;
    }

    public void setPermisosMotivo(String permisosMotivo) {
        this.permisosMotivo = permisosMotivo;
    }

    public String getPermisosEstado() {
        return permisosEstado;
    }

    public void setPermisosEstado(String permisosEstado) {
        this.permisosEstado = permisosEstado;
    }

    public String getPermisosComentario() {
        return permisosComentario;
    }

    public void setPermisosComentario(String permisosComentario) {
        this.permisosComentario = permisosComentario;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public Persona getPermisosSolicitante() {
        return permisosSolicitante;
    }

    public void setPermisosSolicitante(Persona permisosSolicitante) {
        this.permisosSolicitante = permisosSolicitante;
    }

    public TipoPermiso getTipoPermiso1() {
        return tipoPermiso1;
    }

    public void setTipoPermiso1(TipoPermiso tipoPermiso1) {
        this.tipoPermiso1 = tipoPermiso1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (permisosPK != null ? permisosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Permisos)) {
            return false;
        }
        Permisos other = (Permisos) object;
        if ((this.permisosPK == null && other.permisosPK != null) || (this.permisosPK != null && !this.permisosPK.equals(other.permisosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Permisos[ permisosPK=" + permisosPK + " ]";
    }
    
}
