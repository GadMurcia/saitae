/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "persona", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Persona.findAll", query = "SELECT p FROM Persona p")
    , @NamedQuery(name = "Persona.findByIdpersona", query = "SELECT p FROM Persona p WHERE p.idpersona = :idpersona")
    , @NamedQuery(name = "Persona.findByPersonaNombre", query = "SELECT p FROM Persona p WHERE p.personaNombre = :personaNombre")
    , @NamedQuery(name = "Persona.findByPersonaApellido", query = "SELECT p FROM Persona p WHERE p.personaApellido = :personaApellido")
    , @NamedQuery(name = "Persona.findByPersonaNacimiento", query = "SELECT p FROM Persona p WHERE p.personaNacimiento = :personaNacimiento")
    , @NamedQuery(name = "Persona.findByPersonaDireccion", query = "SELECT p FROM Persona p WHERE p.personaDireccion = :personaDireccion")
    , @NamedQuery(name = "Persona.findByPersonaTelefono", query = "SELECT p FROM Persona p WHERE p.personaTelefono = :personaTelefono")
    , @NamedQuery(name = "Persona.findByPersonaCodigoResidencia", query = "SELECT p FROM Persona p WHERE p.personaCodigoResidencia = :personaCodigoResidencia")
    , @NamedQuery(name = "Persona.findByPersonaZonaVivienda", query = "SELECT p FROM Persona p WHERE p.personaZonaVivienda = :personaZonaVivienda")
    , @NamedQuery(name = "Persona.findByPersonaLugarNac", query = "SELECT p FROM Persona p WHERE p.personaLugarNac = :personaLugarNac")
    , @NamedQuery(name = "Persona.findByPersonaContrasenya", query = "SELECT p FROM Persona p WHERE p.personaContrasenya = :personaContrasenya")
    , @NamedQuery(name = "Persona.findByPersonaOCupacion", query = "SELECT p FROM Persona p WHERE p.personaOCupacion = :personaOCupacion")
    , @NamedQuery(name = "Persona.findByPersonaActivo", query = "SELECT p FROM Persona p WHERE p.personaActivo = :personaActivo")
    , @NamedQuery(name = "Persona.findByPersonaNit", query = "SELECT p FROM Persona p WHERE p.personaNit = :personaNit")
    , @NamedQuery(name = "Persona.findByPersonaSexo", query = "SELECT p FROM Persona p WHERE p.personaSexo = :personaSexo")
    , @NamedQuery(name = "Persona.findByPersonaEstadoFamiliar", query = "SELECT p FROM Persona p WHERE p.personaEstadoFamiliar = :personaEstadoFamiliar")
    , @NamedQuery(name = "Persona.findByPersonaNacionalidad", query = "SELECT p FROM Persona p WHERE p.personaNacionalidad = :personaNacionalidad")
    , @NamedQuery(name = "Persona.findByPersonaEmail", query = "SELECT p FROM Persona p WHERE p.personaEmail = :personaEmail")
    , @NamedQuery(name = "Persona.findByPersonaDiscapacidades", query = "SELECT p FROM Persona p WHERE p.personaDiscapacidades = :personaDiscapacidades")
    , @NamedQuery(name = "Persona.findByPersonaComentarios", query = "SELECT p FROM Persona p WHERE p.personaComentarios = :personaComentarios")
    , @NamedQuery(name = "Persona.findByLikeIdpersona", query = "SELECT p FROM Persona p WHERE p.idpersona LIKE CONCAT(:idpersona,'%')")
    , @NamedQuery(name = "Persona.findPlantel", query = "SELECT p FROM Persona p WHERE p.tipoPersona.idtipoPersona NOT IN (1, 8, 9, 10, 11) ORDER BY p.tipoPersona.tipoPersonaNombre, p.personaNombre, p.personaApellido")
    , @NamedQuery(name = "Persona.findPersonaByLikeIdpersona", query = "SELECT p FROM Persona p WHERE p.tipoPersona.idtipoPersona = :idtipoPersona AND p.idpersona LIKE CONCAT(:idpersona,'%')")
    , @NamedQuery(name = "Persona.findAdministratorByLikeType", query = "SELECT p FROM Persona p WHERE p.tipoPersona.idtipoPersona IN (2, 3, 5, 6, 7) AND p.idpersona LIKE CONCAT(:idpersona,'%')")
})
public class Persona implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "PersonaNombre")
    private String personaNombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "personaApellido")
    private String personaApellido;
    @Size(max = 250)
    @Column(name = "personaDireccion")
    private String personaDireccion;
    @Size(max = 9)
    @Column(name = "personaTelefono")
    private String personaTelefono;
    @Size(max = 100)
    @Column(name = "personaLugarNac")
    private String personaLugarNac;
    @Size(max = 60)
    @Column(name = "personaContrasenya")
    private String personaContrasenya;
    @Size(max = 50)
    @Column(name = "personaOCupacion")
    private String personaOCupacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "personaActivo")
    private boolean personaActivo;
    @Size(max = 20)
    @Column(name = "personaNit")
    private String personaNit;
    @Size(max = 45)
    @Column(name = "personaNacionalidad")
    private String personaNacionalidad;
    @Size(max = 45)
    @Column(name = "personaEmail")
    private String personaEmail;
    @Size(max = 250)
    @Column(name = "personaDiscapacidades")
    private String personaDiscapacidades;
    @Size(max = 250)
    @Column(name = "personaComentarios")
    private String personaComentarios;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idpersona")
    private Integer idpersona;
    @Column(name = "personaNacimiento")
    @Temporal(TemporalType.DATE)
    private Date personaNacimiento;
    @Column(name = "personaCodigoResidencia")
    private Integer personaCodigoResidencia;
    @Column(name = "personaZonaVivienda")
    private Integer personaZonaVivienda;
    @Column(name = "personaSexo")
    private Boolean personaSexo;
    @Column(name = "personaEstadoFamiliar")
    private Integer personaEstadoFamiliar;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "anuncioAnunciante")
    private List<Anuncio> anuncioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "evaluador")
    private List<GradoEvaluacion> gradoEvaluacionList;
    @JoinColumn(name = "tipoPersona", referencedColumnName = "idtipoPersona")
    @ManyToOne
    private TipoPersona tipoPersona;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "destinatario")
    private List<Notificaciones> notificacionesDestinatarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "remitente")
    private List<Notificaciones> notificacionesremitenteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpersona")
    private List<DelagacionCargo> delagacionCargoList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "persona")
    private Estudiante estudiante;
    @OneToMany(mappedBy = "estudiantePadre")
    private List<Estudiante> estudianDeLosQueEsPadreteList;
    @OneToMany(mappedBy = "estudianteMadre")
    private List<Estudiante> estudianteDeLosQueEsMadreList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEntregante")
    private List<EntregaUtiles> entregaUtilesEntreganteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private List<Permisos> BeneficiarioDePermisosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "permisosSolicitante")
    private List<Permisos> SolicitanteDePermisosList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "persona")
    private Maestro maestro;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "persona")
    private List<PersonasReserva> personasReservaList;

    public Persona() {
    }

    public Persona(Integer idpersona) {
        this.idpersona = idpersona;
    }

    public Persona(Integer idpersona, String personaNombre, String personaApellido, boolean personaActivo) {
        this.idpersona = idpersona;
        this.personaNombre = personaNombre;
        this.personaApellido = personaApellido;
        this.personaActivo = personaActivo;
    }

    public Integer getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(Integer idpersona) {
        this.idpersona = idpersona;
    }


    public Date getPersonaNacimiento() {
        return personaNacimiento;
    }

    public void setPersonaNacimiento(Date personaNacimiento) {
        this.personaNacimiento = personaNacimiento;
    }


    public Integer getPersonaCodigoResidencia() {
        return personaCodigoResidencia;
    }

    public void setPersonaCodigoResidencia(Integer personaCodigoResidencia) {
        this.personaCodigoResidencia = personaCodigoResidencia;
    }

    public Integer getPersonaZonaVivienda() {
        return personaZonaVivienda;
    }

    public void setPersonaZonaVivienda(Integer personaZonaVivienda) {
        this.personaZonaVivienda = personaZonaVivienda;
    }


    public Boolean getPersonaSexo() {
        return personaSexo;
    }

    public void setPersonaSexo(Boolean personaSexo) {
        this.personaSexo = personaSexo;
    }

    public Integer getPersonaEstadoFamiliar() {
        return personaEstadoFamiliar;
    }

    public void setPersonaEstadoFamiliar(Integer personaEstadoFamiliar) {
        this.personaEstadoFamiliar = personaEstadoFamiliar;
    }


    @XmlTransient
    public List<Anuncio> getAnuncioList() {
        return anuncioList;
    }

    public void setAnuncioList(List<Anuncio> anuncioList) {
        this.anuncioList = anuncioList;
    }

    @XmlTransient
    public List<GradoEvaluacion> getGradoEvaluacionList() {
        return gradoEvaluacionList;
    }

    public void setGradoEvaluacionList(List<GradoEvaluacion> gradoEvaluacionList) {
        this.gradoEvaluacionList = gradoEvaluacionList;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    @XmlTransient
    public List<DelagacionCargo> getDelagacionCargoList() {
        return delagacionCargoList;
    }

    public void setDelagacionCargoList(List<DelagacionCargo> delagacionCargoList) {
        this.delagacionCargoList = delagacionCargoList;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    @XmlTransient
    public List<PersonasReserva> getPersonasReservaList() {
        return personasReservaList;
    }

    public void setPersonasReservaList(List<PersonasReserva> personasReservaList) {
        this.personasReservaList = personasReservaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpersona != null ? idpersona.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.idpersona == null && other.idpersona != null) || (this.idpersona != null && !this.idpersona.equals(other.idpersona))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Persona[ idpersona=" + idpersona + " ]";
    }


    @XmlTransient
    public List<Notificaciones> getNotificacionesDestinatarioList() {
        return notificacionesDestinatarioList;
    }

    public void setNotificacionesDestinatarioList(List<Notificaciones> notificacionesDestinatarioList) {
        this.notificacionesDestinatarioList = notificacionesDestinatarioList;
    }

    @XmlTransient
    public List<Notificaciones> getNotificacionesremitenteList() {
        return notificacionesremitenteList;
    }

    public void setNotificacionesremitenteList(List<Notificaciones> notificacionesremitenteList) {
        this.notificacionesremitenteList = notificacionesremitenteList;
    }

    @XmlTransient
    public List<Estudiante> getEstudianDeLosQueEsPadreteList() {
        return estudianDeLosQueEsPadreteList;
    }

    public void setEstudianDeLosQueEsPadreteList(List<Estudiante> estudianDeLosQueEsPadreteList) {
        this.estudianDeLosQueEsPadreteList = estudianDeLosQueEsPadreteList;
    }

    @XmlTransient
    public List<Estudiante> getEstudianteDeLosQueEsMadreList() {
        return estudianteDeLosQueEsMadreList;
    }

    public void setEstudianteDeLosQueEsMadreList(List<Estudiante> estudianteDeLosQueEsMadreList) {
        this.estudianteDeLosQueEsMadreList = estudianteDeLosQueEsMadreList;
    }

    @XmlTransient
    public List<EntregaUtiles> getEntregaUtilesEntreganteList() {
        return entregaUtilesEntreganteList;
    }

    public void setEntregaUtilesEntreganteList(List<EntregaUtiles> entregaUtilesEntreganteList) {
        this.entregaUtilesEntreganteList = entregaUtilesEntreganteList;
    }

    @XmlTransient
    public List<Permisos> getBeneficiarioDePermisosList() {
        return BeneficiarioDePermisosList;
    }

    public void setBeneficiarioDePermisosList(List<Permisos> BeneficiarioDePermisosList) {
        this.BeneficiarioDePermisosList = BeneficiarioDePermisosList;
    }

    @XmlTransient
    public List<Permisos> getSolicitanteDePermisosList() {
        return SolicitanteDePermisosList;
    }

    public void setSolicitanteDePermisosList(List<Permisos> SolicitanteDePermisosList) {
        this.SolicitanteDePermisosList = SolicitanteDePermisosList;
    }

    public String getPersonaNombre() {
        return personaNombre;
    }

    public void setPersonaNombre(String personaNombre) {
        this.personaNombre = personaNombre;
    }

    public String getPersonaApellido() {
        return personaApellido;
    }

    public void setPersonaApellido(String personaApellido) {
        this.personaApellido = personaApellido;
    }

    public String getPersonaDireccion() {
        return personaDireccion;
    }

    public void setPersonaDireccion(String personaDireccion) {
        this.personaDireccion = personaDireccion;
    }

    public String getPersonaTelefono() {
        return personaTelefono;
    }

    public void setPersonaTelefono(String personaTelefono) {
        this.personaTelefono = personaTelefono;
    }

    public String getPersonaLugarNac() {
        return personaLugarNac;
    }

    public void setPersonaLugarNac(String personaLugarNac) {
        this.personaLugarNac = personaLugarNac;
    }

    public String getPersonaContrasenya() {
        return personaContrasenya;
    }

    public void setPersonaContrasenya(String personaContrasenya) {
        this.personaContrasenya = personaContrasenya;
    }

    public String getPersonaOCupacion() {
        return personaOCupacion;
    }

    public void setPersonaOCupacion(String personaOCupacion) {
        this.personaOCupacion = personaOCupacion;
    }

    public boolean getPersonaActivo() {
        return personaActivo;
    }

    public void setPersonaActivo(boolean personaActivo) {
        this.personaActivo = personaActivo;
    }

    public String getPersonaNit() {
        return personaNit;
    }

    public void setPersonaNit(String personaNit) {
        this.personaNit = personaNit;
    }

    public String getPersonaNacionalidad() {
        return personaNacionalidad;
    }

    public void setPersonaNacionalidad(String personaNacionalidad) {
        this.personaNacionalidad = personaNacionalidad;
    }

    public String getPersonaEmail() {
        return personaEmail;
    }

    public void setPersonaEmail(String personaEmail) {
        this.personaEmail = personaEmail;
    }

    public String getPersonaDiscapacidades() {
        return personaDiscapacidades;
    }

    public void setPersonaDiscapacidades(String personaDiscapacidades) {
        this.personaDiscapacidades = personaDiscapacidades;
    }

    public String getPersonaComentarios() {
        return personaComentarios;
    }

    public void setPersonaComentarios(String personaComentarios) {
        this.personaComentarios = personaComentarios;
    }
    
}
