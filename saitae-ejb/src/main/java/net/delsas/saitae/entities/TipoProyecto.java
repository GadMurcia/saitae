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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "tipoProyecto", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoProyecto.findAll", query = "SELECT t FROM TipoProyecto t")
    , @NamedQuery(name = "TipoProyecto.findByIdtipoProyecto", query = "SELECT t FROM TipoProyecto t WHERE t.idtipoProyecto = :idtipoProyecto")
    , @NamedQuery(name = "TipoProyecto.findByTipoProyectoNombre", query = "SELECT t FROM TipoProyecto t WHERE t.tipoProyectoNombre = :tipoProyectoNombre")
    , @NamedQuery(name = "TipoProyecto.findByTipoProyectoComentario", query = "SELECT t FROM TipoProyecto t WHERE t.tipoProyectoComentario = :tipoProyectoComentario")})
public class TipoProyecto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoProyecto")
    private Integer idtipoProyecto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipoProyectoNombre")
    private String tipoProyectoNombre;
    @Size(max = 140)
    @Column(name = "tipoProyectoComentario")
    private String tipoProyectoComentario;
    @OneToMany(mappedBy = "tipoPtoyecto")
    private List<Reserva> reservaList;

    public TipoProyecto() {
    }

    public TipoProyecto(Integer idtipoProyecto) {
        this.idtipoProyecto = idtipoProyecto;
    }

    public TipoProyecto(Integer idtipoProyecto, String tipoProyectoNombre) {
        this.idtipoProyecto = idtipoProyecto;
        this.tipoProyectoNombre = tipoProyectoNombre;
    }

    public Integer getIdtipoProyecto() {
        return idtipoProyecto;
    }

    public void setIdtipoProyecto(Integer idtipoProyecto) {
        this.idtipoProyecto = idtipoProyecto;
    }

    public String getTipoProyectoNombre() {
        return tipoProyectoNombre;
    }

    public void setTipoProyectoNombre(String tipoProyectoNombre) {
        this.tipoProyectoNombre = tipoProyectoNombre;
    }

    public String getTipoProyectoComentario() {
        return tipoProyectoComentario;
    }

    public void setTipoProyectoComentario(String tipoProyectoComentario) {
        this.tipoProyectoComentario = tipoProyectoComentario;
    }

    @XmlTransient
    public List<Reserva> getReservaList() {
        return reservaList;
    }

    public void setReservaList(List<Reserva> reservaList) {
        this.reservaList = reservaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoProyecto != null ? idtipoProyecto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoProyecto)) {
            return false;
        }
        TipoProyecto other = (TipoProyecto) object;
        if ((this.idtipoProyecto == null && other.idtipoProyecto != null) || (this.idtipoProyecto != null && !this.idtipoProyecto.equals(other.idtipoProyecto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoProyecto[ idtipoProyecto=" + idtipoProyecto + " ]";
    }
    
}
