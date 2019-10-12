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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name = "anuncio", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Anuncio.findAll", query = "SELECT a FROM Anuncio a")
    , @NamedQuery(name = "Anuncio.findByIdanuncio", query = "SELECT a FROM Anuncio a WHERE a.idanuncio = :idanuncio")
    , @NamedQuery(name = "Anuncio.findByAnuncioTitulo", query = "SELECT a FROM Anuncio a WHERE a.anuncioTitulo = :anuncioTitulo")
    , @NamedQuery(name = "Anuncio.findByAnuncioFechaFin", query = "SELECT a FROM Anuncio a WHERE a.anuncioFechaFin = :anuncioFechaFin")
    , @NamedQuery(name = "Anuncio.findByAnuncioComentario", query = "SELECT a FROM Anuncio a WHERE a.anuncioComentario = :anuncioComentario")
    , @NamedQuery(name = "Anuncio.findAnunciosActivos", query = "SELECT a FROM Anuncio a WHERE a.anuncioFechaFin >= :fecha")
    , @NamedQuery(name = "Anuncio.findAnunciosInactivos", query = "SELECT a FROM Anuncio a WHERE a.anuncioFechaFin < :fecha")
    , @NamedQuery(name = "Anuncio.findAnunciosParaTodos", query = "SELECT a FROM Anuncio a WHERE a.anuncioTipoPersona = :tipo and a.anuncioFechaFin >= :fecha")
})
public class Anuncio implements Serializable {

  
  

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idanuncio")
    private Integer idanuncio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "anuncioFechaFin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date anuncioFechaFin;

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "anuncioTitulo")
    private String anuncioTitulo;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "anuncioTexto")
    private String anuncioTexto;
    @Size(max = 140)
    @Column(name = "anuncioComentario")
    private String anuncioComentario;
    @JoinColumn(name = "anuncioAnunciante", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona anuncioAnunciante;
    @JoinColumn(name = "anuncioTipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne
    private TipoPersona anuncioTipoPersona;

    public Anuncio() {
    }

    public Anuncio(Integer idanuncio) {
        this.idanuncio = idanuncio;
    }

    public Anuncio(Integer idanuncio, String anuncioTitulo, Date anuncioFechaFin, String anuncioTexto) {
        this.idanuncio = idanuncio;
        this.anuncioTitulo = anuncioTitulo;
        this.anuncioFechaFin = anuncioFechaFin;
        this.anuncioTexto = anuncioTexto;
    }

    public Integer getIdanuncio() {
        return idanuncio;
    }

    public void setIdanuncio(Integer idanuncio) {
        this.idanuncio = idanuncio;
    }

    public String getAnuncioTitulo() {
        return anuncioTitulo;
    }

    public void setAnuncioTitulo(String anuncioTitulo) {
        this.anuncioTitulo = anuncioTitulo;
    }

    public Date getAnuncioFechaFin() {
        return anuncioFechaFin;
    }

    public void setAnuncioFechaFin(Date anuncioFechaFin) {
        this.anuncioFechaFin = anuncioFechaFin;
    }

    public String getAnuncioTexto() {
        return anuncioTexto;
    }

    public void setAnuncioTexto(String anuncioTexto) {
        this.anuncioTexto = anuncioTexto;
    }

    public String getAnuncioComentario() {
        return anuncioComentario;
    }

    public void setAnuncioComentario(String anuncioComentario) {
        this.anuncioComentario = anuncioComentario;
    }

    public Persona getAnuncioAnunciante() {
        return anuncioAnunciante;
    }

    public void setAnuncioAnunciante(Persona anuncioAnunciante) {
        this.anuncioAnunciante = anuncioAnunciante;
    }

    public TipoPersona getAnuncioTipoPersona() {
        return anuncioTipoPersona;
    }

    public void setAnuncioTipoPersona(TipoPersona anuncioTipoPersona) {
        this.anuncioTipoPersona = anuncioTipoPersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idanuncio != null ? idanuncio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Anuncio)) {
            return false;
        }
        Anuncio other = (Anuncio) object;
        if ((this.idanuncio == null && other.idanuncio != null) || (this.idanuncio != null && !this.idanuncio.equals(other.idanuncio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Anuncio[ idanuncio=" + idanuncio + " ]";
    }    

    
}
