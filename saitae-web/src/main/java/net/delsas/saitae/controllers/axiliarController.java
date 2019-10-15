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
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class axiliarController implements Serializable {

    private static final long serialVersionUID = 1L;
    private static Persona p = new Persona(0);
    private int tipo;
    @EJB
    private PersonaFacadeLocal pfl;

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> list;
        try {
            (new Auxiliar()).setDui(query, getP());
            list = tipo != 100
                    ? pfl.getPersonaByLikeIdAndType(getP().getIdpersona(), tipo)
                    : pfl.getAdminsByLikeId(getP().getIdpersona());
            for (Persona o : list) {
                results.add(o.getPersonaNombre() + " "
                        + o.getPersonaApellido() + "=>" + o.getIdpersona().toString().substring(1));
            }

        } catch (Exception m) {
            System.out.println(m.getMessage());
        }
        return results;
    }

    public void setTipo(int t) {
        tipo = t;
    }

    public void onItemSelect(SelectEvent event) {
        setP(new Persona(0));
        try {
            String x[] = event.getObject().toString().split("=>");
            (new Auxiliar()).setDui(x.length > 1 ? x[1] : x[0], getP());
            setP(pfl.find(getP().getIdpersona()));
        } catch (Exception o) {
            System.out.println("Error en (new prueba()).onItemSelect: " + o.getMessage());
        }
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage("Selected", getP().getPersonaNombre()));
    }

    public List<String> completeTextRep(String query) {
        tipo = 9;
        return completeText(query);
    }

    public List<String> completeTextPad(String query) {
        tipo = 11;
        return completeText(query);
    }

    public List<String> completeTextMad(String query) {
        tipo = 10;
        return completeText(query);
    }

    public List<String> completeTextEst(String query) {
        tipo = 8;
        return completeText(query);
    }
    
    public List<String> completeTextMae(String query) {
        tipo = 4;
        return completeText(query);
    }

    public List<String> completeTextAdm(String query) {
        tipo = 100;
        return completeText(query);
    }

    /**
     * @return the p
     */
    public static Persona getP() {
        return p;
    }

    /**
     * @param aP the p to set
     */
    public static void setP(Persona aP) {
        p = aP;
    }

}
