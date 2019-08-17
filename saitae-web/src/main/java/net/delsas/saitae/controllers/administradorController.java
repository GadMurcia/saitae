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
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.aux.prueba;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class administradorController implements Serializable {

    private static final long serialVersionUID = 1L;

    private Persona adm;
    private Persona selected;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tpfl;
    private List<TipoPersona> tipos;
    private prueba aux;

    @PostConstruct
    public void init() {
        aux = new prueba();
        selected=new Persona();
        adm = aux.getAdministradorCra();
        adm.setTipoPersona(new TipoPersona());
        tipos = new ArrayList<>();
        tipos.add(new TipoPersona(7,"Laboratorista"));
        tipos.add(new TipoPersona(6,"Administrador CRA"));
        tipos.add(new TipoPersona(5,"Bibliotecario"));
        tipos.add(new TipoPersona(3,"Subdirector"));
        tipos.add(new TipoPersona(2, "Director"));
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();

        return results;
    }

    public void onItemSelect(SelectEvent event) {
        adm.setTipoPersona(tpfl.find(adm.getTipoPersona().getIdtipoPersona()));
    }

    public void onItemSelect2(SelectEvent event) {
        adm = axiliarController.getP();
    }

    public Persona getAdm() {
        return adm;
    }

    public void setAdm(Persona adm) {
        this.adm = adm;
    }

    public List<SelectItem> getDepartamentoList() {
        return aux.getDepartamentoLista(adm);
    }

    public List<SelectItem> getMunicipioList() {
        return aux.getMunicipioLista(adm);
    }

    public String getDepto() {
        return aux.getDepartamento(adm);
    }

    public void setDepto(String dep) {
        aux.setDepartamento(dep, adm);
    }

    public String getMuni() {
        return aux.getMunicipio(adm);
    }

    public void setMuni(String mun) {
        aux.setMunicipio(mun, adm);
    }

    public String getDui() {
        return aux.getDui(adm);
    }

    public void setDui(String dui) {
        aux.setDui(dui, adm);
    }

    public List<TipoPersona> getTipos() {
        return tipos;
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public void guardar() {
        try {
            adm.setPersonaContrasenya(DigestUtils.md5Hex(adm.getIdpersona() + ""));
            pfl.edit(adm);
            String a = (!adm.getPersonaSexo() ? "El Señor " : "La Señora ") + adm.getPersonaNombre() + " "
                    + adm.getPersonaApellido() + " ha sido asignad" + (!adm.getPersonaSexo() ? "o " : "a ")
                    + "como " + adm.getTipoPersona().getTipoPersonaNombre() + ".";
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Agregación Exitosa", a));
            FacesContext.getCurrentInstance().getExternalContext().redirect("agAdm.intex");
        } catch (IOException e) {
            System.out.println("Error en adminitrador.Guaradr:" + e.getMessage());
        }
    }
    
    public List<Persona> getPlantel(){
        return pfl.getPlantel();
    }

    public Persona getSelected() {
        return selected;
    }

    public void setSelected(Persona selected) {
        this.selected = selected;
    }
    
    

}
