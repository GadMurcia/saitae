/*
 * Copyright (C) 2019 gabriela
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
package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.prueba;
import net.delsas.saitae.beans.ContribucionesFacadeLocal;

import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Contribuciones;
import net.delsas.saitae.entities.ContribucionesPK;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MatriculaPK;
import net.delsas.saitae.entities.Persona;

import org.primefaces.event.SelectEvent;

/**
 *
 * @author gabriela
 */
@Named

@ViewScoped
public class contribucionesController implements Serializable {
boolean boton ;
    @EJB
    private PersonaFacadeLocal personaFL;
    private Persona p;
    private Persona usuario;
    private String est;


    @EJB
    private MatriculaFacadeLocal matriculaFL;
   
    @EJB
    private ContribucionesFacadeLocal contrFL;
    private Contribuciones contr;
    

    @PostConstruct
    public void init() {
        boton = false;
        contr = new Contribuciones(new ContribucionesPK(0,getAño()));
        
        p = new prueba().getEstudiante();
        FacesContext context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        boolean r = usuario.getTipoPersona().getIdtipoPersona().equals(2) ? false
                : usuario.getTipoPersona().getIdtipoPersona().equals(12) ? false
                : !usuario.getTipoPersona().getIdtipoPersona().equals(1);

        if (r) {

            context.getExternalContext().getSessionMap().put("mensaje", new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "Falla!", "Esa vista no le está permitida."));
            try {
                context.getExternalContext().redirect("./../");
            } catch (IOException ex) {
                Logger.getLogger(paquetesController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    private static final long serialVersionUID = 1L;

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();
        List<Persona> listp;
        try {
            (new prueba()).setDui(query, p);
            listp = personaFL.getPersonaByLikeIdAndType(p.getIdpersona(), 8);
            for (Persona datos : listp) {
                results.add(datos.getPersonaNombre() + " "
                        + datos.getPersonaApellido() + "=>" + datos.getIdpersona().toString().substring(1));
            }
        } catch (Exception m) {
            System.out.println(m.getMessage());
        }

        return results;
    }

    
    
    public void onItemSelect(SelectEvent event) {
       
        new prueba().setDui(event.getObject().toString(), p);
        p = personaFL.find(p.getIdpersona());
        contr.getContribucionesPK().setIdEstudiante(p.getIdpersona()); 
        contr = contrFL.find(contr.getContribucionesPK());
        contr = contr == null ? new Contribuciones(new ContribucionesPK(p.getIdpersona(), getAño())) : contr;
        boton = true;
    }

    public int getAño() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public String getGradoAlumno() {
        String grado = "";
        Matricula mati = matriculaFL.find(new MatriculaPK(p.getIdpersona(), getAño()));
        if (mati != null) {
            GradoPK pk = mati.getGrado().getGradoPK();
            grado += pk.getIdgrado() == 1 ? "Primero" : pk.getIdgrado() == 2 ? "Segundo"
                    : pk.getIdgrado() == 3 ? "Tercero" : "";
            grado += " " + (pk.getGradoModalidad().equals("G") ? "General"
                    : pk.getGradoModalidad().equals("S") ? " T.V.C Secretariado"
                    : pk.getGradoModalidad().equals("C") ? "T.V.C Contador" : "");
        }
        return grado;

    }

    public void guardar() {
        
          FacesMessage msj = null;
      Contribuciones  contrG =  contrFL.find(contr.getContribucionesPK());
      if (){
            contrFL.edit(contr);
          
          FacesContext.getCurrentInstance().addMessage(null,
                  new FacesMessage(FacesMessage.SEVERITY_INFO, "Guardado con éxito","Se guardaron los datos de la contribución"));
           this.init();
      }
      else{
      FacesContext.getCurrentInstance().addMessage(null,
                  new FacesMessage(FacesMessage.SEVERITY_WARN, "Falló","No se seleccionaron datos"));
      }


    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    public Persona getP() {
        return p;
    }

    public void setNie(String nie) {
        new prueba().setDui(nie, p);
    }
    

    public String getNie() {
        return p.getIdpersona().toString().substring(1);
    }

    public Contribuciones getContr() {
        return contr;
    }

    public void setContr(Contribuciones contr) {
        this.contr = contr;
    }
    public boolean getEneroPagado(){
    return contr != null ? (contr.getEnero()!=null): false;
    }
    public void setEneroPagado(boolean e){
     contr.setEnero( contr.getEnero() ==null ? (e ? new Date() : null) : contr.getEnero());

    
    }
     public boolean getFebreroPagado(){
    return contr != null ? (contr.getFebrero()!=null): false;
    }
    public void setFebreroPagado(boolean e){
     contr.setFebrero(contr.getFebrero() ==null ? (e ? new Date() : null) : contr.getFebrero());

    }
     public boolean getMarzoPagado(){
    return contr != null ? (contr.getMarzo()!=null): false;
    }
    public void setMarzoPagado(boolean e){
     contr.setMarzo(contr.getMarzo() ==null ? (e ? new Date() : null) : contr.getMarzo());
    }
     public boolean getAbrilPagado(){
    return contr != null ? (contr.getAbril()!=null): false;
    }
    public void setAbrilPagado(boolean e){
     contr.setAbril(contr.getAbril() ==null ? (e ? new Date() : null) : contr.getAbril());

    }
     public boolean getMayoPagado(){
    return contr != null ? (contr.getMayo()!=null): false;
    }
    public void setMayoPagado(boolean e){
     contr.setMayo(contr.getMayo() ==null ? (e ? new Date() : null) : contr.getMayo());

    }
     public boolean getJunioPagado(){
    return contr != null ? (contr.getJunio()!=null): false;
    }
    public void setJunioPagado(boolean e){
     contr.setJunio(contr.getJunio()==null ? (e ? new Date() : null) : contr.getJunio());
    }
     public boolean getJulioPagado(){
    return contr != null ? (contr.getJulio()!=null): false;
    }
    public void setJulioPagado(boolean e){
     contr.setJulio(contr.getJulio() ==null ? (e ? new Date() : null) : contr.getJulio());
    }
     public boolean getAgostoPagado(){
    return contr != null ? (contr.getAgosto()!=null): false;
    }
    public void setAgostoPagado(boolean e){
     contr.setAgosto(contr.getAgosto() ==null ? (e ? new Date() : null) : contr.getAgosto());

    }
     public boolean getSeptiembrePagado(){
    return contr != null ? (contr.getSeptiembre()!=null): false;
    }
    public void setSeptiembrePagado(boolean e){
     contr.setSeptiembre(contr.getSeptiembre() ==null ? (e ? new Date() : null) : contr.getSeptiembre());
    }
     public boolean getOctubrePagado(){
    return contr != null ? (contr.getOctubre()!=null):false;
    }
    public void setOctubrePagado(boolean e){
     contr.setOctubre(contr.getOctubre() ==null ? (e ? new Date() : null) : contr.getOctubre());

    
    }

    public boolean isBoton() {
        return boton;
    }

    public void setBoton(boolean boton) {
        this.boton = boton;
    }
    
}

