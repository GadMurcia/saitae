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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
@Table(name = "gradoEvaluacion", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GradoEvaluacion.findAll", query = "SELECT g FROM GradoEvaluacion g")
    , @NamedQuery(name = "GradoEvaluacion.findByIdGrado", query = "SELECT g FROM GradoEvaluacion g WHERE g.gradoEvaluacionPK.idGrado = :idGrado")
    , @NamedQuery(name = "GradoEvaluacion.findByGradoSeccion", query = "SELECT g FROM GradoEvaluacion g WHERE g.gradoEvaluacionPK.gradoSeccion = :gradoSeccion")
    , @NamedQuery(name = "GradoEvaluacion.findByGradoA\u00f1o", query = "SELECT g FROM GradoEvaluacion g WHERE g.gradoEvaluacionPK.gradoA\u00f1o = :gradoA\u00f1o")
    , @NamedQuery(name = "GradoEvaluacion.findByGradoModalidad", query = "SELECT g FROM GradoEvaluacion g WHERE g.gradoEvaluacionPK.gradoModalidad = :gradoModalidad")
    , @NamedQuery(name = "GradoEvaluacion.findByFechaEvaluacion", query = "SELECT g FROM GradoEvaluacion g WHERE g.fechaEvaluacion = :fechaEvaluacion")
    , @NamedQuery(name = "GradoEvaluacion.findByOrganizadorLimpieza", query = "SELECT g FROM GradoEvaluacion g WHERE g.organizadorLimpieza = :organizadorLimpieza")
    , @NamedQuery(name = "GradoEvaluacion.findByOrganizadorClase", query = "SELECT g FROM GradoEvaluacion g WHERE g.organizadorClase = :organizadorClase")
    , @NamedQuery(name = "GradoEvaluacion.findByNormas", query = "SELECT g FROM GradoEvaluacion g WHERE g.normas = :normas")
    , @NamedQuery(name = "GradoEvaluacion.findByMision", query = "SELECT g FROM GradoEvaluacion g WHERE g.mision = :mision")
    , @NamedQuery(name = "GradoEvaluacion.findByVision", query = "SELECT g FROM GradoEvaluacion g WHERE g.vision = :vision")
    , @NamedQuery(name = "GradoEvaluacion.findByMapasRiesgo", query = "SELECT g FROM GradoEvaluacion g WHERE g.mapasRiesgo = :mapasRiesgo")
    , @NamedQuery(name = "GradoEvaluacion.findByComites", query = "SELECT g FROM GradoEvaluacion g WHERE g.comites = :comites")
    , @NamedQuery(name = "GradoEvaluacion.findByBienvenidos", query = "SELECT g FROM GradoEvaluacion g WHERE g.bienvenidos = :bienvenidos")
    , @NamedQuery(name = "GradoEvaluacion.findByValores", query = "SELECT g FROM GradoEvaluacion g WHERE g.valores = :valores")
    , @NamedQuery(name = "GradoEvaluacion.findByDirectiva", query = "SELECT g FROM GradoEvaluacion g WHERE g.directiva = :directiva")
    , @NamedQuery(name = "GradoEvaluacion.findByMaterial", query = "SELECT g FROM GradoEvaluacion g WHERE g.material = :material")
    , @NamedQuery(name = "GradoEvaluacion.findByObservacionesPositivas", query = "SELECT g FROM GradoEvaluacion g WHERE g.observacionesPositivas = :observacionesPositivas")
    , @NamedQuery(name = "GradoEvaluacion.findByObservacioneNegativas", query = "SELECT g FROM GradoEvaluacion g WHERE g.observacioneNegativas = :observacioneNegativas")
    , @NamedQuery(name = "GradoEvaluacion.findByRecomendaciones", query = "SELECT g FROM GradoEvaluacion g WHERE g.recomendaciones = :recomendaciones")
    , @NamedQuery(name = "GradoEvaluacion.findByEvaluacionGradoComentario", query = "SELECT g FROM GradoEvaluacion g WHERE g.evaluacionGradoComentario = :evaluacionGradoComentario")})
public class GradoEvaluacion implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaEvaluacion")
    @Temporal(TemporalType.DATE)
    private Date fechaEvaluacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "organizadorLimpieza")
    private boolean organizadorLimpieza;
    @Basic(optional = false)
    @NotNull
    @Column(name = "organizadorClase")
    private boolean organizadorClase;
    @Basic(optional = false)
    @NotNull
    @Column(name = "normas")
    private boolean normas;
    @Basic(optional = false)
    @NotNull
    @Column(name = "mision")
    private boolean mision;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vision")
    private boolean vision;
    @Basic(optional = false)
    @NotNull
    @Column(name = "mapasRiesgo")
    private boolean mapasRiesgo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "comites")
    private boolean comites;
    @Basic(optional = false)
    @NotNull
    @Column(name = "bienvenidos")
    private boolean bienvenidos;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valores")
    private boolean valores;
    @Basic(optional = false)
    @NotNull
    @Column(name = "directiva")
    private boolean directiva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "material")
    private boolean material;
    @Size(max = 145)
    @Column(name = "observacionesPositivas")
    private String observacionesPositivas;
    @Size(max = 145)
    @Column(name = "observacioneNegativas")
    private String observacioneNegativas;
    @Size(max = 145)
    @Column(name = "Recomendaciones")
    private String recomendaciones;
    @Size(max = 145)
    @Column(name = "evaluacionGradoComentario")
    private String evaluacionGradoComentario;
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected GradoEvaluacionPK gradoEvaluacionPK;
    @JoinColumns({
        @JoinColumn(name = "idGrado", referencedColumnName = "idgrado", insertable = false, updatable = false)
        , @JoinColumn(name = "gradoSeccion", referencedColumnName = "gradoSeccion", insertable = false, updatable = false)
        , @JoinColumn(name = "gradoA\u00f1o", referencedColumnName = "gradoA\u00f1o", insertable = false, updatable = false)
        , @JoinColumn(name = "gradoModalidad", referencedColumnName = "gradoModalidad", insertable = false, updatable = false)})
    @OneToOne(optional = false)
    private Grado grado;
    @JoinColumn(name = "evaluador", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona evaluador;

    public GradoEvaluacion() {
    }

    public GradoEvaluacion(GradoEvaluacionPK gradoEvaluacionPK) {
        this.gradoEvaluacionPK = gradoEvaluacionPK;
    }

    public GradoEvaluacion(GradoEvaluacionPK gradoEvaluacionPK, Date fechaEvaluacion, boolean organizadorLimpieza, boolean organizadorClase, boolean normas, boolean mision, boolean vision, boolean mapasRiesgo, boolean comites, boolean bienvenidos, boolean valores, boolean directiva, boolean material) {
        this.gradoEvaluacionPK = gradoEvaluacionPK;
        this.fechaEvaluacion = fechaEvaluacion;
        this.organizadorLimpieza = organizadorLimpieza;
        this.organizadorClase = organizadorClase;
        this.normas = normas;
        this.mision = mision;
        this.vision = vision;
        this.mapasRiesgo = mapasRiesgo;
        this.comites = comites;
        this.bienvenidos = bienvenidos;
        this.valores = valores;
        this.directiva = directiva;
        this.material = material;
    }

    public GradoEvaluacion(int idGrado, String gradoSeccion, int gradoAño, String gradoModalidad) {
        this.gradoEvaluacionPK = new GradoEvaluacionPK(idGrado, gradoSeccion, gradoAño, gradoModalidad);
    }

    public GradoEvaluacionPK getGradoEvaluacionPK() {
        return gradoEvaluacionPK;
    }

    public void setGradoEvaluacionPK(GradoEvaluacionPK gradoEvaluacionPK) {
        this.gradoEvaluacionPK = gradoEvaluacionPK;
    }
    public Grado getGrado() {
        return grado;
    }
    public void setGrado(Grado grado) {
        this.grado = grado;
    }
    public Persona getEvaluador() {
        return evaluador;
    }
    public void setEvaluador(Persona evaluador) {
        this.evaluador = evaluador;
    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (gradoEvaluacionPK != null ? gradoEvaluacionPK.hashCode() : 0);
        return hash;
    }
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GradoEvaluacion)) {
            return false;
        }
        GradoEvaluacion other = (GradoEvaluacion) object;
        if ((this.gradoEvaluacionPK == null && other.gradoEvaluacionPK != null) || (this.gradoEvaluacionPK != null && !this.gradoEvaluacionPK.equals(other.gradoEvaluacionPK))) {
            return false;
        }
        return true;
    }
    @Override
    public String toString() {
        return "net.delsas.saitae.entities.GradoEvaluacion[ gradoEvaluacionPK=" + gradoEvaluacionPK + " ]";
    }

    public Date getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(Date fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }

    public boolean getOrganizadorLimpieza() {
        return organizadorLimpieza;
    }

    public void setOrganizadorLimpieza(boolean organizadorLimpieza) {
        this.organizadorLimpieza = organizadorLimpieza;
    }

    public boolean getOrganizadorClase() {
        return organizadorClase;
    }

    public void setOrganizadorClase(boolean organizadorClase) {
        this.organizadorClase = organizadorClase;
    }

    public boolean getNormas() {
        return normas;
    }

    public void setNormas(boolean normas) {
        this.normas = normas;
    }

    public boolean getMision() {
        return mision;
    }

    public void setMision(boolean mision) {
        this.mision = mision;
    }

    public boolean getVision() {
        return vision;
    }

    public void setVision(boolean vision) {
        this.vision = vision;
    }

    public boolean getMapasRiesgo() {
        return mapasRiesgo;
    }

    public void setMapasRiesgo(boolean mapasRiesgo) {
        this.mapasRiesgo = mapasRiesgo;
    }

    public boolean getComites() {
        return comites;
    }

    public void setComites(boolean comites) {
        this.comites = comites;
    }

    public boolean getBienvenidos() {
        return bienvenidos;
    }

    public void setBienvenidos(boolean bienvenidos) {
        this.bienvenidos = bienvenidos;
    }

    public boolean getValores() {
        return valores;
    }

    public void setValores(boolean valores) {
        this.valores = valores;
    }

    public boolean getDirectiva() {
        return directiva;
    }

    public void setDirectiva(boolean directiva) {
        this.directiva = directiva;
    }

    public boolean getMaterial() {
        return material;
    }

    public void setMaterial(boolean material) {
        this.material = material;
    }

    public String getObservacionesPositivas() {
        return observacionesPositivas;
    }

    public void setObservacionesPositivas(String observacionesPositivas) {
        this.observacionesPositivas = observacionesPositivas;
    }

    public String getObservacioneNegativas() {
        return observacioneNegativas;
    }

    public void setObservacioneNegativas(String observacioneNegativas) {
        this.observacioneNegativas = observacioneNegativas;
    }

    public String getRecomendaciones() {
        return recomendaciones;
    }

    public void setRecomendaciones(String recomendaciones) {
        this.recomendaciones = recomendaciones;
    }

    public String getEvaluacionGradoComentario() {
        return evaluacionGradoComentario;
    }

    public void setEvaluacionGradoComentario(String evaluacionGradoComentario) {
        this.evaluacionGradoComentario = evaluacionGradoComentario;
    }
    
}
