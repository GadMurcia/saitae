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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.MestroHorarioMateriasPK;

/**
 *
 * @author delsas
 */
@Named
@RequestScoped
public class horarioController implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private HorarioFacadeLocal horarioFL;
    private List<MestroHorarioMaterias> horario;
    private MestroHorarioMaterias selected;

    @PostConstruct
    public void init() {
        horario = new ArrayList<>();
        selected = new MestroHorarioMaterias(new MestroHorarioMateriasPK(0, 0, 0, "", 0, "", "", 0));
        List<Horario> h = horarioFL.findAll();
        for (Horario h1 : h) {
            horario.addAll(h1.getMestroHorarioMateriasList());
        }
    }

    public List<MestroHorarioMaterias> getHorario() {
        return Collections.unmodifiableList(horario);
    }

    public void setHorario(List<MestroHorarioMaterias> horario) {
        this.horario = horario;
    }

    public String getHora(Date hora) {
        return new SimpleDateFormat("hh:mm a").format(hora);
    }

    public String getGrado(GradoPK gr) {
        String g = "";
        g = gr.getIdgrado() + "° " + (gr.getGradoModalidad().equals("C") ? "TVC Contador"
                : (gr.getGradoModalidad().equals("S") ? "TVC Secretariado"
                : (gr.getGradoModalidad().equals("G") ? "General" : "??")))
                + " Sección " + gr.getGradoSeccion();
        return g;
    }

}
