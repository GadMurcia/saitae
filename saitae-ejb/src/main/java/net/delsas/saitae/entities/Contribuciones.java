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
@Table(name = "contribuciones", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Contribuciones.findAll", query = "SELECT c FROM Contribuciones c")
    , @NamedQuery(name = "Contribuciones.findByFechaHora", query = "SELECT c FROM Contribuciones c WHERE c.fechaHora = :fechaHora")
    , @NamedQuery(name = "Contribuciones.findByMes", query = "SELECT c FROM Contribuciones c WHERE c.mes = :mes")
    , @NamedQuery(name = "Contribuciones.findByA\u00f1o", query = "SELECT c FROM Contribuciones c WHERE c.a\u00f1o = :a\u00f1o")
    , @NamedQuery(name = "Contribuciones.findByContribucionesComentario", query = "SELECT c FROM Contribuciones c WHERE c.contribucionesComentario = :contribucionesComentario")})
public class Contribuciones implements Serializable {

    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaHora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    @Basic(optional = false)
    @NotNull
    @Column(name = "mes")
    private int mes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "a\u00f1o")
    private int año;

    private static final long serialVersionUID = 1L;
    @Size(max = 140)
    @Column(name = "contribucionesComentario")
    private String contribucionesComentario;
    @JoinColumn(name = "idEstudiante", referencedColumnName = "idestudiante")
    @ManyToOne(optional = false)
    private Estudiante idEstudiante;
    @JoinColumn(name = "idColector", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona idColector;

    public Contribuciones() {
    }

    public Contribuciones(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public Contribuciones(Date fechaHora, int mes, int año) {
        this.fechaHora = fechaHora;
        this.mes = mes;
        this.año = año;
    }

    public String getContribucionesComentario() {
        return contribucionesComentario;
    }

    public void setContribucionesComentario(String contribucionesComentario) {
        this.contribucionesComentario = contribucionesComentario;
    }

    public Estudiante getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(Estudiante idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public Persona getIdColector() {
        return idColector;
    }

    public void setIdColector(Persona idColector) {
        this.idColector = idColector;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fechaHora!= null ? fechaHora.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Contribuciones)) {
            return false;
        }
        Contribuciones other = (Contribuciones) object;
        return !((this.fechaHora == null && other.fechaHora != null) || (this.fechaHora!= null && !this.fechaHora.equals(other.fechaHora)));
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Contribuciones[ fechaHora =" + fechaHora + " ]";
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

}
