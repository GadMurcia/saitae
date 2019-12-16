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
@Table(name = "accesoTipoPersona", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccesoTipoPersona.findAll", query = "SELECT a FROM AccesoTipoPersona a")
    , @NamedQuery(name = "AccesoTipoPersona.findByIdacceso", query = "SELECT a FROM AccesoTipoPersona a WHERE a.accesoTipoPersonaPK.idacceso = :idacceso")
    , @NamedQuery(name = "AccesoTipoPersona.findByIdTipoPersona", query = "SELECT a FROM AccesoTipoPersona a WHERE a.accesoTipoPersonaPK.idTipoPersona = :idTipoPersona")
    , @NamedQuery(name = "AccesoTipoPersona.findByAccesoTipoPersonaComentario", query = "SELECT a FROM AccesoTipoPersona a WHERE a.accesoTipoPersonaComentario = :accesoTipoPersonaComentario")
    , @NamedQuery(name = "AccesoTipoPersona.findTipoPersonaByAccesoUrl", query = "SELECT a.tipoPersona FROM AccesoTipoPersona a WHERE a.accesoTipoPersonaPK.idacceso = :idacceso")
})
public class AccesoTipoPersona implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AccesoTipoPersonaPK accesoTipoPersonaPK;
    @Size(max = 140)
    @Column(name = "accesoTipoPersonaComentario")
    private String accesoTipoPersonaComentario;
    @JoinColumn(name = "idacceso", referencedColumnName = "idacceso", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Acceso acceso;
    @JoinColumn(name = "idTipoPersona", referencedColumnName = "idtipoPersona", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private TipoPersona tipoPersona;

    public AccesoTipoPersona() {
    }

    public AccesoTipoPersona(AccesoTipoPersonaPK accesoTipoPersonaPK) {
        this.accesoTipoPersonaPK = accesoTipoPersonaPK;
    }

    public AccesoTipoPersona(int idacceso, int idTipoPersona) {
        this.accesoTipoPersonaPK = new AccesoTipoPersonaPK(idacceso, idTipoPersona);
    }

    public AccesoTipoPersonaPK getAccesoTipoPersonaPK() {
        return accesoTipoPersonaPK;
    }

    public void setAccesoTipoPersonaPK(AccesoTipoPersonaPK accesoTipoPersonaPK) {
        this.accesoTipoPersonaPK = accesoTipoPersonaPK;
    }

    public String getAccesoTipoPersonaComentario() {
        return accesoTipoPersonaComentario;
    }

    public void setAccesoTipoPersonaComentario(String accesoTipoPersonaComentario) {
        this.accesoTipoPersonaComentario = accesoTipoPersonaComentario;
    }

    public Acceso getAcceso() {
        return acceso;
    }

    public void setAcceso(Acceso acceso) {
        this.acceso = acceso;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accesoTipoPersonaPK != null ? accesoTipoPersonaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccesoTipoPersona)) {
            return false;
        }
        AccesoTipoPersona other = (AccesoTipoPersona) object;
        if ((this.accesoTipoPersonaPK == null && other.accesoTipoPersonaPK != null) || (this.accesoTipoPersonaPK != null && !this.accesoTipoPersonaPK.equals(other.accesoTipoPersonaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.AccesoTipoPersona[ accesoTipoPersonaPK=" + accesoTipoPersonaPK + " ]";
    }
    
}
