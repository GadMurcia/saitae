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
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author delsas
 */
@Embeddable
public class AnuncioPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "idanuncio")
    private int idanuncio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "anuncioFechaFin")
    @Temporal(TemporalType.DATE)
    private Date anuncioFechaFin;

    public AnuncioPK() {
    }

    public AnuncioPK(int idanuncio, Date anuncioFechaFin) {
        this.idanuncio = idanuncio;
        this.anuncioFechaFin = anuncioFechaFin;
    }

    public int getIdanuncio() {
        return idanuncio;
    }

    public void setIdanuncio(int idanuncio) {
        this.idanuncio = idanuncio;
    }

    public Date getAnuncioFechaFin() {
        return anuncioFechaFin;
    }

    public void setAnuncioFechaFin(Date anuncioFechaFin) {
        this.anuncioFechaFin = anuncioFechaFin;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idanuncio;
        hash += (anuncioFechaFin != null ? anuncioFechaFin.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AnuncioPK)) {
            return false;
        }
        AnuncioPK other = (AnuncioPK) object;
        if (this.idanuncio != other.idanuncio) {
            return false;
        }
        if ((this.anuncioFechaFin == null && other.anuncioFechaFin != null) || (this.anuncioFechaFin != null && !this.anuncioFechaFin.equals(other.anuncioFechaFin))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.AnuncioPK[ idanuncio=" + idanuncio + ", anuncioFechaFin=" + anuncioFechaFin + " ]";
    }
    
}
