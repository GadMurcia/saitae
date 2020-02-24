package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class nominaAController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<Estudiante> nomina;
    private Estudiante Selected;
    @EJB
    private GradoFacadeLocal gradoFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    private GradoPK grado;
    private Matricula mat;

    @PostConstruct
    public void init() {
        grado = new GradoPK(0, "", "", 0);
        nomina = new ArrayList<>();
    }

    public List<SelectItem> getGrados() {
        List<SelectItem> items = new ArrayList<>();
        gradoFL.getPorAñoYActivo(getAñoActual()).stream().map((g) -> g.getGradoPK()).forEachOrdered((pk) -> {
            items.add(new SelectItem(pk.getIdgrado() + "@"
                    + pk.getGradoModalidad() + "@" + pk.getGradoSeccion()
                    + "@" + pk.getGradoAño(),
                    getGradoNombre(pk)));
        });
        return items;
    }

    public void onSelectItem(SelectEvent event) {
        nomina = new ArrayList<>();
        grado = new GradoPK(0, "", "", 0);
        String[] pk = event.getObject().toString().split("@");
        if (pk.length == 4) {
            grado = new GradoPK(Integer.valueOf(pk[0]), pk[1], pk[2], Integer.valueOf(pk[3]));
            gradoFL.find(grado).getMatriculaList().forEach((m) -> {
                nomina.add(m.getEstudiante());
            });
        }
    }

    public List<Estudiante> getNomina() {
        return Collections.unmodifiableList(nomina);
    }

    public void setNomina(List<Estudiante> nomina) {
        this.nomina = nomina;
    }

    public GradoPK getPK() {
        return grado;
    }

    public void setPK(GradoPK pk) {
        this.grado = pk;
    }

    public Estudiante getSelected() {
        return Selected;
    }

    public void setSelected(Estudiante Selected) {
        this.Selected = Selected;
    }

    public void onSelect(AjaxBehaviorEvent e) {
        mat = mFL.find(new MatriculaPK(Selected.getIdestudiante(), getAñoActual()));
    }

    public Matricula getMat() {
        return mat;
    }

    public void setMat(Matricula mat) {
        this.mat = mat; 
    }

}
