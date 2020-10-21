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
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "capacitaciones", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Capacitaciones.findAll", query = "SELECT c FROM Capacitaciones c"),
    @NamedQuery(name = "Capacitaciones.findByIdMaestro", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionesPK.idMaestro = :idMaestro"),
    @NamedQuery(name = "Capacitaciones.findByFechaCapacitaciones", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionesPK.fechaCapacitaciones = :fechaCapacitaciones"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionCategoria", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionCategoria = :capacitacionCategoria"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionArea", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionArea = :capacitacionArea"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionNombre", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionNombre = :capacitacionNombre"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionCertificado", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionCertificado = :capacitacionCertificado"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionPatrocinador", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionPatrocinador = :capacitacionPatrocinador"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionModalidad", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionModalidad = :capacitacionModalidad"),
    @NamedQuery(name = "Capacitaciones.findByCapacitacionComentario", query = "SELECT c FROM Capacitaciones c WHERE c.capacitacionComentario = :capacitacionComentario")})
public class Capacitaciones implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CapacitacionesPK capacitacionesPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    private String capacitacionCategoria;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    private String capacitacionArea;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    private String capacitacionNombre;
    @Basic(optional = false)
    @NotNull
    private boolean capacitacionCertificado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    private String capacitacionPatrocinador;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    private String capacitacionModalidad;
    @Size(max = 145)
    private String capacitacionComentario;
    @JoinColumn(name = "idMaestro", referencedColumnName = "idpersona", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Persona persona;

    public Capacitaciones() {
    }

    public Capacitaciones(CapacitacionesPK capacitacionesPK) {
        this.capacitacionesPK = capacitacionesPK;
    }

    public Capacitaciones(CapacitacionesPK capacitacionesPK, String capacitacionCategoria, String capacitacionArea, String capacitacionNombre, boolean capacitacionCertificado, String capacitacionPatrocinador, String capacitacionModalidad) {
        this.capacitacionesPK = capacitacionesPK;
        this.capacitacionCategoria = capacitacionCategoria;
        this.capacitacionArea = capacitacionArea;
        this.capacitacionNombre = capacitacionNombre;
        this.capacitacionCertificado = capacitacionCertificado;
        this.capacitacionPatrocinador = capacitacionPatrocinador;
        this.capacitacionModalidad = capacitacionModalidad;
    }

    public Capacitaciones(int idMaestro, Date fechaCapacitaciones) {
        this.capacitacionesPK = new CapacitacionesPK(idMaestro, fechaCapacitaciones);
    }

    public CapacitacionesPK getCapacitacionesPK() {
        return capacitacionesPK;
    }

    public void setCapacitacionesPK(CapacitacionesPK capacitacionesPK) {
        this.capacitacionesPK = capacitacionesPK;
    }

    public String getCapacitacionCategoria() {
        return capacitacionCategoria;
    }

    public void setCapacitacionCategoria(String capacitacionCategoria) {
        this.capacitacionCategoria = capacitacionCategoria;
    }

    public String getCapacitacionArea() {
        return capacitacionArea;
    }

    public void setCapacitacionArea(String capacitacionArea) {
        this.capacitacionArea = capacitacionArea;
    }

    public String getCapacitacionNombre() {
        return capacitacionNombre;
    }

    public void setCapacitacionNombre(String capacitacionNombre) {
        this.capacitacionNombre = capacitacionNombre;
    }

    public boolean getCapacitacionCertificado() {
        return capacitacionCertificado;
    }

    public void setCapacitacionCertificado(boolean capacitacionCertificado) {
        this.capacitacionCertificado = capacitacionCertificado;
    }

    public String getCapacitacionPatrocinador() {
        return capacitacionPatrocinador;
    }

    public void setCapacitacionPatrocinador(String capacitacionPatrocinador) {
        this.capacitacionPatrocinador = capacitacionPatrocinador;
    }

    public String getCapacitacionModalidad() {
        return capacitacionModalidad;
    }

    public void setCapacitacionModalidad(String capacitacionModalidad) {
        this.capacitacionModalidad = capacitacionModalidad;
    }

    public String getCapacitacionComentario() {
        return capacitacionComentario;
    }

    public void setCapacitacionComentario(String capacitacionComentario) {
        this.capacitacionComentario = capacitacionComentario;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 17 * hash + Objects.hashCode(this.capacitacionesPK);
        hash = 17 * hash + Objects.hashCode(this.capacitacionCategoria);
        hash = 17 * hash + Objects.hashCode(this.capacitacionArea);
        hash = 17 * hash + Objects.hashCode(this.capacitacionNombre);
        hash = 17 * hash + (this.capacitacionCertificado ? 1 : 0);
        hash = 17 * hash + Objects.hashCode(this.capacitacionPatrocinador);
        hash = 17 * hash + Objects.hashCode(this.capacitacionModalidad);
        hash = 17 * hash + Objects.hashCode(this.capacitacionComentario);
        hash = 17 * hash + Objects.hashCode(this.persona);
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
        final Capacitaciones other = (Capacitaciones) obj;
        if (this.capacitacionCertificado != other.capacitacionCertificado) {
            return false;
        }
        if (!Objects.equals(this.capacitacionCategoria, other.capacitacionCategoria)) {
            return false;
        }
        if (!Objects.equals(this.capacitacionArea, other.capacitacionArea)) {
            return false;
        }
        if (!Objects.equals(this.capacitacionNombre, other.capacitacionNombre)) {
            return false;
        }
        if (!Objects.equals(this.capacitacionPatrocinador, other.capacitacionPatrocinador)) {
            return false;
        }
        if (!Objects.equals(this.capacitacionModalidad, other.capacitacionModalidad)) {
            return false;
        }
        if (!Objects.equals(this.capacitacionComentario, other.capacitacionComentario)) {
            return false;
        }
        if (!Objects.equals(this.capacitacionesPK, other.capacitacionesPK)) {
            return false;
        }
        return Objects.equals(this.persona, other.persona);
    }

    public boolean equals2(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Capacitaciones other = (Capacitaciones) obj;
        return Objects.equals(this.capacitacionesPK, other.capacitacionesPK);
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Capacitaciones[ capacitacionesPK=" + capacitacionesPK + " ]";
    }

}
