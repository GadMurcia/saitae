/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "tipoReservaRecurso", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoReservaRecurso.findAll", query = "SELECT t FROM TipoReservaRecurso t")
    , @NamedQuery(name = "TipoReservaRecurso.findByTipoReserva", query = "SELECT t FROM TipoReservaRecurso t WHERE t.tipoReservaRecursoPK.tipoReserva = :tipoReserva")
    , @NamedQuery(name = "TipoReservaRecurso.findByTipoRecurso", query = "SELECT t FROM TipoReservaRecurso t WHERE t.tipoReservaRecursoPK.tipoRecurso = :tipoRecurso")
    , @NamedQuery(name = "TipoReservaRecurso.findByTipoReservaRecursoComentario", query = "SELECT t FROM TipoReservaRecurso t WHERE t.tipoReservaRecursoComentario = :tipoReservaRecursoComentario")
    , @NamedQuery(name = "TipoReservaRecurso.findRecursoByTipoRecursoAndTipoReserva", query = "SELECT DISTINCT t.recurso FROM TipoReservaRecurso t WHERE t.recurso.idTipoRecurso.idtipoRecurso = :tipoRecurso AND t.tipoReserva1.idtipoReserva = :idTipoReserva")
})
public class TipoReservaRecurso implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TipoReservaRecursoPK tipoReservaRecursoPK;
    @Size(max = 145)
    @Column(name = "tipoReservaRecursoComentario")
    private String tipoReservaRecursoComentario;
    @JoinColumn(name = "tipoReserva", referencedColumnName = "idtipoReserva", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private TipoReserva tipoReserva1;
    @JoinColumn(name = "tipoRecurso", referencedColumnName = "idrecurso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Recurso recurso;

    public TipoReservaRecurso() {
    }

    public TipoReservaRecurso(TipoReservaRecursoPK tipoReservaRecursoPK) {
        this.tipoReservaRecursoPK = tipoReservaRecursoPK;
    }

    public TipoReservaRecurso(int tipoReserva, int tipoRecurso) {
        this.tipoReservaRecursoPK = new TipoReservaRecursoPK(tipoReserva, tipoRecurso);
    }

    public TipoReservaRecursoPK getTipoReservaRecursoPK() {
        return tipoReservaRecursoPK;
    }

    public void setTipoReservaRecursoPK(TipoReservaRecursoPK tipoReservaRecursoPK) {
        this.tipoReservaRecursoPK = tipoReservaRecursoPK;
    }

    public String getTipoReservaRecursoComentario() {
        return tipoReservaRecursoComentario;
    }

    public void setTipoReservaRecursoComentario(String tipoReservaRecursoComentario) {
        this.tipoReservaRecursoComentario = tipoReservaRecursoComentario;
    }

    public TipoReserva getTipoReserva1() {
        return tipoReserva1;
    }

    public void setTipoReserva1(TipoReserva tipoReserva1) {
        this.tipoReserva1 = tipoReserva1;
    }

    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tipoReservaRecursoPK != null ? tipoReservaRecursoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoReservaRecurso)) {
            return false;
        }
        TipoReservaRecurso other = (TipoReservaRecurso) object;
        if ((this.tipoReservaRecursoPK == null && other.tipoReservaRecursoPK != null) || (this.tipoReservaRecursoPK != null && !this.tipoReservaRecursoPK.equals(other.tipoReservaRecursoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoReservaRecurso[ tipoReservaRecursoPK=" + tipoReservaRecursoPK + " ]";
    }
    
}
