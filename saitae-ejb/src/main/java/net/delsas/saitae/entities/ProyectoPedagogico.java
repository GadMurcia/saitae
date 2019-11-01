/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "proyectoPedagogico", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProyectoPedagogico.findAll", query = "SELECT p FROM ProyectoPedagogico p")
    , @NamedQuery(name = "ProyectoPedagogico.findByIdproyectoPedagogico", query = "SELECT p FROM ProyectoPedagogico p WHERE p.idproyectoPedagogico = :idproyectoPedagogico")
    , @NamedQuery(name = "ProyectoPedagogico.findByNombreProyecto", query = "SELECT p FROM ProyectoPedagogico p WHERE p.nombreProyecto = :nombreProyecto")
    , @NamedQuery(name = "ProyectoPedagogico.findByBeneficiarios", query = "SELECT p FROM ProyectoPedagogico p WHERE p.beneficiarios = :beneficiarios")
    , @NamedQuery(name = "ProyectoPedagogico.findByDuracion", query = "SELECT p FROM ProyectoPedagogico p WHERE p.duracion = :duracion")
    , @NamedQuery(name = "ProyectoPedagogico.findByObjetivoGeneral", query = "SELECT p FROM ProyectoPedagogico p WHERE p.objetivoGeneral = :objetivoGeneral")
    , @NamedQuery(name = "ProyectoPedagogico.findByObjetivoEspecifico", query = "SELECT p FROM ProyectoPedagogico p WHERE p.objetivoEspecifico = :objetivoEspecifico")
    , @NamedQuery(name = "ProyectoPedagogico.findByJustificacion", query = "SELECT p FROM ProyectoPedagogico p WHERE p.justificacion = :justificacion")
    , @NamedQuery(name = "ProyectoPedagogico.findByMetodologia", query = "SELECT p FROM ProyectoPedagogico p WHERE p.metodologia = :metodologia")
    , @NamedQuery(name = "ProyectoPedagogico.findByActividades", query = "SELECT p FROM ProyectoPedagogico p WHERE p.actividades = :actividades")
    , @NamedQuery(name = "ProyectoPedagogico.findByRecursoHumano", query = "SELECT p FROM ProyectoPedagogico p WHERE p.recursoHumano = :recursoHumano")
    , @NamedQuery(name = "ProyectoPedagogico.findByRecursoMaterial", query = "SELECT p FROM ProyectoPedagogico p WHERE p.recursoMaterial = :recursoMaterial")
    , @NamedQuery(name = "ProyectoPedagogico.findByRecursoFinanciero", query = "SELECT p FROM ProyectoPedagogico p WHERE p.recursoFinanciero = :recursoFinanciero")
    , @NamedQuery(name = "ProyectoPedagogico.findBySeguimiento", query = "SELECT p FROM ProyectoPedagogico p WHERE p.seguimiento = :seguimiento")
    , @NamedQuery(name = "ProyectoPedagogico.findByProductoEsperado", query = "SELECT p FROM ProyectoPedagogico p WHERE p.productoEsperado = :productoEsperado")
    , @NamedQuery(name = "ProyectoPedagogico.findByProyectoPedagogicoComentario", query = "SELECT p FROM ProyectoPedagogico p WHERE p.proyectoPedagogicoComentario = :proyectoPedagogicoComentario")})
public class ProyectoPedagogico implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombreProyecto")
    private String nombreProyecto;
    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 100)
    @Column(name = "beneficiarios")
    private String beneficiarios;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "duracion")
    private String duracion;
    @Basic(optional = false)
    @NotNull
    @Lob()
    @Size(min = 1, max = 16777215)
    @Column(name = "diagnostico")
    private String diagnostico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "objetivoGeneral")
    private String objetivoGeneral;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "objetivoEspecifico")
    private String objetivoEspecifico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "justificacion")
    private String justificacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "metodologia")
    private String metodologia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "actividades")
    private String actividades;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "recursoHumano")
    private String recursoHumano;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "recursoMaterial")
    private String recursoMaterial;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "recursoFinanciero")
    private String recursoFinanciero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "seguimiento")
    private String seguimiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "productoEsperado")
    private String productoEsperado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 140)
    @Column(name = "proyectoPedagogicoComentario")
    private String proyectoPedagogicoComentario;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idproyectoPedagogico")
    private Integer idproyectoPedagogico;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyectoPedagogico")
    private List<ReservaXpedagogia> reservaXpedagogiaList;

    public ProyectoPedagogico() {
    }

    public ProyectoPedagogico(Integer idproyectoPedagogico) {
        this.idproyectoPedagogico = idproyectoPedagogico;
    }

    public ProyectoPedagogico(Integer idproyectoPedagogico, String nombreProyecto, String beneficiarios, String duracion, String diagnostico, String objetivoGeneral, String objetivoEspecifico, String justificacion, String metodologia, String actividades, String recursoHumano, String recursoMaterial, String recursoFinanciero, String seguimiento, String productoEsperado, String proyectoPedagogicoComentario) {
        this.idproyectoPedagogico = idproyectoPedagogico;
        this.nombreProyecto = nombreProyecto;
        this.beneficiarios = beneficiarios;
        this.duracion = duracion;
        this.diagnostico = diagnostico;
        this.objetivoGeneral = objetivoGeneral;
        this.objetivoEspecifico = objetivoEspecifico;
        this.justificacion = justificacion;
        this.metodologia = metodologia;
        this.actividades = actividades;
        this.recursoHumano = recursoHumano;
        this.recursoMaterial = recursoMaterial;
        this.recursoFinanciero = recursoFinanciero;
        this.seguimiento = seguimiento;
        this.productoEsperado = productoEsperado;
        this.proyectoPedagogicoComentario = proyectoPedagogicoComentario;
    }

    public Integer getIdproyectoPedagogico() {
        return idproyectoPedagogico;
    }

    public void setIdproyectoPedagogico(Integer idproyectoPedagogico) {
        this.idproyectoPedagogico = idproyectoPedagogico;
    }
    @XmlTransient
    public List<ReservaXpedagogia> getReservaXpedagogiaList() {
        return reservaXpedagogiaList;
    }
    public void setReservaXpedagogiaList(List<ReservaXpedagogia> reservaXpedagogiaList) {
        this.reservaXpedagogiaList = reservaXpedagogiaList;
    }
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproyectoPedagogico != null ? idproyectoPedagogico.hashCode() : 0);
        return hash;
    }
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProyectoPedagogico)) {
            return false;
        }
        ProyectoPedagogico other = (ProyectoPedagogico) object;
        if ((this.idproyectoPedagogico == null && other.idproyectoPedagogico != null) || (this.idproyectoPedagogico != null && !this.idproyectoPedagogico.equals(other.idproyectoPedagogico))) {
            return false;
        }
        return true;
    }
    @Override
    public String toString() {
        return "net.delsas.saitae.entities.ProyectoPedagogico[ idproyectoPedagogico=" + idproyectoPedagogico + " ]";
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public String getBeneficiarios() {
        return beneficiarios;
    }

    public void setBeneficiarios(String beneficiarios) {
        this.beneficiarios = beneficiarios;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getObjetivoGeneral() {
        return objetivoGeneral;
    }

    public void setObjetivoGeneral(String objetivoGeneral) {
        this.objetivoGeneral = objetivoGeneral;
    }

    public String getObjetivoEspecifico() {
        return objetivoEspecifico;
    }

    public void setObjetivoEspecifico(String objetivoEspecifico) {
        this.objetivoEspecifico = objetivoEspecifico;
    }

    public String getJustificacion() {
        return justificacion;
    }

    public void setJustificacion(String justificacion) {
        this.justificacion = justificacion;
    }

    public String getMetodologia() {
        return metodologia;
    }

    public void setMetodologia(String metodologia) {
        this.metodologia = metodologia;
    }

    public String getActividades() {
        return actividades;
    }

    public void setActividades(String actividades) {
        this.actividades = actividades;
    }

    public String getRecursoHumano() {
        return recursoHumano;
    }

    public void setRecursoHumano(String recursoHumano) {
        this.recursoHumano = recursoHumano;
    }

    public String getRecursoMaterial() {
        return recursoMaterial;
    }

    public void setRecursoMaterial(String recursoMaterial) {
        this.recursoMaterial = recursoMaterial;
    }

    public String getRecursoFinanciero() {
        return recursoFinanciero;
    }

    public void setRecursoFinanciero(String recursoFinanciero) {
        this.recursoFinanciero = recursoFinanciero;
    }

    public String getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(String seguimiento) {
        this.seguimiento = seguimiento;
    }

    public String getProductoEsperado() {
        return productoEsperado;
    }

    public void setProductoEsperado(String productoEsperado) {
        this.productoEsperado = productoEsperado;
    }

    public String getProyectoPedagogicoComentario() {
        return proyectoPedagogicoComentario;
    }

    public void setProyectoPedagogicoComentario(String proyectoPedagogicoComentario) {
        this.proyectoPedagogicoComentario = proyectoPedagogicoComentario;
    }
    
}
