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

import java.text.SimpleDateFormat;
import java.util.Date;
import net.delsas.saitae.entities.Notificaciones;

/**
 *
 * @author delsas
 */
public class orden {
    
    private String fecha;
    private String remitente;
    private String titulo;
    private String texo;

    public orden(String fecha, String remitente, String titulo, String texo) {
        this.fecha = fecha;
        this.remitente = remitente;
        this.titulo = titulo;
        this.texo = texo;
    }

    public orden(Notificaciones n) {
        fecha = getFechaLegible(n.getFechaHora());
        remitente = n.getRemitente().getPersonaNombre() + " " + n.getRemitente().getPersonaApellido();
        titulo = n.getNotificacionTitulo();
        texo = n.getNotificacionCuerpo();
    }

    public static String getFechaLegible(Date d) {
        return new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d);
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexo() {
        return texo;
    }

    public void setTexo(String texo) {
        this.texo = texo;
    }
    
}
