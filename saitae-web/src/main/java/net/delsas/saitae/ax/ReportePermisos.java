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

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import net.delsas.saitae.entities.Permisos;

/**
 *
 * @author delsas
 */
public class ReportePermisos implements Serializable {

    private Date fechaInicio;
    private Permisos permiso;
    private double numeroDias;
    private double numeroHoras;
    private double saldo;
    private boolean conGoce;

    public ReportePermisos() {
    }

    public ReportePermisos(Date fechaInicio, Permisos permiso, double numeroDias, double numeroHoras, double saldo, boolean conGoce) {
        this.fechaInicio = fechaInicio;
        this.permiso = permiso;
        this.numeroDias = numeroDias;
        this.numeroHoras = numeroHoras;
        this.saldo = saldo;
        this.conGoce = conGoce;
    }

    public ReportePermisos(Permisos p, double saldo, int pp) {
        this.fechaInicio = p.getPermisosPK().getPermisoFechaInicio();
        this.permiso = p;
        this.numeroHoras = (new Auxiliar()).getMinutos(p.getPermisoHoraInicio(), p.getPermisoHoraFin()) / 60;
        this.numeroDias = this.numeroHoras == 0
                ? (new Auxiliar()).getCantidadDias(p.getPermisosPK().getPermisoFechaInicio(), p.getPermisoFechafin())
                : 0;
        this.saldo = saldo < 0 ? 0.0
                : saldo - (numeroDias + numeroHoras / (pp == 0 ? 10.0
                        : (pp == 1 ? 5.0 : 8.0)));
        this.saldo *= 100;
        this.saldo = Math.round(this.saldo);
        this.saldo /= 100;
        this.conGoce = new Auxiliar().getPermisoGoceDeSueldo(p);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.fechaInicio);
        hash = 67 * hash + Objects.hashCode(this.permiso);
        hash = 67 * hash + (int) (Double.doubleToLongBits(this.numeroDias) ^ (Double.doubleToLongBits(this.numeroDias) >>> 32));
        hash = 67 * hash + (int) (Double.doubleToLongBits(this.numeroHoras) ^ (Double.doubleToLongBits(this.numeroHoras) >>> 32));
        hash = 67 * hash + (int) (Double.doubleToLongBits(this.saldo) ^ (Double.doubleToLongBits(this.saldo) >>> 32));
        hash = 67 * hash + (this.conGoce ? 1 : 0);
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
        final ReportePermisos other = (ReportePermisos) obj;
        if (Double.doubleToLongBits(this.numeroDias) != Double.doubleToLongBits(other.numeroDias)) {
            return false;
        }
        if (Double.doubleToLongBits(this.numeroHoras) != Double.doubleToLongBits(other.numeroHoras)) {
            return false;
        }
        if (Double.doubleToLongBits(this.saldo) != Double.doubleToLongBits(other.saldo)) {
            return false;
        }
        if (this.conGoce != other.conGoce) {
            return false;
        }
        if (!Objects.equals(this.fechaInicio, other.fechaInicio)) {
            return false;
        }
        return Objects.equals(this.permiso, other.permiso);
    }

    @Override
    public String toString() {
        return "ReportePermisos{" + "fechaInicio=" + fechaInicio + ", permiso=" + permiso + ", numeroDias=" + numeroDias + ", numeroHoras=" + numeroHoras + ", saldo=" + saldo + ", conGoce=" + conGoce + '}';
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Permisos getPermiso() {
        return permiso;
    }

    public void setPermiso(Permisos permiso) {
        this.permiso = permiso;
    }

    public double getNumeroDias() {
        return numeroDias;
    }

    public void setNumeroDias(double numeroDias) {
        this.numeroDias = numeroDias;
    }

    public double getNumeroHoras() {
        return numeroHoras;
    }

    public void setNumeroHoras(double numeroHoras) {
        this.numeroHoras = numeroHoras;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public boolean isConGoce() {
        return conGoce;
    }

    public void setConGoce(boolean conGoce) {
        this.conGoce = conGoce;
    }
}
