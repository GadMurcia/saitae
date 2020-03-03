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
import java.util.List;

/**
 *
 * @author delsas
 */
public class ReporteMatricula implements Serializable {

    private String modalidad;
    private List<MatriculaSeccion> mats;

    public ReporteMatricula() {
    }

    public ReporteMatricula(String modalidad, List<MatriculaSeccion> mats) {
        this.modalidad = modalidad;
        this.mats = mats;
    }

    public List<MatriculaSeccion> getMats() {
        return mats;
    }

    public void setMats(List<MatriculaSeccion> mats) {
        this.mats = mats;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    @Override
    public String toString() {
        return "ReporteMatricula{" + "modalidad=" + modalidad + '}';
    }
}
