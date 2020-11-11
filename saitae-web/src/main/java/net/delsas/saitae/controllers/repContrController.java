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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.ContribucionesFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.entities.Contribuciones;
import net.delsas.saitae.entities.ContribucionesPK;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Persona;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class repContrController extends Auxiliar implements Serializable {

    private Persona usuario;
    private FacesContext context;
    private String pagina;
    private List<Contribuciones> contribuciones;
    private List<Grado> grados;
    private Grado gSelected;
    private PieChartModel contr;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @EJB
    private ContribucionesFacadeLocal contrFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private GradoFacadeLocal gFL;
    private List<Persona> moradores;
    private int mes;
    @EJB
    private PersonaFacadeLocal pFL;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), pFL))) {
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
        grados = gFL.getPorAñoYActivo(getAñoActual());
        mes = Integer.valueOf(new SimpleDateFormat("MM").format(new Date()));
    }

    private int getAlDia(Integer mesActual, Contribuciones c) {
        switch (mesActual) {
            case 1:
                return c.getEnero() != null ? 1 : 0;
            case 2:
                return c.getFebrero() != null ? 1 : 0;
            case 3:
                return c.getMarzo() != null ? 1 : 0;
            case 4:
                return c.getAbril() != null ? 1 : 0;
            case 5:
                return c.getMayo() != null ? 1 : 0;
            case 6:
                return c.getJunio() != null ? 1 : 0;
            case 7:
                return c.getJulio() != null ? 1 : 0;
            case 8:
                return c.getAgosto() != null ? 1 : 0;
            case 9:
                return c.getSeptiembre() != null ? 1 : 0;
            case 10:
                return c.getOctubre() != null ? 1 : 0;
            default:
                return c.getOctubre() != null ? 1 : 0;
        }
    }

    public PieChartModel getContr() {
        contribuciones = gSelected == null
                ? contrFL.findByAño(getAñoActual())
                : contrFL.findByGrado(gSelected.getGradoPK());
        Integer alDia = 0;
        long activos = gSelected == null
                ? mFL.countActivos(getAñoActual())
                : mFL.findMatriculaByGrado(gSelected.getGradoPK()).size();
        alDia = contribuciones.stream().map((c) -> getAlDia(mes, c)).reduce(alDia, Integer::sum);
        HashMap<String, Integer> vs = new HashMap<>();
        vs.put("Al Día", alDia);
        vs.put("Moradores", ((int) activos) - alDia);
        contr = createPieModel(
                vs,
                "Pago de la contribución para la preparación de alimentos"
                + (gSelected == null
                        ? " a nivel Institucional"
                        : " para el grado " + getGradoNombre(gSelected.getGradoPK())),
                "e");
        return contr;
    }

    public List<Grado> getGrados() {
        return grados;
    }

    public void onGselected(SelectEvent e) {

    }

    public Grado getGSelected() {
        return gSelected;
    }

    public void setGSelected(Grado gSelected) {
        this.gSelected = gSelected;
    }

    public int getNumeroPagosAtrasados(Persona p) {
        int y = 0;
        Contribuciones c = contrFL.find(new ContribucionesPK(p.getIdpersona(), getAñoActual()));
        if (c == null) {
            y = mes;
        } else {
            for (int a = 1; a <= mes; a++) {
                y += getAlDia(a, c) == 1 ? 0 : 1;
            }
        }
        return y;
    }

    public List<Persona> getMoradores() {
        moradores = new ArrayList<>();
        List<Persona> pp = gSelected == null
                ? new ArrayList<>()
                : mFL.findMatriculaByGrado(gSelected.getGradoPK());
        pp.forEach((p) -> {
            Contribuciones c = contrFL.find(new ContribucionesPK(p.getIdpersona(), getAñoActual()));
            if (c == null || getAlDia(mes, c) == 0) {
                moradores.add(p);
            }
        });
        return moradores;
    }

    public void postProcesoXLS(Object doc) {
        HSSFWorkbook wb = new XLSModel().getReporteContribucion((HSSFWorkbook) doc, gSelected.getGradoPK());
    }
}
