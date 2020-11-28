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

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.ax.ReportePermisos;
import net.delsas.saitae.ax.XLSModel;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MaestoCargoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.PermisosFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPermiso;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.primefaces.behavior.ajax.AjaxBehavior;
import org.primefaces.component.datatable.DataTable;
import org.primefaces.component.export.ExportConfiguration;
import org.primefaces.component.export.Exporter;
import org.primefaces.component.selectonemenu.SelectOneMenu;
import org.primefaces.event.SelectEvent;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class repPermisosController extends Auxiliar implements Serializable {

    private Integer menu;
    private GradoPK GSelected;
    private List<Grado> grados;
    private List<Persona> personas;
    private List<Permisos> permisos;
    private List<ReportePermisos> rpListGoce;
    private Persona PSelected;
//    private Date fechaInicio, fechaFin;

    @EJB
    private GradoFacadeLocal gFL;
    @EJB
    private PermisosFacadeLocal permFL;
    @EJB
    private MatriculaFacadeLocal mFL;
    @EJB
    private PersonaFacadeLocal pFL;
    @EJB
    private TipopersonaPermisoFacadeLocal tppFL;
    @EJB
    private MaestoCargoFacadeLocal mcFL;
    @EJB
    private TipoPermisoFacadeLocal tpFL;

    @PostConstruct
    public void init() {
        menu = 3;
        grados = new ArrayList<>();
        SelectOneMenu ss = new SelectOneMenu();
        ss.setId("menu");
        onSelect(new SelectEvent(ss, new AjaxBehavior(), menu));
//        fechaInicio = getFechaUnicamente(new Date());
//        fechaFin = getFechaUnicamente(new Date());
    }

    public void dateSelect(AjaxBehaviorEvent e) {
//        if (fechaInicio.after(fechaFin)) {
//            fechaFin = getFechaUnicamente(fechaInicio);
//            FacesContext.getCurrentInstance().addMessage("Form0:msgs",
//                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Error en las fechas",
//                            "La fecha de inicio del periodo del reporte no debe ser posterior "
//                            + "a la fecha de fin del mismo. Intente de nuevo."));
//            PrimeFaces.current().ajax().update("form0:msgs");
//        }
        SelectOneMenu ss = new SelectOneMenu();
        ss.setId("person");
        onSelect(new SelectEvent(ss, new AjaxBehavior(), PSelected));
    }

    public void onSelect(SelectEvent e) {
        SelectOneMenu ss = new SelectOneMenu();
        switch (e.getComponent().getId()) {
            case "menu":
                switch (menu) {
                    case 1:
                        grados = gFL.getPorAñoYActivo(getAñoActual());
                        GSelected = grados.isEmpty() ? new GradoPK(0, "", "", 0) : grados.get(0).getGradoPK();
                        ss.setId("grado");
                        onSelect(new SelectEvent(ss, new AjaxBehavior(), GSelected));
                        break;
                    case 2:
                        grados.clear();
                        GSelected = null;
                        personas = pFL.getMaestros();
                        PSelected = personas.isEmpty() ? null : personas.get(0);
                        ss.setId("person");
                        onSelect(new SelectEvent(ss, new AjaxBehavior(), PSelected));
                        break;
                    case 3:
                        grados.clear();
                        GSelected = null;
                        personas = pFL.getAdmins();
                        PSelected = personas.isEmpty() ? null : personas.get(0);
                        ss.setId("person");
                        onSelect(new SelectEvent(ss, new AjaxBehavior(), PSelected));
                        break;
                    default:
                        grados.clear();
                        GSelected = null;
                        personas = new ArrayList<>();
                        System.out.println(menu);
                }
                break;
            case "grado":
                GSelected = (GradoPK) e.getObject();
                personas = mFL.findMatriculaByGrado(GSelected);
                PSelected = personas.isEmpty() ? null : personas.get(0);
                ss.setId("person");
                onSelect(new SelectEvent(ss, new AjaxBehavior(), PSelected));
                break;
            case "person":
                rpListGoce = new ArrayList<>();
                List<TipoPermiso> permisosPersona = tppFL.findTipoPermisoByIdtipopersona(
                        PSelected == null ? 0
                                : PSelected.getTipoPersona().getIdtipoPersona());
                permisosPersona.add(tpFL.find(1));
                permisosPersona.add(tpFL.find(2));
                permisosPersona.add(tpFL.find(3));
                permisosPersona.forEach(tp -> {
                    List<ReportePermisos> rep0 = new ArrayList<>();
                    List<Permisos> ps = permFL.findByIpPersonaEFsTP(
                            PSelected.getIdpersona(), getAñoActual(), "1", tp.getIdtipoPermiso());
                    ps.stream().filter((p) -> (getPermisoGoceDeSueldo(p) || PSelected.getTipoPersona().getIdtipoPersona() == 8)).forEachOrdered((p) -> {
                        int idtp = PSelected.getTipoPersona().getIdtipoPersona();
                        rep0.add(new ReportePermisos(p,
                                rep0.isEmpty()
                                ? p.getTipoPermiso1().getTipoPermisoDiasMes()
                                : rep0.get(rep0.size() - 1).getSaldo(),
                                idtp == 8 ? 0 : (idtp == 4 ? 1 : 2)));
                    });
                    rpListGoce.addAll(rep0);
                    rep0.clear();
                    ps.stream().filter((p) -> (!getPermisoGoceDeSueldo(p))).forEachOrdered((p) -> {
                        rep0.add(new ReportePermisos(p, -1, 0));
                    });
                    rpListGoce.addAll(rep0);
                });
                Collections.sort(rpListGoce, (r1, r2) -> r1.getFechaInicio().hashCode() - r2.getFechaInicio().hashCode());
                break;

            default:
                personas = new ArrayList<>();
                System.out.println(e.getComponent().getId());
        }
    }

    public Integer getMenu() {
        return menu;
    }

    public void setMenu(Integer menu) {
        this.menu = menu;
    }

    public GradoPK getGSelected() {
        return GSelected;
    }

    public void setGSelected(GradoPK gSelected) {
        this.GSelected = gSelected;
    }

    public List<Grado> getGrados() {
        return grados;
    }

    public List<Persona> getPersonas() {
        return personas;
    }

    public Persona getPSelected() {
        return PSelected;
    }

    public void setPSelected(Persona pSelected) {
        this.PSelected = pSelected;
    }

    public List<Permisos> getPermisos() {
        return permisos;
    }

    public boolean getVerGrado() {
        return menu == 1;
    }

    public boolean getEsEstudiante() {
        return PSelected == null ? false : PSelected.getTipoPersona().getIdtipoPersona().equals(8);
    }

    public String getTipoAdmin(Persona p) {
        return (!p.getTipoPersona().getIdtipoPersona().equals(4)
                && !p.getTipoPersona().getIdtipoPersona().equals(8))
                ? "(" + p.getTipoPersona().getTipoPersonaNombre() + ")"
                : "";
    }

    public void reporte(Object doc) {
        rpListGoce.get(0).getPermiso().setPersona(PSelected);
        HSSFWorkbook wb = (HSSFWorkbook) doc;
        wb = new XLSModel().getReportePermisos(rpListGoce, wb,
                tppFL.findTipoPermisoByIdtipopersona(PSelected.getTipoPersona().getIdtipoPersona()),
                mcFL, pFL);
    }

    public List<ReportePermisos> getRpListGoce() {
        return rpListGoce;
    }

    public void setRpListGoce(List<ReportePermisos> rpListGoce) {
        this.rpListGoce = rpListGoce;
    }

    public boolean getDescargarDoc() {
        return !rpListGoce.isEmpty();
    }

    public Exporter<DataTable> getPdfExporterCra() {
        return (FacesContext fc, List<DataTable> list, ExportConfiguration ec) -> {
            try {
                boolean esEstudiante = PSelected.getTipoPersona().getIdtipoPersona().equals(8);
                boolean esMaestro = PSelected.getTipoPersona().getIdtipoPersona().equals(4);
                List<TipoPermiso> ps = tppFL.findTipoPermisoByIdtipopersona(PSelected.getTipoPersona().getIdtipoPersona());
                int u = (ps.size() * 3) + (esEstudiante ? 5 : 7);
                PdfPTable t = new PdfPTable(u);

                t.addCell(getCellWithImagen(fc, "mined.png", 2, 1, false, 10, PdfPCell.ALIGN_LEFT));
                t.addCell(getTextCell("INSTITUTO NACIONAL TEXISTEPEQUE", ((ps.size() * 3) + (esEstudiante ? 5 : 7)) - 4, 1, false, false, 18, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getCellWithImagen(fc, "intexM.jpeg", 2, 1, false, 25, PdfPCell.ALIGN_RIGHT));

                t.addCell(getTextCell("\n", u, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("NOMBRE: " + getNombreCompletoPersona(PSelected), u / 3, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell(!esMaestro ? "" : "NIP: " + PSelected.getMaestro().getMaestroNip(), u - (((int) (u / 3)) * 2), 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("CARGO: " + getCargos(PSelected), u / 3, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell(!esMaestro ? "" : "PARTIDA: " + PSelected.getMaestro().getMaestroPartidas(), u / 3, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell(!esMaestro ? "" : "SUBNUMERO: " + PSelected.getMaestro().getMaestroSubnumeros(), u - (((int) (u / 3)) * 2), 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_LEFT, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("", u / 3, 1, false, false, 14, Font.BOLD, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("\n\n\n", u, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                t.addCell(getTextCell("FECHA", 1, esEstudiante ? 2 : 3, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                if (!esEstudiante) {
                    if (!ps.isEmpty()) {
                        t.addCell(getTextCell("LICENCIAS CON GOCE DE SUELDO",
                                ps.size() * 3, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    }
                    t.addCell(getTextCell("", 6, 1, false, false, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                }
                if (!ps.isEmpty()) {
                    ps.forEach(p -> {
                        t.addCell(getTextCell(p.getTipoPermisoNombre(), 3, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    });
                }
                if (!esEstudiante) {
                    t.addCell(getTextCell("Licencias Sin Goce de Sueldo", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                }
                t.addCell(getTextCell("Inasistencias Injustificadas", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Llegadas Tarde o Retiros Antes de Hora", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                if (!ps.isEmpty()) {
                    ps.forEach(p -> {
                        t.addCell(getTextCell("Días", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                        t.addCell(getTextCell("Horas", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                        t.addCell(getTextCell("Saldo (" + p.getTipoPermisoDiasMes() + " días)", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    });
                }

                if (!esEstudiante) {
                    t.addCell(getTextCell("Días", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    t.addCell(getTextCell("Horas", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                }
                t.addCell(getTextCell("Días", 2, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Horas en la mañana", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                t.addCell(getTextCell("Horas en la tarde", 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));

                List<Diagramapermisos> perm = getPermisos(ps, esEstudiante);
                perm.forEach((Diagramapermisos p) -> {
                    t.addCell(getTextCell(p.getFecha(), 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    for (int i = 0; i < p.getDatos().length; i++) {
                        t.addCell(getTextCell(p.getDatos()[i], (i == (p.getDatos().length - 3)) ? 2 : 1, 1, false, true, 12, Font.NORMAL, PdfPCell.ALIGN_CENTER, PdfPCell.ALIGN_MIDDLE));
                    }
                });

                OutputStream os = getOutputStream(fc, ec, "application/pdf");
                Document pdf = new Document(new Rectangle((float) (PageSize.LEGAL.rotate().getWidth() * 1.5), (float) (PageSize.LEGAL.rotate().getHeight() * 1.5)));
                PdfWriter writer = PdfWriter.getInstance(pdf, os);
                pdf.open();
                t.setWidthPercentage(100);
                pdf.add(t);
                pdf.setMargins(5, 5, 5, 5);
                pdf.close();
                writer.flush();
            } catch (DocumentException | IOException e) {
                Logger.getLogger(repPermisosController.class.getName()).log(Level.SEVERE, null, e);
            }
        };

    }

    private List<Diagramapermisos> getPermisos(List<TipoPermiso> ps, boolean esEstudiante) {
        List<Diagramapermisos> perm = new ArrayList<>();
        rpListGoce.forEach(rp -> {
            Diagramapermisos dia = new Diagramapermisos(getDateToString(rp.getFechaInicio()), (ps.size() * 3) + (esEstudiante ? 3 : 5));
            if (ps.contains(rp.getPermiso().getTipoPermiso1())) {
                if (rp.isConGoce()) {
                    int y = (ps.indexOf(rp.getPermiso().getTipoPermiso1()) * 3);
                    dia.getDatos()[y] = rp.getNumeroDias() + "";
                    dia.getDatos()[y + 1] = rp.getNumeroHoras() + "";
                    dia.getDatos()[y + 2] = rp.getSaldo() + "";
                } else {
                    int y = (ps.size() * 3);
                    dia.getDatos()[y] = rp.getNumeroDias() + "";
                    dia.getDatos()[y + 1] = rp.getNumeroHoras() + "";
                }
            } else if (rp.getPermiso().getTipoPermiso1().getIdtipoPermiso().equals(1)) {
                int y = (ps.size() * 3) + (esEstudiante ? 0 : 2);
                dia.getDatos()[y] = rp.getNumeroDias() + "";
            } else if (rp.getPermiso().getTipoPermiso1().getIdtipoPermiso().equals(2)) {
                int y = (ps.size() * 3) + (esEstudiante ? 1 : 3);
                dia.getDatos()[y] = rp.getNumeroHoras() + "";
            } else if (rp.getPermiso().getTipoPermiso1().getIdtipoPermiso().equals(3)) {
                int y = (ps.size() * 3) + (esEstudiante ? 2 : 4);
                dia.getDatos()[y] = rp.getNumeroHoras() + "";
            }
            perm.add(dia);
        });
        return perm;
    }

    private class Diagramapermisos implements Serializable {

        private String fecha;
        private String[] datos;

        public Diagramapermisos(String fecha, String[] datos) {
            this.fecha = fecha;
            this.datos = datos;
        }

        public Diagramapermisos(String fecha, int regs) {
            this.fecha = fecha;
            this.datos = new String[regs];
        }

        public String getFecha() {
            return fecha;
        }

        public void setFecha(String fecha) {
            this.fecha = fecha;
        }

        public String[] getDatos() {
            return datos;
        }

        public void setDatos(String[] datos) {
            this.datos = datos;
        }

        @Override
        public int hashCode() {
            int hash = 5;
            hash = 89 * hash + Objects.hashCode(this.fecha);
            hash = 89 * hash + Arrays.deepHashCode(this.datos);
            return hash;
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            final Diagramapermisos other = (Diagramapermisos) obj;
            if (!Objects.equals(this.fecha, other.fecha)) {
                return false;
            }
            return Arrays.deepEquals(this.datos, other.datos);
        }

        @Override
        public String toString() {
            return "Diagramapermisos{" + "fecha=" + fecha + ", datos=" + Arrays.toString(datos) + '}';
        }

    }
}
