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
package net.delsas.saitae.controllers;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.CapacitacionesFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.entities.Capacitaciones;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.component.datatable.DataTable;
import org.primefaces.component.export.ExportConfiguration;
import org.primefaces.component.export.Exporter;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class administradorController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;

    private Persona adm;
    private Persona selected;
    private Capacitaciones cap;
    private FacesContext context;
    private String pagina;
    private Persona usuario;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private TipoPersonaFacadeLocal tpfl;
    private List<TipoPersona> tipos;
    private Auxiliar aux;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    @EJB
    private CapacitacionesFacadeLocal capFL;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), pfl))) {
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
        aux = new Auxiliar();
        adm = aux.getAdministradorCra();
        adm.setTipoPersona(new TipoPersona());
        int q[] = new int[]{1, 4, 8, 9, 10, 11};
        tipos = tpfl.findAll();
        for (int s : q) {
            tipos.remove(tpfl.find(s));
        }
    }

    public List<String> completeText(String query) {
        List<String> results = new ArrayList<>();

        return results;
    }

    public void onItemSelect(SelectEvent event) {
        adm.setTipoPersona(tpfl.find(adm.getTipoPersona().getIdtipoPersona()));
    }

    public void onItemSelect2(SelectEvent event) {
        adm = axiliarController.getP();
    }

    public Persona getAdm() {
        return adm;
    }

    public void setAdm(Persona adm) {
        this.adm = adm;
    }

    public List<SelectItem> getDepartamentoList() {
        return aux.getDepartamentoLista(adm);
    }

    public List<SelectItem> getMunicipioList() {
        return aux.getMunicipioLista(adm);
    }

    public String getDepto() {
        return aux.getDepartamento(adm);
    }

    public void setDepto(String dep) {
        aux.setDepartamento(dep, adm);
    }

    public String getMuni() {
        return aux.getMunicipio(adm);
    }

    public void setMuni(String mun) {
        aux.setMunicipio(mun, adm);
    }

    public String getDui() {
        return aux.getDui(adm);
    }

    public void setDui(String dui) {
        aux.setDui(dui, adm);
    }

    public List<TipoPersona> getTipos() {
        return Collections.unmodifiableList(tipos);
    }

    public void guardar() {
        try {
            adm.setPersonaContrasenya(DigestUtils.md5Hex(adm.getIdpersona().toString().substring(1)));
            pfl.edit(adm);
            String a = (!adm.getPersonaSexo() ? "El Señor " : "La Señora ") + adm.getPersonaNombre() + " "
                    + adm.getPersonaApellido() + " ha sido asignad" + (!adm.getPersonaSexo() ? "o " : "a ")
                    + "como " + adm.getTipoPersona().getTipoPersonaNombre() + ".";
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                    new FacesMessage(FacesMessage.SEVERITY_INFO, "Agregación Exitosa", a));
            FacesContext.getCurrentInstance().getExternalContext().redirect("agAdm.intex");
            List<Persona> ps = new ArrayList<>();
            for (Integer ids : new Integer[]{1, 2, 3}) {
                getPersonasParaNotificar(tpfl.find(ids)).stream().filter(p -> !ps.contains(p)).forEachOrdered(ps::add);
            }
            persistirNotificación(new mensaje(0, 1045367073, "agAdm<form1<<plantel<form",
                    new FacesMessage(
                            FacesMessage.SEVERITY_INFO,
                            "MOdificación del plantel",
                            "Se ha detectado una modificación al plantel institucional.")),
                    ps, notiFL, notificacion);
        } catch (IOException e) {
            System.out.println("Error en adminitrador.Guaradr:" + e.getMessage());
        }
    }

    public List<Persona> getPlantel() {
        List<Persona> pl = pfl.getPlantel();
        Collections.sort(pl, (Persona o1, Persona o2) -> String.CASE_INSENSITIVE_ORDER.compare(getNombreCompletoPersona(o1), getNombreCompletoPersona(o2)));
        return pl;
    }

    public Persona getSelected() {
        return selected;
    }

    public void setSelected(Persona selected) {
        this.selected = selected;
    }

    public String getCargosTxt(Persona p) {
        String g = "";
        for (String i : getCargos(p)) {
            g += (g.isEmpty() ? "" : ", ") + i;
        }
        return g;
    }

    public void postProcessEXCEL(Object document) {
        HSSFWorkbook wb = new XLSModel().getReportePlantel((HSSFWorkbook) document);
    }

    public List<Capacitaciones> getCapacitacionesSelected() {
        return capFL.findByIdPersona(selected == null ? 0 : selected.getIdpersona());
    }

    public Capacitaciones getCap() {
        return cap;
    }

    public void setCap(Capacitaciones cap) {
        this.cap = cap;
    }

    public boolean getVerDatos() {
        return usuario != null
                && (usuario.getTipoPersona().getIdtipoPersona().equals(1)
                || getTiposPersonas(usuario, pfl).contains(2));
    }

    public boolean getVerPaneles() {
        return selected != null && selected.getTipoPersona().getIdtipoPersona().equals(4);
    }

    public Exporter<DataTable> getPdfExporter() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            try {
                PdfPTable t = new PdfPTable(6);
                t.setWidthPercentage(100);
                t.addCell(getTextCell("Listado del plantel institucional", 5, 1, false, false, 18, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getCellWithImagen(fc, "intexM.jpeg", 1, 1, false, 15, PdfPCell.ALIGN_CENTER));

                t.addCell(getTextCell("DUI", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Nombre", 3, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Ocupación", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Cargos", 1, 1, false, true, 13, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                getPlantel().forEach(p -> {
                    t.addCell(getTextCell(p.getIdpersona().toString().substring(1), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getNombreCompletoPersona(p), 3, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(p.getPersonaOCupacion(), 1, 1, false, true, 13, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell(getCargosTxt(p), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                });
                OutputStream os = getOutputStream(fc, ec, "application/pdf");
                Document pdf = new Document(PageSize.LEGAL);
                PdfWriter writer = PdfWriter.getInstance(pdf, os);
                pdf.open();
                t.setWidthPercentage(100);
                pdf.add(t);
                pdf.setMargins(1, 1, 1, 1);
                pdf.close();
                writer.flush();
            } catch (DocumentException | IOException e) {
                Logger.getLogger(repInvController.class.getName()).log(Level.SEVERE, null, e);
            }
        };
    }

}
