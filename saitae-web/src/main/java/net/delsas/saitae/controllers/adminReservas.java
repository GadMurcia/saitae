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
import java.util.Collections;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.ReservaFacadeLocal;
import net.delsas.saitae.entities.Reserva;

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
    private Reserva selected;

    @PostConstruct
    public void init() {
        solicitados = resFL.getReservaByEstado("S");
        entregados = resFL.getReservaByEstado("E");
        devueltos = resFL.getReservaByEstado("D");
        rechazados = resFL.getReservaByEstado("R");
        cancelados = resFL.getReservaByEstado("C");
        aceptados = resFL.getReservaByEstado("A");
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

}
