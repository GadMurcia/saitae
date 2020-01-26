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

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
public class representanteController {

    @EJB
    private GradoFacadeLocal gFL;
    private List<Grado> grados;
    private List<Estudiante> representantes;
    private String nombreGrado;

    @PostConstruct
    public void init() {
        grados = gFL.getPorAñoYActivo(getAñoActual());
        representantes = new ArrayList<>();
        nombreGrado = "";
    }

    public Integer getAñoActual() {
        return Auxiliar.getAñoActual();
    }

    public void selectAño(SelectEvent event) {
        representantes.clear();
        String[] id = event.getObject().toString().split("¿¿");
        if (id.length == 3) {
            Grado g = gFL.find(new GradoPK(Integer.valueOf(id[0]), id[1], id[2], getAñoActual()));
            g.getMatriculaList().forEach((m) -> {
                representantes.add(m.getEstudiante());
            });
            nombreGrado = getLabel(g.getGradoPK());
        } else {
            nombreGrado = "";
        }
        PrimeFaces.current().ajax().update(":form:representantes");
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public void setGrados(List<Grado> grados) {
        this.grados = grados;
    }

    public List<Estudiante> getRepresentantes() {
        return Collections.unmodifiableList(representantes);
    }

    public void setRepresentantes(List<Estudiante> representantes) {
        this.representantes = representantes;
    }

    public String getLabel(GradoPK id) {
        return Auxiliar.getGradoNombre(id);
    }

    public String getValue(GradoPK id) {
        return id.getIdgrado() + "¿¿" + id.getGradoModalidad() + "¿¿" + id.getGradoSeccion();
    }

    public String getNombreGrado() {
        return nombreGrado;
    }

    public void setNombreGrado(String nombreGrado) {
        this.nombreGrado = nombreGrado;
    }
}
