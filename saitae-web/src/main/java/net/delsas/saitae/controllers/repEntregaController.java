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
package net.delsas.saitae.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.EntregaUtilesFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.entities.EntregaUtiles;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Persona;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class repEntregaController extends Auxiliar implements Serializable {

    @EJB
    private EntregaUtilesFacadeLocal euFL;
    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;

    private PieChartModel utiles;
    private PieChartModel uniforme1;
    private PieChartModel zapatos;
    private PieChartModel uniforme2;
    private FacesContext context;
    private Persona usuario;
    private String pagina;
    private Integer sel;

    @PostConstruct
    public void init() {
        sel = 0;
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina))))) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
                return;
            }
        } catch (IOException ex) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado",
                            ex.getMessage() == null ? "Error de causa desconocida." : ex.getMessage()));
        }
        List<Integer> tps = getTiposPersonas(usuario);
        Grado gm = tps.contains(4) ? gFL.findByidMaestroAndAño(usuario.getIdpersona(), getAñoActual()) : null;
        boolean global = (tps.contains(1) || tps.contains(2) || tps.contains(3) || tps.contains(12));
        List<EntregaUtiles> eul = global
                ? euFL.findByAño(getAñoActual())
                : (gm != null ? euFL.findByGrado(gm.getGradoPK()) : new ArrayList<>());
        long estN = global
                ? mFL.countActivos(getAñoActual())
                : (gm != null ? gm.getMatriculaList().size() : 0);
        int entu = 0;
        int entun = 0;
        int entun2 = 0;
        int entz = 0;
        entu = eul.stream().map((eu) -> eu.getUtiles1() ? 1 : 0).reduce(entu, Integer::sum);
        entun = eul.stream().map((eu) -> eu.getUniforme1() ? 1 : 0).reduce(entun, Integer::sum);
        entun2 = eul.stream().map((eu) -> eu.getUniforme2() ? 1 : 0).reduce(entun2, Integer::sum);
        entz = eul.stream().map((eu) -> eu.getZapatos1() ? 1 : 0).reduce(entz, Integer::sum);
        utiles = createPieModel(entu, (estN - entu), "Estrega de útiles", "e");
        uniforme1 = createPieModel(entun, (estN - entun), "Primera estrega de uniformes", "e");
        uniforme2 = createPieModel(entun2, (estN - entun2), "Segunda estrega de uniformes", "e");
        zapatos = createPieModel(entz, (estN - entz), "Estrega de zapatos", "e");
    }

    private PieChartModel createPieModel(int ent, long pen, String tit, String lp) {
        PieChartModel pm = new PieChartModel();
        pm.set("Entregado (" + ent + ")", ent);
        pm.set("Pendiente (" + pen + ")", pen);
        pm.setTitle(tit);
        pm.setLegendPosition(lp);
        pm.setFill(false);
        pm.setShowDataLabels(true);
        pm.setDiameter(150);
        pm.setShadow(false);
        return pm;
    }

    public PieChartModel getUtiles() {
        return utiles;
    }

    public PieChartModel getUniforme1() {
        return uniforme1;
    }

    public PieChartModel getZapatos() {
        return zapatos;
    }

    public PieChartModel getUniforme2() {
        return uniforme2;
    }

    public int getSel() {
        return sel;
    }

    public void setSel(int sel) {
        this.sel = sel;
    }

    public void onSelect(SelectEvent e) {
        sel = e.getObject() != null ? Integer.valueOf(e.getObject().toString()) : 0;
    }

}
