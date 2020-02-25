/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Objects;
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
    @NamedQuery(name = "EntregaUtiles.findAll", query = "SELECT e FROM EntregaUtiles e"),
    @NamedQuery(name = "EntregaUtiles.findByIdEstudiante", query = "SELECT e FROM EntregaUtiles e WHERE e.entregaUtilesPK.idEstudiante = :idEstudiante"),
    @NamedQuery(name = "EntregaUtiles.findByA\u00f1o", query = "SELECT e FROM EntregaUtiles e WHERE e.entregaUtilesPK.a\u00f1o = :a\u00f1o"),
    @NamedQuery(name = "EntregaUtiles.findByZapatos1", query = "SELECT e FROM EntregaUtiles e WHERE e.zapatos1 = :zapatos1"),
    @NamedQuery(name = "EntregaUtiles.findByUniforme1", query = "SELECT e FROM EntregaUtiles e WHERE e.uniforme1 = :uniforme1"),
    @NamedQuery(name = "EntregaUtiles.findByUtiles1", query = "SELECT e FROM EntregaUtiles e WHERE e.utiles1 = :utiles1"),
    @NamedQuery(name = "EntregaUtiles.findByZapatos2", query = "SELECT e FROM EntregaUtiles e WHERE e.zapatos2 = :zapatos2"),
    @NamedQuery(name = "EntregaUtiles.findByUniforme2", query = "SELECT e FROM EntregaUtiles e WHERE e.uniforme2 = :uniforme2"),
    @NamedQuery(name = "EntregaUtiles.findByUtiles2", query = "SELECT e FROM EntregaUtiles e WHERE e.utiles2 = :utiles2"),
    @NamedQuery(name = "EntregaUtiles.findByComentario", query = "SELECT e FROM EntregaUtiles e WHERE e.comentario = :comentario"),
    @NamedQuery(name = "EntregaUtiles.findByAño", query = "SELECT e FROM EntregaUtiles e WHERE e.entregaUtilesPK.año = :año"),
    @NamedQuery(name = "EntregaUtiles.findByGrado", query = "SELECT e FROM EntregaUtiles e WHERE e.entregaUtilesPK.idEstudiante  IN (SELECT m.matriculaPK.idmatricula FROM Matricula m WHERE m.grado.gradoPK = :gPK)")
})
public class EntregaUtiles implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EntregaUtilesPK entregaUtilesPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "zapatos1")
    private boolean zapatos1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "uniforme1")
    private boolean uniforme1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "utiles1")
    private boolean utiles1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "zapatos2")
    private boolean zapatos2;
    @Basic(optional = false)
    @NotNull
    @Column(name = "uniforme2")
    private boolean uniforme2;
    @Basic(optional = false)
    @NotNull
    @Column(name = "utiles2")
    private boolean utiles2;
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

    public EntregaUtiles(EntregaUtilesPK entregaUtilesPK, boolean zapatos1, boolean uniforme1, boolean utiles1, boolean zapatos2, boolean uniforme2, boolean utiles2) {
        this.entregaUtilesPK = entregaUtilesPK;
        this.zapatos1 = zapatos1;
        this.uniforme1 = uniforme1;
        this.utiles1 = utiles1;
        this.zapatos2 = zapatos2;
        this.uniforme2 = uniforme2;
        this.utiles2 = utiles2;
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

    public boolean getZapatos1() {
        return zapatos1;
    }

    public void setZapatos1(boolean zapatos1) {
        this.zapatos1 = zapatos1;
    }

    public boolean getUniforme1() {
        return uniforme1;
    }

    public void setUniforme1(boolean uniforme1) {
        this.uniforme1 = uniforme1;
    }

    public boolean getUtiles1() {
        return utiles1;
    }

    public void setUtiles1(boolean utiles1) {
        this.utiles1 = utiles1;
    }

    public boolean getZapatos2() {
        return zapatos2;
    }

    public void setZapatos2(boolean zapatos2) {
        this.zapatos2 = zapatos2;
    }

    public boolean getUniforme2() {
        return uniforme2;
    }

    public void setUniforme2(boolean uniforme2) {
        this.uniforme2 = uniforme2;
    }

    public boolean getUtiles2() {
        return utiles2;
    }

    public void setUtiles2(boolean utiles2) {
        this.utiles2 = utiles2;
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
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.entregaUtilesPK);
        hash = 79 * hash + (this.zapatos1 ? 1 : 0);
        hash = 79 * hash + (this.uniforme1 ? 1 : 0);
        hash = 79 * hash + (this.utiles1 ? 1 : 0);
        hash = 79 * hash + (this.zapatos2 ? 1 : 0);
        hash = 79 * hash + (this.uniforme2 ? 1 : 0);
        hash = 79 * hash + (this.utiles2 ? 1 : 0);
        hash = 79 * hash + Objects.hashCode(this.comentario);
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
        final EntregaUtiles other = (EntregaUtiles) obj;
        if (this.zapatos1 != other.getZapatos1()) {
            return false;
        }
        if (this.uniforme1 != other.getUniforme1()) {
            return false;
        }
        if (this.utiles1 != other.getUtiles1()) {
            return false;
        }
        if (this.zapatos2 != other.getZapatos2()) {
            return false;
        }
        if (this.uniforme2 != other.getUniforme2()) {
            return false;
        }
        if (this.utiles2 != other.getUtiles2()) {
            return false;
        }
        if (!Objects.equals(this.comentario, other.getComentario())) {
            return false;
        }
        return Objects.equals(this.entregaUtilesPK, other.entregaUtilesPK);
    }

    @Override
    public String toString() {
        return "EntregaUtiles{" + "entregaUtilesPK=" + entregaUtilesPK + ", zapatos1=" + zapatos1 + ", uniforme1=" + uniforme1 + ", utiles1=" + utiles1 + ", zapatos2=" + zapatos2 + ", uniforme2=" + uniforme2 + ", utiles2=" + utiles2 + '}';
    }
}
