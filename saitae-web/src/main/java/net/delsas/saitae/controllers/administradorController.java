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
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.ax.Auxiliar;
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
public class administradorController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;

    private Persona adm;
    private Persona selected;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tpfl;
    private List<TipoPersona> tipos;
    private Auxiliar aux;

    @PostConstruct
    public void init() {
        aux = new Auxiliar();
        selected = new Persona();
        adm = aux.getAdministradorCra();
        adm.setTipoPersona(new TipoPersona());
        int q[] = new int[]{1, 4, 8, 9, 10, 11};
        tipos = tpfl.findAll();
        for (int s : q) {
            tipos.remove(tpfl.find(s));
        }
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
        return Collections.unmodifiableList(tipos);
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public void guardar() {
        try {
            adm.setPersonaContrasenya(DigestUtils.md5Hex(adm.getIdpersona().toString().substring(1)));
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

    public List<Persona> getPlantel() {
        return pfl.getPlantel();
    }

    public Persona getSelected() {
        return selected;
    }

    public void setSelected(Persona selected) {
        this.selected = selected;
    }

    public String getCargos(Persona p) {
        String g = "";
        List<Integer> tps = getTiposPersonas(p);
        for (Integer i : tps) {
            g += (g.isEmpty() ? "" : ", ") + tpfl.find(i).getTipoPersonaNombre();
        }
        return g;
    }

}
