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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Named;
import net.delsas.saitae.aux.prueba;
import net.delsas.saitae.beans.DocumentosFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Documentos;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.FlowEvent;
import org.primefaces.model.UploadedFile;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class inscripcionController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private GradoFacadeLocal gfl;
    @EJB
    private PersonaFacadeLocal personaFL;
    @EJB
    private DocumentosFacadeLocal documentosFL;
    @EJB
    private MatriculaFacadeLocal matriculaFL;

    private Persona estP;
    private Persona repP;
    private Persona madre;
    private Persona padre;
    private Matricula mat;
    private Documentos doc;

    @PostConstruct
    public void init() {
        estP = new prueba().getEstudiante();
        repP = new prueba().getRepresentante();
        madre = new prueba().getMadre();
        padre = new prueba().getPadre();
        mat = new Matricula(0, getAño());
        mat.setGrado(new Grado(0, "", "", getAño()));
        doc = new Documentos(0);
        System.out.println(isTime());
    }

    public void guardar() {
        System.out.println("Inicio del guardar.");
        madre.setPersonaContrasenya(DigestUtils.md5Hex(madre.getIdpersona().toString().substring(1)));
        padre.setPersonaContrasenya(DigestUtils.md5Hex(padre.getIdpersona().toString().substring(1)));

        repP.getEstudiante().setIdestudiante(repP.getIdpersona());
        repP.setPersonaContrasenya(DigestUtils.md5Hex(repP.getIdpersona().toString().substring(1)));

        estP.getEstudiante().setIdestudiante(estP.getIdpersona());
        estP.setPersonaContrasenya(DigestUtils.md5Hex(estP.getIdpersona().toString().substring(1)));
        estP.getEstudiante().setEstudianteRepresentante(repP.getEstudiante());
        estP.getEstudiante().setEstudiantePadre(padre);
        estP.getEstudiante().setEstudianteMadre(madre);
        estP.getEstudiante().setEstudianteParentescoRepresentante(repP.getEstudiante().getEstudianteParentescoRepresentante());
        estP.getEstudiante().setEstudianteRepresentanteFamiliar(repP.getEstudiante().getEstudianteRepresentanteFamiliar());
        estP.getEstudiante().setPersona(estP);
        estP.getEstudiante().setEstudianteEscolaridad("Noveno Grado");
        doc.setIddocumentos(estP.getIdpersona());
        doc.setEstudiante(estP.getEstudiante());
        mat.getMatriculaPK().setIdmatricula(estP.getIdpersona());
        estP.getEstudiante().setDocumentos(doc);
        estP.getEstudiante().getMatriculaList().add(mat);

        FacesContext context = FacesContext.getCurrentInstance();
        if (personaFL.find(estP.getIdpersona()) == null) {
            personaFL.edit(padre);
            personaFL.edit(madre);
            personaFL.edit(repP);
            personaFL.create(estP);

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
        } else {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "El registro No se completó", "La razón es que ha intentado agregar un NIE que ya existe. "
                    + "Compruebe e inténtelo de nuevo."));
        }

    }

    public void partida(FileUploadEvent event) {
        this.doc.setEstudianteDocPartida(event.getFile().getContents());
        this.doc.setEstudianteExtencionPartida(this.getExtencion(event.getFile()));
    }

    public String getExtencion(UploadedFile f) {
        return f.getFileName() + "¿¿" + f.getContentType();
    }

    public void noveno(FileUploadEvent event) {
        this.doc.setEstudianteDocCertificado(event.getFile().getContents());
        this.doc.setEstudianteExtencionCertificado(this.getExtencion(event.getFile()));
    }

    public void conducta(FileUploadEvent event) {
        this.doc.setEstudianteDocConducta(event.getFile().getContents());
        this.doc.setEstudianteExtencionConducta(this.getExtencion(event.getFile()));
    }

    public void dui(FileUploadEvent event) {
        this.doc.setEstudianteDocDui(event.getFile().getContents());
        this.doc.setEstudianteExtencionDui(this.getExtencion(event.getFile()));
    }

    public void notas(FileUploadEvent event) {
        this.doc.setEstudianteDocNotas(event.getFile().getContents());
        this.doc.setEstudianteExtencionNotas(this.getExtencion(event.getFile()));
    }

    public List<SelectItem> getNiveles() {
        List<SelectItem> items = new ArrayList<>();
        for (Integer i : gfl.getIdPorAñoyModalidad(getAño(), mat.getGrado().getGradoPK().getGradoModalidad())) {
            items.add(new SelectItem(i, i == 3 ? "Tercer Año"
                    : i == 2 ? "Segundo Año"
                            : "primer Año"));
        }
        return items;
    }

    public List<SelectItem> getModalidades() {
        List<SelectItem> items = new ArrayList<>();
        for (String g : gfl.getModalidadPorAño(getAño())) {
            items.add(new SelectItem(g, g.equals("C") ? "T.V.C. Contaduría"
                    : g.equals("S") ? "T.V.C. Secretariado"
                    : "General"));
        }
        return items;
    }

    public List<SelectItem> getSecciones() {
        List<SelectItem> items = new ArrayList<>();
        for (String g : gfl.getSeccionPorAñoModalidadyId(getAño(), mat.getGrado().getGradoPK().getGradoModalidad(), mat.getGrado().getGradoPK().getIdgrado())) {
            items.add(new SelectItem(g, g.equals("A") ? "Sección A"
                    : g.equals("B") ? "Sección B"
                    : "Sección C"));
        }
        return items;
    }

    public int getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public boolean isTime() {
        try {
            Date d = new Date();
            Date d1 = (new SimpleDateFormat("dd-mm-yyyy").parse("15-11-" + getAño()));
            return (d.before(d1) || d1.equals(d));
        } catch (ParseException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public Persona getEst() {
        return estP;
    }

    public void setEst(Persona estP) {
        this.estP = estP;
    }

    public Persona getRepresentante() {
        return repP;
    }

    public void setRepresentante(Persona repP) {
        this.repP = repP;
    }

    public Persona getMadre() {
        return madre;
    }

    public void setMadre(Persona madre) {
        this.madre = madre;
    }

    public Persona getPadre() {
        return padre;
    }

    public void setPadre(Persona padre) {
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
        new prueba().setDui(nie, estP);
    }

    public String getNie() {
        return new prueba().getDui(estP);
    }

    public void setDuiP(String dui) {
        new prueba().setDui(dui, padre);
    }

    public String getDuiP() {
        return new prueba().getDui(padre);
    }

    public void setDuiM(String dui) {
        new prueba().setDui(dui, madre);
    }

    public String getDuiM() {
        return new prueba().getDui(madre);
    }

    public void setDuiR(String dui) {
        new prueba().setDui(dui, repP);
    }

    public String getDuiR() {
        return new prueba().getDui(repP);
    }

    public void setDep(String dep) {
        new prueba().setDepartamento(dep, estP);
    }

    public String getDep() {
        return new prueba().getDepartamento(estP);
    }

    public void setDepR(String dep) {
        new prueba().setDepartamento(dep, repP);
    }

    public String getDepR() {
        return new prueba().getDepartamento(repP);
    }

    public void setMun(String mun) {
        new prueba().setMunicipio(mun, estP);
    }

    public String getMun() {
        return new prueba().getMunicipio(estP);
    }

    public void setMunR(String mun) {
        new prueba().setMunicipio(mun, repP);
    }

    public String getMunR() {
        return new prueba().getMunicipio(repP);
    }

    public List<SelectItem> getDepLista() {
        return new prueba().getDepartamentoLista(estP);
    }

    public List<SelectItem> getMunLista() {
        return new prueba().getMunicipioLista(estP);
    }

    public List<SelectItem> getDepListaR() {
        return new prueba().getDepartamentoLista(repP);
    }

    public List<SelectItem> getMunListaR() {
        return new prueba().getMunicipioLista(repP);
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public void setDependencia(String[] dep) {
        String d[] = estP.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        String de = "";
        for (int i = 0; i < dep.length; i++) {
            if (i > 0) {
                de += "#";
            }
            de += dep[i];
        }
        de += "¿" + ot;
        estP.getEstudiante().setEstudianteDependenciaEconomica(de);
    }

    public String[] getDependencia() {
        String d[] = estP.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot[] = d[0].split("#");
        return ot;
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
        String d[] = estP.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        return ot;
    }

    public void setOtraDependenciaEcon(String otrDependencia) {
        String d[] = estP.getEstudiante().getEstudianteDependenciaEconomica().split("¿");
        String dt = d[0];
        estP.getEstudiante().setEstudianteDependenciaEconomica(dt + "¿" + otrDependencia);
    }

    public ByteArrayInputStream getFile(int id) {
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

}
