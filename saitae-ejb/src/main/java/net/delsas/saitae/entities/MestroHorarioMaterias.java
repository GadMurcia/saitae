/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "mestroHorarioMaterias", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MestroHorarioMaterias.findAll", query = "SELECT m FROM MestroHorarioMaterias m"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdMaestro", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idMaestro = :idMaestro"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdMateria", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idMateria = :idMateria"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdHorario", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idHorario = :idHorario"),
    @NamedQuery(name = "MestroHorarioMaterias.findByDiaSemana", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.diaSemana = :diaSemana"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idGrado = :idGrado"),
    @NamedQuery(name = "MestroHorarioMaterias.findByGradoModalidad", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.gradoModalidad = :gradoModalidad"),
    @NamedQuery(name = "MestroHorarioMaterias.findBySeccionGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.seccionGrado = :seccionGrado"),
    @NamedQuery(name = "MestroHorarioMaterias.findByA\u00f1oGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.a\u00f1oGrado = :a\u00f1oGrado"),
    @NamedQuery(name = "MestroHorarioMaterias.findByMestroHorarioMateriasComentarios", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasComentarios = :mestroHorarioMateriasComentarios"),
    @NamedQuery(name = "MestroHorarioMaterias.findByHorarioAndGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.horario = :horario AND m.grado.gradoPK = :gradoPK AND m.diasEstudio = :dia"),
    @NamedQuery(name = "MestroHorarioMaterias.findByHorarioAndMaestro", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.horario = :horario AND m.maestro = :maestro AND m.diasEstudio = :dia"),
    @NamedQuery(name = "MestroHorarioMaterias.findMaestrosBygrado", query = "SELECT DISTINCT m.maestro FROM MestroHorarioMaterias m WHERE m.grado.gradoPK = :gradoPK"),
    @NamedQuery(name = "MestroHorarioMaterias.findMateriasBygradoPkAndMaestroId", query = "SELECT DISTINCT m.materia FROM MestroHorarioMaterias m WHERE m.grado.gradoPK = :gradoPK AND m.maestro.idmaestro = :idMaestro"),
    @NamedQuery(name = "MestroHorarioMaterias.findAllOrdered", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.grado.gradoPK.gradoAño = :año ORDER BY m.diasEstudio, m.horario, m.materia, m.grado, m.maestro"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdDiaAndGradopk", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.horario.idhorario = :idHora AND m.grado.gradoPK = :gradoPK ORDER BY m.horario.idhorario ASC"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdDiaAndMaestro", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.grado.gradoPK.gradoAño = :año AND m.horario.idhorario = :idHora AND m.maestro.idmaestro = :idMaestro ORDER BY m.horario.idhorario ASC"),
    @NamedQuery(name = "MestroHorarioMaterias.findAñoByidMaestro", query = "SELECT DISTINCT m.grado.gradoPK.gradoAño FROM MestroHorarioMaterias m WHERE m.maestro.idmaestro = :idMaestro ORDER BY m.grado.gradoPK.gradoAño DESC"),
    @NamedQuery(name = "MestroHorarioMaterias.findByIdDiaAndGradopkAndidHora", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.horario.idhorario = :idHora AND m.grado.gradoPK = :gradoPK AND m.diasEstudio.idDias =:idDia ORDER BY m.horario.idhorario ASC"),
    @NamedQuery(name = "MestroHorarioMaterias.finHorarioActual", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.maestro.idmaestro = :idMaestro AND m.horario.horaInicio <= :fecha AND m.horario.horaFin >= :fecha AND m.grado.gradoPK.gradoAño = :año AND m.diasEstudio.idDias = :idDia")
})
public class MestroHorarioMaterias implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    private MestroHorarioMateriasPK mestroHorarioMateriasPK;
    @Size(max = 145)
    @Column(name = "mestroHorarioMateriasComentarios")
    private String mestroHorarioMateriasComentarios;
    @JoinColumn(name = "idMaestro", referencedColumnName = "idmaestro", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Maestro maestro;
    @JoinColumn(name = "idMateria", referencedColumnName = "idmateria", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Materia materia;
    @JoinColumn(name = "idHorario", referencedColumnName = "idhorario", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Horario horario;
    @JoinColumns({
        @JoinColumn(name = "idGrado", referencedColumnName = "idgrado", insertable = false, updatable = false),
        @JoinColumn(name = "seccionGrado", referencedColumnName = "gradoSeccion", insertable = false, updatable = false),
        @JoinColumn(name = "a\u00f1oGrado", referencedColumnName = "gradoA\u00f1o", insertable = false, updatable = false),
        @JoinColumn(name = "gradoModalidad", referencedColumnName = "gradoModalidad", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Grado grado;
    @JoinColumn(name = "diaSemana", referencedColumnName = "idDias", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private DiasEstudio diasEstudio;

    public MestroHorarioMaterias() {
    }

    public MestroHorarioMaterias(MestroHorarioMateriasPK mestroHorarioMateriasPK) {
        this.mestroHorarioMateriasPK = mestroHorarioMateriasPK;
    }

    public MestroHorarioMaterias(int idMaestro, int idMateria, int idHorario, int diaSemana, int idGrado, String gradoModalidad, String seccionGrado, int añoGrado) {
        this.mestroHorarioMateriasPK = new MestroHorarioMateriasPK(idMaestro, idMateria, idHorario, diaSemana, idGrado, gradoModalidad, seccionGrado, añoGrado);
    }

    public MestroHorarioMateriasPK getMestroHorarioMateriasPK() {
        return mestroHorarioMateriasPK;
    }

    public void setMestroHorarioMateriasPK(MestroHorarioMateriasPK mestroHorarioMateriasPK) {
        this.mestroHorarioMateriasPK = mestroHorarioMateriasPK;
    }

    public String getMestroHorarioMateriasComentarios() {
        return mestroHorarioMateriasComentarios;
    }

    public void setMestroHorarioMateriasComentarios(String mestroHorarioMateriasComentarios) {
        this.mestroHorarioMateriasComentarios = mestroHorarioMateriasComentarios;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public Grado getGrado() {
        return grado;
    }

    public void setGrado(Grado grado) {
        this.grado = grado;
    }

    public DiasEstudio getDiasEstudio() {
        return diasEstudio;
    }

    public void setDiasEstudio(DiasEstudio diasEstudio) {
        this.diasEstudio = diasEstudio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mestroHorarioMateriasPK != null ? mestroHorarioMateriasPK.hashCode() : 0);
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
        final MestroHorarioMaterias other = (MestroHorarioMaterias) obj;
        if (!Objects.equals(this.mestroHorarioMateriasComentarios, other.mestroHorarioMateriasComentarios)) {
            return false;
        }
        if (!Objects.equals(this.mestroHorarioMateriasPK, other.mestroHorarioMateriasPK)) {
            return false;
        }
        if (!Objects.equals(this.maestro, other.maestro)) {
            return false;
        }
        if (!Objects.equals(this.materia, other.materia)) {
            return false;
        }
        if (!Objects.equals(this.horario, other.horario)) {
            return false;
        }
        if (!Objects.equals(this.grado, other.grado)) {
            return false;
        }
        return Objects.equals(this.diasEstudio, other.diasEstudio);
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MestroHorarioMaterias[ mestroHorarioMateriasPK=" + mestroHorarioMateriasPK + " ]";
    }

}
