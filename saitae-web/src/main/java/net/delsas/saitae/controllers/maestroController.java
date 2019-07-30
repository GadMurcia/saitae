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

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.prueba;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.entities.Maestro;
import org.primefaces.event.FlowEvent;

/**
 *
 * @author delsas
 */
@Named(value = "maestroController")
@ViewScoped
public class maestroController implements Serializable {

    private static final long serialVersionUID = 1L;
    private prueba auxiliar;
    private Maestro maestro;
    private MaestroFacadeLocal mfl;

    /**
     * Creates a new instance of maestro
     */
    @PostConstruct
    public void init() {
        auxiliar=new prueba();
        maestro = auxiliar.getMaestro().getMaestro();
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
    }

    public String getDui() {
        return auxiliar.getDui(maestro.getPersona());
    }

    public List<SelectItem> getMunicipiosLista() {
        return (new prueba()).getMunicipioLista(getDepartamento(), maestro.getPersona());
    }

    public List<SelectItem> getDepartamentosLista() {
        return (new prueba()).getDepartamentoLista(maestro.getPersona());
    }
    
    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

}
