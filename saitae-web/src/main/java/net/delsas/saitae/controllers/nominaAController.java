package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class nominaAController implements Serializable {

    private static final long serialVersionUID = 1L;
    private Estudiante estudiante;
    private List<Estudiante> nomina;
    @EJB
    private GradoFacadeLocal gradoFL;
    private GradoPK grado;

    @PostConstruct
    public void init() {
        estudiante = new Estudiante(0);
        grado = new GradoPK(0, "", "", 0);
        nomina = new ArrayList<>();
    }

    public List<SelectItem> getGrados() {
        List<SelectItem> items = new ArrayList<>();
        for (Grado g : gradoFL.getPorAñoYActivo(getAñoEnCurso())) {
            GradoPK pk = g.getGradoPK();
            String mo = pk.getGradoModalidad();
            items.add(new SelectItem(pk.getIdgrado() + "@" + pk.getGradoModalidad() + "@" + pk.getGradoSeccion()
                    + "@" + pk.getGradoAño(),
                    pk.getIdgrado() + "° " + (mo.equals("C") ? "TVC Contador"
                    : mo.equals("S") ? "TVC Secretariado" : "General")
                    + " " + pk.getGradoSeccion()));
        }
        return items;
    }

    public void onSelectItem(SelectEvent event) {
        nomina = new ArrayList<>();
        grado = new GradoPK(0, "", "", 0);
        String[] pk = event.getObject().toString().split("@");
        if (pk.length == 4) {
            grado = new GradoPK(Integer.valueOf(pk[0]), pk[1], pk[2], Integer.valueOf(pk[3]));
            for (Matricula m : gradoFL.find(grado).getMatriculaList()) {
                nomina.add(m.getEstudiante());
            }
        }
    }

    public int getAñoEnCurso() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public List<Estudiante> getNomina() {
        return nomina;
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

}
