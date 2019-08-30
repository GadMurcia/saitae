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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.aux.mensaje;
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
import net.delsas.saitae.entities.MestroHorarioMateriasPK;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.SelectEvent;
import javax.inject.Inject;
import net.delsas.saitae.entities.GradoPK;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;

/**
 *
 * @author gabriela
 */
@Named(value = "mestromateriaController")

@ViewScoped
public class MestromateriaController implements Serializable {

    private static final long serialVersionUID = 1L;

    //Maestro Horario Materia
    @EJB
    private MestroHorarioMateriasFacadeLocal mhmFL;
    private MestroHorarioMaterias mhm;
    private MestroHorarioMaterias selectmhm = new MestroHorarioMaterias();
    private MestroHorarioMaterias control = new MestroHorarioMaterias();
    private MestroHorarioMateriasPK mhmPK;
    private String diaSemanal;
    private List<MestroHorarioMaterias> listmhm;
    boolean btnCreate = true;
    boolean btnEdit = false;
    //boolean btnDelete = false;

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

    private Persona usuario;
    private Maestro maestroseleccionado;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        listmhm = mhmFL.findAll();
        listmaestro = maestroFL.findAll();
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        listgrado = gradoFL.getPorAñoYActivo(year);
        listmateria = materiaFL.findAll();
        listhorario = horarioFL.findAll();
        maestro = new Maestro();
        grado = new Grado();
        mhm = new MestroHorarioMaterias();
        materia = new Materia(0, "");
        mhmPK = new MestroHorarioMateriasPK();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");

    }

    public List<MestroHorarioMaterias> obtenerTodos() {
        List<MestroHorarioMaterias> salida = new ArrayList<>();
        try {
            if (mhmFL != null) {
                salida = mhmFL.findAll();
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
        return salida;
    }

    public void onRowSelect(SelectEvent event) {
        this.mhm = this.selectmhm;
        this.control = mhmFL.find(selectmhm.getMestroHorarioMateriasPK());
       // this.diaSemanal = this.selectmhm.getMestroHorarioMateriasPK().getDiaSemana();
        btnCreate = false;
        btnEdit = true;
        //btnDelete = true;
    }

    public void crear() {
        try {

            if (this.mhm != null && this.control != null) {

                mhmPK.setIdMaestro(mhm.getMaestro().getIdmaestro());
                mhmPK.setIdMateria(mhm.getMateria().getIdmateria());
                mhmPK.setIdHorario(mhm.getHorario().getIdhorario());
                mhmPK.setSeccionGrado(mhm.getGrado().getGradoPK().getGradoSeccion());
                mhmPK.setAñoGrado(mhm.getGrado().getGradoPK().getGradoAño());
                mhmPK.setGradoModalidad(mhm.getGrado().getGradoPK().getGradoModalidad());
               // mhmPK.setDiaSemana(diaSemanal);
                mhmPK.setIdGrado(mhm.getGrado().getGradoPK().getIdgrado());
                boolean modifica = false;
                
//                                mhm.setMestroHorarioMateriasPK(mhmPK);
//                if(btnEdit == true){
////                     this.mhmFL.remove(control);
//                     this.mhmFL.edit(this.mhm);
//                    modifica = true;
//                    btnEdit = false;
//                    FacesContext.getCurrentInstance().addMessage(null,
//                        new FacesMessage(FacesMessage.SEVERITY_ERROR, "CREAR", null));
//                }
//                
//                if(btnCreate == true){
//                    this.mhmFL.create(this.mhm);
//                    FacesContext.getCurrentInstance().addMessage(null,
//                        new FacesMessage(FacesMessage.SEVERITY_WARN, "EDIT", null));
//                }
//                
//                //volver las variables al estado inicial
//                btnEdit = false;
//                btnCreate = true;

                if (control.getMestroHorarioMateriasPK() != null) {
                    //logs de datos
                    System.err.println(mhm);
                    System.err.println(control);
                    System.err.println(mhmPK);

                    //Eliminar registro de la base de datos
                    this.mhmFL.remove(mhm);
                    
                    //Setter una nueva llave foranea
                    mhm.setMestroHorarioMateriasPK(mhmPK);
                    //volver a crear el registro
                    this.mhmFL.edit(this.mhm);
                    modifica = true;
                }
                else{
                    mhm.setMestroHorarioMateriasPK(mhmPK);
                    this.mhmFL.create(this.mhm);
                }
                
                String cuerpo = usuario.getPersonaNombre() + " " + usuario.getPersonaApellido()
                        + " ha " + ((modifica) ? "modificado" : "agregado") + " la materia " + mhm.getMateria().getMateriaNombre();
                       
                        
                this.limpiar();
                this.push(new mensaje(0, usuario.getIdpersona(), "??",
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Asignación de Horario ", cuerpo)).toString());
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Creado con Exito!", null));
            } else {
                System.err.println("La entity esta vacia revisar");
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public void selectCampo(SelectEvent event) {

        Object id = event.getObject();
        String componente = event.getComponent().getId();
        if (id != null && !id.toString().isEmpty()) {
            switch (componente) {
                case "maestro":

                    maestroseleccionado = (Maestro) id;
                    mhmPK.setIdMaestro(maestroseleccionado.getIdmaestro());
                    break;
                case "materia":
                    mhmPK.setIdMateria(((Materia) id).getIdmateria());
                    break;
                case "horario":
                    mhmPK.setIdHorario(((Horario) id).getIdhorario());
                    break;
                case "dia":
                  //  mhmPK.setDiaSemana(id.toString());
                    break;
                case "grado":
                    GradoPK pk = ((Grado) id).getGradoPK();
                    mhmPK.setAñoGrado(pk.getGradoAño());
                    mhmPK.setIdGrado(pk.getIdgrado());
                    mhmPK.setSeccionGrado(pk.getGradoSeccion());
                    mhmPK.setGradoModalidad(pk.getGradoModalidad());
                    control = new MestroHorarioMaterias();
                    break;

            }

        }

        // PrimeFaces.current().ajax().update("formulario");
    }

//     public void update(){
//        try {
//            
//            if (this.mhm != null && this.mhmFL != null) {
//                
//                    this.mhmFL.edit(this.mhm);
//                    this.limpiar();
//                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Editado con Exito!", null));
//            } else {
//                System.err.println("La entity esta vacia revisar");
//            }
//        } catch (Exception e) {
//            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
//        }
//    }
    public void limpiar() {
        try {
            this.mhm = new MestroHorarioMaterias(new MestroHorarioMateriasPK());
            this.selectmhm = new MestroHorarioMaterias(new MestroHorarioMateriasPK());
            btnCreate = true;
            btnEdit = false;
            //btnDelete = false;
            control = null;
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
    }

    public MestroHorarioMaterias getMhm() {
        return mhm;
    }

    public void setMhm(MestroHorarioMaterias mhm) {
        this.mhm = mhm;
    }

    public List<Materia> getListmateria() {
        return Collections.unmodifiableList(listmateria);
    }

    public void setListmateria(List<Materia> listmateria) {
        this.listmateria = listmateria;
    }

    public List<Grado> getListgrado() {
        return Collections.unmodifiableList(listgrado);
    }

    public void setListgrado(List<Grado> listgrado) {
        this.listgrado = listgrado;
    }

    public List<Maestro> getListmaestro() {
        return Collections.unmodifiableList(listmaestro);
    }

    public void setListmaestro(List<Maestro> listmaestro) {
        this.listmaestro = listmaestro;
    }

    public List<MestroHorarioMaterias> getListmhm() {
        return Collections.unmodifiableList(listmhm);
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
        return Collections.unmodifiableList(listhorario);
    }

    public void setListhorario(List<Horario> listhorario) {
        this.listhorario = listhorario;
    }

    public String getDiaSemanal() {
        return diaSemanal;
    }

    public void setDiaSemanal(String diaSemanal) {
        this.diaSemanal = diaSemanal;
    }

    public MestroHorarioMateriasPK getMhmPK() {
        return mhmPK;
    }

    public void setMhmPK(MestroHorarioMateriasPK mhmPK) {
        this.mhmPK = mhmPK;
    }

    public MestroHorarioMaterias getSelectmhm() {
        return selectmhm;
    }

    public void setSelectmhm(MestroHorarioMaterias selectmhm) {
        this.selectmhm = selectmhm;
    }

    public boolean isBtnCreate() {
        return btnCreate;
    }

    public void setBtnCreate(boolean btnCreate) {
        this.btnCreate = btnCreate;
    }

    public boolean isBtnEdit() {
        return btnEdit;
    }

    public void setBtnEdit(boolean btnEdit) {
        this.btnEdit = btnEdit;
    }

    @Inject
    @Push
    private PushContext notificacion;

    private void push(String mensaje) {
        notificacion.send(mensaje);
        System.out.println("mensaje del push recurso enviado: " + mensaje);
    }

}
