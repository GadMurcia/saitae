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

    private String tema;
    private Map<String, String> themes;
    private Persona usuario;
    @EJB
    private TemaFacadeLocal tFL;
    private boolean existe;

    @PostConstruct
    public void init() {
        tema = "cupertino";
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        if(usuario==null){
            return;
        }
        Tema t = tFL.find(usuario == null ? 0 : usuario.getIdpersona());
        existe = t != null;
        tema = existe ? t.getTemaNombre() : "cupertino";
    }

    public Map<String, String> getThemes() {
        themes = new TreeMap<>();
        themes.put("aristo", "aristo");
        themes.put("black-tie", "black-tie");
        themes.put("blitzer", "blitzer");
        themes.put("bluesky", "bluesky");
        themes.put("casablanca", "casablanca");
        themes.put("cupertino", "cupertino");
        themes.put("dark-hive", "dark-hive");
        themes.put("dot-luv", "dot-luv");
        themes.put("eggplant", "eggplant");
        themes.put("excite-bike", "excite-bike");
        themes.put("flick", "flick");
        themes.put("luna-pink", "luna-pink");
        themes.put("luna-amber", "luna-amber");
        themes.put("luna-green", "luna-green");
        themes.put("luna-blue", "luna-blue");
        themes.put("glass-x", "glass-x");
        themes.put("hot-sneaks", "hot-sneaks");
        themes.put("humanity", "humanity");
        themes.put("le-frog", "le-frog");
        themes.put("midnight", "midnight");
        themes.put("mint-choc", "mint-choc");
        themes.put("none", "none");
        themes.put("overcast", "overcast");
        themes.put("pepper-grinder", "pepper-grinder");
        themes.put("redmond", "redmond");
        themes.put("rocket", "rocket");
        themes.put("sam", "sam");
        themes.put("smoothness", "smoothness");
        themes.put("south-street", "south-street");
        themes.put("start", "start");
        themes.put("sunny", "sunny");
        themes.put("swanky-purse", "swanky-purse");
        themes.put("trontastic", "trontastic");
        themes.put("ui-darkness", "ui-darkness");
        themes.put("ui-lightness", "ui-lightness");
        themes.put("vader", "vader");
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
        if (existe) {
            tFL.edit(t);
        } else {
            tFL.create(t);
        }
        return null;
    }

}
