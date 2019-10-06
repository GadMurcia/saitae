/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author gabriela
 */
@Entity
@Table(name = "contribuciones", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Contribuciones.findAll", query = "SELECT c FROM Contribuciones c")
    , @NamedQuery(name = "Contribuciones.findByIdEstudiante", query = "SELECT c FROM Contribuciones c WHERE c.contribucionesPK.idEstudiante = :idEstudiante")
    , @NamedQuery(name = "Contribuciones.findByA\u00f1o", query = "SELECT c FROM Contribuciones c WHERE c.contribucionesPK.a\u00f1o = :a\u00f1o")
    , @NamedQuery(name = "Contribuciones.findByEnero", query = "SELECT c FROM Contribuciones c WHERE c.enero = :enero")
    , @NamedQuery(name = "Contribuciones.findByFebrero", query = "SELECT c FROM Contribuciones c WHERE c.febrero = :febrero")
    , @NamedQuery(name = "Contribuciones.findByMarzo", query = "SELECT c FROM Contribuciones c WHERE c.marzo = :marzo")
    , @NamedQuery(name = "Contribuciones.findByAbril", query = "SELECT c FROM Contribuciones c WHERE c.abril = :abril")
    , @NamedQuery(name = "Contribuciones.findByMayo", query = "SELECT c FROM Contribuciones c WHERE c.mayo = :mayo")
    , @NamedQuery(name = "Contribuciones.findByJunio", query = "SELECT c FROM Contribuciones c WHERE c.junio = :junio")
    , @NamedQuery(name = "Contribuciones.findByJulio", query = "SELECT c FROM Contribuciones c WHERE c.julio = :julio")
    , @NamedQuery(name = "Contribuciones.findByAgosto", query = "SELECT c FROM Contribuciones c WHERE c.agosto = :agosto")
    , @NamedQuery(name = "Contribuciones.findBySeptiembre", query = "SELECT c FROM Contribuciones c WHERE c.septiembre = :septiembre")
    , @NamedQuery(name = "Contribuciones.findByOctubre", query = "SELECT c FROM Contribuciones c WHERE c.octubre = :octubre")
    , @NamedQuery(name = "Contribuciones.findByComentario", query = "SELECT c FROM Contribuciones c WHERE c.comentario = :comentario")})
public class Contribuciones implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ContribucionesPK contribucionesPK;
    @Column(name = "enero")
    @Temporal(TemporalType.DATE)
    private Date enero;
    @Column(name = "febrero")
    @Temporal(TemporalType.DATE)
    private Date febrero;
    @Column(name = "marzo")
    @Temporal(TemporalType.DATE)
    private Date marzo;
    @Column(name = "abril")
    @Temporal(TemporalType.DATE)
    private Date abril;
    @Column(name = "mayo")
    @Temporal(TemporalType.DATE)
    private Date mayo;
    @Column(name = "junio")
    @Temporal(TemporalType.DATE)
    private Date junio;
    @Column(name = "julio")
    @Temporal(TemporalType.DATE)
    private Date julio;
    @Column(name = "agosto")
    @Temporal(TemporalType.DATE)
    private Date agosto;
    @Column(name = "septiembre")
    @Temporal(TemporalType.DATE)
    private Date septiembre;
    @Column(name = "octubre")
    @Temporal(TemporalType.DATE)
    private Date octubre;
    @Column(name = "comentario")
    @Temporal(TemporalType.DATE)
    private Date comentario;
    @JoinColumn(name = "idEstudiante", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Estudiante estudiante;

    public Contribuciones() {
    }

    public Contribuciones(ContribucionesPK contribucionesPK) {
        this.contribucionesPK = contribucionesPK;
    }

    public Contribuciones(int idEstudiante, int año) {
        this.contribucionesPK = new ContribucionesPK(idEstudiante, año);
    }

    public ContribucionesPK getContribucionesPK() {
        return contribucionesPK;
    }

    public void setContribucionesPK(ContribucionesPK contribucionesPK) {
        this.contribucionesPK = contribucionesPK;
    }

    public Date getEnero() {
        return enero;
    }

    public void setEnero(Date enero) {
        this.enero = enero;
    }

    public Date getFebrero() {
        return febrero;
    }

    public void setFebrero(Date febrero) {
        this.febrero = febrero;
    }

    public Date getMarzo() {
        return marzo;
    }

    public void setMarzo(Date marzo) {
        this.marzo = marzo;
    }

    public Date getAbril() {
        return abril;
    }

    public void setAbril(Date abril) {
        this.abril = abril;
    }

    public Date getMayo() {
        return mayo;
    }

    public void setMayo(Date mayo) {
        this.mayo = mayo;
    }

    public Date getJunio() {
        return junio;
    }

    public void setJunio(Date junio) {
        this.junio = junio;
    }

    public Date getJulio() {
        return julio;
    }

    public void setJulio(Date julio) {
        this.julio = julio;
    }

    public Date getAgosto() {
        return agosto;
    }

    public void setAgosto(Date agosto) {
        this.agosto = agosto;
    }

    public Date getSeptiembre() {
        return septiembre;
    }

    public void setSeptiembre(Date septiembre) {
        this.septiembre = septiembre;
    }

    public Date getOctubre() {
        return octubre;
    }

    public void setOctubre(Date octubre) {
        this.octubre = octubre;
    }

    public Date getComentario() {
        return comentario;
    }

    public void setComentario(Date comentario) {
        this.comentario = comentario;
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
        hash += (contribucionesPK != null ? contribucionesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Contribuciones)) {
            return false;
        }
        Contribuciones other = (Contribuciones) object;
        if ((this.contribucionesPK == null && other.contribucionesPK != null) || (this.contribucionesPK != null && !this.contribucionesPK.equals(other.contribucionesPK))
                || (this.enero == null && other.enero != null)
                || (this.enero!=null && other.enero==null)
                || !this.enero.equals(other.enero)
                
                || !this.febrero.equals(other.febrero)
                || !this.marzo.equals(other.marzo)
                || !this.abril.equals(other.abril)
                || !this.mayo.equals(other.mayo)
                || !this.junio.equals(other.junio)
                || !this.julio.equals(other.julio)
                || !this.agosto.equals(other.agosto)
                || !this.septiembre.equals(other.septiembre)
                || !this.octubre.equals(other.octubre)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.Contribuciones[ contribucionesPK=" + contribucionesPK + " ]";
    }

}
