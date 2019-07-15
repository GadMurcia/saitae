/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "tipoPersona", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoPersona.findAll", query = "SELECT t FROM TipoPersona t")
    , @NamedQuery(name = "TipoPersona.findByIdtipoPersona", query = "SELECT t FROM TipoPersona t WHERE t.idtipoPersona = :idtipoPersona")
    , @NamedQuery(name = "TipoPersona.findByTipoPersonaNombre", query = "SELECT t FROM TipoPersona t WHERE t.tipoPersonaNombre = :tipoPersonaNombre")
    , @NamedQuery(name = "TipoPersona.findByTipoPersonaComentario", query = "SELECT t FROM TipoPersona t WHERE t.tipoPersonaComentario = :tipoPersonaComentario")})
public class TipoPersona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idtipoPersona")
    private Integer idtipoPersona;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipoPersonaNombre")
    private String tipoPersonaNombre;
    @Size(max = 145)
    @Column(name = "tipoPersonaComentario")
    private String tipoPersonaComentario;
    @OneToMany(mappedBy = "tipoPersona")
    private List<Persona> personaList;

    public TipoPersona() {
    }

    public TipoPersona(Integer idtipoPersona) {
        this.idtipoPersona = idtipoPersona;
    }

    public TipoPersona(Integer idtipoPersona, String tipoPersonaNombre) {
        this.idtipoPersona = idtipoPersona;
        this.tipoPersonaNombre = tipoPersonaNombre;
    }

    public Integer getIdtipoPersona() {
        return idtipoPersona;
    }

    public void setIdtipoPersona(Integer idtipoPersona) {
        this.idtipoPersona = idtipoPersona;
    }

    public String getTipoPersonaNombre() {
        return tipoPersonaNombre;
    }

    public void setTipoPersonaNombre(String tipoPersonaNombre) {
        this.tipoPersonaNombre = tipoPersonaNombre;
    }

    public String getTipoPersonaComentario() {
        return tipoPersonaComentario;
    }

    public void setTipoPersonaComentario(String tipoPersonaComentario) {
        this.tipoPersonaComentario = tipoPersonaComentario;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoPersona != null ? idtipoPersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoPersona)) {
            return false;
        }
        TipoPersona other = (TipoPersona) object;
        if ((this.idtipoPersona == null && other.idtipoPersona != null) || (this.idtipoPersona != null && !this.idtipoPersona.equals(other.idtipoPersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoPersona[ idtipoPersona=" + idtipoPersona + " ]";
    }
    
}
