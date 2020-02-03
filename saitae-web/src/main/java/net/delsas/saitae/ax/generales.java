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
import net.delsas.saitae.entities.Materia;

/**
 *
 * @author delsas
 */
public class generales implements Serializable {

    private Materia G1A;
    private Materia G1B;
    private Materia G2A;
    private Materia G2B;

    public generales() {
    }

    public generales(Materia G1A, Materia G1B, Materia G2A, Materia G2B) {
        this.G1A = G1A;
        this.G1B = G1B;
        this.G2A = G2A;
        this.G2B = G2B;
    }

    public Materia getG1A() {
        return G1A;
    }

    public void setG1A(Materia G1A) {
        this.G1A = G1A;
    }

    public Materia getG1B() {
        return G1B;
    }

    public void setG1B(Materia G1B) {
        this.G1B = G1B;
    }

    public Materia getG2A() {
        return G2A;
    }

    public void setG2A(Materia G2A) {
        this.G2A = G2A;
    }

    public Materia getG2B() {
        return G2B;
    }

    public void setG2B(Materia G2B) {
        this.G2B = G2B;
    }

    @Override
    public String toString() {
        return "generales{" + "G1A=" + G1A + ", G1B=" + G1B + ", G2A=" + G2A + ", G2B=" + G2B + '}';
    }

}
