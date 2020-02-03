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
import net.delsas.saitae.entities.MestroHorarioMaterias;

/**
 *
 * @author delsas
 */
public class secciones implements Serializable {

    private MestroHorarioMaterias a1;
    private MestroHorarioMaterias b1;
    private MestroHorarioMaterias a2;
    private MestroHorarioMaterias b2;
    private MestroHorarioMaterias a3;
    private MestroHorarioMaterias b3;

    public secciones() {
    }

    public MestroHorarioMaterias getA1() {
        return a1;
    }

    public void setA1(MestroHorarioMaterias a1) {
        this.a1 = a1;
    }

    public MestroHorarioMaterias getB1() {
        return b1;
    }

    public void setB1(MestroHorarioMaterias b1) {
        this.b1 = b1;
    }

    public MestroHorarioMaterias getA2() {
        return a2;
    }

    public void setA2(MestroHorarioMaterias a2) {
        this.a2 = a2;
    }

    public MestroHorarioMaterias getB2() {
        return b2;
    }

    public void setB2(MestroHorarioMaterias b2) {
        this.b2 = b2;
    }

    public MestroHorarioMaterias getA3() {
        return a3;
    }

    public void setA3(MestroHorarioMaterias a3) {
        this.a3 = a3;
    }

    public MestroHorarioMaterias getB3() {
        return b3;
    }

    public void setB3(MestroHorarioMaterias b3) {
        this.b3 = b3;
    }
}
