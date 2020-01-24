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
import java.util.List;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.Persona;

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

    public static axHorario llenar(Horario h, GradoPK pk, MestroHorarioMateriasFacadeLocal mhmFL) {
        axHorario x = new axHorario();
        x.setHoras(h);
        List<MestroHorarioMaterias> mhmList = mhmFL.findByIdHoraAndGradopk(h.getIdhorario(), pk);
        for (MestroHorarioMaterias mhm : mhmList) {
            switch (mhm.getDiasEstudio().getIdDias()) {
                case 1:
                    x.setLunes(mhm.getMateria());
                    x.setNomL(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 2:
                    x.setMartes(mhm.getMateria());
                    x.setNomM(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 3:
                    x.setMiercoles(mhm.getMateria());
                    x.setNomX(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 4:
                    x.setJueves(mhm.getMateria());
                    x.setNomJ(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 5:
                    x.setViernes(mhm.getMateria());
                    x.setNomV(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 6:
                    x.setSabado(mhm.getMateria());
                    x.setNomS(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 7:
                    x.setDomingo(mhm.getMateria());
                    x.setNomD(" (" + getNomgreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
            }
        }
        return x;
    }

    public static axHorario llenar(Integer año, Horario h, Integer idMaestro, MestroHorarioMateriasFacadeLocal mhmFL) {
        axHorario x = new axHorario();
        x.setHoras(h);
        for (MestroHorarioMaterias mhm : mhmFL.findByIdHoraAndMaestro(año, h.getIdhorario(), idMaestro)) {
            switch (mhm.getDiasEstudio().getIdDias()) {
                case 1:
                    x.setLunes(mhm.getMateria());
                    x.setNomL(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 2:
                    x.setMartes(mhm.getMateria());
                    x.setNomM(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 3:
                    x.setMiercoles(mhm.getMateria());
                    x.setNomX(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 4:
                    x.setJueves(mhm.getMateria());
                    x.setNomJ(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 5:
                    x.setViernes(mhm.getMateria());
                    x.setNomV(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 6:
                    x.setSabado(mhm.getMateria());
                    x.setNomS(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 7:
                    x.setDomingo(mhm.getMateria());
                    x.setNomD(" (" + getGradoNomgre(mhm.getGrado().getGradoPK()) + ") ");
                    break;
            }
        }
        return x;
    }

    public static String getGradoNomgre(GradoPK gr) {
        String g = "";
        g = gr.getIdgrado() + "° " + (gr.getGradoModalidad().equals("C") ? "TVC Contador"
                : (gr.getGradoModalidad().equals("S") ? "TVC Secretariado"
                : (gr.getGradoModalidad().equals("G") ? "General" : "??")))
                + " Sección " + gr.getGradoSeccion();
        return g;
    }

    public static String getNomgreCortoPersona(Persona p) {
        return p == null ? "" : p.getPersonaNombre().split(" ")[0] + " " + p.getPersonaApellido().split(" ")[0];
    }

    public static String getNomgreCompletoPersona(Persona p) {
        return p == null ? "" : p.getPersonaNombre() + " " + p.getPersonaApellido();
    }

}
