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

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class matriculaController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private GradoFacadeLocal gradoFL;
    private List<Matricula> nuevasMatriculasF;
    private List<Matricula> nuevasMatriculasM;
    private List<Grado> grados;
    private Persona usuario;
    private String descTabla;
    private GradoPK selectedPK;
    private boolean btnGuardar;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        boolean r = usuario.getTipoPersona().getIdtipoPersona().equals(1) ? false
                : usuario.getTipoPersona().getIdtipoPersona().equals(2) ? false
                : !usuario.getTipoPersona().getIdtipoPersona().equals(13);
        if (r) {
            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            grados = new ArrayList<>();
            List<String> modalidades = gradoFL.getModalidadPorAño(getAño());
            for (String d : modalidades) {
                List<Integer> niveles = gradoFL.getIdPorAñoyModalidad(getAño(), d);
                for (Integer i : niveles) {
                    grados.add(new Grado(new GradoPK(i, d, "", 0)));
                }
            }
            nuevasMatriculasF = new ArrayList<>();
            nuevasMatriculasM = new ArrayList<>();
            descTabla = "";
            selectedPK = new GradoPK(0, "", "", 0);
        }
    }

    private void procesoSeleccion(int f, List<Matricula> source, String sec, List<Matricula> dest) {
        for (int y = 0; y < f; y++) {
            Matricula ff = matriculaFL.find(source.get(0).getMatriculaPK());
            source.remove(ff);
            ff.getGrado().getGradoPK().setGradoSeccion(sec);
            dest.add(ff);
        }
    }

    public void guardar() {
        int s = getSecciones().size() > 0 ? getSecciones().size() : 1;
        int m = nuevasMatriculasM.size() / s;
        int f = nuevasMatriculasF.size() / s;
        List<Matricula> masc = new ArrayList<>();
        List<Matricula> fem = new ArrayList<>();
        List<String> secciones = getSecciones();
        for (String sec : secciones) {
            procesoSeleccion(f, nuevasMatriculasF, sec, fem);
            procesoSeleccion(m, nuevasMatriculasM, sec, masc);
        }
        while (nuevasMatriculasF.size() > 0) {
            procesoSeleccion(1, nuevasMatriculasF, secciones.get(nuevasMatriculasF.size()-1), fem);
        }
        while (nuevasMatriculasM.size() > 0) {
            procesoSeleccion(1, nuevasMatriculasM, secciones.get(nuevasMatriculasM.size()-1), masc);
        }
        nuevasMatriculasF.addAll(fem);
        nuevasMatriculasM.addAll(masc);
        for (Matricula mat : getAllNew()) {
            System.out.println(mat.getEstudiante().getPersona().getPersonaNombre()
                    + " matriculado en seccion "
                    + (mat.getEstudiante().getPersona().getPersonaSexo() ? " Femenino " : " Masculino ")
                    + mat.getGrado().getGradoPK().getGradoSeccion());
        }

    }

    public List<Matricula> getAllNew() {
        List<Matricula> newE = new ArrayList<>();
        newE.addAll(nuevasMatriculasF);
        newE.addAll(nuevasMatriculasM);
        return newE;
    }

    public List<Matricula> getNuevasMatriculasF() {
        return Collections.unmodifiableList(nuevasMatriculasF);
    }

    public void setNuevasMatriculasF(List<Matricula> nuevasMatriculasF) {
        this.nuevasMatriculasF = nuevasMatriculasF;
    }

    private int getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public void setGrados(List<Grado> grados) {
        this.grados = grados;
    }

    public void selectAño(SelectEvent event) {
        nuevasMatriculasF = new ArrayList<>();
        nuevasMatriculasM = new ArrayList<>();
        selectedPK = (GradoPK) event.getObject();
        descTabla = selectedPK != null ? getGradosLabel(selectedPK) : "";
        List<Matricula> nuevasMatriculas = selectedPK == null ? new ArrayList<Matricula>()
                : matriculaFL.findAllNewEstudent(selectedPK);
        asignaSexo(nuevasMatriculas);
        btnGuardar = selectedPK != null;
        selectedPK = selectedPK == null ? new GradoPK(0, "", "", 0) : selectedPK;
    }

    private void asignaSexo(List<Matricula> nuevasMatriculas) {
        for (Matricula mat : nuevasMatriculas) {
            if (mat.getEstudiante().getPersona().getPersonaSexo()) {
                nuevasMatriculasF.add(mat);
            } else {
                nuevasMatriculasM.add(mat);
            }
        }
    }

    public String getGradosLabel(GradoPK pk) {
        String l = "";
        l += pk.getIdgrado() == 1
                ? "Primero "
                : pk.getIdgrado() == 2
                ? "Segundo "
                : pk.getIdgrado() == 3
                ? "Tercero " : "";
        l += pk.getGradoModalidad().equals("C")
                ? "T.V.C Contador"
                : pk.getGradoModalidad().equals("G")
                ? "General"
                : pk.getGradoModalidad().equals("S")
                ? "T.V.C Secretariado" : "";
        return l;
    }

    public String getDescTabla() {
        return descTabla;
    }

    public void setDescTabla(String descTabla) {
        this.descTabla = descTabla;
    }

    public List<String> getSecciones() {
        return gradoFL.getSeccionPorAñoModalidadyId(getAño(), selectedPK.getGradoModalidad(), selectedPK.getIdgrado());
    }

    public List<Matricula> getNuevasMatriculasM() {
        return Collections.unmodifiableList(nuevasMatriculasM);
    }

    public void setNuevasMatriculasM(List<Matricula> nuevasMatriculasM) {
        this.nuevasMatriculasM = nuevasMatriculasM;
    }

    public boolean isBtnGuardar() {
        return btnGuardar;
    }

    public void setBtnGuardar(boolean btnGuardar) {
        this.btnGuardar = btnGuardar;
    }
    
    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }
}
