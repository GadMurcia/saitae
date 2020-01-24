/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "tema", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tema.findAll", query = "SELECT t FROM Tema t"),
    @NamedQuery(name = "Tema.findByIdPersona", query = "SELECT t FROM Tema t WHERE t.idPersona = :idPersona"),
    @NamedQuery(name = "Tema.findByTemaNombre", query = "SELECT t FROM Tema t WHERE t.temaNombre = :temaNombre"),
    @NamedQuery(name = "Tema.findByTemaComentario", query = "SELECT t FROM Tema t WHERE t.temaComentario = :temaComentario")})
public class Tema implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idPersona")
    private Integer idPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 140)
    @Column(name = "temaNombre")
    private String temaNombre;
    @Size(max = 145)
    @Column(name = "temaComentario")
    private String temaComentario;

    public Tema() {
    }

    public Tema(Integer idPersona) {
        this.idPersona = idPersona;
    }

    public Tema(Integer idPersona, String temaNombre) {
        this.idPersona = idPersona;
        this.temaNombre = temaNombre;
    }

    public Integer getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;
    }

    public String getTemaNombre() {
        return temaNombre;
    }

    public void setTemaNombre(String temaNombre) {
        this.temaNombre = temaNombre;
    }

    public String getTemaComentario() {
        return temaComentario;
    }

    public void setTemaComentario(String temaComentario) {
        this.temaComentario = temaComentario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPersona != null ? idPersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tema)) {
            return false;
        }
        Tema other = (Tema) object;
        if ((this.idPersona == null && other.idPersona != null) || (this.idPersona != null && !this.idPersona.equals(other.idPersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Tema[ idPersona=" + idPersona + " ]";
    }
    
}
