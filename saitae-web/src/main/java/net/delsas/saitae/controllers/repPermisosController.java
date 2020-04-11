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

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;
import org.primefaces.behavior.ajax.AjaxBehavior;
import org.primefaces.component.selectonemenu.SelectOneMenu;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class repPermisosController extends Auxiliar implements Serializable {

    private Integer menu;
    private GradoPK GSelected;
    private List<Grado> grados;
    private List<Persona> personas;
    private List<Permisos> permisos;
    private Persona PSelected;

    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private PermisosFacadeLocal permFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private PersonaFacadeLocal pFL;

    @PostConstruct
    public void init() {
        menu = 1;
        grados = new ArrayList<>();
        SelectOneMenu ss = new SelectOneMenu();
        ss.setId("menu");
        onSelect(new SelectEvent(ss, new AjaxBehavior(), menu));
    }

    public void onSelect(SelectEvent e) {
        SelectOneMenu ss = new SelectOneMenu();
        switch (e.getComponent().getId()) {
            case "menu":
                switch (menu) {
                    case 1:
                        grados = gFL.getPorAñoYActivo(getAñoActual());
                        GSelected = grados.isEmpty() ? new GradoPK(0, "", "", 0) : grados.get(0).getGradoPK();
                        ss.setId("grado");
                        onSelect(new SelectEvent(ss, new AjaxBehavior(), GSelected));
                        break;
                    case 2:
                        grados.clear();
                        GSelected = null;
                        personas = pFL.getMaestros();
                        ss.setId("person");
                        onSelect(new SelectEvent(ss, new AjaxBehavior(), null));
                        break;
                    case 3:
                        grados.clear();
                        GSelected = null;
                        personas = pFL.getAdmins();
                        ss.setId("person");
                        onSelect(new SelectEvent(ss, new AjaxBehavior(), null));
                        break;
                    default:
                        grados.clear();
                        GSelected = null;
                        personas = new ArrayList<>();
                        System.out.println(menu);
                }
                break;
            case "grado":
                GSelected = (GradoPK) e.getObject();
                personas = mFL.findMatriculaByGrado(GSelected);
                ss.setId("person");
                onSelect(new SelectEvent(ss, new AjaxBehavior(), null));
                break;
            case "person":
                PSelected = (Persona) e.getObject();
                PSelected = PSelected == null ? (personas.isEmpty() ? null : personas.get(0)) : PSelected;
                permisos = permFL.findByIpPersonaAndEstado(PSelected == null
                        ? 0 : PSelected.getIdpersona(), getAñoActual(), "1");
                break;
            default:
                personas = new ArrayList<>();
                System.out.println(e.getComponent().getId());
        }
    }

    public Integer getMenu() {
        return menu;
    }

    public void setMenu(Integer menu) {
        this.menu = menu;
    }

    public GradoPK getGSelected() {
        return GSelected;
    }

    public void setGSelected(GradoPK gSelected) {
        this.GSelected = gSelected;
    }

    public List<Grado> getGrados() {
        return grados;
    }

    public List<Persona> getPersonas() {
        return personas;
    }

    public Persona getPSelected() {
        return PSelected;
    }

    public void setPSelected(Persona pSelected) {
        this.PSelected = pSelected;
    }

    public List<Permisos> getPermisos() {
        return permisos;
    }

    public boolean getVerGrado() {
        return menu == 1;
    }

    public boolean getEsEstudiante() {
        return PSelected == null ? false : PSelected.getTipoPersona().getIdtipoPersona().equals(8);
    }

    public String getTipoAdmin(Persona p) {
        return (!p.getTipoPersona().getIdtipoPersona().equals(4)
                && !p.getTipoPersona().getIdtipoPersona().equals(8))
                ? "(" + p.getTipoPersona().getTipoPersonaNombre() + ")"
                : "";
    }
}
