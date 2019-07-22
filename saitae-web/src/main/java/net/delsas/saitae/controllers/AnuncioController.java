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
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.ApplicationScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AnuncioFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
@Named
@ApplicationScoped
public class AnuncioController implements Serializable {

    private static final long serialVersionUID = 1L;
    //private TipoPersona tipoPersona;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private AnuncioFacadeLocal anuncioFL;

    @PostConstruct
    public void construct() {

    }

    public List<Anuncio> getAll() {
        Persona p = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        List<Anuncio> anuncios = null;
        if (p != null) {
            if (p.getTipoPersona().getIdtipoPersona() == 1 || p.getTipoPersona().getIdtipoPersona() == 0) {
                anuncios = anuncioFL.findAll();
            } else {
                anuncios = p.getTipoPersona().getAnuncioList();
            }
        }
        anuncios = anuncios == null ? new ArrayList<Anuncio>() : anuncios;
        return anuncios;
    }

}
