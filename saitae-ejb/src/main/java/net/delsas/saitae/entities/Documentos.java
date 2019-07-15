/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name = "documentos", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Documentos.findAll", query = "SELECT d FROM Documentos d")
    , @NamedQuery(name = "Documentos.findByIddocumentos", query = "SELECT d FROM Documentos d WHERE d.iddocumentos = :iddocumentos")
    , @NamedQuery(name = "Documentos.findByEstudianteExtencionPartida", query = "SELECT d FROM Documentos d WHERE d.estudianteExtencionPartida = :estudianteExtencionPartida")
    , @NamedQuery(name = "Documentos.findByEstudianteExtencionCertificado", query = "SELECT d FROM Documentos d WHERE d.estudianteExtencionCertificado = :estudianteExtencionCertificado")
    , @NamedQuery(name = "Documentos.findByEstudianteExtencionConducta", query = "SELECT d FROM Documentos d WHERE d.estudianteExtencionConducta = :estudianteExtencionConducta")
    , @NamedQuery(name = "Documentos.findByEstudianteExtencionNotas", query = "SELECT d FROM Documentos d WHERE d.estudianteExtencionNotas = :estudianteExtencionNotas")
    , @NamedQuery(name = "Documentos.findByEstudianteExtencionDui", query = "SELECT d FROM Documentos d WHERE d.estudianteExtencionDui = :estudianteExtencionDui")
    , @NamedQuery(name = "Documentos.findByDocumentosComentario", query = "SELECT d FROM Documentos d WHERE d.documentosComentario = :documentosComentario")})
public class Documentos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "iddocumentos")
    private Integer iddocumentos;
    @Lob
    @Column(name = "estudianteDocPartida")
    private byte[] estudianteDocPartida;
    @Lob
    @Column(name = "estudianteDocCertificado")
    private byte[] estudianteDocCertificado;
    @Lob
    @Column(name = "estudianteDocConducta")
    private byte[] estudianteDocConducta;
    @Lob
    @Column(name = "estudianteDocDui")
    private byte[] estudianteDocDui;
    @Lob
    @Column(name = "estudianteDocNotas")
    private byte[] estudianteDocNotas;
    @Size(max = 10)
    @Column(name = "estudianteExtencionPartida")
    private String estudianteExtencionPartida;
    @Size(max = 10)
    @Column(name = "estudianteExtencionCertificado")
    private String estudianteExtencionCertificado;
    @Size(max = 10)
    @Column(name = "estudianteExtencionConducta")
    private String estudianteExtencionConducta;
    @Size(max = 10)
    @Column(name = "estudianteExtencionNotas")
    private String estudianteExtencionNotas;
    @Size(max = 10)
    @Column(name = "estudianteExtencionDui")
    private String estudianteExtencionDui;
    @Size(max = 140)
    @Column(name = "documentosComentario")
    private String documentosComentario;
    @JoinColumn(name = "iddocumentos", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Estudiante estudiante;

    public Documentos() {
    }

    public Documentos(Integer iddocumentos) {
        this.iddocumentos = iddocumentos;
    }

    public Integer getIddocumentos() {
        return iddocumentos;
    }

    public void setIddocumentos(Integer iddocumentos) {
        this.iddocumentos = iddocumentos;
    }

    public byte[] getEstudianteDocPartida() {
        return estudianteDocPartida;
    }

    public void setEstudianteDocPartida(byte[] estudianteDocPartida) {
        this.estudianteDocPartida = estudianteDocPartida;
    }

    public byte[] getEstudianteDocCertificado() {
        return estudianteDocCertificado;
    }

    public void setEstudianteDocCertificado(byte[] estudianteDocCertificado) {
        this.estudianteDocCertificado = estudianteDocCertificado;
    }

    public byte[] getEstudianteDocConducta() {
        return estudianteDocConducta;
    }

    public void setEstudianteDocConducta(byte[] estudianteDocConducta) {
        this.estudianteDocConducta = estudianteDocConducta;
    }

    public byte[] getEstudianteDocDui() {
        return estudianteDocDui;
    }

    public void setEstudianteDocDui(byte[] estudianteDocDui) {
        this.estudianteDocDui = estudianteDocDui;
    }

    public byte[] getEstudianteDocNotas() {
        return estudianteDocNotas;
    }

    public void setEstudianteDocNotas(byte[] estudianteDocNotas) {
        this.estudianteDocNotas = estudianteDocNotas;
    }

    public String getEstudianteExtencionPartida() {
        return estudianteExtencionPartida;
    }

    public void setEstudianteExtencionPartida(String estudianteExtencionPartida) {
        this.estudianteExtencionPartida = estudianteExtencionPartida;
    }

    public String getEstudianteExtencionCertificado() {
        return estudianteExtencionCertificado;
    }

    public void setEstudianteExtencionCertificado(String estudianteExtencionCertificado) {
        this.estudianteExtencionCertificado = estudianteExtencionCertificado;
    }

    public String getEstudianteExtencionConducta() {
        return estudianteExtencionConducta;
    }

    public void setEstudianteExtencionConducta(String estudianteExtencionConducta) {
        this.estudianteExtencionConducta = estudianteExtencionConducta;
    }

    public String getEstudianteExtencionNotas() {
        return estudianteExtencionNotas;
    }

    public void setEstudianteExtencionNotas(String estudianteExtencionNotas) {
        this.estudianteExtencionNotas = estudianteExtencionNotas;
    }

    public String getEstudianteExtencionDui() {
        return estudianteExtencionDui;
    }

    public void setEstudianteExtencionDui(String estudianteExtencionDui) {
        this.estudianteExtencionDui = estudianteExtencionDui;
    }

    public String getDocumentosComentario() {
        return documentosComentario;
    }

    public void setDocumentosComentario(String documentosComentario) {
        this.documentosComentario = documentosComentario;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddocumentos != null ? iddocumentos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Documentos)) {
            return false;
        }
        Documentos other = (Documentos) object;
        if ((this.iddocumentos == null && other.iddocumentos != null) || (this.iddocumentos != null && !this.iddocumentos.equals(other.iddocumentos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Documentos[ iddocumentos=" + iddocumentos + " ]";
    }
    
}
