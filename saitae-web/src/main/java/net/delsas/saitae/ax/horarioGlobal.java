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
package net.delsas.saitae.ax;

import java.io.Serializable;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.Horario;

/**
 * CLASE PARA LA ENMARCACIÓN DE HORARIOS INSTITUCIONALES
 *
 * @author delsas
 */
public class horarioGlobal implements Serializable {

    private String idHorarioGlobal;
    private Horario hora;
    private DiasEstudio dia;
    private secciones generales;
    private secciones comercios;

    public horarioGlobal() {
    }

    public horarioGlobal(String idHorarioGlobal, Horario hora, DiasEstudio dia) {
        this.idHorarioGlobal = idHorarioGlobal;
        this.hora = hora;
        this.dia = dia;
        generales = new secciones();
        comercios = new secciones();
    }

    public Horario getHora() {
        return hora;
    }

    public void setHora(Horario hora) {
        this.hora = hora;
    }

    public DiasEstudio getDia() {
        return dia;
    }

    public void setDia(DiasEstudio dia) {
        this.dia = dia;
    }

    public String getIdHorarioGlobal() {
        return idHorarioGlobal;
    }

    public void setIdHorarioGlobal(String idHorarioGlobal) {
        this.idHorarioGlobal = idHorarioGlobal;
    }

    public secciones getGenerales() {
        return generales;
    }

    public void setGenerales(secciones generales) {
        this.generales = generales;
    }

    public secciones getComercios() {
        return comercios;
    }

    public void setComercios(secciones comercios) {
        this.comercios = comercios;
    }

    @Override
    public String toString() {
        return "horarioGlobal{" + "hora=" + hora + ", dia=" + dia + ", generales=" + generales + ", comercios=" + comercios + '}';
    }
}
