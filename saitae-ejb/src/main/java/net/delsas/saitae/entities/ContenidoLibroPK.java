/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author delsas
 */
@Embeddable
public class ContenidoLibroPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idLibro")
    private int idLibro;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 145)
    @Column(name = "contenidoLibroNombre")
    private String contenidoLibroNombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "contenidoLibroPagina")
    private int contenidoLibroPagina;

    public ContenidoLibroPK() {
    }

    public ContenidoLibroPK(int idLibro, String contenidoLibroNombre, int contenidoLibroPagina) {
        this.idLibro = idLibro;
        this.contenidoLibroNombre = contenidoLibroNombre;
        this.contenidoLibroPagina = contenidoLibroPagina;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public String getContenidoLibroNombre() {
        return contenidoLibroNombre;
    }

    public void setContenidoLibroNombre(String contenidoLibroNombre) {
        this.contenidoLibroNombre = contenidoLibroNombre;
    }

    public int getContenidoLibroPagina() {
        return contenidoLibroPagina;
    }

    public void setContenidoLibroPagina(int contenidoLibroPagina) {
        this.contenidoLibroPagina = contenidoLibroPagina;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idLibro;
        hash += (contenidoLibroNombre != null ? contenidoLibroNombre.hashCode() : 0);
        hash += (int) contenidoLibroPagina;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContenidoLibroPK)) {
            return false;
        }
        ContenidoLibroPK other = (ContenidoLibroPK) object;
        if (this.idLibro != other.idLibro) {
            return false;
        }
        if ((this.contenidoLibroNombre == null && other.contenidoLibroNombre != null) || (this.contenidoLibroNombre != null && !this.contenidoLibroNombre.equals(other.contenidoLibroNombre))) {
            return false;
        }
        if (this.contenidoLibroPagina != other.contenidoLibroPagina) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ContenidoLibroPK[ idLibro=" + idLibro + ", contenidoLibroNombre=" + contenidoLibroNombre + ", contenidoLibroPagina=" + contenidoLibroPagina + " ]";
    }
    
}
