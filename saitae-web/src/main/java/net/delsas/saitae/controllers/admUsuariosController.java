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

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.DelagacionCargoFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.DelagacionCargo;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;
import org.apache.commons.codec.digest.DigestUtils;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class admUsuariosController extends Auxiliar implements Serializable {

    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private TipoPersonaFacadeLocal tpFL;
    @EJB
    private DelagacionCargoFacadeLocal dcFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    private String pagina;
    private FacesContext context;
    private Persona persona;
    private Persona usuario;
    private boolean secret;
    private String query, contra1, contra2;
    private List<TipoPersona> cargos;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance()
                .getExternalContext().getSessionMap().get("usuario");
        context = FacesContext.getCurrentInstance();
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), pFL))) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                FacesContext.getCurrentInstance().getExternalContext().redirect("perfil.intex");
                return;
            }
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage("form0:msgs",
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                            "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
            PrimeFaces.current().ajax().update("form0:msgs");
        }
        secret = getTiposPersonas(usuario, pFL).contains(13);
        query = "";
        init2();
    }

    private void init2() {
        contra1 = "";
        contra2 = "";
    }

    public List<String> autoComplete(String q) {
        persona = null;
        List<String> i = new ArrayList<>();
        List<Persona> ps = /*secret ? pFL.getPersonaByLikeNombreAndType(q, 8)
                : */ pFL.getPersonaByLikeNombre(q);
        ps.stream()
                .filter((p) -> (!(getTiposPersonas(p, pFL).contains(1) || getTiposPersonas(p, pFL).contains(2))))
                .forEachOrdered((p) -> {
                    i.add(getNombreCompletoPersona(p) + " ID: "
                            + p.getIdpersona().toString().substring(1));
                });
        if (i.size() < 1) {
            i.add("No hay resultados");
        }
        return i;
    }

    public void onPersonaSelect(SelectEvent e) {
        String[] val = e.getObject().toString().split(" ID: ");
        if (val.length > 1) {
            persona = pFL.find(Integer.valueOf("1" + val[1]));
            if (persona.getDelagacionCargoList() == null) {
                persona.setDelagacionCargoList(new ArrayList<>());
            }
            query = val[0];
        } else {
            query = "";
            persona = null;
        }
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public boolean isSecret() {
        return secret;
    }

    public void setSecret(boolean secret) {
        this.secret = secret;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public void cambiarContraseña() {
        FacesMessage ms = null;
        if (contra1 == null && contra1.isEmpty()) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error",
                    "Debe ingresar una nueva contraseña");
        } else if (!contra1.equals(contra2)) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error",
                    "La contraseña nueva debe coincidir");
        } else {
            persona.setPersonaContrasenya(DigestUtils.md5Hex(contra1));
            guardarPersona();
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), " ",
                            new FacesMessage(FacesMessage.SEVERITY_WARN,
                                    "Recuperaciń de contraseña",
                                    "Su contraseña ha sido modificada por "
                                    + getNombreCortoPersona(usuario)
                                    + ". Recuerde cambiar su contraseña en su perfil "
                                    + "y mantenerla en secreto")),
                    persona, notiFL, notificacion);
        }
        if (ms != null) {
            FacesContext.getCurrentInstance().addMessage("form0:msgs", ms);
            PrimeFaces.current().ajax().update("form0:msgs");
        }
    }

    public void guardarPersona() {
        pFL.edit(persona);
        init2();
        FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_INFO, "Cambios realizados",
                        "Los datos se han actualizado"));
        PrimeFaces.current().ajax().update("form0:msgs");
    }

    public String getContra1() {
        return contra1;
    }

    public void setContra1(String contra1) {
        this.contra1 = contra1;
    }

    public String getContra2() {
        return contra2;
    }

    public void setContra2(String contra2) {
        this.contra2 = contra2;
    }

    public boolean isVerDelegaciones() {
        return persona != null && !secret;
    }

    public void onAddNew() {
        DelagacionCargo dl = new DelagacionCargo(-1);
        dl.setDelagacionCargoComentario("");
        dl.setFechaInicio(new Date());
        dl.setFechaFin(new Date());
        dl.setIdpersona(persona);
        if (!persona.getDelagacionCargoList().contains(dl)) {
            persona.getDelagacionCargoList().add(dl);
        }
    }

    public void onRowEdit(RowEditEvent event) {
        DelagacionCargo dl = (DelagacionCargo) event.getObject();
        persona.getDelagacionCargoList().remove(dl);
        if (dcFL.find(dl.getIddelagacionCargo()) == null) {
            dcFL.create(dl);
        }
        dcFL.edit(dl);
        persona.getDelagacionCargoList().add(dl);
        guardarPersona();
        persistirNotificación(
                new mensaje(0, usuario.getIdpersona(), getActualizaciones(persona.getTipoPersona().getIdtipoPersona(), dl.getIdTipoPersona().getIdtipoPersona())/*"admUsuarios<form"*/,
                        new FacesMessage(FacesMessage.SEVERITY_WARN,
                                "Asignación de cargo",
                                getNombreCortoPersona(usuario)
                                + " le ha asignado el cargo de " + dl.getIdTipoPersona().getTipoPersonaNombre()
                                + ". Los cambios en su menú lo verá "
                                + "cuando actualice o cambie de págiba. "
                                + "Compruebe sus asignaciones de cargos en su perfil de usuario.")),
                persona, notiFL, notificacion);
        PrimeFaces.current().ajax().update(event.getComponent().getClientId());
    }

    public void onRowCancel(RowEditEvent event) {
        DelagacionCargo dl = (DelagacionCargo) event.getObject();
        persona.getDelagacionCargoList().remove(dl);
        if (!dl.getIddelagacionCargo().equals(-1)) {
            dcFL.remove(dl);
            persistirNotificación(
                    new mensaje(0, usuario.getIdpersona(), getActualizaciones(persona.getTipoPersona().getIdtipoPersona(), dl.getIdTipoPersona().getIdtipoPersona())/*"admUsuarios<form"*/,
                            new FacesMessage(FacesMessage.SEVERITY_WARN,
                                    "Relevación de cargo",
                                    getNombreCortoPersona(usuario)
                                    + " le ha relevado del cargo de " + dl.getIdTipoPersona().getTipoPersonaNombre()
                                    + ". Los cambios en su menú los verá "
                                    + "cuando actualice o cambie de págiba. "
                                    + "Compruebe sus asignaciones de cargos en su perfil de usuario.")),
                    persona, notiFL, notificacion);
        }
        guardarPersona();
        PrimeFaces.current().ajax().update(event.getComponent().getClientId());
    }

    public List<TipoPersona> getCargos() {
        cargos = tpFL.findAll();
        List<Integer> tps = getTiposPersonas(persona, pFL);
        for (Integer i : new Integer[]{1, 14, 3, 4, 8, 9, 10, 11}) {
            if (!tps.contains(i)) {
                tps.add(i);
            }
        }
        tps.forEach((i) -> {
            cargos.remove(tpFL.find(i));
        });
        return cargos;
    }
    String cat = "";

    private String getActualizaciones(int id0, int id1) {
        cat = "";
        for (int id : new int[]{id0, id1}) {
            tpFL.find(id).getAccesoTipoPersonaList().forEach(atp -> {
                Acceso a = atp.getAcceso();
                if (!cat.contains(a.getAccesourl().split(".in")[0])) {
                    cat += (cat.isEmpty() ? "" : "<<") + a.getAccesourl().split(".in")[0] + "<form>form0";
                }
            });
        }
        return cat;
    }
}
