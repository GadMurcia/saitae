/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "recurso", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Recurso.findAll", query = "SELECT r FROM Recurso r")
    , @NamedQuery(name = "Recurso.findByIdrecurso", query = "SELECT r FROM Recurso r WHERE r.idrecurso = :idrecurso")
    , @NamedQuery(name = "Recurso.findByNombre", query = "SELECT r FROM Recurso r WHERE r.nombre = :nombre")
    , @NamedQuery(name = "Recurso.findByActivo", query = "SELECT r FROM Recurso r WHERE r.activo = :activo")
    , @NamedQuery(name = "Recurso.findByValorUnitario", query = "SELECT r FROM Recurso r WHERE r.valorUnitario = :valorUnitario")
    , @NamedQuery(name = "Recurso.findByEstadoFisico", query = "SELECT r FROM Recurso r WHERE r.estadoFisico = :estadoFisico")
    , @NamedQuery(name = "Recurso.findByTipoValor", query = "SELECT r FROM Recurso r WHERE r.tipoValor = :tipoValor")
    , @NamedQuery(name = "Recurso.findByModelo", query = "SELECT r FROM Recurso r WHERE r.modelo = :modelo")
    , @NamedQuery(name = "Recurso.findByRecursoComentarios", query = "SELECT r FROM Recurso r WHERE r.recursoComentarios = :recursoComentarios")
    , @NamedQuery(name = "Recurso.findByTipoRecurso", query = "SELECT r FROM Recurso r WHERE r.idTipoRecurso.idtipoRecurso = :tipoRecurso")
})
public class Recurso implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "estadoFisico")
    private String estadoFisico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "tipoValor")
    private String tipoValor;
    @Size(max = 45)
    @Column(name = "modelo")
    private String modelo;
    @Size(max = 140)
    @Column(name = "recursoComentarios")
    private String recursoComentarios;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idrecurso")
    private Integer idrecurso;
    @Column(name = "activo")
    private Boolean activo;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "valorUnitario")
    private Float valorUnitario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recurso")
    private List<Ejemplar> ejemplarList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recurso")
    private List<ContenidoLibro> contenidoLibroList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recurso")
    private List<TipoReservaRecurso> tipoReservaRecursoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recurso")
    private List<EditorialLibro> editorialLibroList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recurso")
    private List<AutorLibro> autorLibroList;
    @JoinColumn(name = "idTipoRecurso", referencedColumnName = "idtipoRecurso")
    @ManyToOne(optional = false)
    private TipoRecurso idTipoRecurso;
    @JoinColumn(name = "tipoCargo", referencedColumnName = "idtipoCargo")
    @ManyToOne(optional = false)
    private TipoCargo tipoCargo;
    @JoinColumn(name = "pais", referencedColumnName = "idpais")
    @ManyToOne
    private Pais pais;
    @JoinColumn(name = "categoria", referencedColumnName = "idcategoria")
    @ManyToOne
    private Categoria categoria;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recurso")
    private List<SolicitudReserva> solicitudReservaList;

    public Recurso() {
    }

    public Recurso(Integer idrecurso) {
        this.idrecurso = idrecurso;
    }

    public Recurso(Integer idrecurso, String nombre, String estadoFisico, String tipoValor) {
        this.idrecurso = idrecurso;
        this.nombre = nombre;
        this.estadoFisico = estadoFisico;
        this.tipoValor = tipoValor;
    }

    public Integer getIdrecurso() {
        return idrecurso;
    }

    public void setIdrecurso(Integer idrecurso) {
        this.idrecurso = idrecurso;
    }


    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Float getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(Float valorUnitario) {
        this.valorUnitario = valorUnitario;
    }


    @XmlTransient
    public List<Ejemplar> getEjemplarList() {
        return ejemplarList;
    }

    public void setEjemplarList(List<Ejemplar> ejemplarList) {
        this.ejemplarList = ejemplarList;
    }

    @XmlTransient
    public List<ContenidoLibro> getContenidoLibroList() {
        return contenidoLibroList;
    }

    public void setContenidoLibroList(List<ContenidoLibro> contenidoLibroList) {
        this.contenidoLibroList = contenidoLibroList;
    }

    @XmlTransient
    public List<TipoReservaRecurso> getTipoReservaRecursoList() {
        return tipoReservaRecursoList;
    }

    public void setTipoReservaRecursoList(List<TipoReservaRecurso> tipoReservaRecursoList) {
        this.tipoReservaRecursoList = tipoReservaRecursoList;
    }

    @XmlTransient
    public List<EditorialLibro> getEditorialLibroList() {
        return editorialLibroList;
    }

    public void setEditorialLibroList(List<EditorialLibro> editorialLibroList) {
        this.editorialLibroList = editorialLibroList;
    }

    @XmlTransient
    public List<AutorLibro> getAutorLibroList() {
        return autorLibroList;
    }

    public void setAutorLibroList(List<AutorLibro> autorLibroList) {
        this.autorLibroList = autorLibroList;
    }

    public TipoRecurso getIdTipoRecurso() {
        return idTipoRecurso;
    }

    public void setIdTipoRecurso(TipoRecurso idTipoRecurso) {
        this.idTipoRecurso = idTipoRecurso;
    }

    public TipoCargo getTipoCargo() {
        return tipoCargo;
    }

    public void setTipoCargo(TipoCargo tipoCargo) {
        this.tipoCargo = tipoCargo;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @XmlTransient
    public List<SolicitudReserva> getSolicitudReservaList() {
        return solicitudReservaList;
    }

    public void setSolicitudReservaList(List<SolicitudReserva> solicitudReservaList) {
        this.solicitudReservaList = solicitudReservaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrecurso != null ? idrecurso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Recurso)) {
            return false;
        }
        Recurso other = (Recurso) object;
        if ((this.idrecurso == null && other.idrecurso != null) || (this.idrecurso != null && !this.idrecurso.equals(other.idrecurso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Recurso[ idrecurso=" + idrecurso + " ]";
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstadoFisico() {
        return estadoFisico;
    }

    public void setEstadoFisico(String estadoFisico) {
        this.estadoFisico = estadoFisico;
    }

    public String getTipoValor() {
        return tipoValor;
    }

    public void setTipoValor(String tipoValor) {
        this.tipoValor = tipoValor;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getRecursoComentarios() {
        return recursoComentarios;
    }

    public void setRecursoComentarios(String recursoComentarios) {
        this.recursoComentarios = recursoComentarios;
    }

}
