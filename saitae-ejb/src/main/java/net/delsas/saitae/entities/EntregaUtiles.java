/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "entregaUtiles", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EntregaUtiles.findAll", query = "SELECT e FROM EntregaUtiles e")
    , @NamedQuery(name = "EntregaUtiles.findByIdEstudiante", query = "SELECT e FROM EntregaUtiles e WHERE e.entregaUtilesPK.idEstudiante = :idEstudiante")
    , @NamedQuery(name = "EntregaUtiles.findByA\u00f1o", query = "SELECT e FROM EntregaUtiles e WHERE e.entregaUtilesPK.a\u00f1o = :a\u00f1o")
    , @NamedQuery(name = "EntregaUtiles.findByZapatos", query = "SELECT e FROM EntregaUtiles e WHERE e.zapatos = :zapatos")
    , @NamedQuery(name = "EntregaUtiles.findByUniforme", query = "SELECT e FROM EntregaUtiles e WHERE e.uniforme = :uniforme")
    , @NamedQuery(name = "EntregaUtiles.findByUtiles", query = "SELECT e FROM EntregaUtiles e WHERE e.utiles = :utiles")
    , @NamedQuery(name = "EntregaUtiles.findByComentario", query = "SELECT e FROM EntregaUtiles e WHERE e.comentario = :comentario")})
public class EntregaUtiles implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EntregaUtilesPK entregaUtilesPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "zapatos")
    private boolean zapatos;
    @Basic(optional = false)
    @NotNull
    @Column(name = "uniforme")
    private boolean uniforme;
    @Basic(optional = false)
    @NotNull
    @Column(name = "utiles")
    private boolean utiles;
    @Size(max = 100)
    @Column(name = "comentario")
    private String comentario;
    @JoinColumn(name = "idEstudiante", referencedColumnName = "idestudiante", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Estudiante estudiante;
    @JoinColumn(name = "idEntregante", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona idEntregante;
    @JoinColumn(name = "idRepresentante", referencedColumnName = "idestudiante")
    @ManyToOne(optional = false)
    private Estudiante idRepresentante;

    public EntregaUtiles() {
    }

    public EntregaUtiles(EntregaUtilesPK entregaUtilesPK) {
        this.entregaUtilesPK = entregaUtilesPK;
    }

    public EntregaUtiles(EntregaUtilesPK entregaUtilesPK, boolean zapatos, boolean uniforme, boolean utiles) {
        this.entregaUtilesPK = entregaUtilesPK;
        this.zapatos = zapatos;
        this.uniforme = uniforme;
        this.utiles = utiles;
    }

    public EntregaUtiles(int idEstudiante, int año) {
        this.entregaUtilesPK = new EntregaUtilesPK(idEstudiante, año);
    }

    public EntregaUtilesPK getEntregaUtilesPK() {
        return entregaUtilesPK;
    }

    public void setEntregaUtilesPK(EntregaUtilesPK entregaUtilesPK) {
        this.entregaUtilesPK = entregaUtilesPK;
    }

    public boolean getZapatos() {
        return zapatos;
    }

    public void setZapatos(boolean zapatos) {
        this.zapatos = zapatos;
    }

    public boolean getUniforme() {
        return uniforme;
    }

    public void setUniforme(boolean uniforme) {
        this.uniforme = uniforme;
    }

    public boolean getUtiles() {
        return utiles;
    }

    public void setUtiles(boolean utiles) {
        this.utiles = utiles;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public Persona getIdEntregante() {
        return idEntregante;
    }

    public void setIdEntregante(Persona idEntregante) {
        this.idEntregante = idEntregante;
    }

    public Estudiante getIdRepresentante() {
        return idRepresentante;
    }

    public void setIdRepresentante(Estudiante idRepresentante) {
        this.idRepresentante = idRepresentante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (entregaUtilesPK != null ? entregaUtilesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EntregaUtiles)) {
            return false;
        }
        EntregaUtiles other = (EntregaUtiles) object;
        if (other == null ||
                (this.entregaUtilesPK == null && other.entregaUtilesPK != null)
                || (this.entregaUtilesPK != null && !this.entregaUtilesPK.equals(other.entregaUtilesPK))
                
                || (this.uniforme && !other.uniforme)
               
                || (this.zapatos && !other.zapatos)
              
                || (this.utiles && !other.utiles)
                
                ) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EntregaUtiles[ entregaUtilesPK=" + entregaUtilesPK + " ]";
    }
    
}
