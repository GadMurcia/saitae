/*
 * Copyright (C) 2020 delsas
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
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoEvaluacion;
import net.delsas.saitae.entities.Persona;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class gradoEvalHController extends Auxiliar implements Serializable {

    private FacesContext context;
    private Persona usuario;
    private GradoEvaluacion evalSelected;
    private List<Grado> grados;
    private Grado gSelected;
    private String pagina;

    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private PersonaFacadeLocal pFL;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        usuario = pFL.find(usuario.getIdpersona());
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina))))) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            }
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado",
                            ex.getMessage() == null ? "Error de causa desconocida." : ex.getMessage()));
        }

    }

    private boolean isEstudiante() {
        return usuario == null ? false : usuario.getTipoPersona().getIdtipoPersona().equals(8);
    }

    private boolean isMaestro() {
        return usuario == null ? false : usuario.getTipoPersona().getIdtipoPersona().equals(4);
    }

    public List<Grado> getGrados() {
        grados = null;
        Integer id = usuario == null ? 0 : usuario.getIdpersona();
        grados = isEstudiante() ? mFL.findGradoByidEstudiante(id)
                : (isMaestro() ? gFL.findByidMaestro(id)
                        : new ArrayList<>());
        gSelected = gSelected != null ? gSelected : (grados.isEmpty() ? null : grados.get(0));
        return grados;
    }

    public Grado getGSelected() {
        return gSelected;
    }

    public void setGSelected(Grado gSelected) {
        this.gSelected = gSelected;
    }

    public GradoEvaluacion getEvalSelected() {
        return evalSelected;
    }

    public void setEvalSelected(GradoEvaluacion evalSelected) {
        this.evalSelected = evalSelected;
    }

}
