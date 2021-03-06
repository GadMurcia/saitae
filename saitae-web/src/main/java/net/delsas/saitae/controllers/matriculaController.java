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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class matriculaController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private NotificacionesFacadeLocal notFL;
    @EJB
    private MatriculaFacadeLocal matriculaFL;
    @EJB
    private GradoFacadeLocal gradoFL;
    @EJB
    private PersonaFacadeLocal personaFL;
    @Inject
    @Push
    private PushContext notificacion;
    private List<Matricula> nuevasMatriculasF;
    private List<Matricula> nuevasMatriculasM;
    private List<Grado> grados;
    private Persona usuario;
    private GradoPK selectedPK;
    private boolean btnGuardar;
    private boolean btnGuardarp2;
    private Persona buscado;
    private Matricula mat;
    private GradoPK seccion;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        List<Integer> tps = getTiposPersonas(usuario, personaFL);
        boolean r = (tps.contains(1) || tps.contains(2) || tps.contains(13));
        if (!r) {
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
            modalidades.forEach((d) -> {
                List<Integer> niveles = gradoFL.getIdPorAñoyModalidad(getAño(), d);
                niveles.forEach((i) -> {
                    grados.add(new Grado(new GradoPK(i, d, "", 0)));
                });
            });
            nuevasMatriculasF = new ArrayList<>();
            nuevasMatriculasM = new ArrayList<>();
            selectedPK = new GradoPK(0, "", "", 0);
            buscado = new Auxiliar().getEstudiante();
            seccion = new GradoPK(0, " ", "", 0);
            mat = new Matricula(0, getAño());
            mat.setGrado(new Grado(seccion));
            btnGuardarp2 = btnGuardar = false;
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

    public void cambiarSeccion() {
        mensaje x;
        matriculaFL.remove(mat);
        mat.setGrado(gradoFL.find(seccion));
        matriculaFL.create(mat);
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                "Cambio de sección exitoso!", "El estudiante " + buscado.getPersonaNombre() + " "
                + buscado.getPersonaApellido() + " ha sido cambiado a la sección "
                + mat.getGrado().getGradoPK().getGradoSeccion()
                + " del " + (mat.getGrado().getGradoPK().getIdgrado() == 1 ? " Primero "
                : mat.getGrado().getGradoPK().getIdgrado() == 2 ? " Segundo"
                : mat.getGrado().getGradoPK().getIdgrado() == 3 ? " Tercero" : "")
                + (mat.getGrado().getGradoPK().getGradoModalidad().equals("C") ? " Contador"
                : mat.getGrado().getGradoPK().getGradoModalidad().equals("S") ? " Secretariado"
                : mat.getGrado().getGradoPK().getGradoModalidad().equals("G") ? " General" : " ")
                + ". Vea la nómina de alumnos para comproobar el cambio."));
        persistirNotificación(
                new mensaje(buscado.getIdpersona(), usuario.getPersonaNombre().split(" ")[0] + " "
                        + usuario.getPersonaApellido().split(" ")[0]
                        + " ha cambiado la sección donde usted estaba inscrito "
                        + "a la sección '" + mat.getGrado().getGradoPK().getGradoSeccion() + "'.",
                        "Se ha registrado un cambio de sección",
                        FacesMessage.SEVERITY_INFO, usuario.getIdpersona(),
                        " "),
                buscado, notFL, notificacion);
        init();
    }

    public void guardar() {
        int s = getSecciones().size() > 0 ? getSecciones().size() : 1;
        int m = nuevasMatriculasM.size() / s;
        int f = nuevasMatriculasF.size() / s;
        List<Matricula> masc = new ArrayList<>();
        List<Matricula> fem = new ArrayList<>();
        List<String> secciones = getSecciones();
        secciones.stream().map((sec) -> {
            procesoSeleccion(f, nuevasMatriculasF, sec, fem);
            return sec;
        }).forEachOrdered((sec) -> {
            procesoSeleccion(m, nuevasMatriculasM, sec, masc);
        });
        while (nuevasMatriculasF.size() > 0) {
            procesoSeleccion(1, nuevasMatriculasF, secciones.get(nuevasMatriculasF.size() - 1), fem);
        }
        while (nuevasMatriculasM.size() > 0) {
            procesoSeleccion(1, nuevasMatriculasM, secciones.get(nuevasMatriculasM.size() - 1), masc);
        }
        nuevasMatriculasF.addAll(fem);
        nuevasMatriculasM.addAll(masc);
        getAllNew().stream().map((matr) -> {
            System.out.println(matr.getGrado().getGradoPK().getGradoSeccion());
            return matr;
        }).map((matr) -> {
            matriculaFL.remove(matr);
            return matr;
        }).map((matr) -> {
            matr.setMatriculaComentario("R");
            return matr;
        }).map((matr) -> {
            matriculaFL.create(matr);
            return matr;
        }).map((matr) -> {
            matriculaFL.edit(matr);
            return matr;
        }).forEachOrdered((matr) -> {
            GradoPK pk = matr.getGrado().getGradoPK();
            persistirNotificación(
                    new mensaje(matr.getMatriculaPK().getIdmatricula(),
                            "Usted ha sido aceptado en el Instituto Nacional 'Texistepeque'! "
                            + "Ha sido inscrito en " + (pk.getIdgrado() == 1 ? "Primero"
                            : (pk.getIdgrado() == 2 ? "Segundo"
                            : (pk.getIdgrado() == 3 ? "Tercero" : "")))
                            + " " + (pk.getGradoModalidad().equals("C") ? "Contador"
                            : (pk.getGradoModalidad().equals("S") ? "Secretariado"
                            : (pk.getGradoModalidad().equals("G") ? "General" : "")))
                            + " Sección " + pk.getGradoSeccion(),
                            "Su solicitud de nuevo ingreso ha sido aceptada",
                            FacesMessage.SEVERITY_INFO, usuario.getIdpersona(),
                            " "),
                    matr.getEstudiante().getPersona(),
                    notFL, notificacion);
        });
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                "Asignación de secciones exitosa!",
                "Todos los datos se han guardado con éxito. "
                + "Vea la nómina de alumnos para ver con detalle la distribución."));
        init();
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
        return getAñoActual();
    }

    public List<Grado> getGrados() {
        return Collections.unmodifiableList(grados);
    }

    public void selectAño(SelectEvent event) {
        nuevasMatriculasF = new ArrayList<>();
        nuevasMatriculasM = new ArrayList<>();
        selectedPK = (GradoPK) event.getObject();
        List<Matricula> nuevasMatriculas = selectedPK == null ? new ArrayList<>()
                : matriculaFL.findAllNewEstudent(selectedPK);
        asignaSexo(nuevasMatriculas);
        btnGuardar = selectedPK != null;
        selectedPK = selectedPK == null ? new GradoPK(0, "", "", 0) : selectedPK;
    }

    private void asignaSexo(List<Matricula> nuevasMatriculas) {
        nuevasMatriculas.forEach((Matricula matr) -> {
            Persona p = matr.getEstudiante() == null
                    ? personaFL.find(matr.getMatriculaPK().getIdmatricula())
                    : matr.getEstudiante().getPersona();
            matr.setEstudiante(matr.getEstudiante() == null ? p.getEstudiante() : matr.getEstudiante());
            if (p.getPersonaSexo()) {
                nuevasMatriculasF.add(matr);
            } else {
                nuevasMatriculasM.add(matr);
            }
        });
    }

    public String getGradosLabel(GradoPK pk) {
        return getGradoNombre(pk);
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> list;
        try {
            (new Auxiliar()).setDui(query, buscado);
            list = personaFL.getPersonaByLikeIdAndType(buscado.getIdpersona(), 8);
            list.forEach((o) -> {
                results.add(o.getPersonaNombre() + " "
                        + o.getPersonaApellido() + "=>" + o.getIdpersona().toString().substring(1));
            });
        } catch (Exception m) {
            System.out.println(m.getMessage());
        }
        return results;
    }

    public void onItemSelect(SelectEvent event) {
        setBuscado(new Persona(0));
        try {
            String x[] = event.getObject().toString().split("=>");
            (new Auxiliar()).setDui(x.length > 1 ? x[1] : x[0], getBuscado());
            setBuscado(personaFL.find(getBuscado().getIdpersona()));
            mat = matriculaFL.find(new MatriculaPK(buscado.getIdpersona(), getAño()));
            btnGuardarp2 = mat != null;
            mat = mat == null ? new Matricula(buscado.getIdpersona(), getAño()) : mat;
            seccion = mat.getGrado() != null ? mat.getGrado().getGradoPK() : new GradoPK(0, "", "", getAño());
        } catch (Exception o) {
            System.out.println("Error en (new prueba()).onItemSelect: " + o.getMessage());
        }
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

    public boolean isBtnGuardarp2() {
        return btnGuardarp2;
    }

    public List<SelectItem> getDepLista(Persona p) {
        return new Auxiliar().getDepartamentoLista(p);
    }

    public List<SelectItem> getMunLista(Persona p) {
        return new Auxiliar().getMunicipioLista(p);
    }

//    public String[] getDependencia(Estudiante e) {
//        return e.getEstudianteDependenciaEconomica().split("¿")[0].split("#");
//    }

//    public String getOtraDependenciaEcon(Estudiante e) {
//        String d[] = e.getEstudianteDependenciaEconomica().split("¿");
//        String ot = d.length > 1 ? d[1] : " ";
//        return ot;
//    }

    public GradoPK getSelectedPK() {
        return selectedPK;
    }

    public void setSelectedPK(GradoPK selectedPK) {
        this.selectedPK = selectedPK;
    }

    public Persona getBuscado() {
        return buscado;
    }

    public void setBuscado(Persona buscado) {
        this.buscado = buscado;
    }

    public void setNie(String nie) {
        new Auxiliar().setDui(nie, buscado);
    }

    public String getNie() {
        return buscado.getIdpersona() > 0 ? buscado.getIdpersona().toString().substring(1) : "";
    }

    public Matricula getMat() {
        return mat;
    }

    public void setMat(Matricula mat) {
        this.mat = mat;
    }

    public List<SelectItem> getModalidades() {
        List<SelectItem> it = new ArrayList<>();
        it.add(new SelectItem(" ", "Selecione"));
        List<String> m = gradoFL.getModalidadPorAño(getAño());
        m.forEach((mo) -> {
            it.add(new SelectItem(mo, mo.equals("C") ? "TVC Contador" : mo.equals("S") ? "TVC Secretariado" : mo.equals("G") ? "General" : " "));
        });
        return it;
    }

    public List<SelectItem> getNiveles() {
        List<SelectItem> it = new ArrayList<>();
        it.add(new SelectItem(" ", "Selecione"));
        List<Integer> m = gradoFL.getIdPorAñoyModalidad(getAño(), seccion.getGradoModalidad());
        m.forEach((mo) -> {
            it.add(new SelectItem(mo, mo == 1 ? "Primero" : mo == 2 ? "Segundo" : mo == 3 ? "Tercero" : " "));
        });
        return it;
    }

    public List<SelectItem> getSeccionesCambio() {
        List<SelectItem> it = new ArrayList<>();
        List<String> m = gradoFL.getSeccionPorAñoModalidadyId(getAño(), seccion.getGradoModalidad(), seccion.getIdgrado());
        m.forEach((mo) -> {
            it.add(new SelectItem(mo, mo));
        });
        return it;
    }

    public GradoPK getSeccion() {
        return seccion;
    }

    public void setSeccion(GradoPK seccion) {
        this.seccion = seccion;
    }

    @Override
    public String getGradoNombre(GradoPK gr) {
        return gr == null ? ""
                : (gr.getIdgrado() + "° " + getModalidadNombre(gr.getGradoModalidad()));
    }

    @Override
    public void onBlour(AjaxBehaviorEvent e) {
        System.out.println(e);
        btnGuardarp2 = !(seccion.getGradoSeccion().isEmpty() || seccion.getGradoSeccion().equals(" "))
                && getNiveles().size() > 1
                && getModalidades().size() > 1;
    }
}
