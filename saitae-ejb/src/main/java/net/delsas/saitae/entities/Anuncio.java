/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
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
    , @NamedQuery(name = "Anuncio.findAnunciosInactivos", query = "SELECT a FROM Anuncio a WHERE a.anuncioFechaFin < :fecha")
    , @NamedQuery(name = "Anuncio.findAnunciosActivos", query = "SELECT a FROM Anuncio a WHERE a.anuncioFechaFin >= :fecha")
    , @NamedQuery(name = "Anuncio.findAnunciosParaTodos", query = "SELECT a FROM Anuncio a WHERE a.anuncioFechaFin >= :fecha AND a.anuncioTipoPersona = :tipo")
})
public class Anuncio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idanuncio")
    private Integer idanuncio;
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
    @Basic(optional = false)
    @NotNull
    @Column(name = "anuncioFechaFin")
    @Temporal(TemporalType.DATE)
    private Date anuncioFechaFin;
    @JoinColumn(name = "anuncioAnunciante", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona anuncioAnunciante;
    @JoinColumn(name = "anuncioTipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne
    private TipoPersona anuncioTipoPersona;

    public Anuncio() {
    }

    public Anuncio(Integer idanuncio, String anuncioTitulo, String anuncioTexto, Date anuncioFechaFin) {
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

    public Date getAnuncioFechaFin() {
        return anuncioFechaFin;
    }

    public void setAnuncioFechaFin(Date anuncioFechaFin) {
        this.anuncioFechaFin = anuncioFechaFin;
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
        int hash = 7;
        hash = 31 * hash + Objects.hashCode(this.idanuncio);
        hash = 31 * hash + Objects.hashCode(this.anuncioTitulo);
        hash = 31 * hash + Objects.hashCode(this.anuncioTexto);
        hash = 31 * hash + Objects.hashCode(this.anuncioComentario);
        hash = 31 * hash + Objects.hashCode(this.anuncioFechaFin);
        hash = 31 * hash + Objects.hashCode(this.anuncioAnunciante);
        hash = 31 * hash + Objects.hashCode(this.anuncioTipoPersona);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Anuncio other = (Anuncio) obj;
        if (!Objects.equals(this.anuncioTitulo, other.anuncioTitulo)) {
            return false;
        }
        if (!Objects.equals(this.anuncioTexto, other.anuncioTexto)) {
            return false;
        }
        if (!Objects.equals(this.anuncioComentario, other.anuncioComentario)) {
            return false;
        }
        if (!Objects.equals(this.idanuncio, other.idanuncio)) {
            return false;
        }
        if (!Objects.equals(this.anuncioFechaFin, other.anuncioFechaFin)) {
            return false;
        }
        if (!Objects.equals(this.anuncioAnunciante, other.anuncioAnunciante)) {
            return false;
        }
        return Objects.equals(this.anuncioTipoPersona, other.anuncioTipoPersona);
    }

    @Override
    public String toString() {
        return "Anuncio{" + "idanuncio=" + idanuncio + ", anuncioTitulo=" + anuncioTitulo + ", anuncioTexto=" + anuncioTexto + ", anuncioComentario=" + anuncioComentario + ", anuncioFechaFin=" + anuncioFechaFin + ", anuncioAnunciante=" + anuncioAnunciante + ", anuncioTipoPersona=" + anuncioTipoPersona + '}';
    }

   }
