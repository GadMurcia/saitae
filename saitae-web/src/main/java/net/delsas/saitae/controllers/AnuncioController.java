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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AnuncioFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class AnuncioController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private TipoPersonaFacadeLocal tipoPersonaFL;
    @EJB
    private AnuncioFacadeLocal anuncioFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;

    private Anuncio anuncio;
    private Persona usuario;
    private List<TipoPersona> tiposPersonas;
    private List<Anuncio> activos;
    private List<Anuncio> inactivos;

    @PostConstruct
    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
            if (usuario == null) {
                context.getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_ERROR,
                                "Falla!", "Esa vista no le está permitida."));
                context.getExternalContext().redirect("./../");
            } else {
                anuncio = new Anuncio();
                anuncio.setAnuncioAnunciante(usuario);
                tiposPersonas = tipoPersonaFL.findAll();
                tiposPersonas.remove(tipoPersonaFL.find(1));
                tiposPersonas.remove(tipoPersonaFL.find(10));
                tiposPersonas.remove(tipoPersonaFL.find(11));
                activos = anuncioFL.getAnunciosActivos();
                inactivos = anuncioFL.getAnunciosInactivos();
                Integer tp = usuario.getTipoPersona().getIdtipoPersona();
                if (!(tp == 1 || tp == 2)) {
                    List<Anuncio> actNoMios = new ArrayList<>();
                    List<Anuncio> inaNoMios = new ArrayList<>();
                    activos.stream().filter((a) -> (!Objects.equals(a.getAnuncioAnunciante().getIdpersona(), usuario.getIdpersona()))).forEachOrdered((a) -> {
                        actNoMios.add(a);
                    });
                    inactivos.stream().filter((a) -> (!Objects.equals(a.getAnuncioAnunciante().getIdpersona(), usuario.getIdpersona()))).forEachOrdered((a) -> {
                        inaNoMios.add(a);
                    });
                    activos.removeAll(actNoMios);
                    inactivos.removeAll(inaNoMios);
                }
            }
        } catch (IOException e) {

        }
    }

    public void onRowSelect(SelectEvent event) {
        //anuncio = (Anuncio) event.getObject();
    }

    public void onHide() {
        anuncio = new Anuncio();
    }

    public void guardar() {
        try {
            anuncio.setIdanuncio(null);
            anuncioFL.create(anuncio);
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Anunciado con éxito",
                            "El anuncio ha sido publicado con éxito"));
            persistirNotificación(
                    new mensaje(0, "Nuevo auncio publicado recientemente por "
                            + getNombreCortoPersona(anuncio.getAnuncioAnunciante()),
                            "Nuevo anuncio disponible", FacesMessage.SEVERITY_INFO, usuario.getIdpersona(),
                            "perfil<form¿¿¿tp¿¿" + (Optional.ofNullable(anuncio.getAnuncioTipoPersona()).orElseGet(() -> new TipoPersona(0))).getIdtipoPersona()),
                    getPersonasParaNotificar(anuncio.getAnuncioTipoPersona()),
                    notiFL, notificacion);
            init();
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error!", "error en guardar anuncio " + e.getMessage()));
        }
    }

    public Anuncio getAnuncio() {
        return anuncio;
    }

    public void setAnuncio(Anuncio anuncio) {
        this.anuncio = anuncio != null ? anuncio : this.anuncio;
    }

    public List<TipoPersona> getTiposPersonas() {
        return Collections.unmodifiableList(tiposPersonas);
    }

    public List<Anuncio> getActivos() {
        return Collections.unmodifiableList(activos);
    }

    public List<Anuncio> getInactivos() {
        return Collections.unmodifiableList(inactivos);
    }

    public String getAnunciante(Anuncio a) {
        return a.getAnuncioAnunciante().getPersonaNombre().split(" ")[0]
                + " " + a.getAnuncioAnunciante().getPersonaApellido().split(" ")[0]
                + " (" + a.getAnuncioAnunciante().getTipoPersona().getTipoPersonaNombre() + ")";
    }

    public String getDirigidoA(Anuncio a) {
        return a.getAnuncioTipoPersona() == null ? "Todos"
                : a.getAnuncioTipoPersona().getTipoPersonaNombre();
    }

    public boolean getAnuncioActivo(Anuncio a) {
        Date d = new Date();
        boolean z = (a == null || a.getAnuncioFechaFin() == null)
                ? false : activos.contains(a);
        return z;
    }

    public String getFechasToString(Date d) {
        return d == null ? "" : new SimpleDateFormat("EEEEE dd/MM/yyyy").format(d);
    }

    public void modificar(int o) {
        FacesMessage ms = null;
        Anuncio an = anuncioFL.find(anuncio.getIdanuncio());
        String com = "";
        if (o == 1 && !an.equals(anuncio)) {//modificar
            com = "Modificado por: "
                    + usuario.getPersonaNombre() + " " + usuario.getPersonaApellido();
            ms = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "Modificación exitosa",
                    "El anuncio se ha modificado con éxito y su nueva información información"
                    + " ya es visible para sus destinatarios.");
        } else if (o == 2) {//desabilitar
            com = "Desabilitado por: "
                    + usuario.getPersonaNombre() + " " + usuario.getPersonaApellido();
            Date f = new Date();
            int d = Integer.valueOf(new SimpleDateFormat("dd").format(f));
            int m = Integer.valueOf(new SimpleDateFormat("MM").format(f));
            int añ = getAñoActual();
            añ = (d == 1 && m == 1) ? añ - 1 : añ;
            m = d == 1 ? (m == 1 ? 12 : m - 1) : m;
            d = d == 1 ? getMaxDia(m) : d - 1;
            try {
                f = new SimpleDateFormat("dd/MM/yyyy").parse(d + "/" + m + "/" + añ);
            } catch (ParseException ex) {
            }
            anuncio.setAnuncioFechaFin(f);
            ms = new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "Desabilitación exitosa",
                    "El anuncio se ha desabilitado y ya no será visible para sus destinatarios");
        }
        if (o == 1 && an.equals(anuncio)) {
            ms = new FacesMessage(FacesMessage.SEVERITY_WARN,
                    "Sin cambios!",
                    "No hay cambios en la información del anuncio. No se edita.");
            FacesContext.getCurrentInstance().addMessage("form0:msgs", ms);
            PrimeFaces.current().ajax().update("form0:msgs");
        } else {
            anuncio.setAnuncioComentario(com);
            anuncioFL.edit(anuncio);
            FacesContext.getCurrentInstance().addMessage(null, ms);
            PrimeFaces.current().executeScript("PF('Danuncio').hide()");
            PrimeFaces.current().ajax().update("form:tv", "da", "form0:msgs");
            sendMessage(new mensaje(0, "Un anunciopara usted ha sido " + com,
                    "Anuncio " + (o == 1 ? "Modificado" : (0 == 2 ? "Eliminado" : "")),
                    FacesMessage.SEVERITY_INFO, usuario.getIdpersona(),
                    "perfil<form¿¿¿tp¿¿"
                    + (Optional.ofNullable(anuncio.getAnuncioTipoPersona())
                            .orElseGet(() -> new TipoPersona(0)))
                            .getIdtipoPersona()).toString(), notificacion);            
            init();
        }
    }

    public boolean getVerComentario() {
        return (anuncio != null
                && anuncio.getAnuncioComentario() != null
                && !anuncio.getAnuncioComentario().isEmpty());
    }

    public int getMaxDia(int m) {
        switch (m) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;
            case 2:
                return 28;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            default:
                return 30;
        }
    }

    @Override
    public void onBlour(AjaxBehaviorEvent ev) {
        System.out.println(ev);
    }
}
