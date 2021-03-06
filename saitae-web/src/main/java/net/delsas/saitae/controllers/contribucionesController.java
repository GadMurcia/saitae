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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import net.delsas.saitae.beans.ContribucionesFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Contribuciones;
import net.delsas.saitae.entities.ContribucionesPK;
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
public class contribucionesController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    boolean boton;
    @EJB
    private PersonaFacadeLocal personaFL;
    private Persona p;
    private Persona usuario;
    private String est;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private ContribucionesFacadeLocal contrFL;
    private Contribuciones contr;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;

    @PostConstruct
    public void init() {
        boton = false;
        contr = new Contribuciones(new ContribucionesPK(0, getAño()));
        p = new Persona(0, " ", " ", true);
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        String pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), personaFL))) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
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
        contr.getContribucionesPK().setIdEstudiante(p.getIdpersona());
        contr = contrFL.find(contr.getContribucionesPK());
        contr = contr == null ? new Contribuciones(new ContribucionesPK(p.getIdpersona(), getAño())) : contr;
        boton = true;
    }

    public Integer getAño() {
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
        Contribuciones contrG = contrFL.find(contr.getContribucionesPK());
        if (!contr.equals(contrG)) {
            contrFL.edit(contr);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Guardado con éxito",
                            "Se guardaron los datos de la contribución"));
            String g = mesesPagados(contr);
            persistirNotificación(
                    new mensaje(contr.getContribucionesPK().getIdEstudiante(), usuario.getIdpersona(), " ",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Actividad en las contribuciones registrado.",
                                    (g.split("").length > 8 ? "Los meses que ya ha pagado son : " + g
                                    : (g.split("").length > 2 ? "El mes pagado es " + g
                                    : "No tiene registro de pago de las contribuciones para el año en curso.")))),
                    new Persona(contr.getContribucionesPK().getIdEstudiante()),
                    notiFL, notificacion);
            this.init();
        } else {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "No hay cambios", "No se seleccionaron datos nuevos"));
        }
    }

    private String mesesPagados(Contribuciones c) {
        return (c.getEnero() != null ? "Enero" : "") + (c.getFebrero() != null ? ", Febrero" : "")
                + (c.getMarzo() != null ? ", Marzo" : "") + (c.getAbril() != null ? ", Abril" : "")
                + (c.getMayo() != null ? ", Mayo" : "") + (c.getJunio() != null ? ", Junio" : "")
                + (c.getJulio() != null ? ", Julio" : "") + (c.getAgosto() != null ? ", Agosto" : "")
                + (c.getSeptiembre() != null ? ", Septiembre" : "") + (c.getOctubre() != null ? ", Octubre" : "")
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

    public Contribuciones getContr() {
        return contr;
    }

    public void setContr(Contribuciones contr) {
        this.contr = contr;
    }

    public boolean getEneroPagado() {
        return contr.getEnero() != null;
    }

    public void setEneroPagado(boolean e) {
        contr.setEnero(e ? new Date() : null);
    }

    public boolean getFebreroPagado() {
        return contr.getFebrero() != null;
    }

    public void setFebreroPagado(boolean e) {
        contr.setFebrero(e ? new Date() : null);
    }

    public boolean getMarzoPagado() {
        return contr.getMarzo() != null;
    }

    public void setMarzoPagado(boolean e) {
        contr.setMarzo(e ? new Date() : null);
    }

    public boolean getAbrilPagado() {
        return contr.getAbril() != null;
    }

    public void setAbrilPagado(boolean e) {
        contr.setAbril(e ? new Date() : null);
    }

    public boolean getMayoPagado() {
        return contr.getMayo() != null;
    }

    public void setMayoPagado(boolean e) {
        contr.setMayo(e ? new Date() : null);
    }

    public boolean getJunioPagado() {
        return contr.getJunio() != null;
    }

    public void setJunioPagado(boolean e) {
        contr.setJunio(e ? new Date() : null);
    }

    public boolean getJulioPagado() {
        return contr.getJulio() != null;
    }

    public void setJulioPagado(boolean e) {
        contr.setJulio(e ? new Date() : null);
    }

    public boolean getAgostoPagado() {
        return contr.getAgosto() != null;
    }

    public void setAgostoPagado(boolean e) {
        contr.setAgosto(e ? new Date() : null);
    }

    public boolean getSeptiembrePagado() {
        return contr.getSeptiembre() != null;
    }

    public void setSeptiembrePagado(boolean e) {
        contr.setSeptiembre(e ? new Date() : null);
    }

    public boolean getOctubrePagado() {
        return contr.getOctubre() != null;
    }

    public void setOctubrePagado(boolean e) {
        contr.setOctubre(e ? new Date() : null);
    }

    public boolean isBoton() {
        return boton;
    }

    public void setBoton(boolean boton) {
        this.boton = boton;
    }
}
