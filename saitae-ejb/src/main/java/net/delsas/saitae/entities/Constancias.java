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
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.Lob;
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
@Table(name = "constancias", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Constancias.findAll", query = "SELECT c FROM Constancias c"),
    @NamedQuery(name = "Constancias.findByIdConstancias", query = "SELECT c FROM Constancias c WHERE c.constanciasPK.idConstancias = :idConstancias"),
    @NamedQuery(name = "Constancias.findByFechaSolicitud", query = "SELECT c FROM Constancias c WHERE c.constanciasPK.fechaSolicitud = :fechaSolicitud"),
    @NamedQuery(name = "Constancias.findByTioPermiso", query = "SELECT c FROM Constancias c WHERE c.constanciasPK.tioPermiso = :tioPermiso"),
    @NamedQuery(name = "Constancias.findByFechaInicio", query = "SELECT c FROM Constancias c WHERE c.constanciasPK.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Constancias.findByExtención", query = "SELECT c FROM Constancias c WHERE c.extención = :extencion"),
    @NamedQuery(name = "Constancias.findByComentario", query = "SELECT c FROM Constancias c WHERE c.comentario = :comentario")})
public class Constancias implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Lob
    private byte[] documento;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    private ConstanciasPK constanciasPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "extención")
    private String extención;
    @Size(max = 140)
    @Column(name = "comentario")
    private String comentario;
    @JoinColumns({
        @JoinColumn(name = "idConstancias", referencedColumnName = "ipPersona", insertable = false, updatable = false),
        @JoinColumn(name = "fechaSolicitud", referencedColumnName = "permisoFechaSolicitud", insertable = false, updatable = false),
        @JoinColumn(name = "tioPermiso", referencedColumnName = "tipoPermiso", insertable = false, updatable = false),
        @JoinColumn(name = "fechaInicio", referencedColumnName = "permisoFechaInicio", insertable = false, updatable = false)})
    @OneToOne(optional = false)
    private Permisos permisos;

    public Constancias() {
    }

    public Constancias(ConstanciasPK constanciasPK) {
        this.constanciasPK = constanciasPK;
    }

    public Constancias(ConstanciasPK constanciasPK, byte[] documento, String extención) {
        this.constanciasPK = constanciasPK;
        this.documento = documento;
        this.extención = extención;
    }

    public Constancias(int idConstancias, Date fechaSolicitud, int tioPermiso, Date fechaInicio) {
        this.constanciasPK = new ConstanciasPK(idConstancias, fechaSolicitud, tioPermiso, fechaInicio);
    }

    public ConstanciasPK getConstanciasPK() {
        return constanciasPK;
    }

    public void setConstanciasPK(ConstanciasPK constanciasPK) {
        this.constanciasPK = constanciasPK;
    }


    public String getExtención() {
        return extención;
    }

    public void setExtención(String extención) {
        this.extención = extención;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Permisos getPermisos() {
        return permisos;
    }

    public void setPermisos(Permisos permisos) {
        this.permisos = permisos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (constanciasPK != null ? constanciasPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Constancias)) {
            return false;
        }
        Constancias other = (Constancias) object;
        if ((this.constanciasPK == null && other.constanciasPK != null) || (this.constanciasPK != null && !this.constanciasPK.equals(other.constanciasPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Constancias[ constanciasPK=" + constanciasPK + " ]";
    }

    public byte[] getDocumento() {
        return documento;
    }

    public void setDocumento(byte[] documento) {
        this.documento = documento;
    }
    
}
