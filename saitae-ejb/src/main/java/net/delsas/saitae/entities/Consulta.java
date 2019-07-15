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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "consulta", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Consulta.findAll", query = "SELECT c FROM Consulta c")
    , @NamedQuery(name = "Consulta.findByIdestudiante", query = "SELECT c FROM Consulta c WHERE c.consultaPK.idestudiante = :idestudiante")
    , @NamedQuery(name = "Consulta.findByFechaHoraConsulta", query = "SELECT c FROM Consulta c WHERE c.consultaPK.fechaHoraConsulta = :fechaHoraConsulta")
    , @NamedQuery(name = "Consulta.findByIdPsicologo", query = "SELECT c FROM Consulta c WHERE c.idPsicologo = :idPsicologo")
    , @NamedQuery(name = "Consulta.findByConsultaRemitidoPor", query = "SELECT c FROM Consulta c WHERE c.consultaRemitidoPor = :consultaRemitidoPor")
    , @NamedQuery(name = "Consulta.findByConsultaMotivo", query = "SELECT c FROM Consulta c WHERE c.consultaMotivo = :consultaMotivo")
    , @NamedQuery(name = "Consulta.findByConsultaAntecedentePersonal", query = "SELECT c FROM Consulta c WHERE c.consultaAntecedentePersonal = :consultaAntecedentePersonal")
    , @NamedQuery(name = "Consulta.findByConsultaAntecedenteFamiliar", query = "SELECT c FROM Consulta c WHERE c.consultaAntecedenteFamiliar = :consultaAntecedenteFamiliar")
    , @NamedQuery(name = "Consulta.findByConsultaAntecedentesMorbidos", query = "SELECT c FROM Consulta c WHERE c.consultaAntecedentesMorbidos = :consultaAntecedentesMorbidos")
    , @NamedQuery(name = "Consulta.findByConsultaConductaObcerbada", query = "SELECT c FROM Consulta c WHERE c.consultaConductaObcerbada = :consultaConductaObcerbada")
    , @NamedQuery(name = "Consulta.findByConsultaProblema", query = "SELECT c FROM Consulta c WHERE c.consultaProblema = :consultaProblema")
    , @NamedQuery(name = "Consulta.findByConsultaDiagnostico", query = "SELECT c FROM Consulta c WHERE c.consultaDiagnostico = :consultaDiagnostico")
    , @NamedQuery(name = "Consulta.findByConsultaEvaluacionPsicologica", query = "SELECT c FROM Consulta c WHERE c.consultaEvaluacionPsicologica = :consultaEvaluacionPsicologica")
    , @NamedQuery(name = "Consulta.findByConsultaRemitir", query = "SELECT c FROM Consulta c WHERE c.consultaRemitir = :consultaRemitir")
    , @NamedQuery(name = "Consulta.findByConsultaCoemntario", query = "SELECT c FROM Consulta c WHERE c.consultaCoemntario = :consultaCoemntario")})
public class Consulta implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ConsultaPK consultaPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idPsicologo")
    private int idPsicologo;
    @Size(max = 45)
    @Column(name = "consultaRemitidoPor")
    private String consultaRemitidoPor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "consultaMotivo")
    private String consultaMotivo;
    @Size(max = 140)
    @Column(name = "consultaAntecedentePersonal")
    private String consultaAntecedentePersonal;
    @Size(max = 140)
    @Column(name = "consultaAntecedenteFamiliar")
    private String consultaAntecedenteFamiliar;
    @Size(max = 140)
    @Column(name = "consultaAntecedentesMorbidos")
    private String consultaAntecedentesMorbidos;
    @Size(max = 140)
    @Column(name = "consultaConductaObcerbada")
    private String consultaConductaObcerbada;
    @Size(max = 250)
    @Column(name = "consultaProblema")
    private String consultaProblema;
    @Size(max = 150)
    @Column(name = "consultaDiagnostico")
    private String consultaDiagnostico;
    @Size(max = 250)
    @Column(name = "consultaEvaluacionPsicologica")
    private String consultaEvaluacionPsicologica;
    @Size(max = 100)
    @Column(name = "consultaRemitir")
    private String consultaRemitir;
    @Size(max = 45)
    @Column(name = "consultaCoemntario")
    private String consultaCoemntario;
    @JoinColumns({
        @JoinColumn(name = "idestudiante", referencedColumnName = "estudiante", insertable = false, updatable = false)
        , @JoinColumn(name = "fechaHoraConsulta", referencedColumnName = "fechaSolicitada", insertable = false, updatable = false)})
    @OneToOne(optional = false)
    private CitaPsicologia citaPsicologia;
    @JoinColumn(name = "consultaExpediente", referencedColumnName = "idEstudiante")
    @ManyToOne
    private ExpedientePS consultaExpediente;

    public Consulta() {
    }

    public Consulta(ConsultaPK consultaPK) {
        this.consultaPK = consultaPK;
    }

    public Consulta(ConsultaPK consultaPK, int idPsicologo, String consultaMotivo) {
        this.consultaPK = consultaPK;
        this.idPsicologo = idPsicologo;
        this.consultaMotivo = consultaMotivo;
    }

    public Consulta(int idestudiante, Date fechaHoraConsulta) {
        this.consultaPK = new ConsultaPK(idestudiante, fechaHoraConsulta);
    }

    public ConsultaPK getConsultaPK() {
        return consultaPK;
    }

    public void setConsultaPK(ConsultaPK consultaPK) {
        this.consultaPK = consultaPK;
    }

    public int getIdPsicologo() {
        return idPsicologo;
    }

    public void setIdPsicologo(int idPsicologo) {
        this.idPsicologo = idPsicologo;
    }

    public String getConsultaRemitidoPor() {
        return consultaRemitidoPor;
    }

    public void setConsultaRemitidoPor(String consultaRemitidoPor) {
        this.consultaRemitidoPor = consultaRemitidoPor;
    }

    public String getConsultaMotivo() {
        return consultaMotivo;
    }

    public void setConsultaMotivo(String consultaMotivo) {
        this.consultaMotivo = consultaMotivo;
    }

    public String getConsultaAntecedentePersonal() {
        return consultaAntecedentePersonal;
    }

    public void setConsultaAntecedentePersonal(String consultaAntecedentePersonal) {
        this.consultaAntecedentePersonal = consultaAntecedentePersonal;
    }

    public String getConsultaAntecedenteFamiliar() {
        return consultaAntecedenteFamiliar;
    }

    public void setConsultaAntecedenteFamiliar(String consultaAntecedenteFamiliar) {
        this.consultaAntecedenteFamiliar = consultaAntecedenteFamiliar;
    }

    public String getConsultaAntecedentesMorbidos() {
        return consultaAntecedentesMorbidos;
    }

    public void setConsultaAntecedentesMorbidos(String consultaAntecedentesMorbidos) {
        this.consultaAntecedentesMorbidos = consultaAntecedentesMorbidos;
    }

    public String getConsultaConductaObcerbada() {
        return consultaConductaObcerbada;
    }

    public void setConsultaConductaObcerbada(String consultaConductaObcerbada) {
        this.consultaConductaObcerbada = consultaConductaObcerbada;
    }

    public String getConsultaProblema() {
        return consultaProblema;
    }

    public void setConsultaProblema(String consultaProblema) {
        this.consultaProblema = consultaProblema;
    }

    public String getConsultaDiagnostico() {
        return consultaDiagnostico;
    }

    public void setConsultaDiagnostico(String consultaDiagnostico) {
        this.consultaDiagnostico = consultaDiagnostico;
    }

    public String getConsultaEvaluacionPsicologica() {
        return consultaEvaluacionPsicologica;
    }

    public void setConsultaEvaluacionPsicologica(String consultaEvaluacionPsicologica) {
        this.consultaEvaluacionPsicologica = consultaEvaluacionPsicologica;
    }

    public String getConsultaRemitir() {
        return consultaRemitir;
    }

    public void setConsultaRemitir(String consultaRemitir) {
        this.consultaRemitir = consultaRemitir;
    }

    public String getConsultaCoemntario() {
        return consultaCoemntario;
    }

    public void setConsultaCoemntario(String consultaCoemntario) {
        this.consultaCoemntario = consultaCoemntario;
    }

    public CitaPsicologia getCitaPsicologia() {
        return citaPsicologia;
    }

    public void setCitaPsicologia(CitaPsicologia citaPsicologia) {
        this.citaPsicologia = citaPsicologia;
    }

    public ExpedientePS getConsultaExpediente() {
        return consultaExpediente;
    }

    public void setConsultaExpediente(ExpedientePS consultaExpediente) {
        this.consultaExpediente = consultaExpediente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (consultaPK != null ? consultaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Consulta)) {
            return false;
        }
        Consulta other = (Consulta) object;
        if ((this.consultaPK == null && other.consultaPK != null) || (this.consultaPK != null && !this.consultaPK.equals(other.consultaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Consulta[ consultaPK=" + consultaPK + " ]";
    }
    
}
