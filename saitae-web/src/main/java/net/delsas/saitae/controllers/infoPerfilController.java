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
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.primefaces.PrimeFaces;

/**
 *
 * @author delsas
 */
@Named
@SessionScoped
public class infoPerfilController implements Serializable {

    private Persona usuario;
    private Matricula m;
    private Maestro ma;
    private boolean maestro, estudiante;

    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private MaestroFacadeLocal maFL;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        m = mFL.find(new MatriculaPK(usuario.getIdpersona(), Auxiliar.getAñoActual()));
        ma = usuario.getMaestro();
        estudiante = usuario.getTipoPersona().getIdtipoPersona().equals(8);
        maestro = usuario.getTipoPersona().getIdtipoPersona().equals(4);
    }

    public Persona getUsuario() {
        return usuario;
    }

    public void setUsuario(Persona usuario) {
        this.usuario = usuario;
    }

    public Matricula getM() {
        return m;
    }

    public void setM(Matricula m) {
        this.m = m;
    }

    public Maestro getMa() {
        return ma;
    }

    public void setMa(Maestro ma) {
        this.ma = ma;
    }

    public boolean isMaestro() {
        return maestro;
    }

    public void setMaestro(boolean maestro) {
        this.maestro = maestro;
    }

    public boolean isEstudiante() {
        return estudiante;
    }

    public void setEstudiante(boolean estudiante) {
        this.estudiante = estudiante;
    }

    public List<SelectItem> getDepList() {
        return new Auxiliar().getDepartamentoLista(usuario);
    }

    public List<SelectItem> getMunList() {
        return new Auxiliar().getMunicipioLista(usuario);
    }

    public String getDepto() {
        return usuario.getPersonaLugarNac().split("#")[0];
    }

    public String getMuni() {
        return usuario.getPersonaLugarNac().split("#")[1];
    }

    public void setDepto(String dep) {
        String mu = getMuni();
        usuario.setPersonaLugarNac(dep + "#" + mu);
    }

    public void setMuni(String mun) {
        String d = getDepto();
        usuario.setPersonaLugarNac(d + "#" + mun);
    }

    public void guardarPersona() {
        pFL.edit(usuario);
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios realizados", "Los datos se han actualizado"));
        PrimeFaces.current().ajax().update("form0:msgs");
    }
    
    public void onBlour(AjaxBehaviorEvent e){
        
    }
    
    public void setDependencia(String[] dep) {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        String de = "";
        for (Integer i = 0; i < dep.length; i++) {
            if (i > 0) {
                de += "#";
            }
            de += dep[i];
        }
        de += "¿" + ot;
        usuario.getEstudiante().setEstudianteDependenciaEconomica(de);
    }

    public String[] getDependencia() {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot[] = d[0].split("#");
        return ot;
    }

    public boolean isOtraDependencia() {
        boolean f = false;
        String[] c = getDependencia();
        for (String o : c) {
            f = o.equals("Otro");
        }
        return f;
    }

    public String getOtraDependenciaEcon() {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        return ot;
    }

    public void setOtraDependenciaEcon(String otrDependencia) {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String dt = d[0];
        usuario.getEstudiante().setEstudianteDependenciaEconomica(dt + "¿" + otrDependencia);
    }

}
