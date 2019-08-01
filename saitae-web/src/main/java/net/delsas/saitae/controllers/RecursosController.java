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

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.RecursoFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.Pais;
import net.delsas.saitae.entities.Recurso;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoRecurso;


/**
 *
 * @author gabriela
 */
@Named(value = "recursosController")
@ViewScoped
public class RecursosController implements Serializable{

    private static final long serialVersionUID = 1L;

  //Recurso  
  @EJB
  private RecursoFacadeLocal recursoFL;
  private List<Recurso> recurso;
 
  //Pais
  @EJB
   private PaisFacadeLocal paisFL;
   private List<Pais> listaPais;
  
  
   //Categoria
   @EJB 
   private CategoriaFacadeLocal categoriaFL;
   private List<Categoria> categoria;
   
   //Tipo Recurso
   @EJB
   private TipoRecursoFacadeLocal tiporecursoFL;
   private List<TipoRecurso> tiporecurso;
   
   //TipoCargo;
   @EJB
   private TipoCargoFacadeLocal tipocargoFL;
   private List<TipoCargo> tipocargo;
   
   private Recurso r;
   
   
    
   
    
    
    @PostConstruct
    public void init() {
    recurso = recursoFL.findAll();
    listaPais = paisFL.findAll();
    categoria = categoriaFL.findAll();
    tiporecurso = tiporecursoFL.findAll();
    tipocargo = tipocargoFL.findAll();
   
    
    }
    
    
    public List<Recurso> getRecurso() {
        return recurso;
    }

    public void setRecurso(List<Recurso> recurso) {
        this.recurso = recurso;
    }

    public List<Pais> getListaPais() {
        return listaPais;
    }

    public void setListaPais(List<Pais> listaPais) {
        this.listaPais = listaPais;
    }

    public List<Categoria> getCategoria() {
        return categoria;
    }

    public void setCategoria(List<Categoria> categoria) {
        this.categoria = categoria;
    }

    public List<TipoRecurso> getTiporecurso() {
        return tiporecurso;
    }

    public void setTiporecurso(List<TipoRecurso> tiporecurso) {
        this.tiporecurso = tiporecurso;
    }

    public List<TipoCargo> getTipocargo() {
        return tipocargo;
    }

    public void setTipocargo(List<TipoCargo> tipocargo) {
        this.tipocargo = tipocargo;
    }

    public RecursoFacadeLocal getRecursoFL() {
        return recursoFL;
    }

    public void setRecursoFL(RecursoFacadeLocal recursoFL) {
        this.recursoFL = recursoFL;
    }

    public PaisFacadeLocal getPaisFL() {
        return paisFL;
    }

    public void setPaisFL(PaisFacadeLocal paisFL) {
        this.paisFL = paisFL;
    }

    public CategoriaFacadeLocal getCategoriaFL() {
        return categoriaFL;
    }

    public void setCategoriaFL(CategoriaFacadeLocal categoriaFL) {
        this.categoriaFL = categoriaFL;
    }

    public TipoRecursoFacadeLocal getTiporecursoFL() {
        return tiporecursoFL;
    }

    public void setTiporecursoFL(TipoRecursoFacadeLocal tiporecursoFL) {
        this.tiporecursoFL = tiporecursoFL;
    }

    public TipoCargoFacadeLocal getTipocargoFL() {
        return tipocargoFL;
    }

    public void setTipocargoFL(TipoCargoFacadeLocal tipocargoFL) {
        this.tipocargoFL = tipocargoFL;
    }

    public Recurso getR() {
        return r;
    }

    public void setR(Recurso r) {
        this.r = r;
    }
    
  
    
    
}
