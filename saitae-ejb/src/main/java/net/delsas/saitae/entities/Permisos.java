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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
    @NamedQuery(name = "Permisos.findAll", query = "SELECT p FROM Permisos p"),
    @NamedQuery(name = "Permisos.findByIpPersona", query = "SELECT p FROM Permisos p WHERE p.permisosPK.ipPersona = :ipPersona AND FUNCTION('YEAR' , p.permisosPK.permisoFechaInicio) = :año ORDER BY p.permisosEstado ASC"),
    @NamedQuery(name = "Permisos.findByPermisoFechaSolicitud", query = "SELECT p FROM Permisos p WHERE p.permisosPK.permisoFechaSolicitud = :permisoFechaSolicitud"),
    @NamedQuery(name = "Permisos.findByTipoPermiso", query = "SELECT p FROM Permisos p WHERE p.permisosPK.tipoPermiso = :tipoPermiso"),
    @NamedQuery(name = "Permisos.findByPermisoFechaInicio", query = "SELECT p FROM Permisos p WHERE p.permisosPK.permisoFechaInicio = :permisoFechaInicio"),
    @NamedQuery(name = "Permisos.findByPermisoFechafin", query = "SELECT p FROM Permisos p WHERE p.permisoFechafin = :permisoFechafin"),
    @NamedQuery(name = "Permisos.findByPermisosMotivo", query = "SELECT p FROM Permisos p WHERE p.permisosMotivo = :permisosMotivo"),
    @NamedQuery(name = "Permisos.findByPermisosEstado", query = "SELECT p FROM Permisos p WHERE p.permisosEstado = :permisoEstado AND FUNCTION('YEAR' , p.permisosPK.permisoFechaInicio) = :año ORDER BY p.permisosPK.permisoFechaSolicitud DESC"),
    @NamedQuery(name = "Permisos.findByPermisosComentario", query = "SELECT p FROM Permisos p WHERE p.permisosComentario = :permisosComentario"),
    @NamedQuery(name = "Permisos.findByPEPEs", query = "SELECT p FROM Permisos p WHERE p.permisosEstado = :permisoEstado AND p.tipoPersona.idtipoPersona = :tipo ORDER BY p.permisosPK.permisoFechaSolicitud DESC, p.permisosPK.permisoFechaInicio ASC"),
    @NamedQuery(name = "Permisos.findByEstadoAndTipos", query = "SELECT p FROM Permisos p WHERE p.permisosEstado = :permisoEstado AND p.tipoPersona.idtipoPersona IN :tipos AND FUNCTION('YEAR' , p.permisosPK.permisoFechaInicio) = :año ORDER BY p.permisosPK.permisoFechaSolicitud DESC, p.permisosPK.permisoFechaInicio ASC"),
    @NamedQuery(name = "Permisos.findAñosGlobales", query = "SELECT DISTINCT FUNCTION('YEAR' ,p.permisosPK.permisoFechaInicio) FROM Permisos p ORDER BY 1 ASC"),
    @NamedQuery(name = "Permisos.findAñosPersona", query = "SELECT DISTINCT FUNCTION('YEAR' ,p.permisosPK.permisoFechaInicio)  FROM Permisos p WHERE p.permisosPK.ipPersona = :idPersona ORDER BY 1 ASC"),
    @NamedQuery(name = "Permisos.findByIpPersonaAndEstado", query = "SELECT p FROM Permisos p WHERE p.permisosPK.ipPersona = :ipPersona AND FUNCTION('YEAR' , p.permisosPK.permisoFechaInicio) = :año AND p.permisosEstado = :estado ORDER BY p.permisosPK.permisoFechaInicio ASC"),
    @NamedQuery(name = "Permisos.findByIpPersonaAndEstadoAndFechas", query = "SELECT p FROM Permisos p WHERE p.permisosPK.ipPersona = :ipPersona AND p.permisosPK.permisoFechaInicio >= :fechaInicio AND p.permisoFechafin <= :fechaFin AND p.permisosEstado = :estado ORDER BY p.permisosPK.permisoFechaInicio ASC"),
    @NamedQuery(name = "Permisos.findByIpPEFTP", query = "SELECT p FROM Permisos p WHERE p.permisosPK.ipPersona = :ipPersona AND FUNCTION('YEAR' , p.permisosPK.permisoFechaInicio) = :año AND FUNCTION('YEAR' , p.permisoFechafin) = :año AND p.permisosEstado = :estado AND p.permisosPK.tipoPermiso = :idTp ORDER BY p.permisosPK.permisoFechaInicio ASC")
})
public class Permisos implements Serializable {

    @Column(name = "permisoHoraInicio")
    @Temporal(TemporalType.TIME)
    private Date permisoHoraInicio;
    @Column(name = "permisoHoraFin")
    @Temporal(TemporalType.TIME)
    private Date permisoHoraFin;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PermisosPK permisosPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "permisoFechafin")
    @Temporal(TemporalType.DATE)
    private Date permisoFechafin;
    @Size(max = 250)
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
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "permisos")
    private Constancias constancias;
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
    @JoinColumn(name = "permisosGestor", referencedColumnName = "idpersona")
    @ManyToOne
    private Persona permisosGestor;

    public Permisos() {
    }

    public Permisos(PermisosPK permisosPK) {
        this.permisosPK = permisosPK;
    }

    public Permisos(PermisosPK permisosPK, Date permisoFechafin, String permisosEstado) {
        this.permisosPK = permisosPK;
        this.permisoFechafin = permisoFechafin;
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

    public Constancias getConstancias() {
        return constancias;
    }

    public void setConstancias(Constancias constancias) {
        this.constancias = constancias;
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

    public Persona getPermisosGestor() {
        return permisosGestor;
    }

    public void setPermisosGestor(Persona permisosGestor) {
        this.permisosGestor = permisosGestor;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + Objects.hashCode(this.permisoHoraInicio);
        hash = 97 * hash + Objects.hashCode(this.permisoHoraFin);
        hash = 97 * hash + Objects.hashCode(this.permisosPK);
        hash = 97 * hash + Objects.hashCode(this.permisoFechafin);
        hash = 97 * hash + Objects.hashCode(this.permisosMotivo);
        hash = 97 * hash + Objects.hashCode(this.permisosEstado);
        hash = 97 * hash + Objects.hashCode(this.permisosComentario);
        hash = 97 * hash + Objects.hashCode(this.constancias);
        hash = 97 * hash + Objects.hashCode(this.persona);
        hash = 97 * hash + Objects.hashCode(this.tipoPersona);
        hash = 97 * hash + Objects.hashCode(this.permisosSolicitante);
        hash = 97 * hash + Objects.hashCode(this.tipoPermiso1);
        hash = 97 * hash + Objects.hashCode(this.permisosGestor);
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
        final Permisos other = (Permisos) obj;
        if (!Objects.equals(this.permisosMotivo, other.permisosMotivo)) {
            return false;
        }
        if (!Objects.equals(this.permisosEstado, other.permisosEstado)) {
            return false;
        }
        if (!Objects.equals(this.permisosComentario, other.permisosComentario)) {
            return false;
        }
        if (!Objects.equals(this.permisoHoraInicio, other.permisoHoraInicio)) {
            return false;
        }
        if (!Objects.equals(this.permisoHoraFin, other.permisoHoraFin)) {
            return false;
        }
        if (!Objects.equals(this.permisosPK, other.permisosPK)) {
            return false;
        }
        if (!Objects.equals(this.permisoFechafin, other.permisoFechafin)) {
            return false;
        }
        if (!Objects.equals(this.constancias, other.constancias)) {
            return false;
        }
        if (!Objects.equals(this.persona, other.persona)) {
            return false;
        }
        if (!Objects.equals(this.tipoPersona, other.tipoPersona)) {
            return false;
        }
        if (!Objects.equals(this.permisosSolicitante, other.permisosSolicitante)) {
            return false;
        }
        if (!Objects.equals(this.tipoPermiso1, other.tipoPermiso1)) {
            return false;
        }
        return Objects.equals(this.permisosGestor, other.permisosGestor);
    }

    
    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Permisos[ permisosPK=" + permisosPK + " ]";
    }

    public Date getPermisoHoraInicio() {
        return permisoHoraInicio;
    }

    public void setPermisoHoraInicio(Date permisoHoraInicio) {
        this.permisoHoraInicio = permisoHoraInicio;
    }

    public Date getPermisoHoraFin() {
        return permisoHoraFin;
    }

    public void setPermisoHoraFin(Date permisoHoraFin) {
        this.permisoHoraFin = permisoHoraFin;
    }

}
