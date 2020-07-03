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
import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import net.delsas.saitae.beans.TemaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Tema;

/**
 *
 * @author delsas
 */
@Named
@SessionScoped
public class themeControlller implements Serializable {

    private static final long serialVersionUID = 1L;

    private String tema = "luna-amber";
    private Map<String, String> themes;
    private Persona usuario;
    @EJB
    private TemaFacadeLocal tFL;
    private boolean existe;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        if (usuario != null) {
            Tema t = tFL.find(usuario.getIdpersona());
            existe = t != null;
            tema = existe ? t.getTemaNombre() : tema;
        }
    }

    public Map<String, String> getThemes() {
        themes = new TreeMap<>();
        themes.put("Predeterminado", "excite-bike");
        themes.put("Aristo", "aristo");
        themes.put("Black Tie", "black-tie");
//        themes.put("Blitzer", "blitzer");
        themes.put("Bluesky", "bluesky");
//        themes.put("Casablanca", "casablanca");
        themes.put("Cupertino", "cupertino");
//        themes.put("Dark Hive", "dark-hive");
        themes.put("Dot Luv", "dot-luv");
//        themes.put("Eggplant", "eggplant");
        themes.put("Excite Bike", "excite-bike");
        themes.put("Flick", "flick");
        themes.put("Glass-x", "glass-x");
        themes.put("Hot Sneaks", "hot-sneaks");
        themes.put("Humanity", "humanity");
        themes.put("Le Frog", "le-frog");
        themes.put("Luna Amber", "luna-amber");
        themes.put("Luna Blue", "luna-blue");
        themes.put("Luna Green", "luna-green");
        themes.put("Luna Pink", "luna-pink");
//        themes.put("Midnight", "midnight");
//        themes.put("Mint Choc", "mint-choc");
        themes.put("Overcast", "overcast");
        themes.put("Pepper Grinder", "pepper-grinder");
        themes.put("Redmond", "redmond");
        themes.put("Rocket", "rocket");
        themes.put("Sam", "sam");
        themes.put("Smoothness", "smoothness");
        themes.put("South Street", "south-street");
        themes.put("Start", "start");
        themes.put("Sunny", "sunny");
        themes.put("Swanky Purse", "swanky-purse");
//        themes.put("Trontastic", "trontastic");
//        themes.put("Ui Darkness", "ui-darkness");
        themes.put("Ui Lightness", "ui-lightness");
//        themes.put("Vader", "vader");
        return Collections.unmodifiableMap(themes);
    }

    public void setThemes(Map<String, String> themes) {
        this.themes = themes;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String cambiar() {
        Tema t = new Tema(usuario.getIdpersona(), tema);
        t.setTemaComentario("");
        t.setPersona(usuario);
        if (existe) {
            tFL.edit(t);
        } else {
            tFL.create(t);
        }
        existe = true;
        return null;
    }

    public String getEstilo() {
        boolean f = tema.contains("luna");

        return f ? "background-color: #323232; color: #888888;" : "";
    }

}
