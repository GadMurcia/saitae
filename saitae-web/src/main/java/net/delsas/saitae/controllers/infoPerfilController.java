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
package net.delsas.saitae.controllers;

import java.io.Serializable;
import java.lang.invoke.MethodHandles;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.CapacitacionesFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoEspecialidadesFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoSueldosFacadeLocal;
import net.delsas.saitae.entities.Capacitaciones;
import net.delsas.saitae.entities.Documentos;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoEspecialidades;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipoSueldos;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class infoPerfilController extends Auxiliar implements Serializable {
    
    private Persona usuario;
    private Matricula m;
    private boolean maestro, estudiante, matriculado, representante, editCap;
    private String contra, contra1, contra2;
    private Capacitaciones cap;
    private List<String> modalidades;
    private List<Integer> niveles;
    private List<TipoSueldos> sueldos;
    private List<TipoEspecialidades> especialidades;
    private List<TipoPersona> cargos;
    
    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private TipoEspecialidadesFacadeLocal teFL;
    @EJB
    private TipoSueldosFacadeLocal tsFL;
    @EJB
    private TipoPersonaFacadeLocal tpFL;
    @EJB
    private CapacitacionesFacadeLocal capFL;
    
    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
        estudiante = usuario.getTipoPersona().getIdtipoPersona().equals(8);
        maestro = usuario.getTipoPersona().getIdtipoPersona().equals(4);
        representante = usuario.getTipoPersona().getIdtipoPersona().equals(9);
        contra = "";
        contra1 = "";
        contra2 = "";
        
        if (maestro) {
            especialidades = teFL.findAll();
            sueldos = tsFL.findAll();
        }
        if (estudiante) {
            matriculado = mFL.find(new MatriculaPK(usuario.getIdpersona(), getAñoActual())) != null;
            m = new Matricula(new MatriculaPK(usuario.getIdpersona(), getAñoActual()));
            m.setEstudiante(usuario.getEstudiante());
            m.setGrado(new Grado(new GradoPK(0, "", "", getAñoActual())));
            List<Matricula> mctr = mFL.findByIdmatricula(usuario.getIdpersona());
            if (usuario.getEstudiante().getDocumentos() == null) {
                usuario.getEstudiante().setDocumentos(new Documentos(usuario.getIdpersona()));
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("usuario");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("usuario", usuario);
            }
            if (!mctr.equals(usuario.getEstudiante().getMatriculaList())) {
                usuario.getEstudiante().setMatriculaList(mctr);
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("usuario");
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("usuario", usuario);
            }
            if (!matriculado) {
                modalidades = gFL.getModalidadPorAño(getAñoActual());
                niveles = new ArrayList<>();
            }
        }
    }
    
    public Persona getUsuario() {
        return usuario;
    }
    
    public void setUsuario(Persona usuario) {
        this.usuario = usuario;
    }
    
    public Matricula getM() {
        return m;
    }
    
    public void setM(Matricula m) {
        this.m = m;
    }
    
    public boolean isMaestro() {
        return maestro;
    }
    
    public void setMaestro(boolean maestro) {
        this.maestro = maestro;
    }
    
    public boolean isEstudiante() {
        return estudiante;
    }
    
    public void setEstudiante(boolean estudiante) {
        this.estudiante = estudiante;
    }
    
    public List<SelectItem> getDepList() {
        return new Auxiliar().getDepartamentoLista(usuario);
    }
    
    public List<SelectItem> getMunList() {
        return new Auxiliar().getMunicipioLista(usuario);
    }
    
    public String getDepto() {
        return usuario.getPersonaLugarNac().split("#")[0];
    }
    
    public String getMuni() {
        return usuario.getPersonaLugarNac().split("#")[1];
    }
    
    public void setDepto(String dep) {
        String mu = getMuni();
        usuario.setPersonaLugarNac(dep + "#" + mu);
    }
    
    public void setMuni(String mun) {
        String d = getDepto();
        usuario.setPersonaLugarNac(d + "#" + mun);
    }
    
    public void guardarPersona() {
        pFL.edit(usuario);
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios realizados", "Los datos se han actualizado"));
        PrimeFaces.current().ajax().update("form0:msgs");
    }
    
    @Override
    public void onBlour(AjaxBehaviorEvent e) {
        switch (e.getComponent().getId()) {
            case "modal":
                m.getGrado().getGradoPK().setIdgrado(0);
                niveles = gFL.getIdPorAñoyModalidad(getAñoActual(), m.getGrado().getGradoPK().getGradoModalidad());
                break;
            case "niv":
                Matricula mc = mFL.find(new MatriculaPK(usuario.getIdpersona(), getAñoActual() - 1));
                m.setMatriculaRepite(mc == null ? false
                        : (mc.getGrado().getGradoPK().getGradoModalidad().equals(m.getGrado().getGradoPK().getGradoModalidad())
                        && mc.getGrado().getGradoPK().getIdgrado() == m.getGrado().getGradoPK().getIdgrado()));
                break;
        }
    }
    
    public void setDependencia(String[] dep) {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        String de = "";
        for (Integer i = 0; i < dep.length; i++) {
            if (i > 0) {
                de += "#";
            }
            de += dep[i];
        }
        de += "¿" + ot;
        usuario.getEstudiante().setEstudianteDependenciaEconomica(de);
    }
    
    public String[] getDependencia() {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot[] = d[0].split("#");
        return ot;
    }
    
    public boolean isOtraDependencia() {
        boolean f = false;
        String[] c = getDependencia();
        for (String o : c) {
            f = o.equals("Otro");
        }
        if (!f) {
            setOtraDependenciaEcon("");
        }
        return f;
    }
    
    public String getOtraDependenciaEcon() {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : "";
        return ot;
    }
    
    public void setOtraDependenciaEcon(String otrDependencia) {
        String d[] = usuario.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String dt = d[0];
        usuario.getEstudiante().setEstudianteDependenciaEconomica(dt + ((otrDependencia == null || otrDependencia.isEmpty())
                ? "" : "¿" + otrDependencia));
    }
    
    public String getContra() {
        return contra;
    }
    
    public void setContra(String contra) {
        this.contra = contra;
    }
    
    public String getContra2() {
        return contra2;
    }
    
    public void setContra2(String contra2) {
        this.contra2 = contra2;
    }
    
    public void acContra() {
        FacesMessage ms = null;
        if (contra == null && contra.isEmpty()) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "Debe ingresar la contraseña actual");
        } else if (!usuario.getPersonaContrasenya().equals(DigestUtils.md5Hex(contra))) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "La contraseña actual ingresada difiere de la real");
        } else if (!contra1.equals(contra2)) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error", "La contraseña nueva debe coincidir");
        } else {
            usuario.setPersonaContrasenya(DigestUtils.md5Hex(contra1));
            guardarPersona();
        }
        if (ms != null) {
            FacesContext.getCurrentInstance().addMessage("form0:msgs", ms);
            PrimeFaces.current().ajax().update("form0:msgs");
        }
    }
    
    public String getContra1() {
        return contra1;
    }
    
    public void setContra1(String contra1) {
        this.contra1 = contra1;
    }
    
    public String getNombre(Persona p) {
        return getNombreCompletoPersona(p);
    }
    
    public String getNombreGrado(GradoPK pk) {
        return getGradoNombre(pk);
    }
    
    public boolean isMatriculado() {
        return matriculado;
    }
    
    public void setMatriculado(boolean matriculado) {
        this.matriculado = matriculado;
    }
    
    public List<String> getModalidades() {
        return modalidades;
    }
    
    public void setModalidades(List<String> modalidades) {
        this.modalidades = modalidades;
    }
    
    public List<Integer> getNiveles() {
        return niveles;
    }
    
    public void setNiveles(List<Integer> niveles) {
        this.niveles = niveles;
    }
    
    public void matricular() {
        Matricula mc = mFL.find(new MatriculaPK(usuario.getIdpersona(), getAñoActual() - 1));
        boolean repite = m.getMatriculaRepite();
        m.getGrado().getGradoPK().setGradoSeccion(repite ? "A"
                : (mc == null ? "A" : mc.getGrado().getGradoPK().getGradoSeccion()));
        m.setMatriculaComentario(repite ? "N" : (mc == null ? "N" : "R"));
        usuario.getEstudiante().getMatriculaList().add(m);
        guardarPersona();
        if (mFL.find(new MatriculaPK(usuario.getIdpersona(), getAñoActual())) == null) {
            mFL.create(mc);
            guardarPersona();
        }
        init();
    }
    
    public boolean isRepresentante() {
        return representante;
    }
    
    public void setRepresentante(boolean representante) {
        this.representante = representante;
    }
    
    public List<TipoSueldos> getSueldos() {
        return sueldos;
    }
    
    public void setSueldos(List<TipoSueldos> sueldos) {
        this.sueldos = sueldos;
    }
    
    public List<TipoEspecialidades> getEspecialidades() {
        return especialidades;
    }
    
    public void setEspecialidades(List<TipoEspecialidades> especialidades) {
        this.especialidades = especialidades;
    }
    
    public List<TipoPersona> getCargos() {
        List<Integer> tps = getTiposPersonas(usuario);
        cargos = new ArrayList<>();
        if (tps.size() > 1) {
            tps.forEach((c) -> {
                cargos.add(tpFL.find(c));
            });
        }
        return cargos;
    }
    
    public void partida(FileUploadEvent f) {
        partida(f, usuario.getEstudiante());
    }
    
    public boolean getHayPartida() {
        return getHayPartida(usuario.getEstudiante());
    }
    
    public String getDocPartida() {
        return getDocPartida(usuario.getEstudiante());
    }
    
    public void certificado(FileUploadEvent f) {
        certificado(f, usuario.getEstudiante());
    }
    
    public boolean getHayCertifcado() {
        return getHayCertifcado(usuario.getEstudiante());
    }
    
    public String getDocCertificado() {
        return getDocCertificado(usuario.getEstudiante());
    }
    
    public void conducta(FileUploadEvent f) {
        conducta(f, usuario.getEstudiante());
    }
    
    public boolean getHayConducta() {
        return getHayConducta(usuario.getEstudiante());
    }
    
    public String getDocConducta() {
        return getDocConducta(usuario.getEstudiante());
    }
    
    public void dui(FileUploadEvent f) {
        dui(f, usuario.getEstudiante());
    }
    
    public boolean getHayDui() {
        return getHayDui(usuario.getEstudiante());
    }
    
    public String getDocDui() {
        return getDocDui(usuario.getEstudiante());
    }
    
    public void notas(FileUploadEvent f) {
        notas(f, usuario.getEstudiante());
    }
    
    public boolean getHayNotas() {
        return getHayNotas(usuario.getEstudiante());
    }
    
    public String getDocNotas() {
        return getDocNotas(usuario.getEstudiante());
    }
    
    public Capacitaciones getCap() {
        return cap;
    }
    
    public void setCap(Capacitaciones cap) {
        this.cap = cap;
    }
    
    public boolean getVerCap() {
        return usuario != null
                && !usuario.getTipoPersona().getIdtipoPersona().equals(8)
                && !usuario.getTipoPersona().getIdtipoPersona().equals(9);
    }
    
    public void guardar(int v) {
        FacesMessage fm = null;
        switch (v) {
            case 0://agregar
                try {
                    capFL.create(cap);
                    fm = new FacesMessage(FacesMessage.SEVERITY_INFO, "Información de capacitación",
                            "La capacitación se agregó con éxito.");
                } catch (EJBException e) {
                    fm = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Información de capacitación",
                            "La capacitación no se pudo agregar. Revise que no haya registrado ya otra capacitación para el día "
                            + getDateToString(cap.getCapacitacionesPK().getFechaCapacitaciones()) + ".");
                }
                break;
            case 1://eliminar
                capFL.remove(cap);
                fm = new FacesMessage(FacesMessage.SEVERITY_INFO, "Información de capacitación",
                        "La capacitación se quitó con éxito.");
                break;
            default:
        }
        cap = null;
        editCap = false;
        if (fm != null) {
            PrimeFaces.current().executeScript("PF('Dcap0').hide();");
            FacesContext.getCurrentInstance().addMessage("form0:msgs", fm);
            PrimeFaces.current().ajax().update("form0:msgs");
        }
    }
    
    public void onAddNew() {
        cap = new Capacitaciones(usuario.getIdpersona(), new Date());
        editCap = true;
    }
    
    public boolean isEditCap() {
        return editCap;
    }
    
    public void setEditCap(boolean editCap) {
        this.editCap = editCap;
    }
    
    public void onSelectRow(SelectEvent ev) {
        
    }
    
    public List<Capacitaciones> getCapacitaciones() {
        return capFL.findByIdPersona(usuario.getIdpersona());
    }
    
}
