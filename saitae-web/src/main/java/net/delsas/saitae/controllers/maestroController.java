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
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.CargoFacadeLocal;
import net.delsas.saitae.beans.FinanciamientoFacadeLocal;
import net.delsas.saitae.beans.MaestoCargoFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoEspecialidadesFacadeLocal;
import net.delsas.saitae.beans.TipoNombramientoFacadeLocal;
import net.delsas.saitae.beans.TipoSueldosFacadeLocal;
import net.delsas.saitae.entities.Cargo;
import net.delsas.saitae.entities.Financiamiento;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoEspecialidades;
import net.delsas.saitae.entities.TipoNombramiento;
import net.delsas.saitae.entities.TipoSueldos;
import org.apache.commons.codec.digest.DigestUtils;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.event.FlowEvent;
import org.primefaces.event.RowEditEvent;

/**
 *
 * @author delsas
 */
@Named(value = "maestroController")
@ViewScoped
public class maestroController implements Serializable {
    
    private List<Cargo> cargos;
    @EJB
    private CargoFacadeLocal cargoFL;
    private List<Financiamiento> financiamientos;
    @EJB
    private FinanciamientoFacadeLocal financiamientoFL;
    private List<TipoNombramiento> nombramientos;
    @EJB
    private TipoNombramientoFacadeLocal tipoNombramientoFL;
    
    private static final long serialVersionUID = 1L;
    private Maestro maestro;
    @EJB
    private MaestroFacadeLocal mfl;
    @EJB
    private FinanciamientoFacadeLocal ffl;
    @EJB
    private CargoFacadeLocal cfl;
    @EJB
    private TipoNombramientoFacadeLocal tnfl;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private MaestoCargoFacadeLocal mcfl;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private TipoSueldosFacadeLocal tiposFL;
    private List<TipoSueldos> tipoS;
    @EJB
    private TipoEspecialidadesFacadeLocal tipoeFL;
    private List<TipoEspecialidades> tipoE;
    private Persona usuario;

    /**
     * Creates a new instance of maestro
     */
    @PostConstruct
    public void init() {
        maestro = new Auxiliar().getMaestro().getMaestro();
        cargos = cargoFL.findAll();
        financiamientos = financiamientoFL.findAll();
        nombramientos = tipoNombramientoFL.findAll();
        tipoE = tipoeFL.findAll();
        tipoS = tiposFL.findAll();
        usuario = (Persona) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("usuario");
    }
    
    public Maestro getMaestro() {
        return maestro;
    }
    
    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }
    
    public void setDepartamento(String dep) {
        new Auxiliar().setDepartamento(dep, maestro.getPersona());
    }
    
    public String getDepartamento() {
        return new Auxiliar().getDepartamento(maestro.getPersona());
    }
    
    public void setMunicipio(String mun) {
        new Auxiliar().setMunicipio(mun, maestro.getPersona());
    }
    
    public String getMunicipio() {
        return new Auxiliar().getMunicipio(maestro.getPersona());
    }
    
    public void setDui(String dui) {
        new Auxiliar().setDui(dui, maestro.getPersona());
        maestro.setIdmaestro(maestro.getPersona().getIdpersona());
    }
    
    public String getDui() {
        return new Auxiliar().getDui(maestro.getPersona());
    }
    
    public List<SelectItem> getMunicipiosLista() {
        return new Auxiliar().getMunicipioLista(maestro.getPersona());
    }
    
    public List<SelectItem> getDepartamentosLista() {
        return new Auxiliar().getDepartamentoLista(maestro.getPersona());
    }
    
    public String onFlowProcess(FlowEvent event) {
        return event.getNewStep();
    }
    
    public void onRowEdit(RowEditEvent event) {
        MaestoCargo mc = (MaestoCargo) event.getObject();
        mc.getMaestoCargoPK().setIdCargo(mc.getCargo().getIdcargo());
        mc.getMaestoCargoPK().setIdFinanciamiento(mc.getFinanciamiento().getIdfinanciamiento());
        mc.getMaestoCargoPK().setIdNombramiento(mc.getTipoNombramiento().getIdtipoNombramiento());
        mc.getMaestoCargoPK().setIdMaesto(maestro.getIdmaestro());
        maestro.getMaestoCargoList().remove(index);
        maestro.getMaestoCargoList().add(mc);
        FacesMessage msg = new FacesMessage("Modificaciones realizadas con éxito",
                "Modificado: " + mc.getCargo().getCargoNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    
    public void onRowCancel(RowEditEvent event) {
        MaestoCargo mc = (MaestoCargo) event.getObject();
        if (mc.getCargo().getIdcargo() != null | mc.getCargo().getIdcargo() > 0) {
            maestro.getMaestoCargoList().remove(mc);
        }
        FacesMessage msg = new FacesMessage("Edición Cancelada", "Borrados los campos vacíos.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    private int index = 0;
    
    public void onAddNew() {
        MaestoCargo mc = new MaestoCargo(0, 0, 0, 0, Calendar.getInstance().getTime());
        mc.setCargo(new Cargo(0, ""));
        mc.setFinanciamiento(new Financiamiento(0, ""));
        mc.setTipoNombramiento(new TipoNombramiento(0, ""));
        mc.setMaestro(maestro);
        maestro.getMaestoCargoList().add(mc);
        index = maestro.getMaestoCargoList().indexOf(mc);
        FacesMessage msg = new FacesMessage("Campos nuevos agregados",
                "Seleccione los datos adecuados antes de proceder a guardarlos");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    
    public void setChange() {
        maestro = mfl.find(axiliarController.getP().getIdpersona());
        maestro.setMaestoCargoList(mcfl.getMaestroCargoByIdMaestro(maestro.getIdmaestro()));
    }
    
    public void guardar() {
        try {
            Persona p = maestro.getPersona();
            p.setMaestro(maestro);
            Persona m = pfl.find(p.getIdpersona());
            if (m == null) {
                maestro.getPersona().setPersonaContrasenya(DigestUtils.md5Hex(new Auxiliar().getDui(maestro.getPersona())));
                pfl.create(p);
            } else {
                List<MaestoCargo> mm = new ArrayList<>();
                List<MaestoCargo> mm0 = mcfl.getMaestroCargoByIdMaestro(m.getIdpersona());
                maestro.getMaestoCargoList().forEach(mm::add);
                maestro.setMaestoCargoList(new ArrayList<>());
                pfl.edit(p);
                mm0.forEach((mc) -> {
                    if (!mm.contains(mc)) {
                        mcfl.remove(mc);
                        persistirNotificación(new mensaje(maestro.getIdmaestro(), usuario.getIdpersona(), " ",
                                new FacesMessage(FacesMessage.SEVERITY_INFO, "Relevación de Cargo",
                                        "Ha sido relevado de su cargo como " + mc.getCargo().getCargoNombre() + " "
                                        + "Por " + usuario.getPersonaNombre().split(" ")[0] + " "
                                        + usuario.getPersonaApellido().split(" ")[0])));
                    } else {
                        mm.remove(mc);
                    }
                });
                mm.forEach((mc) -> {
                    mcfl.create(mc);
                    persistirNotificación(new mensaje(maestro.getIdmaestro(), usuario.getIdpersona(), " ",
                            new FacesMessage(FacesMessage.SEVERITY_INFO, "Asignación de Cargo",
                                    usuario.getPersonaNombre().split(" ")[0] + " "
                                    + usuario.getPersonaApellido().split(" ")[0]
                                    + " le ha asignado el cargo de " + mc.getCargo().getCargoNombre())));
                });
            }
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Guardado con éxito",
                            "Los datos de " + maestro.getPersona().getPersonaNombre()
                            + " han sido guardados con éxito."));
        } catch (Exception o) {
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje", new FacesMessage(
                    FacesMessage.SEVERITY_FATAL, "Error al intentar guardar", o.getMessage()));
        } finally {
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("agregacion.intex");
            } catch (IOException ex) {
                init();
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(
                        FacesMessage.SEVERITY_FATAL, "Error Desconocido", ex.getMessage() == null ? "Error desconocido al intentar guardar"
                        : ex.getMessage()));
            }
        }
    }
    
    public List<Cargo> getCargos() {
        return Collections.unmodifiableList(cargos);
    }
    
    public List<Financiamiento> getFinanciamientos() {
        return Collections.unmodifiableList(financiamientos);
    }
    
    public List<TipoNombramiento> getNombramientos() {
        return Collections.unmodifiableList(nombramientos);
    }
    
    private void persistirNotificación(mensaje x) {
        try {
            x.getNotificacion().setFechaHora(new Date());
            notiFL.create(x.getNotificacion());
            sendMessage(x.toString());
        } catch (Exception e) {
        }
    }
    
    @Inject
    @Push
    private PushContext notificacion;
    
    public void sendMessage(String message) {
        notificacion.send(message);
    }
    
    public List<TipoSueldos> getTipoS() {
        return tipoS;
    }
    
    public void setTipoS(List<TipoSueldos> tipoS) {
        this.tipoS = tipoS;
    }
    
    public List<TipoEspecialidades> getTipoE() {
        return tipoE;
    }
    
    public void setTipoE(List<TipoEspecialidades> tipoE) {
        this.tipoE = tipoE;
    }
    
}
