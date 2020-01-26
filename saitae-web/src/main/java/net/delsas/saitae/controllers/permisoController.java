/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.PermisosPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
public class permisoController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
    private MatriculaFacadeLocal mfl;

    private Matricula m;
    private List<TipopersonaPermiso> permisos;
    private Estudiante us;
    private List<Estudiante> e;
    private int id;
    private Permisos p;

    public void inicial() {
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            Persona u = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (u == null) {

                context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                        "Falla!", "Esa vista no le está permitida aún porque usted no se a logueado."));
                context.getExternalContext().redirect("./../");

            } else {
                this.setUs(u.getEstudiante());
                p.setPermisosPK(new PermisosPK(0, Calendar.getInstance().getTime(), 0, Calendar.getInstance().getTime()));
                permisos = u.getTipoPersona().getTipopersonaPermisoList();
                e = u.getEstudiante().getEstudianteEsEstudiante()
                        ? new ArrayList<>()
                        : u.getEstudiante().getEstudianteList();
                p.setTipoPersona(tipoPersonaFL.find(8));
                p.setPersona(new Persona(0));
                p.setPermisoFechafin(p.getPermisosPK().getPermisoFechaInicio());
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    @PostConstruct
    public void permisoController() {
        p = new Permisos();
        p.setTipoPermiso1(new TipoPermiso(0));
        e = new ArrayList<>();
        us = new Estudiante();
        permisos = new ArrayList<>();
        inicial();
    }

    public ArrayList<SelectItem> listaPermisos() {
        ArrayList<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(-1, "Seleccione"));
        permisos.forEach((t) -> {
            items.add(new SelectItem(t.getTipoPermiso().getIdtipoPermiso(), t.getTipoPermiso().getTipoPermisoNombre()));
        });
        return items;
    }

    public boolean isSeleccionPermiso() {
        return p.getTipoPermiso1().getIdtipoPermiso() > 0;
    }

    public void onItemSelect(SelectEvent event) {
        id = (int) event.getObject();
    }

    public boolean isSeleccionEstudiante() {
        if (id > 0) {
            m = mfl.find(new MatriculaPK(id, Integer.valueOf(new SimpleDateFormat("YYYY")
                    .format(p.getPermisosPK().getPermisoFechaSolicitud()))));
        }
        return id > 0;
    }

    public Permisos getP() {
        return p;
    }

    public void setP(Permisos p) {
        this.p = p;
    }

    public ArrayList<SelectItem> listaEstudiantes() {
        ArrayList<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(-1, "Seleccione"));
        if (e == null || e.isEmpty()) {
            items.add(new SelectItem(us.getPersona().getIdpersona(), us.getPersona().getPersonaNombre() + " "
                    + us.getPersona().getPersonaApellido()));
        }
        e.forEach((e1) -> {
            items.add(new SelectItem(e1.getPersona().getIdpersona(), e1.getPersona().getPersonaNombre() + " "
                    + e1.getPersona().getPersonaApellido()));
        });
        return items;
    }

    public void guardar() {
        p.getPermisosPK().setTipoPermiso(p.getTipoPermiso1().getIdtipoPermiso());
        p.setPermisosSolicitante(us.getPersona());
        p.setPersona(personaFL.find(id));
        p.getPermisosPK().setIpPersona(id);
        FacesMessage ms = null;
        try {
            pfl.create(p);
            ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Solicitud exitosa",
                    "Su permiso se ha solicitado para entre las fechas: " + p.getPermisosPK().getPermisoFechaInicio() + " y " + p.getPermisoFechafin());
        } catch (Exception e) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", e.getMessage());
        } finally {
            FacesContext.getCurrentInstance().addMessage(null, ms);
            p = new Permisos(new PermisosPK((us == null ? 0 : us.getIdestudiante()), 
                    new Date(), 0, new Date()));
            p.setTipoPersona(tipoPersonaFL.find(8));
            p.setPersona(new Persona(0));
            p.setTipoPermiso1(new TipoPermiso(0));
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
