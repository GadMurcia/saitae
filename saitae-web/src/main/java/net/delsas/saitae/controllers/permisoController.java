/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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

/**
 *
 * @author delsas
 */
@Named(value = "permisoEstudianteController")
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
    private Date finicio, ffin;

    /**
     * Creates a new instance of permisoController
     */
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
                        ? new ArrayList<Estudiante>() : u.getEstudiante().getEstudianteList();
                p.setTipoPersona(tipoPersonaFL.find(8));
                p.setPersona(new Persona(0));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public permisoController() {
        p = new Permisos();
        p.setTipoPermiso1(new TipoPermiso(0));
        e = new ArrayList<>();
        us = new Estudiante();
        id = 0;
        finicio = ffin = Calendar.getInstance().getTime();

    }

    public ArrayList<SelectItem> listaPermisos() {
        ArrayList<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(0, "Seleccione"));
        for (TipopersonaPermiso t : permisos) {
            items.add(new SelectItem(t.getTipoPermiso().getIdtipoPermiso(), t.getTipoPermiso().getTipoPermisoNombre()));
        }
        return items;
    }

    public boolean isSeleccionPermiso() {
        return p.getTipoPermiso1().getIdtipoPermiso() > 0;
    }

    public boolean isSeleccionEstudiante() {
        if (id > 0) {
            m = mfl.find(new MatriculaPK(id,
                    p.getPermisosPK().getPermisoFechaSolicitud()));
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
        items.add(new SelectItem(0, "Seleccione"));
        if (e == null || e.isEmpty()) {
            items.add(new SelectItem(us.getPersona().getIdpersona(), us.getPersona().getPersonaNombre() + " "
                    + us.getPersona().getPersonaApellido()));
        }
        for (Estudiante e1 : e) {
            items.add(new SelectItem(e1.getPersona().getIdpersona(), e1.getPersona().getPersonaNombre() + " "
                    + e1.getPersona().getPersonaApellido()));
        }
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
            p = new Permisos(new PermisosPK((us == null ? 0 : us.getIdestudiante()), Calendar.getInstance().getTime(), 0, Calendar.getInstance().getTime()));
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

    public Date getFinicio() {
        return finicio;
    }

    public void setFinicio(Date finicio) {
        System.out.println("fecha inicio: " + finicio.toString());
        this.finicio = finicio;
    }

    public Date getFfin() {
        return ffin;
    }

    public void setFfin(Date ffin) {
        System.out.println("fecha fin: " + ffin.toString());
        this.ffin = ffin;
    }

}
