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
    , @NamedQuery(name = "ProyectoPedagogico.findByRecursoHumano", query = "SELECT p FROM ProyectoPedagogico p WHERE p.recursoHumano = :recursoHumano")
    , @NamedQuery(name = "ProyectoPedagogico.findByRecursoMaterial", query = "SELECT p FROM ProyectoPedagogico p WHERE p.recursoMaterial = :recursoMaterial")
    , @NamedQuery(name = "ProyectoPedagogico.findByRecursoFinanciero", query = "SELECT p FROM ProyectoPedagogico p WHERE p.recursoFinanciero = :recursoFinanciero")
    , @NamedQuery(name = "ProyectoPedagogico.findByProyectoPedagogicoComentario", query = "SELECT p FROM ProyectoPedagogico p WHERE p.proyectoPedagogicoComentario = :proyectoPedagogicoComentario")})
public class ProyectoPedagogico implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proyectoPedagogico")
    private List<ReservaXpedagogia> reservaXpedagogiaList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idproyectoPedagogico")
    private Integer idproyectoPedagogico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombreProyecto")
    private String nombreProyecto;
    @Size(max = 300)
    @Column(name = "beneficiarios")
    private String beneficiarios;
    @Size(max = 30)
    @Column(name = "duracion")
    private String duracion;
    @Lob
    @Size(max = 65535)
    @Column(name = "diagnostico")
    private String diagnostico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "objetivoGeneral")
    private String objetivoGeneral;
    @Size(max = 100)
    @Column(name = "objetivoEspecifico")
    private String objetivoEspecifico;
    @Lob
    @Size(max = 65535)
    @Column(name = "justificacion")
    private String justificacion;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "metodologia")
    private String metodologia;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "actividades")
    private String actividades;
    @Size(max = 300)
    @Column(name = "recursoHumano")
    private String recursoHumano;
    @Size(max = 300)
    @Column(name = "recursoMaterial")
    private String recursoMaterial;
    @Size(max = 300)
    @Column(name = "recursoFinanciero")
    private String recursoFinanciero;
    @Lob
    @Size(max = 65535)
    @Column(name = "seguimiento")
    private String seguimiento;
    @Lob
    @Size(max = 65535)
    @Column(name = "productoEsperado")
    private String productoEsperado;
    @Size(max = 300)
    @Column(name = "proyectoPedagogicoComentario")
    private String proyectoPedagogicoComentario;

    public ProyectoPedagogico() {
    }

    public ProyectoPedagogico(Integer idproyectoPedagogico) {
        this.idproyectoPedagogico = idproyectoPedagogico;
    }

    public ProyectoPedagogico(Integer idproyectoPedagogico, String nombreProyecto, String objetivoGeneral, String metodologia, String actividades) {
        this.idproyectoPedagogico = idproyectoPedagogico;
        this.nombreProyecto = nombreProyecto;
        this.objetivoGeneral = objetivoGeneral;
        this.metodologia = metodologia;
        this.actividades = actividades;
    }

    public Integer getIdproyectoPedagogico() {
        return idproyectoPedagogico;
    }

    public void setIdproyectoPedagogico(Integer idproyectoPedagogico) {
        this.idproyectoPedagogico = idproyectoPedagogico;
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

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.idproyectoPedagogico);
        hash = 59 * hash + Objects.hashCode(this.nombreProyecto);
        hash = 59 * hash + Objects.hashCode(this.beneficiarios);
        hash = 59 * hash + Objects.hashCode(this.duracion);
        hash = 59 * hash + Objects.hashCode(this.diagnostico);
        hash = 59 * hash + Objects.hashCode(this.objetivoGeneral);
        hash = 59 * hash + Objects.hashCode(this.objetivoEspecifico);
        hash = 59 * hash + Objects.hashCode(this.justificacion);
        hash = 59 * hash + Objects.hashCode(this.metodologia);
        hash = 59 * hash + Objects.hashCode(this.actividades);
        hash = 59 * hash + Objects.hashCode(this.recursoHumano);
        hash = 59 * hash + Objects.hashCode(this.recursoMaterial);
        hash = 59 * hash + Objects.hashCode(this.recursoFinanciero);
        hash = 59 * hash + Objects.hashCode(this.seguimiento);
        hash = 59 * hash + Objects.hashCode(this.productoEsperado);
        hash = 59 * hash + Objects.hashCode(this.proyectoPedagogicoComentario);
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
        final ProyectoPedagogico other = (ProyectoPedagogico) obj;
        if (!Objects.equals(this.nombreProyecto, other.nombreProyecto)) {
            return false;
        }
        if (!Objects.equals(this.beneficiarios, other.beneficiarios)) {
            return false;
        }
        if (!Objects.equals(this.duracion, other.duracion)) {
            return false;
        }
        if (!Objects.equals(this.diagnostico, other.diagnostico)) {
            return false;
        }
        if (!Objects.equals(this.objetivoGeneral, other.objetivoGeneral)) {
            return false;
        }
        if (!Objects.equals(this.objetivoEspecifico, other.objetivoEspecifico)) {
            return false;
        }
        if (!Objects.equals(this.justificacion, other.justificacion)) {
            return false;
        }
        if (!Objects.equals(this.metodologia, other.metodologia)) {
            return false;
        }
        if (!Objects.equals(this.actividades, other.actividades)) {
            return false;
        }
        if (!Objects.equals(this.recursoHumano, other.recursoHumano)) {
            return false;
        }
        if (!Objects.equals(this.recursoMaterial, other.recursoMaterial)) {
            return false;
        }
        if (!Objects.equals(this.recursoFinanciero, other.recursoFinanciero)) {
            return false;
        }
        if (!Objects.equals(this.seguimiento, other.seguimiento)) {
            return false;
        }
        if (!Objects.equals(this.productoEsperado, other.productoEsperado)) {
            return false;
        }
        if (!Objects.equals(this.proyectoPedagogicoComentario, other.proyectoPedagogicoComentario)) {
            return false;
        }
        return Objects.equals(this.idproyectoPedagogico, other.idproyectoPedagogico);
    }

    @Override
    public String toString() {
        return "ProyectoPedagogico{" + "idproyectoPedagogico=" + idproyectoPedagogico + ", nombreProyecto=" + nombreProyecto + ", beneficiarios=" + beneficiarios + ", duracion=" + duracion + ", diagnostico=" + diagnostico + ", objetivoGeneral=" + objetivoGeneral + ", objetivoEspecifico=" + objetivoEspecifico + ", justificacion=" + justificacion + ", metodologia=" + metodologia + ", actividades=" + actividades + ", recursoHumano=" + recursoHumano + ", recursoMaterial=" + recursoMaterial + ", recursoFinanciero=" + recursoFinanciero + ", seguimiento=" + seguimiento + ", productoEsperado=" + productoEsperado + ", proyectoPedagogicoComentario=" + proyectoPedagogicoComentario + '}';
    }

    @XmlTransient
    public List<ReservaXpedagogia> getReservaXpedagogiaList() {
        return reservaXpedagogiaList;
    }

    public void setReservaXpedagogiaList(List<ReservaXpedagogia> reservaXpedagogiaList) {
        this.reservaXpedagogiaList = reservaXpedagogiaList;
    }
}
