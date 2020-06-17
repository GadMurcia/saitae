/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "estudiante", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estudiante.findAll", query = "SELECT e FROM Estudiante e")
    , @NamedQuery(name = "Estudiante.findByIdestudiante", query = "SELECT e FROM Estudiante e WHERE e.idestudiante = :idestudiante")
    , @NamedQuery(name = "Estudiante.findByEstudiantePartidaNac", query = "SELECT e FROM Estudiante e WHERE e.estudiantePartidaNac = :estudiantePartidaNac")
    , @NamedQuery(name = "Estudiante.findByEstudianteTipoCalle", query = "SELECT e FROM Estudiante e WHERE e.estudianteTipoCalle = :estudianteTipoCalle")
    , @NamedQuery(name = "Estudiante.findByEstudianteRiesgoVulnerabilidad", query = "SELECT e FROM Estudiante e WHERE e.estudianteRiesgoVulnerabilidad = :estudianteRiesgoVulnerabilidad")
    , @NamedQuery(name = "Estudiante.findByEstudianteMedioTransporte", query = "SELECT e FROM Estudiante e WHERE e.estudianteMedioTransporte = :estudianteMedioTransporte")
    , @NamedQuery(name = "Estudiante.findByEstudianteDistanciaAlCentro", query = "SELECT e FROM Estudiante e WHERE e.estudianteDistanciaAlCentro = :estudianteDistanciaAlCentro")
    , @NamedQuery(name = "Estudiante.findByEstudianteTrabaja", query = "SELECT e FROM Estudiante e WHERE e.estudianteTrabaja = :estudianteTrabaja")
    , @NamedQuery(name = "Estudiante.findByEstudianteDependenciaEconomica", query = "SELECT e FROM Estudiante e WHERE e.estudianteDependenciaEconomica = :estudianteDependenciaEconomica")
    , @NamedQuery(name = "Estudiante.findByEstudianteParvularia", query = "SELECT e FROM Estudiante e WHERE e.estudianteParvularia = :estudianteParvularia")
    , @NamedQuery(name = "Estudiante.findByEstudianteEnfermedades", query = "SELECT e FROM Estudiante e WHERE e.estudianteEnfermedades = :estudianteEnfermedades")
    , @NamedQuery(name = "Estudiante.findByEstudianteMedicamentos", query = "SELECT e FROM Estudiante e WHERE e.estudianteMedicamentos = :estudianteMedicamentos")
    , @NamedQuery(name = "Estudiante.findByEstudianteParentescoRepresentante", query = "SELECT e FROM Estudiante e WHERE e.estudianteParentescoRepresentante = :estudianteParentescoRepresentante")
    , @NamedQuery(name = "Estudiante.findByEstudianteEsEstudiante", query = "SELECT e FROM Estudiante e WHERE e.estudianteEsEstudiante = :estudianteEsEstudiante")
    , @NamedQuery(name = "Estudiante.findByEstudianteEscolaridad", query = "SELECT e FROM Estudiante e WHERE e.estudianteEscolaridad = :estudianteEscolaridad")
    , @NamedQuery(name = "Estudiante.findByEstudianteFormaTrabajo", query = "SELECT e FROM Estudiante e WHERE e.estudianteFormaTrabajo = :estudianteFormaTrabajo")
    , @NamedQuery(name = "Estudiante.findByEstudianteCentroProcedencia", query = "SELECT e FROM Estudiante e WHERE e.estudianteCentroProcedencia = :estudianteCentroProcedencia")
    , @NamedQuery(name = "Estudiante.findByEstudianteNoPartida", query = "SELECT e FROM Estudiante e WHERE e.estudianteNoPartida = :estudianteNoPartida")
    , @NamedQuery(name = "Estudiante.findByEstudianteRepresentanteFamiliar", query = "SELECT e FROM Estudiante e WHERE e.estudianteRepresentanteFamiliar = :estudianteRepresentanteFamiliar")
    , @NamedQuery(name = "Estudiante.findByEstudianteComentario", query = "SELECT e FROM Estudiante e WHERE e.estudianteComentario = :estudianteComentario")})
public class Estudiante implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudiante1")
    private List<ReportePsicologia> reportePsicologiaList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idestudiante")
    private Integer idestudiante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estudiantePartidaNac")
    private boolean estudiantePartidaNac;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estudianteTipoCalle")
    private int estudianteTipoCalle;
    @Size(max = 100)
    @Column(name = "estudianteRiesgoVulnerabilidad")
    private String estudianteRiesgoVulnerabilidad;
    @Column(name = "estudianteMedioTransporte")
    private Integer estudianteMedioTransporte;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "estudianteDistanciaAlCentro")
    private BigDecimal estudianteDistanciaAlCentro;
    @Column(name = "estudianteTrabaja")
    private Boolean estudianteTrabaja;
    @Size(max = 45)
    @Column(name = "estudianteDependenciaEconomica")
    private String estudianteDependenciaEconomica;
    @Column(name = "estudianteParvularia")
    private Boolean estudianteParvularia;
    @Size(max = 100)
    @Column(name = "estudianteEnfermedades")
    private String estudianteEnfermedades;
    @Size(max = 250)
    @Column(name = "estudianteMedicamentos")
    private String estudianteMedicamentos;
    @Size(max = 45)
    @Column(name = "estudianteParentescoRepresentante")
    private String estudianteParentescoRepresentante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estudianteEsEstudiante")
    private boolean estudianteEsEstudiante;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "estudianteEscolaridad")
    private String estudianteEscolaridad;
    @Size(max = 45)
    @Column(name = "estudianteFormaTrabajo")
    private String estudianteFormaTrabajo;
    @Size(max = 45)
    @Column(name = "estudianteCentroProcedencia")
    private String estudianteCentroProcedencia;
    @Size(max = 45)
    @Column(name = "estudianteNoPartida")
    private String estudianteNoPartida;
    @Column(name = "estudianteRepresentanteFamiliar")
    private Boolean estudianteRepresentanteFamiliar;
    @Size(max = 145)
    @Column(name = "estudianteComentario")
    private String estudianteComentario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudiante")
    private List<Contribuciones> contribucionesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudiante")
    private List<Matricula> matriculaList;
    @JoinColumn(name = "idestudiante", referencedColumnName = "idpersona", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Persona persona;
    @JoinColumn(name = "estudiantePadre", referencedColumnName = "idpersona")
    @ManyToOne
    private Persona estudiantePadre;
    @JoinColumn(name = "estudianteMadre", referencedColumnName = "idpersona")
    @ManyToOne
    private Persona estudianteMadre;
    @OneToMany(mappedBy = "estudianteRepresentante")
    private List<Estudiante> estudianteList;
    @JoinColumn(name = "estudianteRepresentante", referencedColumnName = "idestudiante")
    @ManyToOne
    private Estudiante estudianteRepresentante;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "estudiante")
    private Documentos documentos;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudiante1")
    private List<CitaPsicologia> citaPsicologiaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudiante")
    private List<EntregaUtiles> entregaUtilesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRepresentante")
    private List<EntregaUtiles> entregaUtilesList1;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "estudiante")
    private ExpedientePS expedientePS;

    public Estudiante() {
    }

    public Estudiante(Integer idestudiante) {
        this.idestudiante = idestudiante;
    }

    public Estudiante(Integer idestudiante, boolean estudiantePartidaNac, int estudianteTipoCalle, boolean estudianteEsEstudiante, String estudianteEscolaridad) {
        this.idestudiante = idestudiante;
        this.estudiantePartidaNac = estudiantePartidaNac;
        this.estudianteTipoCalle = estudianteTipoCalle;
        this.estudianteEsEstudiante = estudianteEsEstudiante;
        this.estudianteEscolaridad = estudianteEscolaridad;
    }

    public Integer getIdestudiante() {
        return idestudiante;
    }

    public void setIdestudiante(Integer idestudiante) {
        this.idestudiante = idestudiante;
    }

    public boolean getEstudiantePartidaNac() {
        return estudiantePartidaNac;
    }

    public void setEstudiantePartidaNac(boolean estudiantePartidaNac) {
        this.estudiantePartidaNac = estudiantePartidaNac;
    }

    public int getEstudianteTipoCalle() {
        return estudianteTipoCalle;
    }

    public void setEstudianteTipoCalle(int estudianteTipoCalle) {
        this.estudianteTipoCalle = estudianteTipoCalle;
    }

    public String getEstudianteRiesgoVulnerabilidad() {
        return estudianteRiesgoVulnerabilidad;
    }

    public void setEstudianteRiesgoVulnerabilidad(String estudianteRiesgoVulnerabilidad) {
        this.estudianteRiesgoVulnerabilidad = estudianteRiesgoVulnerabilidad;
    }

    public Integer getEstudianteMedioTransporte() {
        return estudianteMedioTransporte;
    }

    public void setEstudianteMedioTransporte(Integer estudianteMedioTransporte) {
        this.estudianteMedioTransporte = estudianteMedioTransporte;
    }

    public BigDecimal getEstudianteDistanciaAlCentro() {
        return estudianteDistanciaAlCentro;
    }

    public void setEstudianteDistanciaAlCentro(BigDecimal estudianteDistanciaAlCentro) {
        this.estudianteDistanciaAlCentro = estudianteDistanciaAlCentro;
    }

    public Boolean getEstudianteTrabaja() {
        return estudianteTrabaja;
    }

    public void setEstudianteTrabaja(Boolean estudianteTrabaja) {
        this.estudianteTrabaja = estudianteTrabaja;
    }

    public String getEstudianteDependenciaEconomica() {
        return estudianteDependenciaEconomica;
    }

    public void setEstudianteDependenciaEconomica(String estudianteDependenciaEconomica) {
        this.estudianteDependenciaEconomica = estudianteDependenciaEconomica;
    }

    public Boolean getEstudianteParvularia() {
        return estudianteParvularia;
    }

    public void setEstudianteParvularia(Boolean estudianteParvularia) {
        this.estudianteParvularia = estudianteParvularia;
    }

    public String getEstudianteEnfermedades() {
        return estudianteEnfermedades;
    }

    public void setEstudianteEnfermedades(String estudianteEnfermedades) {
        this.estudianteEnfermedades = estudianteEnfermedades;
    }

    public String getEstudianteMedicamentos() {
        return estudianteMedicamentos;
    }

    public void setEstudianteMedicamentos(String estudianteMedicamentos) {
        this.estudianteMedicamentos = estudianteMedicamentos;
    }

    public String getEstudianteParentescoRepresentante() {
        return estudianteParentescoRepresentante;
    }

    public void setEstudianteParentescoRepresentante(String estudianteParentescoRepresentante) {
        this.estudianteParentescoRepresentante = estudianteParentescoRepresentante;
    }

    public boolean getEstudianteEsEstudiante() {
        return estudianteEsEstudiante;
    }

    public void setEstudianteEsEstudiante(boolean estudianteEsEstudiante) {
        this.estudianteEsEstudiante = estudianteEsEstudiante;
    }

    public String getEstudianteEscolaridad() {
        return estudianteEscolaridad;
    }

    public void setEstudianteEscolaridad(String estudianteEscolaridad) {
        this.estudianteEscolaridad = estudianteEscolaridad;
    }

    public String getEstudianteFormaTrabajo() {
        return estudianteFormaTrabajo;
    }

    public void setEstudianteFormaTrabajo(String estudianteFormaTrabajo) {
        this.estudianteFormaTrabajo = estudianteFormaTrabajo;
    }

    public String getEstudianteCentroProcedencia() {
        return estudianteCentroProcedencia;
    }

    public void setEstudianteCentroProcedencia(String estudianteCentroProcedencia) {
        this.estudianteCentroProcedencia = estudianteCentroProcedencia;
    }

    public String getEstudianteNoPartida() {
        return estudianteNoPartida;
    }

    public void setEstudianteNoPartida(String estudianteNoPartida) {
        this.estudianteNoPartida = estudianteNoPartida;
    }

    public Boolean getEstudianteRepresentanteFamiliar() {
        return estudianteRepresentanteFamiliar;
    }

    public void setEstudianteRepresentanteFamiliar(Boolean estudianteRepresentanteFamiliar) {
        this.estudianteRepresentanteFamiliar = estudianteRepresentanteFamiliar;
    }

    public String getEstudianteComentario() {
        return estudianteComentario;
    }

    public void setEstudianteComentario(String estudianteComentario) {
        this.estudianteComentario = estudianteComentario;
    }

    @XmlTransient
    public List<Contribuciones> getContribucionesList() {
        return contribucionesList;
    }

    public void setContribucionesList(List<Contribuciones> contribucionesList) {
        this.contribucionesList = contribucionesList;
    }

    @XmlTransient
    public List<Matricula> getMatriculaList() {
        return matriculaList;
    }

    public void setMatriculaList(List<Matricula> matriculaList) {
        this.matriculaList = matriculaList;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Persona getEstudiantePadre() {
        return estudiantePadre;
    }

    public void setEstudiantePadre(Persona estudiantePadre) {
        this.estudiantePadre = estudiantePadre;
    }

    public Persona getEstudianteMadre() {
        return estudianteMadre;
    }

    public void setEstudianteMadre(Persona estudianteMadre) {
        this.estudianteMadre = estudianteMadre;
    }

    @XmlTransient
    public List<Estudiante> getEstudianteList() {
        return estudianteList;
    }

    public void setEstudianteList(List<Estudiante> estudianteList) {
        this.estudianteList = estudianteList;
    }

    public Estudiante getEstudianteRepresentante() {
        return estudianteRepresentante;
    }

    public void setEstudianteRepresentante(Estudiante estudianteRepresentante) {
        this.estudianteRepresentante = estudianteRepresentante;
    }

    public Documentos getDocumentos() {
        return documentos;
    }

    public void setDocumentos(Documentos documentos) {
        this.documentos = documentos;
    }

    @XmlTransient
    public List<CitaPsicologia> getCitaPsicologiaList() {
        return citaPsicologiaList;
    }

    public void setCitaPsicologiaList(List<CitaPsicologia> citaPsicologiaList) {
        this.citaPsicologiaList = citaPsicologiaList;
    }

    @XmlTransient
    public List<EntregaUtiles> getEntregaUtilesList() {
        return entregaUtilesList;
    }

    public void setEntregaUtilesList(List<EntregaUtiles> entregaUtilesList) {
        this.entregaUtilesList = entregaUtilesList;
    }

    @XmlTransient
    public List<EntregaUtiles> getEntregaUtilesList1() {
        return entregaUtilesList1;
    }

    public void setEntregaUtilesList1(List<EntregaUtiles> entregaUtilesList1) {
        this.entregaUtilesList1 = entregaUtilesList1;
    }

    public ExpedientePS getExpedientePS() {
        return expedientePS;
    }

    public void setExpedientePS(ExpedientePS expedientePS) {
        this.expedientePS = expedientePS;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idestudiante != null ? idestudiante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estudiante)) {
            return false;
        }
        Estudiante other = (Estudiante) object;
        if ((this.idestudiante == null && other.idestudiante != null) || (this.idestudiante != null && !this.idestudiante.equals(other.idestudiante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Estudiante[ idestudiante=" + idestudiante + " ]";
    }

    @XmlTransient
    public List<ReportePsicologia> getReportePsicologiaList() {
        return reportePsicologiaList;
    }

    public void setReportePsicologiaList(List<ReportePsicologia> reportePsicologiaList) {
        this.reportePsicologiaList = reportePsicologiaList;
    }
    
}
