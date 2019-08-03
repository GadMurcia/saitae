/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
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
    @NamedQuery(name = "MestroHorarioMaterias.findAll", query = "SELECT m FROM MestroHorarioMaterias m")
    , @NamedQuery(name = "MestroHorarioMaterias.findByIdMaestro", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idMaestro = :idMaestro")
    , @NamedQuery(name = "MestroHorarioMaterias.findByIdMateria", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idMateria = :idMateria")
    , @NamedQuery(name = "MestroHorarioMaterias.findByIdHorario", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idHorario = :idHorario")
    , @NamedQuery(name = "MestroHorarioMaterias.findByDiaSemana", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.diaSemana = :diaSemana")
    , @NamedQuery(name = "MestroHorarioMaterias.findByIdGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.idGrado = :idGrado")
    , @NamedQuery(name = "MestroHorarioMaterias.findBySeccionGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.seccionGrado = :seccionGrado")
    , @NamedQuery(name = "MestroHorarioMaterias.findByA\u00f1oGrado", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasPK.a\u00f1oGrado = :a\u00f1oGrado")
    , @NamedQuery(name = "MestroHorarioMaterias.findByMestroHorarioMateriasComentarios", query = "SELECT m FROM MestroHorarioMaterias m WHERE m.mestroHorarioMateriasComentarios = :mestroHorarioMateriasComentarios")})
public class MestroHorarioMaterias implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MestroHorarioMateriasPK mestroHorarioMateriasPK;
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
        @JoinColumn(name = "idGrado", referencedColumnName = "idgrado", insertable = false, updatable = false)
        , @JoinColumn(name = "seccionGrado", referencedColumnName = "gradoSeccion", insertable = false, updatable = false)
        , @JoinColumn(name = "a\u00f1oGrado", referencedColumnName = "gradoA\u00f1o", insertable = false, updatable = false)
        , @JoinColumn(name = "gradoModalidad", referencedColumnName = "gradoModalidad")})
    @ManyToOne(optional = false)
    private Grado grado;

    public MestroHorarioMaterias() {
    }

    public MestroHorarioMaterias(MestroHorarioMateriasPK mestroHorarioMateriasPK) {
        this.mestroHorarioMateriasPK = mestroHorarioMateriasPK;
    }

    public MestroHorarioMaterias(int idMaestro, int idMateria, int idHorario, String diaSemana, int idGrado, String seccionGrado, int añoGrado) {
        this.mestroHorarioMateriasPK = new MestroHorarioMateriasPK(idMaestro, idMateria, idHorario, diaSemana, idGrado, seccionGrado, añoGrado);
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mestroHorarioMateriasPK != null ? mestroHorarioMateriasPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MestroHorarioMaterias)) {
            return false;
        }
        MestroHorarioMaterias other = (MestroHorarioMaterias) object;
        if ((this.mestroHorarioMateriasPK == null && other.mestroHorarioMateriasPK != null) || (this.mestroHorarioMateriasPK != null && !this.mestroHorarioMateriasPK.equals(other.mestroHorarioMateriasPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.MestroHorarioMaterias[ mestroHorarioMateriasPK=" + mestroHorarioMateriasPK + " ]";
    }
    
}
