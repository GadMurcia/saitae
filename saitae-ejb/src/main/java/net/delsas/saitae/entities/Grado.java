/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "grado", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Grado.findAll", query = "SELECT g FROM Grado g"),
    @NamedQuery(name = "Grado.findByIdgrado", query = "SELECT g FROM Grado g WHERE g.gradoPK.idgrado = :idgrado"),
    @NamedQuery(name = "Grado.findByGradoModalidad", query = "SELECT g FROM Grado g WHERE g.gradoPK.gradoModalidad = :gradoModalidad"),
    @NamedQuery(name = "Grado.findByGradoSeccion", query = "SELECT g FROM Grado g WHERE g.gradoPK.gradoSeccion = :gradoSeccion"),
    @NamedQuery(name = "Grado.findByGradoAño", query = "SELECT g FROM Grado g WHERE g.gradoPK.gradoAño = :gradoAño"),
    @NamedQuery(name = "Grado.findByGradoActivo", query = "SELECT g FROM Grado g WHERE g.gradoActivo = :gradoActivo"),
    @NamedQuery(name = "Grado.findByGradoCoemntario", query = "SELECT g FROM Grado g WHERE g.gradoCoemntario = :gradoCoemntario"),
    @NamedQuery(name = "Grado.findModalidadByaño", query = "SELECT DISTINCT(g.gradoPK.gradoModalidad) FROM Grado g WHERE g.gradoPK.gradoAño = :año AND g.gradoActivo = true"),
    @NamedQuery(name = "Grado.findIDByañoAndModalidad", query = "SELECT DISTINCT(g.gradoPK.idgrado) FROM Grado g WHERE g.gradoPK.gradoAño = :año AND g.gradoPK.gradoModalidad = :modalidad AND g.gradoActivo = true"),
    @NamedQuery(name = "Grado.findSeccionByAñoModId", query = "SELECT DISTINCT(g.gradoPK.gradoSeccion) FROM Grado g WHERE g.gradoPK.gradoAño = :año AND g.gradoPK.gradoModalidad = :modalidad AND g.gradoPK.idgrado = :idgrado AND g.gradoActivo = true"),
    @NamedQuery(name = "Grado.findByañoAndActivo", query = "SELECT g FROM Grado g WHERE g.gradoPK.gradoAño = :año AND g.gradoActivo = true"),
    @NamedQuery(name = "Grado.findAños", query = "SELECT DISTINCT g.gradoPK.gradoAño FROM Grado g ORDER BY g.gradoPK.gradoAño DESC"),
    @NamedQuery(name = "Grado.findByidMaestro", query = "SELECT g FROM Grado g WHERE g.gradoMaestroGuia.idmaestro = :idMaestro ORDER BY g.gradoPK.gradoAño DESC"),
    @NamedQuery(name = "Grado.findByidMaestroAndAño", query = "SELECT g FROM Grado g WHERE g.gradoMaestroGuia.idmaestro = :idMaestro AND g.gradoPK.gradoAño = :año")
})
public class Grado implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    private GradoPK gradoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gradoActivo")
    private boolean gradoActivo;
    @Size(max = 145)
    @Column(name = "gradoCoemntario")
    private String gradoCoemntario;
    @JoinColumn(name = "gradoMaestroGuia", referencedColumnName = "idmaestro")
    @ManyToOne
    private Maestro gradoMaestroGuia;
    @JoinColumn(name = "aulaGrado", referencedColumnName = "idaula")
    @ManyToOne(optional = false)
    private Aula aulaGrado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "grado")
    private List<MestroHorarioMaterias> mestroHorarioMateriasList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "grado")
    private List<GradoEvaluacion> gradoEvaluacionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "grado")
    private List<EvaluacionMaestro> evaluacionMaestroList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "grado")
    private List<Matricula> matriculaList;

    public Grado() {
    }

    public Grado(GradoPK gradoPK) {
        this.gradoPK = gradoPK;
    }

    public Grado(GradoPK gradoPK, boolean gradoActivo) {
        this.gradoPK = gradoPK;
        this.gradoActivo = gradoActivo;
    }

    public Grado(int idgrado, String gradoModalidad, String gradoSeccion, int gradoAño) {
        this.gradoPK = new GradoPK(idgrado, gradoModalidad, gradoSeccion, gradoAño);
    }

    public GradoPK getGradoPK() {
        return gradoPK;
    }

    public void setGradoPK(GradoPK gradoPK) {
        this.gradoPK = gradoPK;
    }

    public boolean getGradoActivo() {
        return gradoActivo;
    }

    public void setGradoActivo(boolean gradoActivo) {
        this.gradoActivo = gradoActivo;
    }

    public String getGradoCoemntario() {
        return gradoCoemntario;
    }

    public void setGradoCoemntario(String gradoCoemntario) {
        this.gradoCoemntario = gradoCoemntario;
    }

    public Maestro getGradoMaestroGuia() {
        return gradoMaestroGuia;
    }

    public void setGradoMaestroGuia(Maestro gradoMaestroGuia) {
        this.gradoMaestroGuia = gradoMaestroGuia;
    }

    public Aula getAulaGrado() {
        return aulaGrado;
    }

    public void setAulaGrado(Aula aulaGrado) {
        this.aulaGrado = aulaGrado;
    }

    @XmlTransient
    public List<MestroHorarioMaterias> getMestroHorarioMateriasList() {
        return mestroHorarioMateriasList;
    }

    public void setMestroHorarioMateriasList(List<MestroHorarioMaterias> mestroHorarioMateriasList) {
        this.mestroHorarioMateriasList = mestroHorarioMateriasList;
    }

    @XmlTransient
    public List<EvaluacionMaestro> getEvaluacionMaestroList() {
        return evaluacionMaestroList;
    }

    public void setEvaluacionMaestroList(List<EvaluacionMaestro> evaluacionMaestroList) {
        this.evaluacionMaestroList = evaluacionMaestroList;
    }

    @XmlTransient
    public List<Matricula> getMatriculaList() {
        return matriculaList;
    }

    public void setMatriculaList(List<Matricula> matriculaList) {
        this.matriculaList = matriculaList;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 17 * hash + Objects.hashCode(this.gradoPK);
        hash = 17 * hash + (this.gradoActivo ? 1 : 0);
        hash = 17 * hash + Objects.hashCode(this.gradoCoemntario);
        hash = 17 * hash + Objects.hashCode(this.gradoMaestroGuia);
        hash = 17 * hash + Objects.hashCode(this.aulaGrado);
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
        final Grado other = (Grado) obj;
        if (this.gradoActivo != other.gradoActivo) {
            return false;
        }
        if (!Objects.equals(this.gradoCoemntario, other.gradoCoemntario)) {
            return false;
        }
        if (!Objects.equals(this.gradoPK, other.gradoPK)) {
            return false;
        }
        if (!Objects.equals(this.gradoMaestroGuia, other.gradoMaestroGuia)) {
            return false;
        }
        return Objects.equals(this.aulaGrado, other.aulaGrado);
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Grado[ gradoPK=" + gradoPK + " ]";
    }

    @XmlTransient
    public List<GradoEvaluacion> getGradoEvaluacionList() {
        return gradoEvaluacionList;
    }

    public void setGradoEvaluacionList(List<GradoEvaluacion> gradoEvaluacionList) {
        this.gradoEvaluacionList = gradoEvaluacionList;
    }

}
