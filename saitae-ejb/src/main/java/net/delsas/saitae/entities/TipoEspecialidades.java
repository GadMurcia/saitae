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
@Table(name = "tipoEspecialidades", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoEspecialidades.findAll", query = "SELECT t FROM TipoEspecialidades t")
    , @NamedQuery(name = "TipoEspecialidades.findByIdtipoEspecialidades", query = "SELECT t FROM TipoEspecialidades t WHERE t.idtipoEspecialidades = :idtipoEspecialidades")
    , @NamedQuery(name = "TipoEspecialidades.findByTipoEspecialidadesNombre", query = "SELECT t FROM TipoEspecialidades t WHERE t.tipoEspecialidadesNombre = :tipoEspecialidadesNombre")
    , @NamedQuery(name = "TipoEspecialidades.findByTipoEspecialidadesComentario", query = "SELECT t FROM TipoEspecialidades t WHERE t.tipoEspecialidadesComentario = :tipoEspecialidadesComentario")})
public class TipoEspecialidades implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtipoEspecialidades")
    private Integer idtipoEspecialidades;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 70)
    @Column(name = "tipoEspecialidadesNombre")
    private String tipoEspecialidadesNombre;
    @Size(max = 145)
    @Column(name = "tipoEspecialidadesComentario")
    private String tipoEspecialidadesComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maestroEspecialidad")
    private List<Maestro> maestroList;

    public TipoEspecialidades() {
    }

    public TipoEspecialidades(Integer idtipoEspecialidades) {
        this.idtipoEspecialidades = idtipoEspecialidades;
    }

    public TipoEspecialidades(Integer idtipoEspecialidades, String tipoEspecialidadesNombre) {
        this.idtipoEspecialidades = idtipoEspecialidades;
        this.tipoEspecialidadesNombre = tipoEspecialidadesNombre;
    }

    public Integer getIdtipoEspecialidades() {
        return idtipoEspecialidades;
    }

    public void setIdtipoEspecialidades(Integer idtipoEspecialidades) {
        this.idtipoEspecialidades = idtipoEspecialidades;
    }

    public String getTipoEspecialidadesNombre() {
        return tipoEspecialidadesNombre;
    }

    public void setTipoEspecialidadesNombre(String tipoEspecialidadesNombre) {
        this.tipoEspecialidadesNombre = tipoEspecialidadesNombre;
    }

    public String getTipoEspecialidadesComentario() {
        return tipoEspecialidadesComentario;
    }

    public void setTipoEspecialidadesComentario(String tipoEspecialidadesComentario) {
        this.tipoEspecialidadesComentario = tipoEspecialidadesComentario;
    }

    @XmlTransient
    public List<Maestro> getMaestroList() {
        return maestroList;
    }

    public void setMaestroList(List<Maestro> maestroList) {
        this.maestroList = maestroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtipoEspecialidades != null ? idtipoEspecialidades.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoEspecialidades)) {
            return false;
        }
        TipoEspecialidades other = (TipoEspecialidades) object;
        if ((this.idtipoEspecialidades == null && other.idtipoEspecialidades != null) || (this.idtipoEspecialidades != null && !this.idtipoEspecialidades.equals(other.idtipoEspecialidades))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.TipoEspecialidades[ idtipoEspecialidades=" + idtipoEspecialidades + " ]";
    }
    
}
