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
@Table(name = "evaluacionMaestro", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EvaluacionMaestro.findAll", query = "SELECT e FROM EvaluacionMaestro e")
    , @NamedQuery(name = "EvaluacionMaestro.findByIdMaestro", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroPK.idMaestro = :idMaestro")
    , @NamedQuery(name = "EvaluacionMaestro.findByFechaHora", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroPK.fechaHora = :fechaHora")
    , @NamedQuery(name = "EvaluacionMaestro.findByMateria", query = "SELECT e FROM EvaluacionMaestro e WHERE e.materia = :materia")
    , @NamedQuery(name = "EvaluacionMaestro.findByTurno", query = "SELECT e FROM EvaluacionMaestro e WHERE e.turno = :turno")
    , @NamedQuery(name = "EvaluacionMaestro.findByEstudiantes", query = "SELECT e FROM EvaluacionMaestro e WHERE e.estudiantes = :estudiantes")
    , @NamedQuery(name = "EvaluacionMaestro.findByHoraInicio", query = "SELECT e FROM EvaluacionMaestro e WHERE e.horaInicio = :horaInicio")
    , @NamedQuery(name = "EvaluacionMaestro.findByHoraFin", query = "SELECT e FROM EvaluacionMaestro e WHERE e.horaFin = :horaFin")
    , @NamedQuery(name = "EvaluacionMaestro.findByUnidad", query = "SELECT e FROM EvaluacionMaestro e WHERE e.unidad = :unidad")
    , @NamedQuery(name = "EvaluacionMaestro.findByObjetivo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.objetivo = :objetivo")
    , @NamedQuery(name = "EvaluacionMaestro.findByEvaluador", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluador = :evaluador")
    , @NamedQuery(name = "EvaluacionMaestro.findByResumen", query = "SELECT e FROM EvaluacionMaestro e WHERE e.resumen = :resumen")
    , @NamedQuery(name = "EvaluacionMaestro.findByPropuestaMejora", query = "SELECT e FROM EvaluacionMaestro e WHERE e.propuestaMejora = :propuestaMejora")
    , @NamedQuery(name = "EvaluacionMaestro.findByEvaluacionMaestroComentario", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroComentario = :evaluacionMaestroComentario")
    , @NamedQuery(name = "EvaluacionMaestro.findByGradoModalidad", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroPK.gradoModalidad = :gradoModalidad")})
public class EvaluacionMaestro implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "materia")
    private int materia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "turno")
    private String turno;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Estudiantes")
    private int estudiantes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaInicio")
    @Temporal(TemporalType.TIME)
    private Date horaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaFin")
    @Temporal(TemporalType.TIME)
    private Date horaFin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "unidad")
    private String unidad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "objetivo")
    private String objetivo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "evaluador")
    private int evaluador;
    @Basic(optional = false)
    @NotNull
    @Lob()
    @Size(min = 1, max = 2147483647)
    @Column(name = "faceIniciacion")
    private String faceIniciacion;
    @Basic(optional = false)
    @NotNull
    @Lob()
    @Size(min = 1, max = 2147483647)
    @Column(name = "faceDesarrollo")
    private String faceDesarrollo;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "FaceCulminaci\u00f3n")
    private String faceCulminación;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "actitudicionales")
    private String actitudicionales;
    @Size(max = 250)
    @Column(name = "resumen")
    private String resumen;
    @Size(max = 145)
    @Column(name = "propuestaMejora")
    private String propuestaMejora;
    @Size(max = 145)
    @Column(name = "evaluacionMaestroComentario")
    private String evaluacionMaestroComentario;
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EvaluacionMaestroPK evaluacionMaestroPK;
    @JoinColumn(name = "idMaestro", referencedColumnName = "idmaestro", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Maestro maestro;
    @JoinColumns({
        @JoinColumn(name = "grado", referencedColumnName = "idgrado")
        , @JoinColumn(name = "seccion", referencedColumnName = "gradoSeccion")
        , @JoinColumn(name = "a\u00f1o", referencedColumnName = "gradoA\u00f1o")
        , @JoinColumn(name = "gradoModalidad", referencedColumnName = "gradoModalidad", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Grado grado;

    public EvaluacionMaestro() {
    }

    public EvaluacionMaestro(EvaluacionMaestroPK evaluacionMaestroPK) {
        this.evaluacionMaestroPK = evaluacionMaestroPK;
    }

    public EvaluacionMaestro(EvaluacionMaestroPK evaluacionMaestroPK, int materia, String turno, int estudiantes, Date horaInicio, Date horaFin, String unidad, String objetivo, int evaluador, String faceIniciacion, String faceDesarrollo, String faceCulminación, String actitudicionales) {
        this.evaluacionMaestroPK = evaluacionMaestroPK;
        this.materia = materia;
        this.turno = turno;
        this.estudiantes = estudiantes;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.unidad = unidad;
        this.objetivo = objetivo;
        this.evaluador = evaluador;
        this.faceIniciacion = faceIniciacion;
        this.faceDesarrollo = faceDesarrollo;
        this.faceCulminación = faceCulminación;
        this.actitudicionales = actitudicionales;
    }

    public EvaluacionMaestro(int idMaestro, Date fechaHora, String gradoModalidad) {
        this.evaluacionMaestroPK = new EvaluacionMaestroPK(idMaestro, fechaHora, gradoModalidad);
    }

    public EvaluacionMaestroPK getEvaluacionMaestroPK() {
        return evaluacionMaestroPK;
    }

    public void setEvaluacionMaestroPK(EvaluacionMaestroPK evaluacionMaestroPK) {
        this.evaluacionMaestroPK = evaluacionMaestroPK;
    }
    public Maestro getMaestro() {
        return maestro;
    }
    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }
    public Grado getGrado() {
        return grado;
    }
    public void setGrado(Grado grado) {
        this.grado = grado;
    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (evaluacionMaestroPK != null ? evaluacionMaestroPK.hashCode() : 0);
        return hash;
    }
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvaluacionMaestro)) {
            return false;
        }
        EvaluacionMaestro other = (EvaluacionMaestro) object;
        if ((this.evaluacionMaestroPK == null && other.evaluacionMaestroPK != null) || (this.evaluacionMaestroPK != null && !this.evaluacionMaestroPK.equals(other.evaluacionMaestroPK))) {
            return false;
        }
        return true;
    }
    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EvaluacionMaestro[ evaluacionMaestroPK=" + evaluacionMaestroPK + " ]";
    }

    public int getMateria() {
        return materia;
    }

    public void setMateria(int materia) {
        this.materia = materia;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public int getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(int estudiantes) {
        this.estudiantes = estudiantes;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public int getEvaluador() {
        return evaluador;
    }

    public void setEvaluador(int evaluador) {
        this.evaluador = evaluador;
    }

    public String getFaceIniciacion() {
        return faceIniciacion;
    }

    public void setFaceIniciacion(String faceIniciacion) {
        this.faceIniciacion = faceIniciacion;
    }

    public String getFaceDesarrollo() {
        return faceDesarrollo;
    }

    public void setFaceDesarrollo(String faceDesarrollo) {
        this.faceDesarrollo = faceDesarrollo;
    }

    public String getFaceCulminación() {
        return faceCulminación;
    }

    public void setFaceCulminación(String faceCulminación) {
        this.faceCulminación = faceCulminación;
    }

    public String getActitudicionales() {
        return actitudicionales;
    }

    public void setActitudicionales(String actitudicionales) {
        this.actitudicionales = actitudicionales;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getPropuestaMejora() {
        return propuestaMejora;
    }

    public void setPropuestaMejora(String propuestaMejora) {
        this.propuestaMejora = propuestaMejora;
    }

    public String getEvaluacionMaestroComentario() {
        return evaluacionMaestroComentario;
    }

    public void setEvaluacionMaestroComentario(String evaluacionMaestroComentario) {
        this.evaluacionMaestroComentario = evaluacionMaestroComentario;
    }
    
}
