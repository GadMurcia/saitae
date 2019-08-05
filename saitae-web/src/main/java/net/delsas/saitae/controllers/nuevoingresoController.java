package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.prueba;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class nuevoingresoController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private EstudianteFacadeLocal efl;
    private Persona e;
    private Persona Representante;
    private Persona madre;
    private Persona padre;

    @PostConstruct
    public void init() {
        Representante = (new prueba()).getRepresentante();
        e = (new prueba()).getEstudiante();
        madre = (new prueba()).getMadre();
        padre = (new prueba()).getPadre();
    }

    public void guardar() {
        System.out.println("guardar");
    }

    public String[] getDependenciaeco() {
        String dep = e.getEstudiante().getEstudianteDependenciaEconomica() == null ? ""
                : e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[0];
        return ((dep == null || dep.isEmpty()) ? new String[]{""} : dep.split("#"));
    }

    public void setDependenciaeco(String[] dependenciaeco) {
        String dep = "";
        for (String g : dependenciaeco) {
            if (dep.equalsIgnoreCase("")) {
                dep += g;
            } else {
                dep += "#" + g;
            }
        }
        e.getEstudiante().setEstudianteDependenciaEconomica(dep + "¿ ");
    }

    public boolean isOtraDep() {
        String es = e.getEstudiante().getEstudianteDependenciaEconomica() == null ? ""
                : e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[0];
        String[] r = ((es == null || es.isEmpty()) ? new String[]{""} : es.split("#"));
        return r.length > 0 ? r[r.length - 1].equalsIgnoreCase("otro") : false;
    }

    public String getOtraDependencia() {
        String dep = e.getEstudiante().getEstudianteDependenciaEconomica() == null ? " ¿ "
                : e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[1];
        return dep;
    }

    public void setOtraDependencia(String otradependencia) {
        this.e.getEstudiante().setEstudianteDependenciaEconomica(
                e.getEstudiante().getEstudianteDependenciaEconomica() + "¿" + otradependencia);
    }

    public Persona getE() {
        return e;
    }

    public void setE(Persona e) {
        this.e = e;
    }

    public void setNie(String nie) {
        (new prueba()).setDui(nie, e);
    }

    public String getNie() {
        return (new prueba()).getDui(e);
    }

    public String getDepartamentoE() {
        return (new prueba()).getDepartamento(e);
    }

    public void setDepartamentoE(String de) {
        (new prueba()).setDepartamento(de, e);
    }

    public List<SelectItem> getDepartamentoListaE() {
        return (new prueba()).getDepartamentoLista(e);
    }

    public String getMunicipioE() {
        return (new prueba()).getMunicipio(e);
    }

    public void setMunicipioE(String de) {
        (new prueba()).setMunicipio(de, e);
    }

    public List<SelectItem> getMunicipioListaE() {
        return (new prueba()).getMunicipioLista(e);
    }

    public void onItemSelect2(SelectEvent event) {
        Persona po = axiliarController.getP();
        switch (po.getTipoPersona().getIdtipoPersona()) {
            case 8:
                e = po;
                break;
            case 9:
                Representante = po;
                break;
            case 10:
                madre = po;
                break;
            case 11:
                padre = po;
        }
        System.out.println(po.toString());
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public int getAñoMatricula() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public void setDuiPadre(String dui) {
        (new prueba()).setDui(dui, padre);
    }

    public String getDuiPadre() {
        return (new prueba()).getDui(padre);
    }

    public void setDuiMadre(String dui) {
        (new prueba()).setDui(dui, madre);
    }

    public String getDuiMadre() {
        return (new prueba()).getDui(madre);
    }

    public Persona getMadre() {
        return madre;
    }

    public void setMadre(Persona madre) {
        this.madre = madre;
    }

    public Persona getPadre() {
        return padre;
    }

    public void setPadre(Persona padre) {
        this.padre = padre;
    }

}
