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
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
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
@ViewScoped
public class AnuncioController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private AnuncioFacadeLocal anuncioFL;
    private Anuncio anuncio;
    private Persona usuario;
    private List<TipoPersona> tiposPersonas;

    @PostConstruct
    public void construct() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            int t = usuario.getTipoPersona().getIdtipoPersona();
            boolean r = t == 1 ? false : (t == 2 ? false : (t == 3 ? false : t != 4));
            if (r) {
                context.getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                "Falla!", "Esa vista no le está permitida."));
                context.getExternalContext().redirect("./../");
            } else {
                anuncio = new Anuncio(0, "", new Date(), "");
                anuncio.setAnuncioAnunciante(usuario);
                tiposPersonas = tipoPersonaFL.findAll();
                tiposPersonas.remove(0);
            }
        } catch (Exception e) {

        }
    }

    public List<Anuncio> getAll() {
        List<Anuncio> anuncios = null;
        if (usuario != null) {
            if (usuario.getTipoPersona().getIdtipoPersona() == 1
                    || usuario.getTipoPersona().getIdtipoPersona() == 2) {
                anuncios = anuncioFL.findAll();
            } else {
                anuncios = usuario.getTipoPersona().getAnuncioList();
            }
        }
        anuncios = anuncios == null ? new ArrayList<Anuncio>() : anuncios;
        return anuncios;
    }

    public Anuncio getAnuncio() {
        return anuncio;
    }

    public void setAnuncio(Anuncio anuncio) {
        this.anuncio = anuncio;
    }

    public List<TipoPersona> getTiposPersonas() {
        return Collections.unmodifiableList(tiposPersonas);
    }
}
