/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.MatriculaPK;

/**
 *
 * @author delsas
 */
@Named(value = "permisoEstudianteController")
@ViewScoped
public class permisoController implements Serializable {

    private static final long serialVersionUID = 1L;

    private Permisos p;
    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPermisoFacadeLocal tpfl;
    @EJB
    private EstudianteFacadeLocal efl;
    @EJB
    private MatriculaFacadeLocal mfl;
    
    private Matricula m;
    private List<TipoPermiso> permisos;
    private Estudiante us;
    private List<Estudiante> e;

    /**
     * Creates a new instance of permisoController
     */
    public void inicial() {
        FacesContext context = FacesContext.getCurrentInstance();
        us = ((Persona) context.getExternalContext().getApplicationMap().get("usuario")).getEstudiante();
    }

    @PostConstruct
    public void init() {
        p = new Permisos();
        p.setPermisosPK(new PermisosPK((us == null ? 0 : us.getIdestudiante()), Calendar.getInstance().getTime(), 0));
        permisos = tpfl.findAll();
        e = efl.representados(us.getIdestudiante());
        
        
    }

    public ArrayList<SelectItem> listaPermisos() {
        ArrayList<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(0, "Seleccione"));
        for (TipoPermiso t : permisos) {
            items.add(new SelectItem(t.getIdtipoPermiso(), t.getTipoPermisoNombre()));
        }
        return items;
    }

    public boolean SeleccionPermiso() {
        return p.getPermisosPK().getTipoPermiso() > 0;
    }
    
    public boolean SeleccionEstudiante() {
        if(p.getPermisosPK().getIpPersona() > 0){
            m=mfl.find(new MatriculaPK(p.getPermisosPK().getIpPersona(), 
                    (p.getPermisosPK().getPermisoFechaSolicitud())));
        }
        return p.getPermisosPK().getIpPersona() > 0;
    }

    public Permisos getP() {
        return p;
    }

    public void setP(Permisos p) {
        this.p = p;
    }

    public ArrayList<SelectItem> listaEstudiantes() {
        ArrayList<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(0, "Seleccione"));
        if (e == null) {
            items.add(new SelectItem(us.getIdestudiante(), us.getPersona().getPersonaNombre() + " "
                    + us.getPersona().getPersonaApellido()));
        }
        for (Estudiante e1 : e) {
            items.add(new SelectItem(e1.getIdestudiante(), e1.getPersona().getPersonaNombre()+""+
                    e1.getPersona().getPersonaApellido()));
        }
        return items;
    }

    public Matricula getM() {
        return m;
    }

    public void setM(Matricula m) {
        this.m = m;
    }

    public Estudiante getUs() {
        return us;
    }

    public void setUs(Estudiante us) {
        this.us = us;
    }
    
    
    
}
