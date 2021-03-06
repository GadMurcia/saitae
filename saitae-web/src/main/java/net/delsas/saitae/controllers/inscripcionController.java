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

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
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
import javax.imageio.ImageIO;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Documentos;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.file.UploadedFile;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class inscripcionController extends Auxiliar implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    @EJB
    private GradoFacadeLocal gfl;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    
    private Persona estP;
    private Persona repP;
    private Persona madre;
    private Persona padre;
    private Matricula mat;
    private Documentos doc;
    
    @PostConstruct
    public void init() {
        estP = new Auxiliar().getEstudiante();
        repP = new Auxiliar().getRepresentante();
        limpiarAPadres(1);
        limpiarAPadres(2);
        mat = new Matricula(0, getAño());
        mat.setGrado(new Grado(0, "", "", getAño()));
        doc = new Documentos(0);
    }
    
    private void quitarEspaciosAntes(Persona p) {
        String n = p.getPersonaNombre() == null ? "" : p.getPersonaNombre(),
                a = p.getPersonaApellido() == null ? "" : p.getPersonaApellido();
        if (n.split("")[0].equals(" ")) {
            p.setPersonaNombre(n.substring(1));
        }
        if (a.split("")[0].equals(" ")) {
            p.setPersonaApellido(a.substring(1));
        }
    }
    
    public void guardar() {
        quitarEspaciosAntes(madre);
        quitarEspaciosAntes(padre);
        
        repP.getEstudiante().setIdestudiante(repP.getIdpersona());
        repP.setPersonaContrasenya(DigestUtils.md5Hex(repP.getIdpersona().toString().substring(1)));
        quitarEspaciosAntes(repP);
        
        estP.getEstudiante().setIdestudiante(estP.getIdpersona());
        estP.setPersonaContrasenya(DigestUtils.md5Hex(estP.getIdpersona().toString().substring(1)));
        quitarEspaciosAntes(estP);
        estP.getEstudiante().setEstudianteRepresentante(repP.getEstudiante());
        estP.getEstudiante().setEstudianteParentescoRepresentante(repP.getEstudiante().getEstudianteParentescoRepresentante());
        estP.getEstudiante().setEstudianteRepresentanteFamiliar(repP.getEstudiante().getEstudianteRepresentanteFamiliar());
        estP.getEstudiante().setPersona(estP);
        estP.getEstudiante().setEstudianteEscolaridad("Noveno Grado");
        doc.setIddocumentos(estP.getIdpersona());
        doc.setEstudiante(estP.getEstudiante());
        mat.getMatriculaPK().setIdmatricula(estP.getIdpersona());
        mat.getGrado().getGradoPK().setGradoSeccion(
                gfl.getSeccionPorAñoModalidadyId(
                        getAño(),
                        mat.getGrado().getGradoPK().getGradoModalidad(),
                        mat.getGrado().getGradoPK().getIdgrado()).get(0));
        estP.getEstudiante().setDocumentos(doc);
        
        FacesContext context = FacesContext.getCurrentInstance();
        Persona estCtr = personaFL.find(estP.getIdpersona());
        Matricula mct = null;
        if (estCtr != null) {
            Persona p1;
            if (estCtr.getEstudiante().getEstudianteRepresentante() != null
                    && !estCtr.getEstudiante().getEstudianteRepresentante().getIdestudiante().equals(repP.getIdpersona())) {
                p1 = personaFL.find(estCtr.getEstudiante().getEstudianteRepresentante().getIdestudiante());
                estCtr.getEstudiante().setEstudianteRepresentante(null);
                personaFL.edit(estCtr);
                if (p1.getEstudiante().getEstudianteList().contains(estCtr.getEstudiante())) {
                    p1.getEstudiante().getEstudianteList().remove(estCtr.getEstudiante());
                    personaFL.edit(p1);
                }
                try {
                    personaFL.remove(p1);
                } catch (Exception e) {
                    if (p1.getEstudiante().getEstudianteList().isEmpty()) {
                        p1.setPersonaActivo(false);
                        personaFL.edit(p1);
                    }                    
                }
            }
            if (estCtr.getEstudiante().getEstudianteMadre() != null
                    && !estCtr.getEstudiante().getEstudianteMadre().getIdpersona().equals(madre.getIdpersona())) {
                p1 = personaFL.find(estCtr.getEstudiante().getEstudianteMadre().getIdpersona());
                estCtr.getEstudiante().setEstudianteMadre(null);
                personaFL.edit(estCtr);
                personaFL.remove(p1);
            }
            if (estCtr.getEstudiante().getEstudiantePadre() != null
                    && !estCtr.getEstudiante().getEstudiantePadre().getIdpersona().equals(padre.getIdpersona())) {
                p1 = personaFL.find(estCtr.getEstudiante().getEstudiantePadre().getIdpersona());
                estCtr.getEstudiante().setEstudiantePadre(null);
                personaFL.edit(estCtr);
                personaFL.remove(p1);
            }
            List<Matricula> mmml = mFL.findByIdmatricula(estP.getIdpersona());
            for (Matricula m : mmml) {
                if (m.getGrado().getGradoPK().getGradoAño() == (getAñoActual() - 1)) {
                    mct = m;
                }
            }
            estP.getEstudiante().setMatriculaList(mmml);
        }
        mat.getGrado().getGradoPK().setGradoSeccion(
                mat.getMatriculaRepite() ? "A"
                : (mct == null ? "A"
                        : mct.getGrado().getGradoPK().getGradoSeccion()));
        mat.setMatriculaComentario(mat.getMatriculaRepite() ? "N" : (mct == null ? "N" : "R"));
        estP.getEstudiante().getMatriculaList().add(mat);
        if (padre.getIdpersona().toString().split("").length > 8) {
            personaFL.edit(padre);
        } else {
            padre = null;
        }
        if (madre.getIdpersona().toString().split("").length > 8) {
            personaFL.edit(madre);
        } else {
            madre = null;
        }
        personaFL.edit(repP);
        estP.getEstudiante().setEstudiantePadre(padre);
        estP.getEstudiante().setEstudianteMadre(madre);
        if (estCtr == null) {
            personaFL.create(estP);
        } else {
            personaFL.edit(estP);
        }
        FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_INFO,
                "Solicitud de registro exitosa",
                "La solicitud de registro de " + estP.getPersonaNombre() + " " + estP.getPersonaApellido() + " se ha lleado con éxito."
                + " Espere la confirmación de su solicitud por parte del personal del INTEX."
                + " Puede iniciar sesión con el NIE del estudiante como usuario y contraseña o con el DUI de representante.");
        context.getExternalContext().getSessionMap().put("mensaje", fm);
        try {
            context.getExternalContext().redirect("./../");
        } catch (IOException ex) {
            Logger.getLogger(inscripcionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void partida(FileUploadEvent event) {
        this.doc.setEstudianteDocPartida(event.getFile().getContent());
        this.doc.setEstudianteExtencionPartida(this.getExtencion(event.getFile()));
    }
    
    public String getExtencion(UploadedFile f) {
        return f.getFileName() + "¿¿" + f.getContentType();
    }
    
    public void noveno(FileUploadEvent event) {
        this.doc.setEstudianteDocCertificado(event.getFile().getContent());
        this.doc.setEstudianteExtencionCertificado(this.getExtencion(event.getFile()));
    }
    
    public void conducta(FileUploadEvent event) {
        this.doc.setEstudianteDocConducta(event.getFile().getContent());
        this.doc.setEstudianteExtencionConducta(this.getExtencion(event.getFile()));
    }
    
    public void dui(FileUploadEvent event) {
        this.doc.setEstudianteDocDui(event.getFile().getContent());
        this.doc.setEstudianteExtencionDui(this.getExtencion(event.getFile()));
    }
    
    public void notas(FileUploadEvent event) {
        this.doc.setEstudianteDocNotas(event.getFile().getContent());
        this.doc.setEstudianteExtencionNotas(this.getExtencion(event.getFile()));
    }
    
    public List<SelectItem> getNiveles() {
        List<SelectItem> items = new ArrayList<>();
        gfl.getIdPorAñoyModalidad(getAño(), mat.getGrado().getGradoPK().getGradoModalidad()).forEach((i) -> {
            items.add(new SelectItem(i, i == 3 ? "Tercer Año"
                    : i == 2 ? "Segundo Año"
                            : "primer Año"));
        });
        return items;
    }
    
    public List<SelectItem> getModalidades() {
        List<SelectItem> items = new ArrayList<>();
        gfl.getModalidadPorAño(getAño()).forEach((g) -> {
            items.add(new SelectItem(g, g.equals("C") ? "T.V.C. Contaduría"
                    : g.equals("S") ? "T.V.C. Secretariado"
                    : "General"));
        });
        return items;
    }
    
    public List<SelectItem> getSecciones() {
        List<SelectItem> items = new ArrayList<>();
        gfl.getSeccionPorAñoModalidadyId(getAño(), mat.getGrado().getGradoPK().getGradoModalidad(), mat.getGrado().getGradoPK().getIdgrado()).forEach((g) -> {
            items.add(new SelectItem(g, g.equals("A") ? "Sección A"
                    : g.equals("B") ? "Sección B"
                    : "Sección C"));
        });
        return items;
    }
    
    public Integer getAño() {
        return getAñoInscripcion();
    }
    
    public boolean isTime() {
        return isTimeToInsciption();
    }
    
    public Persona getEst() {
        return estP;
    }
    
    public void setEst(Persona estP) {
        this.estP = estP;
    }
    
    public Persona getRepPresentanteI() {
        return repP;
    }
    
    public void setRepresentanteI(Persona repP) {
        this.repP = repP;
    }
    
    public Persona getMadreI() {
        return madre;
    }
    
    public void setMadreI(Persona madre) {
        this.madre = madre;
    }
    
    public Persona getPadreI() {
        return padre;
    }
    
    public void setPadreI(Persona padre) {
        this.padre = padre;
    }
    
    public Matricula getMatricula() {
        return mat;
    }
    
    public void setMatricula(Matricula mat) {
        if (mat != null) {
            this.mat = mat;
        }
    }
    
    public Documentos getDocumentos() {
        return doc;
    }
    
    public void setDocumentos(Documentos doc) {
        if (doc != null) {
            this.doc = doc;
        }
    }
    
    public void setNie(String nie) {
        new Auxiliar().setDui(nie, estP);
    }
    
    public String getNie() {
        return new Auxiliar().getDui(estP);
    }
    
    public void setDuiP(String dui) {
        new Auxiliar().setDui(dui, padre);
    }
    
    public String getDuiP() {
        return new Auxiliar().getDui(padre);
    }
    
    public void setDuiM(String dui) {
        new Auxiliar().setDui(dui, madre);
    }
    
    public String getDuiM() {
        return new Auxiliar().getDui(madre);
    }
    
    public void setDuiR(String dui) {
        new Auxiliar().setDui(dui, repP);
    }
    
    public String getDuiR() {
        return new Auxiliar().getDui(repP);
    }
    
    public void setDep(String dep) {
        new Auxiliar().setDepartamento(dep, estP);
    }
    
    public String getDep() {
        return new Auxiliar().getDepartamento(estP);
    }
    
    public void setDepR(String dep) {
        new Auxiliar().setDepartamento(dep, repP);
    }
    
    public String getDepR() {
        return new Auxiliar().getDepartamento(repP);
    }
    
    public void setMun(String mun) {
        new Auxiliar().setMunicipio(mun, estP);
    }
    
    public String getMun() {
        return new Auxiliar().getMunicipio(estP);
    }
    
    public void setMunR(String mun) {
        new Auxiliar().setMunicipio(mun, repP);
    }
    
    public String getMunR() {
        return new Auxiliar().getMunicipio(repP);
    }
    
    public List<SelectItem> getDepLista() {
        return new Auxiliar().getDepartamentoLista(estP);
    }
    
    public List<SelectItem> getMunLista() {
        return new Auxiliar().getMunicipioLista(estP);
    }
    
    public List<SelectItem> getDepListaR() {
        return new Auxiliar().getDepartamentoLista(repP);
    }
    
    public List<SelectItem> getMunListaR() {
        return new Auxiliar().getMunicipioLista(repP);
    }
    
    public void setDependencia(String[] dep) {
        String d[] = estP.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        String de = "";
        for (Integer i = 0; i < dep.length; i++) {
            if (i > 0) {
                de += "#";
            }
            de += dep[i];
        }
        de += "¿" + ot;
        estP.getEstudiante().setEstudianteDependenciaEconomica(de);
    }
    
    public String[] getDependencia() {
        return getDependencia(estP.getEstudiante());
    }
    
    public boolean isOtraDependencia() {
        boolean f = false;
        String[] c = getDependencia();
        for (String o : c) {
            f = o.equals("Otro");
        }
        return f;
    }
    
    public String getOtraDependenciaEcon() {
        return getOtraDependenciaEcon(estP.getEstudiante());
    }
    
    public void setOtraDependenciaEcon(String otrDependencia) {
        String d[] = estP.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String dt = d[0];
        estP.getEstudiante().setEstudianteDependenciaEconomica(dt + "¿" + otrDependencia);
    }
    
    public ByteArrayInputStream getFile(Integer id) {
        byte[] img = id == 1 ? doc.getEstudianteDocPartida()
                : (id == 2 ? doc.getEstudianteDocCertificado()
                        : (id == 3 ? doc.getEstudianteDocConducta()
                                : (id == 4 ? doc.getEstudianteDocNotas()
                                        : (id == 5 ? doc.getEstudianteDocDui() : null))));
        if (img == null) {
            try {
                BufferedImage bImage = ImageIO.read(new File("/resources/gl.jpg"));
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                ImageIO.write(bImage, "jpg", bos);
                img = bos.toByteArray();
            } catch (IOException ex) {
                return null;
            }
        }
        return new ByteArrayInputStream(img);
    }
    
    public boolean getNacionalidadR() {
        return getNacionalidades(repP);
    }
    
    public void setNacionalidadR(boolean i) {
        setNacionalidades(repP, i);
    }
    
    public boolean getNacionalidad() {
        return getNacionalidades(estP);
    }
    
    public void setNacionalidad(boolean i) {
        setNacionalidades(estP, i);
    }
    
    private void setNacionalidades(Persona p, boolean i) {
        p.setPersonaNacionalidad(i ? "Salvadoreña" : "Extrangera");
        p.setPersonaLugarNac(i ? "9#9" : " # ");
    }
    
    private boolean getNacionalidades(Persona p) {
        return p.getPersonaNacionalidad().equals("Salvadoreña");
    }
    
    public void copiarAPadres(int q) {
        if (q == 1) {
            padre = repP;
        } else {
            madre = repP;
        }
    }
    
    public void limpiarAPadres(int q) {
        if (q == 1) {
            padre = new Auxiliar().getPadre();
            padre.setPersonaNombre(" ");
            padre.setPersonaApellido(" ");
        } else {
            madre = new Auxiliar().getMadre();
            madre.setPersonaNombre(" ");
            madre.setPersonaApellido(" ");
        }
    }
    
    @Override
    public void onBlour(AjaxBehaviorEvent a) {
        Matricula mc = mFL.find(new MatriculaPK(estP.getIdpersona(), getAño()));
        FacesContext context = FacesContext.getCurrentInstance();
        if (mc != null) {
            try {
                context.getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN,
                                "Inscripción duplicada!",
                                "El NIE proporcionado pertenece a un estudiante que ya se ha inscrito."
                                + " Si necesita modificar su información personal, inicie sessión y vaya a su perfil. "
                                + "Si lo que necesita es cambiar los datos de su inscripción, solicítelo en la "
                                + "oficina de la secretaria de la institución."));
                context.getExternalContext().redirect("./../");
            } catch (IOException e) {
            }
        }
        
    }
    
}
