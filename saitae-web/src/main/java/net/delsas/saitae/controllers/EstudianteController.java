/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.prueba;
import net.delsas.saitae.beans.DocumentosFacadeLocal;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Documentos;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.UploadedFile;

/**
 *
 * @author delsas
 */
@Named(value = "estudianteController")
@RequestScoped
public class EstudianteController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private EstudianteFacadeLocal efl;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private MatriculaFacadeLocal mfl;
    @EJB
    private DocumentosFacadeLocal dfl;
    @EJB
    private TipoPersonaFacadeLocal tpfl;

    private Persona est1;
    private Persona resp1;
    private Persona padre;
    private Persona madre;
    private Estudiante est;
    private Estudiante resp;
    private Matricula m;
    private Documentos docs;
    private prueba aux;

    @PostConstruct
    public void init() {
        aux = new prueba();
        est1 = aux.getEstudiante();
        resp1 = aux.getRepresentante();
        padre = aux.getPadre();
        madre = aux.getMadre();
        est = est1.getEstudiante();
        resp = resp1.getEstudiante();
        m = new Matricula();
        m.setGrado(new Grado(new GradoPK(0, "", "", getAñoMatricula().getYear()+1900)));
        docs = new Documentos();
    }

    public void preinit() {
        FacesContext context = FacesContext.getCurrentInstance();
        FacesMessage msj = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
        if (msj != null) {
            context.addMessage("growl", msj);
            context.getExternalContext().getSessionMap().remove("mensaje");
        }
    }

    public void busca() {
        Matricula m1 = mfl.find(new MatriculaPK(est1.getIdpersona() != null ? est1.getIdpersona() : 0,
                getAñoMatricula().getYear()+1900));
        if (m1 != null && m1.getEstudiante().getEstudianteEsEstudiante() && est.getIdestudiante() == null) {
            est = m1.getEstudiante();
            est1 = est.getPersona();
            resp = est.getEstudianteRepresentante();
            resp1 = resp.getPersona();
            madre = est.getEstudianteMadre();
            padre = est.getEstudiantePadre();
            //m = f.getMatriculaCollection().toArray();
            m = m1;
            docs = est.getDocumentos() != null ? est.getDocumentos() : new Documentos();
        }
    }

    public void guardar() {
        madre.setPersonaActivo(false);
        madre.setPersonaContrasenya(DigestUtils.md5Hex(this.getDuiMadre()));
        madre.setTipoPersona(tpfl.find(10));
        persist(madre, madre.getIdpersona());

        padre.setPersonaContrasenya(DigestUtils.md5Hex(getDuiPadre()));
        padre.setTipoPersona(tpfl.find(10));
        padre.setPersonaActivo(false);
        persist(padre, padre.getIdpersona());

        resp.setIdestudiante(resp1.getIdpersona());
        resp.setEstudianteEsEstudiante(false);
        resp.setPersona(resp1);
        resp1.setTipoPersona(tpfl.find(9));
        resp1.setPersonaContrasenya(DigestUtils.md5Hex(getDuiResponsable()));
        resp1.setPersonaActivo(true);
        resp.setEstudianteFormaTrabajo((resp.getEstudianteFormaTrabajo() == null ? "Desempleado" : resp.getEstudianteFormaTrabajo()));
        persist(resp1, resp1.getIdpersona());
        persist(resp, resp.getIdestudiante());

        est.setIdestudiante(est1.getIdpersona());
        est.setEstudianteEscolaridad("Noveno Grado");
        est.setEstudianteEsEstudiante(true);
        est.setEstudianteRepresentante(resp);
        est.setEstudiantePadre(padre);
        est.setEstudianteMadre(madre);
        est.setEstudianteParentescoRepresentante(resp.getEstudianteParentescoRepresentante());
        est.setEstudianteDependenciaEconomica(est.getEstudianteDependenciaEconomica() + "*" + (getOtradependencia() == null ? "" : getOtradependencia()));
        est1.setTipoPersona(tpfl.find(8));
        est.setPersona(est1);
        est1.setPersonaContrasenya(DigestUtils.md5Hex(getNie()));
        est1.setPersonaActivo(true);
        persist(est1, est1.getIdpersona());
        est1.setEstudiante(est);
        est.setEstudianteFormaTrabajo((est.getEstudianteFormaTrabajo() == null ? "Estudiante" : est.getEstudianteFormaTrabajo()));
        persist(est, est.getIdestudiante());

        m.setEstudiante(est);
        m.setMatriculaPK(new MatriculaPK(est.getIdestudiante(), this.getAñoMatricula().getYear()+1900));
        m.getGrado().getGradoPK().setGradoSeccion("C");
        persist(m, m.getMatriculaPK().getIdmatricula());

        if (docs.getEstudianteDocCertificado() != null | docs.getEstudianteDocConducta() != null
                | docs.getEstudianteDocPartida() != null) {
            docs.setEstudiante(est);
            docs.setIddocumentos(est.getIdestudiante());
            persist(docs, docs.getIddocumentos());
        }
        FacesContext ci = FacesContext.getCurrentInstance();
        try {
            ci.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "Éxito!", "El estudiante " + est1.getPersonaNombre() + " " + est1.getPersonaApellido()
                    + " ha sido guardado."));
            ci.getExternalContext().redirect("perfil.intex");
        } catch (IOException ex) {
            System.out.println(ex.toString());
        }

    }

    public String onFlowProcess(FlowEvent event) {
        busca();
        return event.getNewStep();
    }

    

    public void dependencia() {
        this.getOtraDependencia();
    }

    public Estudiante getEst() {
        return est;
    }

    public void setEst(Estudiante est) {
        this.est = est;
    }

    public Estudiante getResp() {
        return resp;
    }

    public void setResp(Estudiante resp) {
        this.resp = resp;
    }

    public Persona getEst1() {
        return est1;
    }

    public void setEst1(Persona est1) {
        this.est1 = est1;
    }

    public Persona getResp1() {
        return resp1;
    }

    public void setResp1(Persona resp11) {
        this.resp1 = resp11;
    }

    public boolean getPartida() {
        return (est.getEstudiantePartidaNac());
    }

    public void setPartida(boolean partida) {
        est.setEstudiantePartidaNac(partida);
    }

    public String[] getDependenciaeco() {
        String dep = est.getEstudianteDependenciaEconomica() == null ? ""
                : est.getEstudianteDependenciaEconomica().split("¿")[0];
        return ((dep == null || dep.isEmpty()) ? new String[]{""} : dep.split("#"));
    }

    public void setDependenciaeco(String[] dependenciaeco) {
        String dep = "";
        for (String g : dependenciaeco) {
            if (dep.equalsIgnoreCase("")) {
                dep += g;
            } else {
                dep += "#" + g;
            }
        }
        est.setEstudianteDependenciaEconomica(dep + "¿ ");
    }

    public boolean getOtraDependencia() {
        String e = est.getEstudianteDependenciaEconomica() == null ? ""
                : est.getEstudianteDependenciaEconomica().split("¿")[0];
        String[] r = ((e == null || e.isEmpty()) ? new String[]{""} : e.split("#"));
        return r.length > 0 ? r[r.length - 1].equalsIgnoreCase("otro") : false;
    }

    public Matricula getM() {
        return m;
    }

    public void setM(Matricula m) {
        this.m = m;
    }

    public String getMunEst() {
        return est1.getPersonaLugarNac() != null ? est1.getPersonaLugarNac().split("#")[1] == null ? "" : est1.getPersonaLugarNac().split("#")[1] : "";
    }

    public void setMunEst(String munEst) {
        est1.setPersonaLugarNac(this.getDepEst() + "#" + munEst);
    }

    public String getDepRep() {
        return resp1.getPersonaLugarNac() != null ? resp1.getPersonaLugarNac().split("#")[0] == null ? "" : resp1.getPersonaLugarNac().split("#")[0] : "";
    }

    public void setDepRep(String depRep) {
        resp1.setPersonaLugarNac(depRep + "#" + getMunRep());
    }

    public String getMunRep() {
        return resp1.getPersonaLugarNac() != null ? resp1.getPersonaLugarNac().split("#")[1] == null
                ? "" : resp1.getPersonaLugarNac().split("#")[1] : "";
    }

    public void setMunRep(String munRep) {
        resp1.setPersonaLugarNac(getDepRep() + "#" + munRep);
    }

    public String getDepEst() {
        return est1.getPersonaLugarNac() != null ? est1.getPersonaLugarNac().split("#")[0] == null
                ? "" : est1.getPersonaLugarNac().split("#")[0] : "";
    }

    public void setDepEst(String depEst) {
        est1.setPersonaLugarNac(depEst + "#" + getMunEst());
    }

    public String getOtradependencia() {
        String dep = est.getEstudianteDependenciaEconomica() == null ? " ¿ "
                : est.getEstudianteDependenciaEconomica().split("¿")[1];
        return dep;
    }

    public void setOtradependencia(String otradependencia) {
        this.est.setEstudianteDependenciaEconomica(est.getEstudianteDependenciaEconomica() + "¿" + otradependencia);
    }

    public Date getAñoMatricula() {
        return Calendar.getInstance().getTime();
    }

    public Documentos getDocs() {
        return docs;
    }

    public void setDocs(Documentos docs) {
        this.docs = docs;
    }

    public Persona getPadre() {
        return padre;
    }

    public void setPadre(Persona padre) {
        this.padre = padre;
    }

    public Persona getMadre() {
        return madre;
    }

    public void setMadre(Persona madre) {
        this.madre = madre;
    }

    public ArrayList<SelectItem> niveles() {
        ArrayList<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(1, "Primer Año"));
        items.add(new SelectItem(2, "Segundo Año"));
        if (m.getGrado().getGradoPK().getGradoModalidad().equalsIgnoreCase("C")) {
            items.add(new SelectItem(3, "Tercer Año"));
        }
        return items;
    }

    private void persist(Object m, int p) {
        if (m.getClass() == madre.getClass()) {
            if (pfl.find(p) == null) {
                pfl.create((Persona) m);
            } else {
                pfl.edit((Persona) m);
            }
        } else if (m.getClass() == est.getClass()) {
            if (efl.find(p) == null) {
                efl.create((Estudiante) m);
            } else {
                efl.edit((Estudiante) m);
            }
        } else if (m.getClass() == this.m.getClass()) {
            if (mfl.find(new MatriculaPK(p, this.getAñoMatricula().getYear()+1900)) == null) {
                mfl.create((Matricula) m);
            } else {
                mfl.edit((Matricula) m);
            }
        } else if (m.getClass() == docs.getClass()) {
            if (dfl.find(p) == null) {
                dfl.create((Documentos) m);
            } else {
                dfl.edit((Documentos) m);
            }
        }
    }

    public String getDui(Persona p) {
        String[] d = p.getIdpersona() == null ? new String[]{""} : p.getIdpersona().toString().split("");
        String h = "";
        for (int i = 1; i < d.length; i++) {
            h += d[i];
            if (p.getTipoPersona().getIdtipoPersona() != 8 && i == (d.length - 2)) {
                h += "-";
            }
        }
        return h;
    }

    public void setDui(String dui, Persona p) {
        String[] d = dui.split("");
        String h = "1";
        for (String f : d) {
            if (!f.equals("-")) {
                h += f;
            }
        }
        p.setIdpersona(Integer.valueOf(h));
    }

    public String getDuiResponsable() {
        return getDui(resp1);
    }

    public void setDuiResponsable(String dui) {
        setDui(dui, resp1);
    }

    public String getDuiPadre() {
        return getDui(padre);
    }

    public void setDuiPadre(String dui) {
        setDui(dui, padre);
    }

    public String getDuiMadre() {
        return getDui(madre);
    }

    public void setDuiMadre(String dui) {
        setDui(dui, madre);
    }

    public String getNie() {
        return aux.getDui(est1);
    }

    public void setNie(String nie) {
        aux.setDui(nie, est1);
    }
    
    public void onItemSelect2(SelectEvent event) {
        est1 = axiliarController.getP();
        est=est1.getEstudiante();
        resp=est.getEstudianteRepresentante();
        resp1=resp.getPersona();
        madre=est.getEstudianteMadre();
        padre=est.getEstudiantePadre();
    }

    public List<SelectItem> getDepartamentoListaE() {
        return aux.getDepartamentoLista(est1);
    }
    
    public List<SelectItem> getMunicipioListaE(){
        return aux.getMunicipioLista(est1);
    }
    
    public String getDepartamentoE() {
        return aux.getDepartamento(est1);
    }

    public void setDepartamentoE(String dept) {
        aux.setDepartamento(dept, est1);
    }

    public String getMunicipioE() {
        return aux.getMunicipio(est1);
    }

    public void setMunicipioE(String mun) {
        aux.setMunicipio(mun, est1);
    }
}
