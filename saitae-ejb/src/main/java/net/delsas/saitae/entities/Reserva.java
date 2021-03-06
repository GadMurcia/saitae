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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "reserva", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reserva.findAll", query = "SELECT r FROM Reserva r"),
    @NamedQuery(name = "Reserva.findByIdreserva", query = "SELECT r FROM Reserva r WHERE r.idreserva = :idreserva"),
    @NamedQuery(name = "Reserva.findByReservaFecha", query = "SELECT r FROM Reserva r WHERE r.reservaFecha = :reservaFecha"),
    @NamedQuery(name = "Reserva.findByReservaEntrega", query = "SELECT r FROM Reserva r WHERE r.reservaEntrega = :reservaEntrega"),
    @NamedQuery(name = "Reserva.findByReservaDevolucion", query = "SELECT r FROM Reserva r WHERE r.reservaDevolucion = :reservaDevolucion"),
    @NamedQuery(name = "Reserva.findByReservaEstado", query = "SELECT r FROM Reserva r WHERE r.reservaEstado = :reservaEstado AND FUNCTION('YEAR', r.reservaEntrega) = :año"),
    @NamedQuery(name = "Reserva.findByReservaDevuelto", query = "SELECT r FROM Reserva r WHERE r.reservaDevuelto = :reservaDevuelto"),
    @NamedQuery(name = "Reserva.findByTema", query = "SELECT r FROM Reserva r WHERE r.tema = :tema"),
    @NamedQuery(name = "Reserva.findByObjetivoTema", query = "SELECT r FROM Reserva r WHERE r.objetivoTema = :objetivoTema"),
    @NamedQuery(name = "Reserva.findByReservaComentario", query = "SELECT r FROM Reserva r WHERE r.reservaComentario = :reservaComentario"),
    @NamedQuery(name = "Reserva.findByEstadoAndIdTipoRecurso", query = "SELECT r FROM Reserva r WHERE r.reservaEstado = :estado AND :idTipoRecurso IN (SELECT  s.recurso.idTipoRecurso.idtipoRecurso FROM SolicitudReserva s WHERE s.reserva.idreserva = r.idreserva) AND FUNCTION('YEAR', r.reservaEntrega) = :año ORDER BY r.reservaEntrega DESC"),
    @NamedQuery(name = "Reserva.findAñosGlobales", query = "SELECT DISTINCT FUNCTION('YEAR', r.reservaEntrega) FROM Reserva r ORDER BY 1 ASC")
})
public class Reserva implements Serializable {

    @JoinColumn(name = "acepta", referencedColumnName = "idpersona")
    @ManyToOne
    private Persona acepta;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idreserva")
    private Integer idreserva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "reservaFecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date reservaFecha;
    @Basic(optional = false)
    @NotNull
    @Column(name = "reservaEntrega")
    @Temporal(TemporalType.TIMESTAMP)
    private Date reservaEntrega;
    @Basic(optional = false)
    @NotNull
    @Column(name = "reservaDevolucion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date reservaDevolucion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "reservaEstado")
    private String reservaEstado;
    @Column(name = "reservaDevuelto")
    @Temporal(TemporalType.TIMESTAMP)
    private Date reservaDevuelto;
    @Size(max = 45)
    @Column(name = "tema")
    private String tema;
    @Size(max = 300)
    @Column(name = "objetivoTema")
    private String objetivoTema;
    @Size(max = 300)
    @Column(name = "reservaComentario")
    private String reservaComentario;
    @Size(max = 250)
    @Column(name = "observacionDevolucion")
    private String observacionDevolucion;
    @Size(max = 250)
    @Column(name = "observacionEntrega")
    private String observacionEntrega;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reserva")
    private List<ReservaDetalle> reservaDetalleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reserva")
    private List<ReservaXpedagogia> reservaXpedagogiaList;
    @JoinColumn(name = "tipoReserva", referencedColumnName = "idtipoReserva")
    @ManyToOne(optional = false)
    private TipoReserva tipoReserva;
    @JoinColumn(name = "docente", referencedColumnName = "idmaestro")
    @ManyToOne
    private Maestro docente;
    @JoinColumn(name = "tipoRecurso", referencedColumnName = "idtipoRecurso")
    @ManyToOne
    private TipoRecurso tipoRecurso;
    @JoinColumn(name = "maeria", referencedColumnName = "idmateria")
    @ManyToOne
    private Materia maeria;
    @JoinColumn(name = "TipoProyecto", referencedColumnName = "idtipoProyecto")
    @ManyToOne
    private TipoProyecto tipoProyecto;
    @JoinColumn(name = "entregante", referencedColumnName = "idpersona")
    @ManyToOne
    private Persona entregante;
    @JoinColumn(name = "recibe", referencedColumnName = "idpersona")
    @ManyToOne
    private Persona recibe;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reserva")
    private List<SolicitudReserva> solicitudReservaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reserva")
    private List<PersonasReserva> personasReservaList;

    public Reserva() {
    }

    public Reserva(Integer idreserva) {
        this.idreserva = idreserva;
    }

    public Reserva(Integer idreserva, Date reservaFecha, Date reservaEntrega, Date reservaDevolucion, String reservaEstado) {
        this.idreserva = idreserva;
        this.reservaFecha = reservaFecha;
        this.reservaEntrega = reservaEntrega;
        this.reservaDevolucion = reservaDevolucion;
        this.reservaEstado = reservaEstado;
    }

    public Integer getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(Integer idreserva) {
        this.idreserva = idreserva;
    }

    public Date getReservaFecha() {
        return reservaFecha;
    }

    public void setReservaFecha(Date reservaFecha) {
        this.reservaFecha = reservaFecha;
    }

    public Date getReservaEntrega() {
        return reservaEntrega;
    }

    public void setReservaEntrega(Date reservaEntrega) {
        this.reservaEntrega = reservaEntrega;
    }

    public Date getReservaDevolucion() {
        return reservaDevolucion;
    }

    public void setReservaDevolucion(Date reservaDevolucion) {
        this.reservaDevolucion = reservaDevolucion;
    }

    public String getReservaEstado() {
        return reservaEstado;
    }

    public void setReservaEstado(String reservaEstado) {
        this.reservaEstado = reservaEstado;
    }

    public Date getReservaDevuelto() {
        return reservaDevuelto;
    }

    public void setReservaDevuelto(Date reservaDevuelto) {
        this.reservaDevuelto = reservaDevuelto;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getObjetivoTema() {
        return objetivoTema;
    }

    public void setObjetivoTema(String objetivoTema) {
        this.objetivoTema = objetivoTema;
    }

    public String getReservaComentario() {
        return reservaComentario;
    }

    public void setReservaComentario(String reservaComentario) {
        this.reservaComentario = reservaComentario;
    }

    @XmlTransient
    public List<ReservaDetalle> getReservaDetalleList() {
        return reservaDetalleList;
    }

    public void setReservaDetalleList(List<ReservaDetalle> reservaDetalleList) {
        this.reservaDetalleList = reservaDetalleList;
    }

    @XmlTransient
    public List<ReservaXpedagogia> getReservaXpedagogiaList() {
        return reservaXpedagogiaList;
    }

    public void setReservaXpedagogiaList(List<ReservaXpedagogia> reservaXpedagogiaList) {
        this.reservaXpedagogiaList = reservaXpedagogiaList;
    }

    public TipoReserva getTipoReserva() {
        return tipoReserva;
    }

    public void setTipoReserva(TipoReserva tipoReserva) {
        this.tipoReserva = tipoReserva;
    }

    public Maestro getDocente() {
        return docente;
    }

    public void setDocente(Maestro docente) {
        this.docente = docente;
    }

    public Materia getMaeria() {
        return maeria;
    }

    public void setMaeria(Materia maeria) {
        this.maeria = maeria;
    }

    public TipoProyecto getTipoProyecto() {
        return tipoProyecto;
    }

    public void setTipoProyecto(TipoProyecto tipoProyecto) {
        this.tipoProyecto = tipoProyecto;
    }

    @XmlTransient
    public List<SolicitudReserva> getSolicitudReservaList() {
        return solicitudReservaList;
    }

    public void setSolicitudReservaList(List<SolicitudReserva> solicitudReservaList) {
        this.solicitudReservaList = solicitudReservaList;
    }

    @XmlTransient
    public List<PersonasReserva> getPersonasReservaList() {
        return personasReservaList;
    }

    public void setPersonasReservaList(List<PersonasReserva> personasReservaList) {
        this.personasReservaList = personasReservaList;
    }

    public String getObservacionDevolucion() {
        return observacionDevolucion;
    }

    public void setObservacionDevolucion(String observacionDevolucion) {
        this.observacionDevolucion = observacionDevolucion;
    }

    public String getObservacionEntrega() {
        return observacionEntrega;
    }

    public void setObservacionEntrega(String observacionEntrega) {
        this.observacionEntrega = observacionEntrega;
    }

    public Persona getEntregante() {
        return entregante;
    }

    public void setEntregante(Persona entregante) {
        this.entregante = entregante;
    }

    public Persona getRecibe() {
        return recibe;
    }

    public void setRecibe(Persona recibe) {
        this.recibe = recibe;
    }

    public TipoRecurso getTipoRecurso() {
        return tipoRecurso;
    }

    public void setTipoRecurso(TipoRecurso tipoRecurso) {
        this.tipoRecurso = tipoRecurso;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.idreserva);
        hash = 37 * hash + Objects.hashCode(this.reservaFecha);
        hash = 37 * hash + Objects.hashCode(this.reservaEntrega);
        hash = 37 * hash + Objects.hashCode(this.reservaDevolucion);
        hash = 37 * hash + Objects.hashCode(this.reservaEstado);
        hash = 37 * hash + Objects.hashCode(this.reservaDevuelto);
        hash = 37 * hash + Objects.hashCode(this.tema);
        hash = 37 * hash + Objects.hashCode(this.objetivoTema);
        hash = 37 * hash + Objects.hashCode(this.reservaComentario);
        hash = 37 * hash + Objects.hashCode(this.observacionDevolucion);
        hash = 37 * hash + Objects.hashCode(this.observacionEntrega);
        hash = 37 * hash + Objects.hashCode(this.tipoReserva);
        hash = 37 * hash + Objects.hashCode(this.docente);
        hash = 37 * hash + Objects.hashCode(this.tipoRecurso);
        hash = 37 * hash + Objects.hashCode(this.maeria);
        hash = 37 * hash + Objects.hashCode(this.tipoProyecto);
        hash = 37 * hash + Objects.hashCode(this.entregante);
        hash = 37 * hash + Objects.hashCode(this.recibe);
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
        final Reserva other = (Reserva) obj;
        if (!Objects.equals(this.reservaEstado, other.reservaEstado)) {
            return false;
        }
        if (!Objects.equals(this.tema, other.tema)) {
            return false;
        }
        if (!Objects.equals(this.objetivoTema, other.objetivoTema)) {
            return false;
        }
        if (!Objects.equals(this.reservaComentario, other.reservaComentario)) {
            return false;
        }
        if (!Objects.equals(this.observacionDevolucion, other.observacionDevolucion)) {
            return false;
        }
        if (!Objects.equals(this.observacionEntrega, other.observacionEntrega)) {
            return false;
        }
        if (!Objects.equals(this.idreserva, other.idreserva)) {
            return false;
        }
        if (!Objects.equals(this.reservaFecha, other.reservaFecha)) {
            return false;
        }
        if (!Objects.equals(this.reservaEntrega, other.reservaEntrega)) {
            return false;
        }
        if (!Objects.equals(this.reservaDevolucion, other.reservaDevolucion)) {
            return false;
        }
        if (!Objects.equals(this.reservaDevuelto, other.reservaDevuelto)) {
            return false;
        }
        if (!Objects.equals(this.tipoReserva, other.tipoReserva)) {
            return false;
        }
        if (!Objects.equals(this.docente, other.docente)) {
            return false;
        }
        if (!Objects.equals(this.tipoRecurso, other.tipoRecurso)) {
            return false;
        }
        if (!Objects.equals(this.maeria, other.maeria)) {
            return false;
        }
        if (!Objects.equals(this.tipoProyecto, other.tipoProyecto)) {
            return false;
        }
        if (!Objects.equals(this.entregante, other.entregante)) {
            return false;
        }
        return Objects.equals(this.recibe, other.recibe);
    }

    @Override
    public String toString() {
        return "Reserva{" + "idreserva=" + idreserva + ", reservaFecha=" + reservaFecha
                + ", reservaEntrega=" + reservaEntrega + ", reservaDevolucion=" + reservaDevolucion
                + ", reservaEstado=" + reservaEstado + ", reservaDevuelto=" + reservaDevuelto
                + ", tema=" + tema + ", objetivoTema=" + objetivoTema + ", reservaComentario="
                + reservaComentario + ", observacionDevolucion=" + observacionDevolucion
                + ", observacionEntrega=" + observacionEntrega + ", tipoReserva=" + tipoReserva
                + ", docente=" + docente + ", tipoRecurso=" + tipoRecurso + ", maeria=" + maeria
                + ", tipoProyecto=" + tipoProyecto + ", entregante=" + entregante + ", recibe="
                + recibe + '}';
    }

    public Persona getAcepta() {
        return acepta;
    }

    public void setAcepta(Persona acepta) {
        this.acepta = acepta;
    }

}
