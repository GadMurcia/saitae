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
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Materia;

/**
 *
 * @author delsas
 */
public class axHorario implements Serializable {

    private static final long serialVersionUID = 1L;

    private Horario horas;
    private Materia lunes;
    private String nomL;
    private Materia martes;
    private String nomM;
    private Materia Miercoles;
    private String nomX;
    private Materia jueves;
    private String nomJ;
    private Materia viernes;
    private String nomV;
    private Materia sabado;
    private String nomS;
    private Materia domingo;
    private String nomD;

    public axHorario() {
    }

    public axHorario(Horario horas, Materia lunes, String nomL, Materia martes, String nomM, Materia Miercoles, String nomX, Materia jueves, String nomJ, Materia viernes, String nomV, Materia sabado, String nomS, Materia domingo, String nomD) {
        this.horas = horas;
        this.lunes = lunes;
        this.nomL = nomL;
        this.martes = martes;
        this.nomM = nomM;
        this.Miercoles = Miercoles;
        this.nomX = nomX;
        this.jueves = jueves;
        this.nomJ = nomJ;
        this.viernes = viernes;
        this.nomV = nomV;
        this.sabado = sabado;
        this.nomS = nomS;
        this.domingo = domingo;
        this.nomD = nomD;
    }

    public Horario getHoras() {
        return horas;
    }

    public void setHoras(Horario horas) {
        this.horas = horas;
    }

    public Materia getLunes() {
        return lunes;
    }

    public void setLunes(Materia lunes) {
        this.lunes = lunes;
    }

    public String getNomL() {
        return nomL;
    }

    public void setNomL(String nomL) {
        this.nomL = nomL;
    }

    public Materia getMartes() {
        return martes;
    }

    public void setMartes(Materia martes) {
        this.martes = martes;
    }

    public String getNomM() {
        return nomM;
    }

    public void setNomM(String nomM) {
        this.nomM = nomM;
    }

    public Materia getMiercoles() {
        return Miercoles;
    }

    public void setMiercoles(Materia Miercoles) {
        this.Miercoles = Miercoles;
    }

    public String getNomX() {
        return nomX;
    }

    public void setNomX(String nomX) {
        this.nomX = nomX;
    }

    public Materia getJueves() {
        return jueves;
    }

    public void setJueves(Materia jueves) {
        this.jueves = jueves;
    }

    public String getNomJ() {
        return nomJ;
    }

    public void setNomJ(String nomJ) {
        this.nomJ = nomJ;
    }

    public Materia getViernes() {
        return viernes;
    }

    public void setViernes(Materia viernes) {
        this.viernes = viernes;
    }

    public String getNomV() {
        return nomV;
    }

    public void setNomV(String nomV) {
        this.nomV = nomV;
    }

    public Materia getSabado() {
        return sabado;
    }

    public void setSabado(Materia sabado) {
        this.sabado = sabado;
    }

    public String getNomS() {
        return nomS;
    }

    public void setNomS(String nomS) {
        this.nomS = nomS;
    }

    public Materia getDomingo() {
        return domingo;
    }

    public void setDomingo(Materia domingo) {
        this.domingo = domingo;
    }

    public String getNomD() {
        return nomD;
    }

    public void setNomD(String nomD) {
        this.nomD = nomD;
    }
}
