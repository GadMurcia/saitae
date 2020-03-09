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
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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

    public List<Grado> getGrados() {
        return gradoFL.getPorAñoYActivo(getAñoActual());
    }

    public void onSelectItem(SelectEvent event) {
        nomina = new ArrayList<>();
        if (grado != null) {
            mFL.findMatriculaByGrado(grado).forEach((m) -> {
                nomina.add(m.getEstudiante());
            });
        }
    }

    public List<Estudiante> getNomina() {
        Collections.sort(nomina, (Estudiante m1, Estudiante m2)
                -> String.CASE_INSENSITIVE_ORDER.compare(getNombreCompletoPersona(m1.getPersona()), getNombreCompletoPersona(m2.getPersona())));
        return Collections.unmodifiableList(nomina);
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

    public void postProcesoXLS(Object doc) {
        HSSFWorkbook wb = (HSSFWorkbook) doc;
        wb = new XLSModel().getReporteNominaAlumnos(wb, grado);

    }
}
