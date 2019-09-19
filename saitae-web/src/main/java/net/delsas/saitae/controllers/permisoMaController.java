/*
 * Copyright (C) 2019 gabriela
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
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipopersonaPermiso;

/**
 *
 * @author gabriela
 */
@Named
@ViewScoped
public class permisoMaController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private PermisosFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
   
    private List<TipopersonaPermiso> permisos;
    private Persona usuario;
    private List<Maestro> m;
    private int id;
    private Permisos p;
    
    @PostConstruct
    public void init() {
    
    
    
    }
    
    
}
