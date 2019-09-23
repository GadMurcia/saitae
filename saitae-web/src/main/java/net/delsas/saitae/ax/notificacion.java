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
package net.delsas.saitae.ax;

/**
 *
 * @author delsas
 */
public class notificacion {

    private String nombreNoti;
    private String cuerpoNoti;
    private boolean verNoti;
    private boolean collapsed;

    public notificacion(String nombreNoti, String cuerpoNoti) {
        this.nombreNoti = nombreNoti;
        this.cuerpoNoti = cuerpoNoti;
        this.verNoti=true;
        this.collapsed=false;
    }

    public notificacion() {
        this.nombreNoti = "";
        this.cuerpoNoti = "";
        this.verNoti=true;
        this.collapsed=false;
    }

    public String getNombreNoti() {
        return nombreNoti;
    }

    public void setNombreNoti(String nombreNoti) {
        this.nombreNoti = nombreNoti;
    }

    public String getCuerpoNoti() {
        return cuerpoNoti;
    }

    public void setCuerpoNoti(String cuerpoNoti) {
        this.cuerpoNoti = cuerpoNoti;
    }

    @Override
    public String toString() {
        return nombreNoti + ":::" + cuerpoNoti;
    }

    public void notificacionFromString(String notiString) {
        String[] m = notiString.split(":::");
        if (m.length == 2) {
            this.cuerpoNoti = m[1];
            this.nombreNoti = m[0];
        } else {
            this.cuerpoNoti = "";
            this.nombreNoti = "";
            System.out.println("NO se entendió la cadena");
        }
            this.verNoti=true;
            this.collapsed=false;
    }

    public boolean isVerNoti() {
        return verNoti;
    }

    public void setVerNoti(boolean verNoti) {
        this.verNoti = verNoti;
    }

    public boolean isCollapsed() {
        return collapsed;
    }

    public void setCollapsed(boolean collapsed) {
        this.collapsed = collapsed;
    }

}
