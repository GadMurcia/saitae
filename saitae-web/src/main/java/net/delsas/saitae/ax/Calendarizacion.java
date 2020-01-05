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
package net.delsas.saitae.ax;

import java.util.Date;
import java.util.Objects;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import net.delsas.saitae.entities.Horario;

/**
 *
 * @author delsas
 */
public class Calendarizacion {

    private Integer numero;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    private Horario horai;
    private Horario horaf;
    private String observacion;

    public Calendarizacion() {
    }

    public Calendarizacion(Integer numero, Date fecha, Horario horai, Horario horaf, String observacion) {
        this.numero = numero;
        this.fecha = fecha;
        this.horai = horai;
        this.horaf = horaf;
        this.observacion = observacion;
    }

    public Calendarizacion(Calendarizacion c) {
        this.numero = c.getNumero();
        this.fecha = c.getFecha();
        this.horai = c.getHorai();
        this.horaf = c.getHoraf();
        this.observacion = c.getObservacion();
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Horario getHorai() {
        return horai;
    }

    public void setHorai(Horario horai) {
        this.horai = horai;
    }

    public Horario getHoraf() {
        return horaf;
    }

    public void setHoraf(Horario horaf) {
        this.horaf = horaf;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 37 * hash + Objects.hashCode(this.numero);
        hash = 37 * hash + Objects.hashCode(this.fecha);
        hash = 37 * hash + Objects.hashCode(this.horai);
        hash = 37 * hash + Objects.hashCode(this.horaf);
        hash = 37 * hash + Objects.hashCode(this.observacion);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Calendarizacion other = (Calendarizacion) obj;
        if (!Objects.equals(this.observacion, other.getObservacion())) {
            return false;
        }
        if (!Objects.equals(this.numero, other.getNumero())) {
            return false;
        }
        if (!Objects.equals(this.fecha, other.getFecha())) {
            return false;
        }
        if (!Objects.equals(this.horai, other.getHorai())) {
            return false;
        }
        return Objects.equals(this.horaf, other.getHoraf());
    }

    @Override
    public String toString() {
        return "Calendarizacion{" + "numero=" + numero + ", fecha=" + fecha + ", horai=" + horai + ", horaf=" + horaf + ", observacion=" + observacion + '}';
    }

}
