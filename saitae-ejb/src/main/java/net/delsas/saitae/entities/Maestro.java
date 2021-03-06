/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "maestro", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Maestro.findAll", query = "SELECT m FROM Maestro m")
    , @NamedQuery(name = "Maestro.findByIdmaestro", query = "SELECT m FROM Maestro m WHERE m.idmaestro = :idmaestro")
    , @NamedQuery(name = "Maestro.findByMaestroNip", query = "SELECT m FROM Maestro m WHERE m.maestroNip = :maestroNip")
    , @NamedQuery(name = "Maestro.findByMaestroNup", query = "SELECT m FROM Maestro m WHERE m.maestroNup = :maestroNup")
    , @NamedQuery(name = "Maestro.findByMaestroCodigo", query = "SELECT m FROM Maestro m WHERE m.maestroCodigo = :maestroCodigo")
    , @NamedQuery(name = "Maestro.findByMaestroPartidas", query = "SELECT m FROM Maestro m WHERE m.maestroPartidas = :maestroPartidas")
    , @NamedQuery(name = "Maestro.findByMaestroSubnumeros", query = "SELECT m FROM Maestro m WHERE m.maestroSubnumeros = :maestroSubnumeros")
    , @NamedQuery(name = "Maestro.findByMaestroNivel", query = "SELECT m FROM Maestro m WHERE m.maestroNivel = :maestroNivel")
    , @NamedQuery(name = "Maestro.findByMaestroCategoria", query = "SELECT m FROM Maestro m WHERE m.maestroCategoria = :maestroCategoria")
    , @NamedQuery(name = "Maestro.findByMaestroAfp", query = "SELECT m FROM Maestro m WHERE m.maestroAfp = :maestroAfp")
    , @NamedQuery(name = "Maestro.findByMaestroBienestar", query = "SELECT m FROM Maestro m WHERE m.maestroBienestar = :maestroBienestar")
    , @NamedQuery(name = "Maestro.findByMaestrocolTelefonoResidencia", query = "SELECT m FROM Maestro m WHERE m.maestrocolTelefonoResidencia = :maestrocolTelefonoResidencia")
    , @NamedQuery(name = "Maestro.findByMaestroFechaMagisterio", query = "SELECT m FROM Maestro m WHERE m.maestroFechaMagisterio = :maestroFechaMagisterio")
    , @NamedQuery(name = "Maestro.findByMaestroFechaInstitucion", query = "SELECT m FROM Maestro m WHERE m.maestroFechaInstitucion = :maestroFechaInstitucion")
    , @NamedQuery(name = "Maestro.findByMaestroFechaProximoAsenso", query = "SELECT m FROM Maestro m WHERE m.maestroFechaProximoAsenso = :maestroFechaProximoAsenso")
    , @NamedQuery(name = "Maestro.findByMaestroTurno", query = "SELECT m FROM Maestro m WHERE m.maestroTurno = :maestroTurno")
    , @NamedQuery(name = "Maestro.findByMaestroTiempoCategoria", query = "SELECT m FROM Maestro m WHERE m.maestroTiempoCategoria = :maestroTiempoCategoria")
    , @NamedQuery(name = "Maestro.findByMaestroSinEscalafon", query = "SELECT m FROM Maestro m WHERE m.maestroSinEscalafon = :maestroSinEscalafon")
    , @NamedQuery(name = "Maestro.findByMaestroUtilidadTecnologica", query = "SELECT m FROM Maestro m WHERE m.maestroUtilidadTecnologica = :maestroUtilidadTecnologica")
    , @NamedQuery(name = "Maestro.findByMaestroHorasUsoTecnologia", query = "SELECT m FROM Maestro m WHERE m.maestroHorasUsoTecnologia = :maestroHorasUsoTecnologia")
    , @NamedQuery(name = "Maestro.findByMaestroUsoVideoconferencias", query = "SELECT m FROM Maestro m WHERE m.maestroUsoVideoconferencias = :maestroUsoVideoconferencias")
    , @NamedQuery(name = "Maestro.findByMaestroRecursosWeb", query = "SELECT m FROM Maestro m WHERE m.maestroRecursosWeb = :maestroRecursosWeb")
    , @NamedQuery(name = "Maestro.findByMaestroCapacitacionesVirtuales", query = "SELECT m FROM Maestro m WHERE m.maestroCapacitacionesVirtuales = :maestroCapacitacionesVirtuales")
    , @NamedQuery(name = "Maestro.findByMaestroComentario", query = "SELECT m FROM Maestro m WHERE m.maestroComentario = :maestroComentario")
    , @NamedQuery(name = "Maestro.findByLikeIdmaestro", query = "SELECT m FROM Maestro m WHERE m.idmaestro LIKE CONCAT(:idmaestro, '%')")
})
public class Maestro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idmaestro")
    private Integer idmaestro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroNip")
    private int maestroNip;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroNup")
    private int maestroNup;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroCodigo")
    private int maestroCodigo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroPartidas")
    private int maestroPartidas;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroSubnumeros")
    private int maestroSubnumeros;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroNivel")
    private int maestroNivel;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroCategoria")
    private int maestroCategoria;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "maestroAfp")
    private String maestroAfp;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroBienestar")
    private int maestroBienestar;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 9)
    @Column(name = "maestrocolTelefonoResidencia")
    private String maestrocolTelefonoResidencia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroFechaMagisterio")
    @Temporal(TemporalType.DATE)
    private Date maestroFechaMagisterio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroFechaInstitucion")
    @Temporal(TemporalType.DATE)
    private Date maestroFechaInstitucion;
    @Column(name = "maestroFechaProximoAsenso")
    @Temporal(TemporalType.DATE)
    private Date maestroFechaProximoAsenso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "maestroTurno")
    private String maestroTurno;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "maestroTiempoCategoria")
    private String maestroTiempoCategoria;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroSinEscalafon")
    private boolean maestroSinEscalafon;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroUtilidadTecnologica")
    private boolean maestroUtilidadTecnologica;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroHorasUsoTecnologia")
    private int maestroHorasUsoTecnologia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroUsoVideoconferencias")
    private boolean maestroUsoVideoconferencias;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroRecursosWeb")
    private boolean maestroRecursosWeb;
    @Basic(optional = false)
    @NotNull
    @Column(name = "maestroCapacitacionesVirtuales")
    private boolean maestroCapacitacionesVirtuales;
    @Size(max = 45)
    @Column(name = "maestroComentario")
    private String maestroComentario;
    @OneToMany(mappedBy = "gradoMaestroGuia")
    private List<Grado> gradoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maestro")
    private List<MestroHorarioMaterias> mestroHorarioMateriasList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maestro")
    private List<MaestoCargo> maestoCargoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "maestro")
    private List<EvaluacionMaestro> evaluacionMaestroList;
    @OneToMany(mappedBy = "docente")
    private List<Reserva> reservaList;
    @JoinColumn(name = "idmaestro", referencedColumnName = "idpersona", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Persona persona;
    @JoinColumn(name = "maestroTipoSalario", referencedColumnName = "idtipoSueldo")
    @ManyToOne(optional = false)
    private TipoSueldos maestroTipoSalario;
    @JoinColumn(name = "maestroEspecialidad", referencedColumnName = "idtipoEspecialidades")
    @ManyToOne(optional = false)
    private TipoEspecialidades maestroEspecialidad;

    public Maestro() {
    }

    public Maestro(Integer idmaestro) {
        this.idmaestro = idmaestro;
    }

    public Maestro(Integer idmaestro, int maestroNip, int maestroNup, int maestroCodigo, int maestroPartidas, int maestroSubnumeros, int maestroNivel, int maestroCategoria, String maestroAfp, int maestroBienestar, String maestrocolTelefonoResidencia, Date maestroFechaMagisterio, Date maestroFechaInstitucion, String maestroTurno, String maestroTiempoCategoria, boolean maestroSinEscalafon, boolean maestroUtilidadTecnologica, int maestroHorasUsoTecnologia, boolean maestroUsoVideoconferencias, boolean maestroRecursosWeb, boolean maestroCapacitacionesVirtuales) {
        this.idmaestro = idmaestro;
        this.maestroNip = maestroNip;
        this.maestroNup = maestroNup;
        this.maestroCodigo = maestroCodigo;
        this.maestroPartidas = maestroPartidas;
        this.maestroSubnumeros = maestroSubnumeros;
        this.maestroNivel = maestroNivel;
        this.maestroCategoria = maestroCategoria;
        this.maestroAfp = maestroAfp;
        this.maestroBienestar = maestroBienestar;
        this.maestrocolTelefonoResidencia = maestrocolTelefonoResidencia;
        this.maestroFechaMagisterio = maestroFechaMagisterio;
        this.maestroFechaInstitucion = maestroFechaInstitucion;
        this.maestroTurno = maestroTurno;
        this.maestroTiempoCategoria = maestroTiempoCategoria;
        this.maestroSinEscalafon = maestroSinEscalafon;
        this.maestroUtilidadTecnologica = maestroUtilidadTecnologica;
        this.maestroHorasUsoTecnologia = maestroHorasUsoTecnologia;
        this.maestroUsoVideoconferencias = maestroUsoVideoconferencias;
        this.maestroRecursosWeb = maestroRecursosWeb;
        this.maestroCapacitacionesVirtuales = maestroCapacitacionesVirtuales;
    }

    public Integer getIdmaestro() {
        return idmaestro;
    }

    public void setIdmaestro(Integer idmaestro) {
        this.idmaestro = idmaestro;
    }

    public int getMaestroNip() {
        return maestroNip;
    }

    public void setMaestroNip(int maestroNip) {
        this.maestroNip = maestroNip;
    }

    public int getMaestroNup() {
        return maestroNup;
    }

    public void setMaestroNup(int maestroNup) {
        this.maestroNup = maestroNup;
    }

    public int getMaestroCodigo() {
        return maestroCodigo;
    }

    public void setMaestroCodigo(int maestroCodigo) {
        this.maestroCodigo = maestroCodigo;
    }

    public int getMaestroPartidas() {
        return maestroPartidas;
    }

    public void setMaestroPartidas(int maestroPartidas) {
        this.maestroPartidas = maestroPartidas;
    }

    public int getMaestroSubnumeros() {
        return maestroSubnumeros;
    }

    public void setMaestroSubnumeros(int maestroSubnumeros) {
        this.maestroSubnumeros = maestroSubnumeros;
    }

    public int getMaestroNivel() {
        return maestroNivel;
    }

    public void setMaestroNivel(int maestroNivel) {
        this.maestroNivel = maestroNivel;
    }

    public int getMaestroCategoria() {
        return maestroCategoria;
    }

    public void setMaestroCategoria(int maestroCategoria) {
        this.maestroCategoria = maestroCategoria;
    }

    public String getMaestroAfp() {
        return maestroAfp;
    }

    public void setMaestroAfp(String maestroAfp) {
        this.maestroAfp = maestroAfp;
    }

    public int getMaestroBienestar() {
        return maestroBienestar;
    }

    public void setMaestroBienestar(int maestroBienestar) {
        this.maestroBienestar = maestroBienestar;
    }

    public String getMaestrocolTelefonoResidencia() {
        return maestrocolTelefonoResidencia;
    }

    public void setMaestrocolTelefonoResidencia(String maestrocolTelefonoResidencia) {
        this.maestrocolTelefonoResidencia = maestrocolTelefonoResidencia;
    }

    public Date getMaestroFechaMagisterio() {
        return maestroFechaMagisterio;
    }

    public void setMaestroFechaMagisterio(Date maestroFechaMagisterio) {
        this.maestroFechaMagisterio = maestroFechaMagisterio;
    }

    public Date getMaestroFechaInstitucion() {
        return maestroFechaInstitucion;
    }

    public void setMaestroFechaInstitucion(Date maestroFechaInstitucion) {
        this.maestroFechaInstitucion = maestroFechaInstitucion;
    }

    public Date getMaestroFechaProximoAsenso() {
        return maestroFechaProximoAsenso;
    }

    public void setMaestroFechaProximoAsenso(Date maestroFechaProximoAsenso) {
        this.maestroFechaProximoAsenso = maestroFechaProximoAsenso;
    }

    public String getMaestroTurno() {
        return maestroTurno;
    }

    public void setMaestroTurno(String maestroTurno) {
        this.maestroTurno = maestroTurno;
    }

    public String getMaestroTiempoCategoria() {
        return maestroTiempoCategoria;
    }

    public void setMaestroTiempoCategoria(String maestroTiempoCategoria) {
        this.maestroTiempoCategoria = maestroTiempoCategoria;
    }

    public boolean getMaestroSinEscalafon() {
        return maestroSinEscalafon;
    }

    public void setMaestroSinEscalafon(boolean maestroSinEscalafon) {
        this.maestroSinEscalafon = maestroSinEscalafon;
    }

    public boolean getMaestroUtilidadTecnologica() {
        return maestroUtilidadTecnologica;
    }

    public void setMaestroUtilidadTecnologica(boolean maestroUtilidadTecnologica) {
        this.maestroUtilidadTecnologica = maestroUtilidadTecnologica;
    }

    public int getMaestroHorasUsoTecnologia() {
        return maestroHorasUsoTecnologia;
    }

    public void setMaestroHorasUsoTecnologia(int maestroHorasUsoTecnologia) {
        this.maestroHorasUsoTecnologia = maestroHorasUsoTecnologia;
    }

    public boolean getMaestroUsoVideoconferencias() {
        return maestroUsoVideoconferencias;
    }

    public void setMaestroUsoVideoconferencias(boolean maestroUsoVideoconferencias) {
        this.maestroUsoVideoconferencias = maestroUsoVideoconferencias;
    }

    public boolean getMaestroRecursosWeb() {
        return maestroRecursosWeb;
    }

    public void setMaestroRecursosWeb(boolean maestroRecursosWeb) {
        this.maestroRecursosWeb = maestroRecursosWeb;
    }

    public boolean getMaestroCapacitacionesVirtuales() {
        return maestroCapacitacionesVirtuales;
    }

    public void setMaestroCapacitacionesVirtuales(boolean maestroCapacitacionesVirtuales) {
        this.maestroCapacitacionesVirtuales = maestroCapacitacionesVirtuales;
    }

    public String getMaestroComentario() {
        return maestroComentario;
    }

    public void setMaestroComentario(String maestroComentario) {
        this.maestroComentario = maestroComentario;
    }

    @XmlTransient
    public List<Grado> getGradoList() {
        return gradoList;
    }

    public void setGradoList(List<Grado> gradoList) {
        this.gradoList = gradoList;
    }

    @XmlTransient
    public List<MestroHorarioMaterias> getMestroHorarioMateriasList() {
        return mestroHorarioMateriasList;
    }

    public void setMestroHorarioMateriasList(List<MestroHorarioMaterias> mestroHorarioMateriasList) {
        this.mestroHorarioMateriasList = mestroHorarioMateriasList;
    }

    @XmlTransient
    public List<MaestoCargo> getMaestoCargoList() {
        return maestoCargoList;
    }

    public void setMaestoCargoList(List<MaestoCargo> maestoCargoList) {
        this.maestoCargoList = maestoCargoList;
    }

    @XmlTransient
    public List<EvaluacionMaestro> getEvaluacionMaestroList() {
        return evaluacionMaestroList;
    }

    public void setEvaluacionMaestroList(List<EvaluacionMaestro> evaluacionMaestroList) {
        this.evaluacionMaestroList = evaluacionMaestroList;
    }

    @XmlTransient
    public List<Reserva> getReservaList() {
        return reservaList;
    }

    public void setReservaList(List<Reserva> reservaList) {
        this.reservaList = reservaList;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public TipoSueldos getMaestroTipoSalario() {
        return maestroTipoSalario;
    }

    public void setMaestroTipoSalario(TipoSueldos maestroTipoSalario) {
        this.maestroTipoSalario = maestroTipoSalario;
    }

    public TipoEspecialidades getMaestroEspecialidad() {
        return maestroEspecialidad;
    }

    public void setMaestroEspecialidad(TipoEspecialidades maestroEspecialidad) {
        this.maestroEspecialidad = maestroEspecialidad;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.idmaestro);
        hash = 47 * hash + this.maestroNip;
        hash = 47 * hash + this.maestroNup;
        hash = 47 * hash + this.maestroCodigo;
        hash = 47 * hash + this.maestroPartidas;
        hash = 47 * hash + this.maestroSubnumeros;
        hash = 47 * hash + this.maestroNivel;
        hash = 47 * hash + this.maestroCategoria;
        hash = 47 * hash + Objects.hashCode(this.maestroAfp);
        hash = 47 * hash + this.maestroBienestar;
        hash = 47 * hash + Objects.hashCode(this.maestrocolTelefonoResidencia);
        hash = 47 * hash + Objects.hashCode(this.maestroFechaMagisterio);
        hash = 47 * hash + Objects.hashCode(this.maestroFechaInstitucion);
        hash = 47 * hash + Objects.hashCode(this.maestroFechaProximoAsenso);
        hash = 47 * hash + Objects.hashCode(this.maestroTurno);
        hash = 47 * hash + Objects.hashCode(this.maestroTiempoCategoria);
        hash = 47 * hash + (this.maestroSinEscalafon ? 1 : 0);
        hash = 47 * hash + (this.maestroUtilidadTecnologica ? 1 : 0);
        hash = 47 * hash + this.maestroHorasUsoTecnologia;
        hash = 47 * hash + (this.maestroUsoVideoconferencias ? 1 : 0);
        hash = 47 * hash + (this.maestroRecursosWeb ? 1 : 0);
        hash = 47 * hash + (this.maestroCapacitacionesVirtuales ? 1 : 0);
        hash = 47 * hash + Objects.hashCode(this.maestroComentario);
        hash = 47 * hash + Objects.hashCode(this.persona);
        hash = 47 * hash + Objects.hashCode(this.maestroTipoSalario);
        hash = 47 * hash + Objects.hashCode(this.maestroEspecialidad);
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
        final Maestro other = (Maestro) obj;
        if (this.maestroNip != other.maestroNip) {
            return false;
        }
        if (this.maestroNup != other.maestroNup) {
            return false;
        }
        if (this.maestroCodigo != other.maestroCodigo) {
            return false;
        }
        if (this.maestroPartidas != other.maestroPartidas) {
            return false;
        }
        if (this.maestroSubnumeros != other.maestroSubnumeros) {
            return false;
        }
        if (this.maestroNivel != other.maestroNivel) {
            return false;
        }
        if (this.maestroCategoria != other.maestroCategoria) {
            return false;
        }
        if (this.maestroBienestar != other.maestroBienestar) {
            return false;
        }
        if (this.maestroSinEscalafon != other.maestroSinEscalafon) {
            return false;
        }
        if (this.maestroUtilidadTecnologica != other.maestroUtilidadTecnologica) {
            return false;
        }
        if (this.maestroHorasUsoTecnologia != other.maestroHorasUsoTecnologia) {
            return false;
        }
        if (this.maestroUsoVideoconferencias != other.maestroUsoVideoconferencias) {
            return false;
        }
        if (this.maestroRecursosWeb != other.maestroRecursosWeb) {
            return false;
        }
        if (this.maestroCapacitacionesVirtuales != other.maestroCapacitacionesVirtuales) {
            return false;
        }
        if (!Objects.equals(this.maestroAfp, other.maestroAfp)) {
            return false;
        }
        if (!Objects.equals(this.maestrocolTelefonoResidencia, other.maestrocolTelefonoResidencia)) {
            return false;
        }
        if (!Objects.equals(this.maestroTurno, other.maestroTurno)) {
            return false;
        }
        if (!Objects.equals(this.maestroTiempoCategoria, other.maestroTiempoCategoria)) {
            return false;
        }
        if (!Objects.equals(this.maestroComentario, other.maestroComentario)) {
            return false;
        }
        if (!Objects.equals(this.idmaestro, other.idmaestro)) {
            return false;
        }
        if (!Objects.equals(this.maestroFechaMagisterio, other.maestroFechaMagisterio)) {
            return false;
        }
        if (!Objects.equals(this.maestroFechaInstitucion, other.maestroFechaInstitucion)) {
            return false;
        }
        if (!Objects.equals(this.maestroFechaProximoAsenso, other.maestroFechaProximoAsenso)) {
            return false;
        }
        if (!Objects.equals(this.maestroTipoSalario, other.maestroTipoSalario)) {
            return false;
        }
        return Objects.equals(this.maestroEspecialidad, other.maestroEspecialidad);
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Maestro[ idmaestro=" + idmaestro + " ]";
    }
    
}
