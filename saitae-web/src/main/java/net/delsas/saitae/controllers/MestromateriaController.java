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
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.MestroHorarioMaterias;


/**
 *
 * @author gabriela
 */
@Named(value = "mestromateriaController")

@ViewScoped
public class MestromateriaController implements Serializable{
   private static final long serialVersionUID = 1L;

   //Maestro Horario Materia
   @EJB
   private MestroHorarioMateriasFacadeLocal mhmFL;
   private MestroHorarioMaterias mhm;
   private List<MestroHorarioMaterias> listmhm;
   
   //Materia
   @EJB
   private MateriaFacadeLocal materiaFL;
   private List<Materia> listmateria;
   private Materia materia;
   
   //Grado 
   @EJB
   private GradoFacadeLocal gradoFL;
   private List<Grado> listgrado;
   private Grado grado;
   
   //Maestro
   @EJB
   private MaestroFacadeLocal maestroFL;
   private List<Maestro> listmaestro;
   private Maestro maestro;
   
   @EJB
   private HorarioFacadeLocal horarioFL;
   private Horario horario;
   private List<Horario> listhorario;
   
   
   
   
   @PostConstruct
    public void init() {
     listmhm = mhmFL.findAll();
     listmaestro = maestroFL.findAll();
     listgrado = gradoFL.findAll();
     listmateria = materiaFL.findAll();
     maestro = new Maestro();
     grado = new Grado();
     mhm = new MestroHorarioMaterias();
     materia = new Materia(0, "");
     
       
        
    }
    

    public MestroHorarioMaterias getMhm() {
        return mhm;
    }

    public void setMhm(MestroHorarioMaterias mhm) {
        this.mhm = mhm;
    }

    public List<Materia> getListmateria() {
        return listmateria;
    }

    public void setListmateria(List<Materia> listmateria) {
        this.listmateria = listmateria;
    }

    public List<Grado> getListgrado() {
        return listgrado;
    }

    public void setListgrado(List<Grado> listgrado) {
        this.listgrado = listgrado;
    }

    public List<Maestro> getListmaestro() {
        return listmaestro;
    }

    public void setListmaestro(List<Maestro> listmaestro) {
        this.listmaestro = listmaestro;
    }

    public List<MestroHorarioMaterias> getListmhm() {
        return listmhm;
    }

    public void setListmhm(List<MestroHorarioMaterias> listmhm) {
        this.listmhm = listmhm;
    }

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public List<Horario> getListhorario() {
        return listhorario;
    }

    public void setListhorario(List<Horario> listhorario) {
        this.listhorario = listhorario;
    }
    
    
}
