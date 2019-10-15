/*
 * Copyright (C) 2019 delsas
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
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.CargoFacadeLocal;
import net.delsas.saitae.beans.FinanciamientoFacadeLocal;
import net.delsas.saitae.beans.MaestoCargoFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoNombramientoFacadeLocal;
import net.delsas.saitae.entities.Cargo;
import net.delsas.saitae.entities.Financiamiento;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoNombramiento;
import net.delsas.saitae.entities.TipoPersona;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.RowEditEvent;

/**
 *
 * @author delsas
 */
@Named(value = "maestroController")
@ViewScoped
public class maestroController implements Serializable {

    private List<Cargo> cargos;
    @EJB
    private CargoFacadeLocal cargoFL;
    private List<Financiamiento> financiamientos;
    @EJB
    private FinanciamientoFacadeLocal financiamientoFL;
    private List<TipoNombramiento> nombramientos;
    @EJB
    private TipoNombramientoFacadeLocal tipoNombramientoFL;

    private static final long serialVersionUID = 1L;
    private Auxiliar auxiliar;
    private Maestro maestro;
    @EJB
    private MaestroFacadeLocal mfl;
    @EJB
    private FinanciamientoFacadeLocal ffl;
    @EJB
    private CargoFacadeLocal cfl;
    @EJB
    private TipoNombramientoFacadeLocal tnfl;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private MaestoCargoFacadeLocal mcfl;

    /**
     * Creates a new instance of maestro
     */
    @PostConstruct
    public void init() {
        auxiliar = new Auxiliar();
        maestro = auxiliar.getMaestro().getMaestro();
        cargos = cargoFL.findAll();
        financiamientos = financiamientoFL.findAll();
        nombramientos = tipoNombramientoFL.findAll();
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    public void setDepartamento(String dep) {
        auxiliar.setDepartamento(dep, maestro.getPersona());
    }

    public String getDepartamento() {
        return auxiliar.getDepartamento(maestro.getPersona());
    }

    public void setMunicipio(String mun) {
        auxiliar.setMunicipio(mun, maestro.getPersona());
    }

    public String getMunicipio() {
        return auxiliar.getMunicipio(maestro.getPersona());
    }

    public void setDui(String dui) {
        auxiliar.setDui(dui, maestro.getPersona());
        maestro.setIdmaestro(maestro.getPersona().getIdpersona());
    }

    public String getDui() {
        return auxiliar.getDui(maestro.getPersona());
    }

    public List<SelectItem> getMunicipiosLista() {
        return auxiliar.getMunicipioLista(maestro.getPersona());
    }

    public List<SelectItem> getDepartamentosLista() {
        return auxiliar.getDepartamentoLista(maestro.getPersona());
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public void onRowEdit(RowEditEvent event) {
        MaestoCargo mc = (MaestoCargo) event.getObject();
        mc.setCargo(cfl.find(mc.getCargo().getIdcargo()));
        mc.setFinanciamiento(ffl.find(mc.getFinanciamiento().getIdfinanciamiento()));
        mc.setTipoNombramiento(tnfl.find(mc.getTipoNombramiento().getIdtipoNombramiento()));
        mc.getMaestoCargoPK().setIdCargo(mc.getCargo().getIdcargo());
        mc.getMaestoCargoPK().setIdFinanciamiento(mc.getFinanciamiento().getIdfinanciamiento());
        mc.getMaestoCargoPK().setIdNombramiento(mc.getTipoNombramiento().getIdtipoNombramiento());
        mc.getMaestoCargoPK().setIdMaesto(maestro.getIdmaestro());
        maestro.getMaestoCargoList().remove(index);
        maestro.getMaestoCargoList().add(mc);
        FacesMessage msg = new FacesMessage("Modificaciones realizadas con éxito",
                "Modificado: " + mc.getCargo().getCargoNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        MaestoCargo mc = (MaestoCargo) event.getObject();
        if (mc.getCargo().getIdcargo() != null | mc.getCargo().getIdcargo() > 0) {
            maestro.getMaestoCargoList().remove(mc);
        }
        FacesMessage msg = new FacesMessage("Edición Cancelada", "Borrados los campos vacíos.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    private int index = 0;

    public void onAddNew() {
        MaestoCargo mc = new MaestoCargo(0, 0, 0, 0, Calendar.getInstance().getTime());
        mc.setCargo(new Cargo(0, ""));
        mc.setFinanciamiento(new Financiamiento(0, ""));
        mc.setTipoNombramiento(new TipoNombramiento(0, ""));
        mc.setMaestro(maestro);
        maestro.getMaestoCargoList().add(mc);
        index = maestro.getMaestoCargoList().indexOf(mc);
        FacesMessage msg = new FacesMessage("New Car added", "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void setChange() {
        maestro = mfl.find(axiliarController.getP().getIdpersona());
    }

    public void guardar() {
        try {
            maestro.getPersona().setPersonaContrasenya(DigestUtils.md5Hex(auxiliar.getDui(maestro.getPersona())));
            Persona p = maestro.getPersona();
            p.setMaestro(null);
            p.setTipoPersona(new TipoPersona(4, "Maestro"));
            pfl.edit(p);
            Maestro m1 = mfl.find(maestro.getIdmaestro());
            if (m1 != null) {
                for (MaestoCargo mc : m1.getMaestoCargoList()) {
                    if (!maestro.getMaestoCargoList().contains(mc)) {
                        mcfl.remove(mc);
                    }
                }
            }
            mfl.edit(maestro);
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Guardado con éxito",
                            "Los datos de " + maestro.getPersona().getPersonaNombre()
                            + " han sido guardados con éxito."));
            FacesContext.getCurrentInstance().getExternalContext().redirect("agregacion.intex");
        } catch (IOException o) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(
                    FacesMessage.SEVERITY_FATAL, "Error al intentar guardar", o.getMessage()));
        }
    }

    public List<Cargo> getCargos() {
        return Collections.unmodifiableList(cargos);
    }

    public List<Financiamiento> getFinanciamientos() {
        return Collections.unmodifiableList(financiamientos);
    }

    public List<TipoNombramiento> getNombramientos() {
        return Collections.unmodifiableList(nombramientos);
    }

}
