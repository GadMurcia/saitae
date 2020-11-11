/*
 * Copyright (C) 2019 gabriela
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.EntregaUtilesFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.EntregaUtiles;
import net.delsas.saitae.entities.EntregaUtilesPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author gabriela
 */
@Named

@ViewScoped
public class paquetesController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;

    private boolean boton;
    private EntregaUtiles entregaUtiles;
    private Persona p;
    private Persona usuario;
    private String est;
    private Auxiliar ax;
    @EJB
    private EntregaUtilesFacadeLocal entregaUFL;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private PersonaFacadeLocal personaFL;

    @PostConstruct
    public void init() {
        ax = new Auxiliar();
        boton = true;
        entregaUtiles = new EntregaUtiles(new EntregaUtilesPK(0, getAño()));
        p = new Auxiliar().getEstudiante();
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        String pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), personaFL))) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex0) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error iniesperado",
                        (ex0 != null ? ex0.getMessage() : "Error desconocido.")));
            }
        }
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> listp;
        try {
            (new Auxiliar()).setDui(query, p);
            listp = personaFL.getPersonaByLikeIdAndType(p.getIdpersona(), 8);
            listp.forEach((datos) -> {
                results.add(datos.getPersonaNombre() + " "
                        + datos.getPersonaApellido() + "=>" + datos.getIdpersona().toString().substring(1));
            });
        } catch (Exception m) {
            System.out.println(m.getMessage());
        }
        return results;
    }

    public void onItemSelect(SelectEvent event) {
        new Auxiliar().setDui(event.getObject().toString(), p);
        p = personaFL.find(p.getIdpersona());
        entregaUtiles = entregaUFL.find(new EntregaUtilesPK(p.getIdpersona(), getAño()));
        entregaUtiles = entregaUtiles == null ? new EntregaUtiles(p.getIdpersona(), getAño()) : entregaUtiles;
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Alumno seleccionado", event.getObject().toString()));
        entregaUtiles.setIdRepresentante(p.getEstudiante().getEstudianteRepresentante());
        entregaUtiles.setEstudiante(p.getEstudiante());
        boton = false;
    }

    public int getAño() {
        return getAñoActual();
    }

    public String getGradoAlumno() {
        String grado = "";
        Matricula mati = matriculaFL.find(new MatriculaPK(p.getIdpersona(), getAño()));
        if (mati != null) {
            grado = getGradoNombre(mati.getGrado().getGradoPK());
        }
        return grado;
    }

    public void guardar() {
        EntregaUtiles entregaG = entregaUFL.find(entregaUtiles.getEntregaUtilesPK());
        if (!entregaUtiles.equals(entregaG)) {
            entregaUtiles.setIdEntregante(usuario);
            entregaUFL.edit(entregaUtiles);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Guardado con éxito",
                            "Se guardaron los datos de paquetes entregados"));
            String g = entrega(entregaUtiles);
            persistirNotificación(
                    new mensaje(entregaUtiles.getEntregaUtilesPK().getIdEstudiante(),
                            usuario.getIdpersona(), " ",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Se ha registrado actividad en la entrega de paquetes.",
                                    (g.split("").length > 2 ? "Lo que se le ha entregado es: " + g
                                    : "No hay registro de entregas en este año."))),
                    entregaUtiles.getEstudiante().getPersona(),
                    notiFL, notificacion);
            this.init();
        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Falló", "No se seleccionaron datos"));
        }
    }

    private String entrega(EntregaUtiles e) {
        return ((e.getUtiles1() || e.getUtiles2()) ? "Útiles" : "")
                + (e.getUniforme1() || e.getUniforme2() ? ", Uniforme" : "")
                + (e.getZapatos1() || e.getZapatos2() ? ", Zapatos" : "")
                + ".";
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    public Persona getP() {
        return p;
    }

    public void setNie(String nie) {
        new Auxiliar().setDui(nie, p);
    }

    public String getNie() {
        return p.getIdpersona().toString().substring(1);
    }

    public EntregaUtiles getEntregaUtiles() {
        return entregaUtiles;
    }

    public void setEntregaUtiles(EntregaUtiles entregaUtiles) {
        this.entregaUtiles = entregaUtiles;
    }

    public boolean isBoton() {
        return boton;
    }

    public void setBoton(boolean boton) {
        this.boton = boton;
    }
}
