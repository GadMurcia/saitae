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
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
public class representanteController extends Auxiliar implements Serializable {

    @EJB
    private GradoFacadeLocal gFL;
    private List<Grado> grados;
    private GradoPK id;
    private List<Estudiante> representantes;

    @PostConstruct
    public void init() {
        grados = gFL.getPorAñoYActivo(getAñoActual());
        representantes = new ArrayList<>();
        id = grados.isEmpty() ? null : grados.get(0).getGradoPK();
        selectAño(null);
    }

    public void selectAño(SelectEvent event) {
        representantes.clear();
        if (id != null) {
            Grado g = gFL.find(id);
            g.getMatriculaList().forEach((m) -> {
                representantes.add(m.getEstudiante());
            });
        }
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public List<Estudiante> getRepresentantes() {
        return Collections.unmodifiableList(representantes);
    }

    public GradoPK getId() {
        return id;
    }

    public void setId(GradoPK id) {
        this.id = id;
    }
}
