package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.aux.prueba;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Documentos;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;
import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.UploadedFile;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class nuevoingresoController implements Serializable {

    private static final long serialVersionUID = 1L;
    private final String nombrePagina = "nuevoIngreso.intex";
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private EstudianteFacadeLocal efl;
    @EJB
    private GradoFacadeLocal gfl;
    private Persona e;
    private Persona Representante;
    private Persona madre;
    private Persona padre;
    private Matricula mat;
    private Documentos docs;
    private FacesContext context;

    public void message() {
//        Object session = context.getExternalContext().getSession(true);
//        
//        FacesMessage ms = (FacesMessage) context.getExternalContext().getSessionMap().get("mensaje");
//        if (ms != null) {
//            context.addMessage(null, ms);
//            context.getExternalContext().getSessionMap().remove("mensaje");
//        }
    }

    @PostConstruct
    public void init() {
        Representante = (new prueba()).getRepresentante();
        context = FacesContext.getCurrentInstance();
        e = (new prueba()).getEstudiante();
        madre = (new prueba()).getMadre();
        padre = (new prueba()).getPadre();
        mat = new Matricula(new MatriculaPK(0, getAñoMatricula()));
        mat.setGrado(new Grado(0, "", "", getAñoMatricula()));
        docs = e.getEstudiante().getDocumentos() != null ? e.getEstudiante().getDocumentos()
                : new Documentos(e.getIdpersona());
    }

    public void guardar() {
        try {
            setContraseña(Representante);
            Representante.getEstudiante().setIdestudiante(Representante.getIdpersona());

            pfl.edit(madre);
            pfl.edit(padre);
            pfl.edit(Representante);

            mat.getMatriculaPK().setIdmatricula(e.getIdpersona());
            mat.setEstudiante(e.getEstudiante());

            docs.setIddocumentos(e.getIdpersona());
            docs.setEstudiante(e.getEstudiante());

            setContraseña(e);
            e.getEstudiante().setIdestudiante(e.getIdpersona());
            e.getEstudiante().setMatriculaList(new ArrayList<Matricula>());
            e.getEstudiante().getMatriculaList().add(mat);
            e.getEstudiante().setDocumentos(docs);
            e.getEstudiante().setEstudianteMadre(madre);
            e.getEstudiante().setEstudiantePadre(padre);
            e.getEstudiante().setEstudianteRepresentante(Representante.getEstudiante());
            pfl.edit(e);

            FacesMessage ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Agregación exitosa",
                    "Inscrito: " + e.getPersonaNombre() + " " + e.getPersonaApellido() + " en el grado: "
                    + mat.getGrado().getGradoPK().getIdgrado() + "° "
                    + (mat.getGrado().getGradoPK().getGradoModalidad().equals("C") ? "Comercio"
                    : mat.getGrado().getGradoPK().getGradoModalidad().equals("S") ? "Secretariado"
                    : "general") + ", para el año " + mat.getMatriculaPK().getMatriculaAnyo() + ".");
            context.addMessage("mensaje", ms);
            context.getExternalContext().redirect("nuevoIngreso.intex");
            System.out.println("guardar");
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(
                    FacesMessage.SEVERITY_FATAL, "Error inesperado", ex.toString()));
        }
    }

    private void setContraseña(Persona p) {
        p.setPersonaContrasenya(DigestUtils.md5Hex(p.getIdpersona().toString()));
    }

    /**
     * Genera un lista para que el susario seleccione el año de bachillerato
     * para inscribirse.
     *
     * @return List;
     */
    public List<SelectItem> getNiveles() {
        List<SelectItem> items = new ArrayList<>();
        for (Integer i : gfl.getIdPorAñoyModalidad(getAñoMatricula(), mat.getGrado().getGradoPK().getGradoModalidad())) {
            items.add(new SelectItem(i, i == 3 ? "Tercer Año"
                    : i == 2 ? "Segundo Año"
                            : "primer Año"));
        }
        return items;
    }

    public List<SelectItem> getModalidades() {
        List<SelectItem> items = new ArrayList<>();
        for (String g : gfl.getModalidadPorAño(getAñoMatricula())) {
            items.add(new SelectItem(g, g.equals("C") ? "T.V.C. Contaduría"
                    : g.equals("S") ? "T.V.C. Secretariado"
                    : "General"));
        }
        return items;
    }

    public List<SelectItem> getSecciones() {
        List<SelectItem> items = new ArrayList<>();
        for (String g : gfl.getSeccionPorAñoModalidadyId(getAñoMatricula(), mat.getGrado().getGradoPK().getGradoModalidad(), mat.getGrado().getGradoPK().getIdgrado())) {
            items.add(new SelectItem(g, g.equals("A") ? "Sección A"
                    : g.equals("B") ? "Sección B"
                    : "Sección C"));
        }
        return items;
    }

    public void onItemSelect2(SelectEvent event) {
        Persona po = axiliarController.getP();
        switch (po.getTipoPersona().getIdtipoPersona()) {
            case 8:
                e = po;
                Representante = e.getEstudiante().getEstudianteRepresentante().getPersona();
                padre = e.getEstudiante().getEstudiantePadre();
                madre = e.getEstudiante().getEstudianteMadre();
                break;
            case 9:
                Representante = po;
                break;
            case 10:
                madre = po;
                break;
            case 11:
                padre = po;
        }
        System.out.println(po.toString());
    }

    public String[] getDependenciaeco() {
        String dep = e.getEstudiante().getEstudianteDependenciaEconomica() == null ? ""
                : e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[0];
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
        e.getEstudiante().setEstudianteDependenciaEconomica(dep + "¿ ");
    }

    public boolean isOtraDep() {
        String es = e.getEstudiante().getEstudianteDependenciaEconomica() == null ? ""
                : e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[0];
        String[] r = ((es == null || es.isEmpty()) ? new String[]{""} : es.split("#"));
        return r.length > 0 ? r[r.length - 1].equalsIgnoreCase("otro") : false;
    }

    public String getOtraDependencia() {
        String dep = e.getEstudiante().getEstudianteDependenciaEconomica() == null ? " ¿ "
                : e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[1];
        return dep;
    }

    public void setOtraDependencia(String otradependencia) {
        this.e.getEstudiante().setEstudianteDependenciaEconomica(
                e.getEstudiante().getEstudianteDependenciaEconomica().split("¿")[0] + "¿" + otradependencia);
    }

    public void partida(FileUploadEvent event) {
        this.docs.setEstudianteDocPartida(event.getFile().getContents());
        this.docs.setEstudianteExtencionPartida(this.getExtencion(event.getFile()));
    }

    public String getExtencion(UploadedFile f) {
        return f.getContentType();
    }

    public void noveno(FileUploadEvent event) {
        this.docs.setEstudianteDocCertificado(event.getFile().getContents());
        this.docs.setEstudianteExtencionCertificado(this.getExtencion(event.getFile()));
    }

    public void conducta(FileUploadEvent event) {
        this.docs.setEstudianteDocConducta(event.getFile().getContents());
        this.docs.setEstudianteExtencionConducta(this.getExtencion(event.getFile()));
    }

    public void dui(FileUploadEvent event) {
        this.docs.setEstudianteDocDui(event.getFile().getContents());
        this.docs.setEstudianteExtencionDui(this.getExtencion(event.getFile()));
    }

    public void notas(FileUploadEvent event) {
        this.docs.setEstudianteDocNotas(event.getFile().getContents());
        this.docs.setEstudianteExtencionNotas(this.getExtencion(event.getFile()));
    }

    public Persona getE() {
        return e;
    }

    public void setE(Persona e) {
        this.e = e;
    }

    public void setNie(String nie) {
        (new prueba()).setDui(nie, e);
    }

    public String getNie() {
        return (new prueba()).getDui(e);
    }

    public String getDepartamentoE() {
        return (new prueba()).getDepartamento(e);
    }

    public void setDepartamentoE(String de) {
        (new prueba()).setDepartamento(de, e);
    }

    public List<SelectItem> getDepartamentoListaE() {
        return (new prueba()).getDepartamentoLista(e);
    }

    public String getMunicipioE() {
        return (new prueba()).getMunicipio(e);
    }

    public void setMunicipioE(String de) {
        (new prueba()).setMunicipio(de, e);
    }

    public List<SelectItem> getMunicipioListaE() {
        return (new prueba()).getMunicipioLista(e);
    }

    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }

    public int getAñoMatricula() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public void setDuiPadre(String dui) {
        (new prueba()).setDui(dui, padre);
    }

    public String getDuiPadre() {
        return (new prueba()).getDui(padre);
    }

    public void setDuiMadre(String dui) {
        (new prueba()).setDui(dui, madre);
    }

    public String getDuiMadre() {
        return (new prueba()).getDui(madre);
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

    public Persona getRepresentante() {
        return Representante;
    }

    public void setRepresentante(Persona Representante) {
        this.Representante = Representante;
    }

    public Matricula getMat() {
        return mat;
    }

    public void setMat(Matricula mat) {
        this.mat = mat;
    }

    public void setDuiR(String nie) {
        (new prueba()).setDui(nie, Representante);
    }

    public String getDuiR() {
        return (new prueba()).getDui(Representante);
    }

    public String getDepartamentoR() {
        return (new prueba()).getDepartamento(Representante);
    }

    public void setDepartamentoR(String de) {
        (new prueba()).setDepartamento(de, Representante);
    }

    public List<SelectItem> getDepartamentoListaR() {
        return (new prueba()).getDepartamentoLista(Representante);
    }

    public String getMunicipioR() {
        return (new prueba()).getMunicipio(Representante);
    }

    public void setMunicipioR(String de) {
        (new prueba()).setMunicipio(de, Representante);
    }

    public List<SelectItem> getMunicipioListaR() {
        return (new prueba()).getMunicipioLista(Representante);
    }

    public Documentos getDocs() {
        return docs;
    }
}
