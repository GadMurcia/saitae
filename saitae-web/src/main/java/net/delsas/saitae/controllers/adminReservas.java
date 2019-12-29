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

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.entities.Ejemplar;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.ReservaDetalle;
import net.delsas.saitae.entities.SolicitudReserva;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class adminReservas implements Serializable {

    private static final long serialVersionUID = 1L;
    @EJB
    private ReservaFacadeLocal resFL;
    private List<Reserva> solicitados, entregados, devueltos, rechazados, cancelados, aceptados;
    private List<Integer> tipos;
    private Reserva selected;
    private String textoReserva;
    private String[] u;
    private boolean rechazo;
    private Persona usuario;

    @PostConstruct
    public void init() {
        usuario = (Persona) FacesContext.getCurrentInstance()
                .getExternalContext().getSessionMap().get("usuario");
        tipos = new ArrayList<>();
        tipos.add(usuario.getTipoPersona().getIdtipoPersona());
        usuario.getDelagacionCargoList().forEach((dl) -> {
            tipos.add(dl.getIdTipoPersona().getIdtipoPersona());
        });
        if (usuario.getMaestro() != null) {
            usuario.getMaestro().getMaestoCargoList().forEach((mc) -> {
                tipos.add(mc.getCargo().getCargoTipoPersona().getIdtipoPersona());
            });
        }
        solicitados = resFL.getReservaByEstado("S");
        entregados = resFL.getReservaByEstado("E");
        devueltos = resFL.getReservaByEstado("D");
        rechazados = resFL.getReservaByEstado("R");
        cancelados = resFL.getReservaByEstado("C");
        aceptados = resFL.getReservaByEstado("A");
        textoReserva = "";
        u = new String[]{"Docente", "Estudiante", "Grupo de estudiantes", "Personal (No académico)"};
        rechazo = false;
    }

    public List<Reserva> getSolicitados() {
        return Collections.unmodifiableList(solicitados);
    }

    public void setSolicitados(List<Reserva> solicitados) {
        this.solicitados = solicitados;
    }

    public List<Reserva> getEntregados() {
        return Collections.unmodifiableList(entregados);
    }

    public void setEntregados(List<Reserva> entregados) {
        this.entregados = entregados;
    }

    public List<Reserva> getDevueltos() {
        return Collections.unmodifiableList(devueltos);
    }

    public void setDevueltos(List<Reserva> devueltos) {
        this.devueltos = devueltos;
    }

    public List<Reserva> getRechazados() {
        return Collections.unmodifiableList(rechazados);
    }

    public void setRechazados(List<Reserva> rechazados) {
        this.rechazados = rechazados;
    }

    public Reserva getSelected() {
        return selected;
    }

    public void setSelected(Reserva selected) {
        this.selected = selected;
    }

    public List<Reserva> getCancelados() {
        return Collections.unmodifiableList(cancelados);
    }

    public void setCancelados(List<Reserva> cancelados) {
        this.cancelados = cancelados;
    }

    public List<Reserva> getAceptados() {
        return Collections.unmodifiableList(aceptados);
    }

    public void setAceptados(List<Reserva> aceptados) {
        this.aceptados = aceptados;
    }

    public String getFechaString(Date d) {
        if (d == null) {
            return "";
        }
        return new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d);
    }

    public void onRowSelect(SelectEvent event) {
        String id = event.getComponent().getId();
        selected = (Reserva) event.getObject();
        rechazo = false;
        switch (id) {
            case "solicitados":
                textoReserva = "solicitad";
                break;
            case "aceptados":
                textoReserva = "aceptad";
                break;
            case "entregados":
                textoReserva = "entregad";
                break;
            case "devueltos":
                textoReserva = "devuelt";
                break;
            case "rechazados":
                textoReserva = "rechazad";
                rechazo = true;
                break;
            case "cancelados":
                textoReserva = "cancelad";
                break;
            default:
        }
    }

    public String getTextoReserva() {
        return textoReserva;
    }

    public void setTextoReserva(String textoReserva) {
        this.textoReserva = textoReserva;
    }

    public void setReservaDetalle(List<Ejemplar> e) {
        selected.setReservaDetalleList(new ArrayList<>());
        e.stream().map((r) -> {
            ReservaDetalle s = new ReservaDetalle(r.getEjemplarPK().getIdRecurso(),
                    r.getEjemplarPK().getEjemplarCorrelativo(),
                    selected.getIdreserva());
            s.setEjemplar(r);
            s.setReserva(selected);
            s.setReservaDetalleComentario("");
            return s;
        }).forEachOrdered((s) -> {
            selected.getReservaDetalleList().add(s);
        });
    }

    public List<Ejemplar> getReservaDetalle() {
        List<Ejemplar> r = new ArrayList<>();
        List<ReservaDetalle> rds = selected.getReservaDetalleList();
        if (rds != null) {
            rds.forEach((rd) -> {
                r.add(rd.getEjemplar());
            });
        }
        return r;
    }

    public List<SolicitudReserva> getSolicitudReservaDetalle() {
        return selected != null ? selected.getSolicitudReservaList() : new ArrayList<>();
    }

    public String getUsos() {
        return (selected != null && getUsadoPor() > 0) ? u[(getUsadoPor() - 1)] : "";
    }

    public void setResponsable(String resp) {
        setCom(0, resp);
    }

    public String getResponsable() {
        return selected != null ? selected.getReservaComentario().split("¿¿")[0] : " ";
    }

    public String getResponsableTabla(Reserva r) {
        return r != null ? r.getReservaComentario().split("¿¿")[0] : "";
    }

    public Integer getNumeroPractica() {
        return selected != null ? Integer.valueOf(selected.getReservaComentario().split("¿¿")[2]) : 0;
    }

    public void setNumeroPractica(Integer n) {
        setCom(2, n + "");
    }

    public void setCom(Integer ind, String v) {
        String c[] = selected.getReservaComentario().split("¿¿");
        String rr = "";
        for (Integer y = 0; y < c.length; y++) {
            rr += (y > 0 ? "¿¿" : "") + (Objects.equals(y, ind) ? v : c[y]);
        }
        selected.setReservaComentario(rr);
        System.out.println("Se guardó " + ind + " en el indice " + ind + ". Cadena total: " + rr);
    }

    public void setUsadoPor(int usadoPor) {
        setCom(1, usadoPor + "");
    }

    public int getUsadoPor() {
        return selected != null ? Integer.valueOf(selected.getReservaComentario().split("¿¿")[1]) : 0;
    }

    public String getDocente(Reserva r) {
        Maestro m = r != null ? r.getDocente() : null;
        String salida = "";
        if (m != null) {
            salida += m.getPersona().getPersonaNombre().split(" ")[0]
                    + " " + m.getPersona().getPersonaApellido().split(" ")[0];
        }
        return salida;
    }

    public String getRazonRechazo() {
        return selected != null ? selected.getReservaComentario().split("¿¿")[3] : "";
    }

    public void setRazonRechazo(String rechazo) {
        setCom(3, rechazo);
    }

    public String getGradoNombre(Grado g) {
        if (g == null) {
            return "";
        }
        GradoPK id = g.getGradoPK();
        return id.getIdgrado() + "° " + (id.getGradoModalidad().equals("C") ? "TVC Contador"
                : (id.getGradoModalidad().equals("S") ? "TVC Secretariado" : "General"))
                + " " + id.getGradoSeccion();
    }

    public boolean isRechazo() {
        return rechazo;
    }

    public void setRechazo(boolean rechazo) {
        this.rechazo = rechazo;
    }

    public boolean isVariasPersonas() {
        return selected == null ? false : selected.getPersonasReservaList().size() > 1;
    }

    public Grado getGradoActualDePersonas(Persona p) {
        Grado g = null;
        if (p != null && p.getEstudiante() != null) {
            for (Matricula m : p.getEstudiante().getMatriculaList()) {
                if (m.getGrado().getGradoPK().getGradoAño() == getAñoActual()) {
                    g = m.getGrado();
                }
            }
        }
        return g;
    }

    public boolean isGradoValido() {
        return getGradoUso().split("").length > 1;
    }

    public String getGradoUso() {
        String g = "";
        for (Persona p : getPersonasEnSolicitud()) {
            String n = p.getPersonaNombre().split(" ")[0]
                    + " " + p.getPersonaApellido().split(" ")[0];
            if (getResponsable().equals(n)) {
                if (p.getEstudiante() != null) {
                    Grado gg = getGradoActualDePersonas(p);
                    g = gg != null ? getGradoNombre(gg) : "";
                }
            }
        }
        return g;
    }

    public int getAñoActual() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public List<Persona> getPersonasEnSolicitud() {
        List<Persona> l = new ArrayList<>();
        if (selected != null) {
            selected.getPersonasReservaList().forEach((pr) -> {
                l.add(pr.getPersona());
            });
        }

        return l;
    }

    public String getPersonasEnSolicitudTexto() {
        String l = "";
        for (Persona p : getPersonasEnSolicitud()) {
            l += (l.split("").length > 0 ? "\n" : "") + "* " + p.getPersonaNombre() + " "
                    + p.getPersonaApellido();
        }
        return l;
    }

    public boolean isadmin() {
        return (tipos.contains(1) || tipos.contains(2));
    }

    public String getTipoRecurso(Reserva r) {
        return r == null ? "" : (!r.getSolicitudReservaList().isEmpty()
                ? r.getSolicitudReservaList().get(0).getRecurso().getIdTipoRecurso().getTipoRecursoNombre()
                : "");
    }

}
