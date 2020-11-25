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

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.apache.commons.collections4.CollectionUtils;

/**
 *
 * @author delsas
 */
public enum Meses {
    Enero(1, "Enero"),
    Febrero(2, "Febrero"),
    Marzo(3, "Marzo"),
    Abril(4, "Abril"),
    Mayo(5, "Mayo"),
    Junio(6, "Junio"),
    Julio(7, "Julio"),
    Agosto(8, "Agosto"),
    Septiembre(9, "Septiembre"),
    Octubre(10, "Octubre"),
    Noviembre(11, "Noviembre"),
    Diciembre(12, "Diciembre");

    Meses(int numero, String nombre) {
        this.numero = numero;
        this.nombre = nombre;
    }

    private final int numero;
    private final String nombre;

    public int getNumero() {
        return numero;
    }

    public String getNombre() {
        return nombre;
    }

    private static String no;
    private static int nu;

    public static String getNombreByNumero(int numero) {
        no = null;
        Arrays.stream(values()).filter(m0 -> (m0.getNumero() == numero)).forEach(m0 -> {
            no = m0.getNombre();
        });
        return no;
    }

    public static int getNumeroByNombre(String nombre) {
        nu = -1;
        Arrays.stream(values()).filter(m0 -> (m0.getNombre().equalsIgnoreCase(nombre))).forEach(m0 -> {
            nu = m0.getNumero();
        });
        return nu;
    }
}
