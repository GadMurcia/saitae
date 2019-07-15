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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "matricula", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Matricula.findAll", query = "SELECT m FROM Matricula m")
    , @NamedQuery(name = "Matricula.findByIdmatricula", query = "SELECT m FROM Matricula m WHERE m.matriculaPK.idmatricula = :idmatricula")
    , @NamedQuery(name = "Matricula.findByMatriculaNivel", query = "SELECT m FROM Matricula m WHERE m.matriculaPK.matriculaNivel = :matriculaNivel")
    , @NamedQuery(name = "Matricula.findByMatriculaSeccion", query = "SELECT m FROM Matricula m WHERE m.matriculaPK.matriculaSeccion = :matriculaSeccion")
    , @NamedQuery(name = "Matricula.findByMatriculaAnyo", query = "SELECT m FROM Matricula m WHERE m.matriculaPK.matriculaAnyo = :matriculaAnyo")
    , @NamedQuery(name = "Matricula.findByMatriculaModalidad", query = "SELECT m FROM Matricula m WHERE m.matriculaModalidad = :matriculaModalidad")
    , @NamedQuery(name = "Matricula.findByMatriculaRepite", query = "SELECT m FROM Matricula m WHERE m.matriculaRepite = :matriculaRepite")
    , @NamedQuery(name = "Matricula.findByMatriculaComentario", query = "SELECT m FROM Matricula m WHERE m.matriculaComentario = :matriculaComentario")})
public class Matricula implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MatriculaPK matriculaPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "matriculaModalidad")
    private String matriculaModalidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "matriculaRepite")
    private boolean matriculaRepite;
    @Size(max = 140)
    @Column(name = "matriculaComentario")
    private String matriculaComentario;
    @JoinColumn(name = "idmatricula", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Estudiante estudiante;
    @JoinColumns({
        @JoinColumn(name = "matriculaNivel", referencedColumnName = "idgrado", insertable = false, updatable = false)
        , @JoinColumn(name = "matriculaSeccion", referencedColumnName = "gradoSeccion", insertable = false, updatable = false)
        , @JoinColumn(name = "matriculaAnyo", referencedColumnName = "gradoA\u00f1o", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Grado grado;

    public Matricula() {
    }

    public Matricula(MatriculaPK matriculaPK) {
        this.matriculaPK = matriculaPK;
    }

    public Matricula(MatriculaPK matriculaPK, String matriculaModalidad, boolean matriculaRepite) {
        this.matriculaPK = matriculaPK;
        this.matriculaModalidad = matriculaModalidad;
        this.matriculaRepite = matriculaRepite;
    }

    public Matricula(int idmatricula, int matriculaNivel, String matriculaSeccion, Date matriculaAnyo) {
        this.matriculaPK = new MatriculaPK(idmatricula, matriculaNivel, matriculaSeccion, matriculaAnyo);
    }

    public MatriculaPK getMatriculaPK() {
        return matriculaPK;
    }

    public void setMatriculaPK(MatriculaPK matriculaPK) {
        this.matriculaPK = matriculaPK;
    }

    public String getMatriculaModalidad() {
        return matriculaModalidad;
    }

    public void setMatriculaModalidad(String matriculaModalidad) {
        this.matriculaModalidad = matriculaModalidad;
    }

    public boolean getMatriculaRepite() {
        return matriculaRepite;
    }

    public void setMatriculaRepite(boolean matriculaRepite) {
        this.matriculaRepite = matriculaRepite;
    }

    public String getMatriculaComentario() {
        return matriculaComentario;
    }

    public void setMatriculaComentario(String matriculaComentario) {
        this.matriculaComentario = matriculaComentario;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
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
        hash += (matriculaPK != null ? matriculaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Matricula)) {
            return false;
        }
        Matricula other = (Matricula) object;
        if ((this.matriculaPK == null && other.matriculaPK != null) || (this.matriculaPK != null && !this.matriculaPK.equals(other.matriculaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Matricula[ matriculaPK=" + matriculaPK + " ]";
    }
    
}
