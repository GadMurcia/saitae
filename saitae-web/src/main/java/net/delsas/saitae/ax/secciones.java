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
import net.delsas.saitae.entities.MestroHorarioMateriasPK;

/**
 *
 * @author delsas
 */
public class secciones implements Serializable {

    private MestroHorarioMateriasPK a1;
    private MestroHorarioMateriasPK b1;
    private MestroHorarioMateriasPK a2;
    private MestroHorarioMateriasPK b2;
    private MestroHorarioMateriasPK a3;
    private MestroHorarioMateriasPK b3;

    public secciones() {
    }

    public MestroHorarioMateriasPK getA1() {
        return a1;
    }

    public void setA1(MestroHorarioMateriasPK a1) {
        this.a1 = a1;
    }

    public MestroHorarioMateriasPK getB1() {
        return b1;
    }

    public void setB1(MestroHorarioMateriasPK b1) {
        this.b1 = b1;
    }

    public MestroHorarioMateriasPK getA2() {
        return a2;
    }

    public void setA2(MestroHorarioMateriasPK a2) {
        this.a2 = a2;
    }

    public MestroHorarioMateriasPK getB2() {
        return b2;
    }

    public void setB2(MestroHorarioMateriasPK b2) {
        this.b2 = b2;
    }

    public MestroHorarioMateriasPK getA3() {
        return a3;
    }

    public void setA3(MestroHorarioMateriasPK a3) {
        this.a3 = a3;
    }

    public MestroHorarioMateriasPK getB3() {
        return b3;
    }

    public void setB3(MestroHorarioMateriasPK b3) {
        this.b3 = b3;
    }
}
