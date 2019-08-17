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
package net.delsas.saitae.aux;

import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;

/**
 *
 * @author delsas
 */
public class mensaje {

    private int destinatario;
    private String cuerpoMensaje;
    private String tituloMensaje;
    private Severity severidad;
    private int remitente;
    private String cadenaAccion;
    private FacesMessage facesmessage;

    public mensaje(int destinatario, String cuerpoMensaje, String tituloMensaje, Severity severidad, int remitente, String cadenaAccion) {
        this.destinatario = destinatario;
        this.cuerpoMensaje = cuerpoMensaje;
        this.tituloMensaje = tituloMensaje;
        this. severidad= severidad;
        this.remitente = remitente;
        this.cadenaAccion = cadenaAccion;
        this.facesmessage = new FacesMessage(severidad, tituloMensaje, cuerpoMensaje);
    }

    public mensaje(int destinatario, int remitente, String cadenaAccion, FacesMessage facesmessage) {
        this.destinatario = destinatario;
        this.remitente = remitente;
        this.cadenaAccion = cadenaAccion;
        this.facesmessage = facesmessage;
        this.cuerpoMensaje = facesmessage.getDetail();
        this.tituloMensaje = facesmessage.getSummary();
        this. severidad= facesmessage.getSeverity();
    }

    public mensaje(String mensajePush) throws Exception {
        String[] msj = mensajePush.split("::");
        if (msj.length == 6) {
            this.destinatario = Integer.valueOf(msj[0]);
            this.cuerpoMensaje = msj[1];
            this.tituloMensaje = msj[2];
            this.severidad = this.setSeverityFromOrdinal(Integer.valueOf(msj[3]));
            this.remitente = Integer.valueOf(msj[4]);
            this.cadenaAccion = msj[5];
            this.facesmessage = new FacesMessage(severidad, tituloMensaje, cuerpoMensaje);
        } else {
            throw new Exception("La cadena ingresada no tiene el formato indicado para la conversión.");
        }
    }   

    public mensaje() {}

    public int getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(int destinatario) {
        this.destinatario = destinatario;
    }

    public String getCuerpoMensaje() {
        return cuerpoMensaje;
    }

    public void setCuerpoMensaje(String cuerpoMensaje) {
        this.cuerpoMensaje = cuerpoMensaje;
    }

    public String getTituloMensaje() {
        return tituloMensaje;
    }

    public void setTituloMensaje(String tituloMensaje) {
        this.tituloMensaje = tituloMensaje;
    }

    public Severity getSeveridad() {
        return severidad;
    }

    public void setSeveridad(Severity severidad) {
        this.severidad = severidad;
    }

    public int getRemitente() {
        return remitente;
    }

    public void setRemitente(int remitente) {
        this.remitente = remitente;
    }

    public String getCadenaAccion() {
        return cadenaAccion;
    }

    public void setCadenaAccion(String cadenaAccion) {
        this.cadenaAccion = cadenaAccion;
    }

    private int getSeverityOrdinal(Severity severity) {
        if(FacesMessage.SEVERITY_ERROR==severity){
                return FacesMessage.SEVERITY_ERROR.getOrdinal();
        }else if(FacesMessage.SEVERITY_FATAL==severity){
         return FacesMessage.SEVERITY_FATAL.getOrdinal();
        }else if(FacesMessage.SEVERITY_INFO==severity){
            return FacesMessage.SEVERITY_INFO.getOrdinal();
        }else if(FacesMessage.SEVERITY_WARN==severity){
            return FacesMessage.SEVERITY_WARN.getOrdinal();
        }else{
            return FacesMessage.SEVERITY_ERROR.getOrdinal();
        }
    }
    
    private Severity setSeverityFromOrdinal(int o){
        if(FacesMessage.SEVERITY_ERROR.getOrdinal()==o){
                return FacesMessage.SEVERITY_ERROR;
        }else if(FacesMessage.SEVERITY_FATAL.getOrdinal()==o){
         return FacesMessage.SEVERITY_FATAL;
        }else if(FacesMessage.SEVERITY_INFO.getOrdinal()==o){
            return FacesMessage.SEVERITY_INFO;
        }else if(FacesMessage.SEVERITY_WARN.getOrdinal()==o){
            return FacesMessage.SEVERITY_WARN;
        }else{
            return FacesMessage.SEVERITY_ERROR;
        }
    }

    @Override
    public String toString() {
        return destinatario + "::" + cuerpoMensaje + "::" + tituloMensaje + "::"
                + getSeverityOrdinal(severidad) + "::" + remitente + "::" + cadenaAccion;
    }

    public FacesMessage getFacesmessage() {
        return facesmessage;
    }

    public void setFacesmessage(FacesMessage facesmessage) {
        this.facesmessage = facesmessage;
    }

}
