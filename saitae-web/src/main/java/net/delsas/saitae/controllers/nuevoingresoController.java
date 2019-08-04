package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;
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
    private prueba aux;
    private Persona estudiante;

    @PostConstruct
    public void init() {
        aux = new prueba();
        estudiante = aux.getEstudiante();
        estudiante.getEstudiante().setEstudianteRepresentante(aux.getRepresentante().getEstudiante());
        estudiante.getEstudiante().getEstudianteRepresentante().setPersona(aux.getRepresentante());
        estudiante.getEstudiante().setEstudiantePadre(aux.getMadre());
        estudiante.getEstudiante().setEstudianteMadre(aux.getMadre());
    }

    public void guardar() {
        System.out.println("guardar");
    }

    public Persona getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Persona estudiante) {
        this.estudiante = estudiante;
    }

    public void setNie(String nie) {
        aux.setDui(nie, estudiante);
    }

    public String getNie() {
        return aux.getDui(estudiante);
    }

    public String getDepartamentoE() {
        return aux.getDepartamento(estudiante);
    }

    public void setDepartamentoE(String de) {
        aux.setDepartamento(de, estudiante);
    }

    public List<SelectItem> getDepartamentoListaE() {
        return aux.getDepartamentoLista(estudiante);
    }

    public String getMunicipioE() {
        return aux.getMunicipio(estudiante);
    }

    public void setMunicipioE(String de) {
        aux.setMunicipio(de, estudiante);
    }

    public List<SelectItem> getMunicipioListaE() {
        return aux.getMunicipioLista(estudiante);
    }

    public void onItemSelect2(SelectEvent event) {
        estudiante = axiliarController.p;
    }
    
    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }
    
    public int getAñoMatricula(){
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }
}
