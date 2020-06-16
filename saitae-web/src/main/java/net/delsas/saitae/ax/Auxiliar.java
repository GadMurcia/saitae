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

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.MatriculaFacadeLocal;
import net.delsas.saitae.beans.MestroHorarioMateriasFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.Reserva;
import net.delsas.saitae.entities.TipoEspecialidades;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipoSueldos;
import org.apache.commons.codec.binary.Base64;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.event.FlowEvent;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author delsas
 */
public class Auxiliar implements Serializable {

    private final long serialVersionUID = 1L;

    private Persona user;

    public Auxiliar() {
        user = new Persona(0, "", "", false);
        user.setPersonaContrasenya("");
        user.setPersonaNacimiento(getEdad(18));
        user.setPersonaDireccion("");
        user.setPersonaTelefono("");
        user.setPersonaCodigoResidencia(0);
        user.setPersonaZonaVivienda(0);
        user.setPersonaLugarNac(" # ");
        user.setPersonaOCupacion("");
        user.setPersonaNit("");
        user.setPersonaSexo(false);
        user.setPersonaEstadoFamiliar(0);
        user.setPersonaNacionalidad("Salvadoreña");
        user.setPersonaEmail("");
        user.setPersonaDiscapacidades("");
        user.setPersonaComentarios("");
    }

    public Persona getEstudiante() {
        Persona e = (new Auxiliar()).getUser();
        e.setPersonaNacimiento(getEdad(12));
        e.setEstudiante(new Estudiante(e.getIdpersona(), true, 0, true, ""));
        e.getEstudiante().setEstudianteRiesgoVulnerabilidad("");
        e.getEstudiante().setEstudianteMedioTransporte(0);
        e.getEstudiante().setEstudianteDistanciaAlCentro(BigDecimal.valueOf(0));
        e.getEstudiante().setEstudianteTrabaja(false);
        e.getEstudiante().setEstudianteDependenciaEconomica(" ¿ ");
        e.getEstudiante().setEstudianteParvularia(true);
        e.getEstudiante().setEstudianteEnfermedades("");
        e.getEstudiante().setEstudianteMedicamentos("");
        e.getEstudiante().setEstudianteParentescoRepresentante("");
        e.getEstudiante().setEstudianteFormaTrabajo("");
        e.getEstudiante().setEstudianteCentroProcedencia("");
        e.getEstudiante().setEstudianteNoPartida("");
        e.getEstudiante().setEstudianteRepresentanteFamiliar(true);
        e.getEstudiante().setEstudiantePadre(getPadre());
        e.getEstudiante().setEstudianteMadre(getMadre());
        e.getEstudiante().setMatriculaList(new ArrayList<>());
        e.getEstudiante().setEstudianteComentario("");
        e.getEstudiante().setPersona(e);
        e.getEstudiante().setEstudianteEsEstudiante(true);
        e.setTipoPersona(new TipoPersona(8, "Estudiante"));
        e.setPersonaActivo(true);
        return e;
    }

    public Persona getRepresentante() {
        Persona r = (new Auxiliar()).getUser();
        r.setEstudiante(new Estudiante(r.getIdpersona(), true, 0, false, ""));
        r.getEstudiante().setEstudianteRiesgoVulnerabilidad("");
        r.getEstudiante().setEstudianteMedioTransporte(null);
        r.getEstudiante().setEstudianteDistanciaAlCentro(null);
        r.getEstudiante().setEstudianteTrabaja(true);
        r.getEstudiante().setEstudianteDependenciaEconomica(null);
        r.getEstudiante().setEstudianteParvularia(null);
        r.getEstudiante().setEstudianteEnfermedades(null);
        r.getEstudiante().setEstudianteMedicamentos(null);
        r.getEstudiante().setEstudianteParentescoRepresentante("");
        r.getEstudiante().setEstudianteFormaTrabajo("");
        r.getEstudiante().setEstudianteCentroProcedencia(null);
        r.getEstudiante().setEstudianteNoPartida("");
        r.getEstudiante().setEstudianteRepresentanteFamiliar(true);
        r.getEstudiante().setEstudiantePadre(null);
        r.getEstudiante().setEstudianteMadre(null);
        r.getEstudiante().setEstudianteRepresentante(null);
        r.getEstudiante().setEstudianteComentario("");
        r.getEstudiante().setEstudianteEsEstudiante(false);
        r.setTipoPersona(new TipoPersona(9, "Representante"));
        r.getEstudiante().setPersona(r);
        r.setPersonaActivo(true);
        return r;
    }

    public Persona getMadre() {
        Persona m = (new Auxiliar()).getUser();
        m.setTipoPersona(new TipoPersona(10, "Madre de familia"));
        m.setPersonaEmail(null);
        m.setPersonaNit(null);
        m.setPersonaNacimiento(null);
        m.setPersonaSexo(true);
        return m;
    }

    public Persona getPadre() {
        Persona p = (new Auxiliar()).getUser();
        p.setTipoPersona(new TipoPersona(11, "Padre de familia"));
        p.setPersonaEmail(null);
        p.setPersonaNit(null);
        p.setPersonaSexo(true);
        p.setPersonaNacimiento(null);
        return p;
    }

    public Persona getMaestro() {
        Persona ma = (new Auxiliar()).getUser();
        ma.setEstudiante(null);
        ma.setMaestro(new Maestro(ma.getIdpersona()));
        ma.getMaestro().setMaestroAfp("");
        ma.getMaestro().setMaestroBienestar(0);
        ma.getMaestro().setMaestroCapacitacionesVirtuales(false);
        ma.getMaestro().setMaestroCategoria(0);
        ma.getMaestro().setMaestroCodigo(0);
        ma.getMaestro().setMaestroComentario("");
        ma.getMaestro().setMaestroEspecialidad(new TipoEspecialidades(0));
        ma.getMaestro().setMaestroFechaInstitucion(Calendar.getInstance().getTime());
        ma.getMaestro().setMaestroFechaMagisterio(Calendar.getInstance().getTime());
        ma.getMaestro().setMaestroFechaProximoAsenso(Calendar.getInstance().getTime());
        ma.getMaestro().setMaestroHorasUsoTecnologia(0);
        ma.getMaestro().setMaestroNip(0);
        ma.getMaestro().setMaestroNivel(0);
        ma.getMaestro().setMaestroNup(0);
        ma.getMaestro().setMaestroPartidas(0);
        ma.getMaestro().setMaestroRecursosWeb(false);
        ma.getMaestro().setMaestroSinEscalafon(false);
        ma.getMaestro().setMaestroSubnumeros(0);
        ma.getMaestro().setMaestroTiempoCategoria("");
        ma.getMaestro().setMaestroTipoSalario(new TipoSueldos(0));
        ma.getMaestro().setMaestroTurno("");
        ma.getMaestro().setMaestroUsoVideoconferencias(false);
        ma.getMaestro().setMaestroUtilidadTecnologica(false);
        ma.getMaestro().setMaestrocolTelefonoResidencia("");
        ma.getMaestro().setPersona(ma);
        ma.getMaestro().setMaestoCargoList(new ArrayList<>());
        ma.setTipoPersona(new TipoPersona(4, "Maestro"));
        ma.setPersonaActivo(true);
        return ma;
    }

    public Persona getBibliotecario() {
        Persona b = (new Auxiliar()).getUser();
        b.setTipoPersona(new TipoPersona(5, "Bibliotecario"));
        b.setPersonaActivo(true);
        return b;
    }

    public Persona getAdministradorCra() {
        Persona a = (new Auxiliar()).getUser();
        a.setTipoPersona(new TipoPersona(6, "Administrador CRA"));
        a.setPersonaActivo(true);
        return a;
    }

    public Persona getSubDirector() {
        Persona sd = (new Auxiliar()).getUser();
        sd.setTipoPersona(new TipoPersona(3, "Subdirector"));
        sd.setPersonaActivo(true);
        return sd;
    }

    public Persona getLAboratorista() {
        Persona l = (new Auxiliar()).getUser();
        l.setTipoPersona(new TipoPersona(7, "Laboratorista"));
        l.setPersonaActivo(true);
        return l;
    }

    public Persona getAmin() {
        Persona ad = (new Auxiliar()).getUser();
        ad.setEstudiante(getEstudiante().getEstudiante());
        ad.setMaestro(getMaestro().getMaestro());
        ad.setTipoPersona(new TipoPersona(1, "Administrador"));
        ad.setPersonaActivo(true);
        return ad;
    }

    public List<SelectItem> getMunicipioLista(Persona p) {
        List<SelectItem> items = new ArrayList<>();
        SelectItem u = new SelectItem(" ", "Seleccione");
        u.setNoSelectionOption(true);
        items.add(u);
        Integer i = 1;
        switch (getDepartamento(p)) {
            case "01":
                for (String h : new String[]{"Ahuachapán", "Apaneca", "Atiquizaya", "Concepción de Ataco", "El Refugio",
                    "Guaymango", "Jujutla", "San Francisco Menéndez", "San Lorenzo", "San Pedro Puxtla", "Tacuba", "Turín"}) {
                    items.add(new SelectItem((i > 9 ? "" : "0") + i, h));
                    i++;
                }
                break;
            case "02":
                for (String h : new String[]{"Candelaria de la Frontera", "Chalchuapa", "Coatepeque", "El Congo", "El Porvenir",
                    "Masahuat", "Metapán", "San Antonio Pajonal", "San Sebastián Salitrillo", "Santa Ana",
                    "Santa Rosa Guachipilín", "Santiago de la Frontera", "Texistepeque"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "03":
                for (String h : new String[]{"Acajutla", "Armenia", "Caluco", "Cuisnahuat", "Izalco", "Juayúa", "Nahuizalco",
                    "Nahulingo", "Salcoatitán", "San Antonio del Monte", "San Julián", "Santa Catarina Masahuat",
                    "Santa Isabel Ishuatán", "Santo Domingo Guzmán", "Sonsonate", "Sonzacate"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "04":
                for (String h : new String[]{"Agua Caliente", "Arcatao", "Azacualpa", "Chalatenango (ciudad)", "Comalapa", "Citalá",
                    "Concepción Quezaltepeque", "Dulce Nombre de María", "El Carrizal", "El Paraíso", "La Laguna", "La Palma",
                    "La Reina", "Las Vueltas", "Nueva Concepción", "Nueva Trinidad", "Nombre de Jesús", "Ojos de Agua", "Potonico",
                    "San Antonio de la Cruz", "San Antonio Los Ranchos", "San Fernando", "San Francisco Lempa",
                    "San Francisco Morazán", "San Ignacio", "San Isidro Labrador", "San José Cancasque", "San José Las Flores",
                    "San Luis del Carmen", "San Miguel de Mercedes", "San Rafael", "Santa Rita", "Tejutla"}) {
                    items.add(new SelectItem(((i < 10) ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "05":
                for (String h : new String[]{"Candelaria", "Cojutepeque", "El Carmen", "El Rosario", "Monte San Juan",
                    "Oratorio de Concepción", "San Bartolomé Perulapía", "San Cristóbal", "San José Guayabal",
                    "San Pedro Perulapán", "San Rafael Cedros", "San Ramón", "Santa Cruz Analquito", "Santa Cruz Michapa",
                    "Suchitoto", "Tenancingo"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "06":
                for (String h : new String[]{"Aguilares", "Apopa", "Ayutuxtepeque", "Cuscatancingo", "Ciudad Delgado",
                    "El Paisnal", "Guazapa", "Ilopango", "Mejicanos", "Nejapa", "Panchimalco", "Rosario de Mora", "San Marcos",
                    "San Martín", "San Salvador", "Santiago Texacuangos", "Santo Tomás", "Soyapango", "Tonacatepeque"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "07":
                for (String h : new String[]{"Antiguo Cuscatlán", "Chiltiupán", "Ciudad Arce", "Colón", "Comasagua", "Huizúcar",
                    "Jayaque", "Jicalapa", "La Libertad", "Nueva San Salvador (Santa Tecla)", "Nuevo Cuscatlán", "San Juan Opico",
                    "Quezaltepeque", "Sacacoyo", "San José Villanueva", "San Matías", "San Pablo Tacachico", "Talnique",
                    "Tamanique", "Teotepeque", "Tepecoyo", "Zaragoza"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "08":
                for (String h : new String[]{"Apastepeque", "Guadalupe", "San Cayetano Istepeque", "San Esteban Catarina",
                    "San Ildefonso", "San Lorenzo", "San Sebastián", "San Vicente", "Santa Clara", "Santo Domingo",
                    "Tecoluca", "Tepetitán", "Verapaz"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "09":
                for (String h : new String[]{"Cinquera", "Dolores", "Guacotecti", "Ilobasco", "Jutiapa",
                    "San Isidro", "Sensuntepeque", "Tejutepeque", "Victoria"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "10":
                for (String h : new String[]{"Cuyultitán", "El Rosario", "Jerusalén", "Mercedes La Ceiba", "Olocuilta",
                    "Paraíso de Osorio", "San Antonio Masahuat", "San Emigdio", "San Francisco Chinameca",
                    "San Juan Nonualco", "San Juan Talpa", "San Juan Tepezontes", "San Luis Talpa", "San Luis La Herradura",
                    "San Miguel Tepezontes", "San Pedro Masahuat", "San Pedro Nonualco", "San Rafael Obrajuelo",
                    "Santa María Ostuma", "Santiago Nonualco", "Tapalhuaca", "Zacatecoluca"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "11":
                for (String h : new String[]{"Alegría", "Berlín", "California", "Concepción Batres", "El Triunfo", "Ereguayquín",
                    "Estanzuelas", "Jiquilisco", "Jucuapa", "Jucuarán", "Mercedes Umaña", "Nueva Granada", "Ozatlán",
                    "Puerto El Triunfo", "San Agustín", "San Buenaventura", "San Dionisio", "San Francisco Javier",
                    "Santa Elena", "Santa María", "Santiago de María", "Tecapán", "Usulután"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "12":
                for (String h : new String[]{"Carolina", "Chapeltique", "Chinameca", "Chirilagua", "Ciudad Barrios",
                    "Comacarán", "El Tránsito", "Lolotique", "Moncagua", "Nueva Guadalupe", "Nuevo Edén de San Juan",
                    "Quelepa", "San Antonio del Mosco", "San Gerardo", "San Jorge", "San Luis de la Reina", "San Miguel",
                    "San Rafael Oriente", "Sesori", "Uluazapa"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "13":
                for (String h : new String[]{"Arambala", "Cacaopera", "Chilanga", "Corinto", "Delicias de Concepción",
                    "El Divisadero", "El Rosario", "Gualococti", "Guatajiagua", "Joateca", "Jocoaitique", "Jocoro",
                    "Lolotiquillo", "Meanguera", "Osicala", "Perquín", "San Carlos", "San Fernando", "San Francisco Gotera",
                    "San Isidro", "San Simón", "Sensembra", "Sociedad", "Torola", "Yamabal", "Yoloaiquín"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "14":
                for (String h : new String[]{"Anamorós", "Bolivar", "Concepción de Oriente", "Conchagua", "El Carmen",
                    "El Sauce", "Intipucá", "La Unión", "Lislique", "Meanguera del Golfo", "Nueva Esparta", "Pasaquina",
                    "Polorós", "San Alejo", "San José", "Santa Rosa de Lima", "Yayantique", "Yucuaiquín"}) {
                    items.add(new SelectItem((i < 10 ? "0" : "") + i, h));
                    i++;
                }
                break;
            case "9":
                items.add(new SelectItem("9", "Extrangero"));
                break;
            default:
                if (p != null) {
                    p.setPersonaLugarNac(" # ");
                }
        }

        return items;
    }

    public List<SelectItem> getDepartamentoLista(Persona p) {
        List<SelectItem> items = new ArrayList<>();
        SelectItem u = new SelectItem(" ", "Seleccione");
        u.setNoSelectionOption(true);
        items.add(u);
        switch (p == null ? " " : p.getPersonaNacionalidad()) {
            case "Salvadoreña":
                Integer t = 1;
                for (String f : new String[]{"Ahuachapán", "Santa Ana", "Sonsonate", "Chalatenango",
                    "Cuscatlán", "San Salvador", "La Libertad", "San Vicente", "Cabañas", "La Paz",
                    "Usulután", "San Miguel", "Morazán", "La Unión"}) {
                    items.add(new SelectItem((t < 10 ? "0" : "") + t, f));
                    t++;
                }
                break;
            case "Extrangera":
                items.add(new SelectItem("9", "Extrangero"));
                break;
            default:
                if (p != null) {
                    p.setPersonaLugarNac(" # ");
                }
        }
        return items;

    }

    public void setDepartamento(String dep, Persona p) {
        p.setPersonaLugarNac(dep + "#" + p.getPersonaLugarNac().split("#")[1]);
    }

    public String getDepartamento(Persona p) {
        return p != null ? p.getPersonaLugarNac().split("#").length > 1 ? p.getPersonaLugarNac().split("#")[0] : " " : " ";
    }

    public String getMunicipio(Persona p) {
        return p != null ? p.getPersonaLugarNac().split("#").length > 1 ? p.getPersonaLugarNac().split("#")[1] : " " : " ";
    }

    public void setMunicipio(String mun, Persona p) {
        p.setPersonaLugarNac(p.getPersonaLugarNac().split("#")[0] + "#" + mun);
    }

    public void setDui(String dui, Persona p) {
        String x[] = dui != null ? dui.split("=>") : new String[]{"-"};
        String i = "1";
        for (String g : (x.length > 1 ? x[1] : x[0]).split("")) {// dui.split("")) {
            if (isNumber(g)) {
                i += g;
            }
        }
        p.setIdpersona(Integer.valueOf(i));
    }

    private boolean isNumber(String a) {
        String[] aa = a.split("");
        for (String aaa : aa) {
            switch (aaa) {
                case "0":
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "6":
                case "7":
                case "8":
                case "9":
                    break;
                default:
                    return false;
            }
        }
        return true;
    }

    public String getDui(Persona p) {
        String i = "";
        String[] h = p.getIdpersona().toString().split("");
        for (Integer g = 1; g < h.length; g++) {
            if (g == h.length - 1) {
                i += "-";
            }
            i += h[g];
        }
        return i;
    }

    public Persona getUser() {
        return user;
    }

    public void setUser(Persona user) {
        this.user = user;
    }

    private Date getEdad(Integer menos) {
        String g = new SimpleDateFormat("dd-mm").format(new Date())
                + (Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date())) - menos);
        Date d;
        try {
            d = new SimpleDateFormat("dd-mm-yyyy").parse(g);
        } catch (ParseException ex) {
            d = null;
        }
        return d;
    }

    public List<Integer> getTiposPersonas(Persona p) {
        List<Integer> items = new ArrayList<>();
        if (p != null && p.getTipoPersona() != null) {
            items.add(p.getTipoPersona().getIdtipoPersona());
            if (p.getDelagacionCargoList() != null) {
                p.getDelagacionCargoList().stream().filter((dl) -> (dl.getIdTipoPersona() != null)).forEachOrdered((dl) -> {
                    items.add(dl.getIdTipoPersona().getIdtipoPersona());
                });
            }
            if (p.getMaestro() != null && p.getMaestro().getMaestoCargoList() != null) {
                p.getMaestro().getMaestoCargoList().forEach((mc) -> {
                    items.add(mc.getCargo().getCargoTipoPersona().getIdtipoPersona());
                });
            }
        }
        return items;
    }

    public boolean permitirAcceso(Persona p, List<TipoPersona> lista) {
        List<Integer> permitidos = new ArrayList<>();
        List<Integer> tps = getTiposPersonas(p);
        lista.forEach((tp) -> {
            permitidos.add(tp.getIdtipoPersona());
        });
        boolean r = false;
        for (Integer i : tps) {
            if (permitidos.contains(i)) {
                r = true;
            }
        }
        return r;
    }

    public List<Persona> getPersonasParaNotificar(TipoPersona tp) {
        List<Persona> ps = new ArrayList<>();
        if (tp != null) {
            ps.addAll(tp.getPersonaList());
            tp.getDelagacionCargoList().stream().filter((dl) -> (!ps.contains(dl.getIdpersona()))).forEachOrdered((dl) -> {
                ps.add(dl.getIdpersona());
            });
            tp.getCargoList().forEach((c) -> {
                c.getMaestoCargoList().stream().filter((mc) -> (!ps.contains(mc.getMaestro().getPersona()))).forEachOrdered((mc) -> {
                    ps.add(mc.getMaestro().getPersona());
                });
            });
        }
        return ps;
    }

    public void sendMessage(String message, PushContext notificacion) {
        notificacion.send(message);
    }

    public void persistirNotificación(mensaje x, List<Persona> ps, NotificacionesFacadeLocal notiFL, PushContext notificacion) {
        ps.forEach((p) -> {
            persistirNotificación(x, p, notiFL, notificacion);
        });
    }

    public void persistirNotificación(mensaje x, Persona ps, NotificacionesFacadeLocal notiFL, PushContext notificacion) {
        notificar(x, ps, notificacion);
        try {
            notiFL.create(x.getNotificacion());
        } catch (Exception e) {
            try {
                notiFL.edit(x.getNotificacion());
            } catch (Exception ex) {
                System.out.println("doble error:\n" + e + "\n" + ex);
            }
        }
    }

    public void notificar(mensaje x, Persona ps, PushContext notificacion) {
        x.setDestinatario(ps.getIdpersona());
        x.getNotificacion().setFechaHora(new Date());
        sendMessage(x.toString(), notificacion);
    }

    public List<Integer> getDisabledDays() {
        List<Integer> i = new ArrayList<>();
        i.add(0);
        i.add(6);
        return i;
    }

    public Date getMinTimeCPs() {
        Calendar tmp = Calendar.getInstance();
        tmp.set(Calendar.HOUR_OF_DAY, 8);
        tmp.set(Calendar.MINUTE, 0);
        tmp.set(Calendar.SECOND, 0);
        tmp.set(Calendar.MILLISECOND, 0);
        return tmp.getTime();
    }

    public Date getMaxTimeCPs() {
        Calendar tmp = Calendar.getInstance();
        tmp.set(Calendar.HOUR_OF_DAY, 12);
        tmp.set(Calendar.MINUTE, 0);
        tmp.set(Calendar.SECOND, 0);
        tmp.set(Calendar.MILLISECOND, 0);
        return tmp.getTime();
    }

    public Date getMinTimeReservas() {
        Calendar tmp = Calendar.getInstance();
        tmp.set(Calendar.HOUR_OF_DAY, 7);
        tmp.set(Calendar.MINUTE, 15);
        tmp.set(Calendar.SECOND, 0);
        tmp.set(Calendar.MILLISECOND, 0);
        return tmp.getTime();
    }

    public static Date getMaxTimeReservas() {
        Calendar tmp = Calendar.getInstance();
        tmp.set(Calendar.HOUR_OF_DAY, 17);
        tmp.set(Calendar.MINUTE, 0);
        tmp.set(Calendar.SECOND, 0);
        tmp.set(Calendar.MILLISECOND, 0);
        return tmp.getTime();
    }

    public String getEstadoCita1(String estado) {
        String textoReserva;
        switch (estado) {
            case "S":
                textoReserva = "solicitad";
                break;
            case "A":
                textoReserva = "aceptad";
                break;
            case "P":
                textoReserva = "pospuest";
                break;
            case "C":
                textoReserva = "cancelad";
                break;
            case "T":
                textoReserva = "atendid";
                break;
            default:
                textoReserva = "";
        }
        return textoReserva;
    }

    public String getEstadoCita2(String e) {
        return e.equals("S") ? "Solicitada"
                : (e.equals("A") ? "Aceptada"
                : (e.equals("P") ? "Pospuesta"
                : (e.equals("C") ? "Cancelada"
                : (e.equals("T") ? "Atendida" : ""))));
    }

    public String getEstadoPermisos2(String e) {
        return e.equals("0") ? "Solicitado"
                : (e.equals("1") ? "Aceptado"
                : (e.equals("2") ? "Rechazado"
                : (e.equals("3") ? "Cancelado" : "")));
    }

    public String getEstadoPermisos1(String estado) {
        String textoReserva;
        switch (estado) {
            case "0":
                textoReserva = "solicitad";
                break;
            case "1":
                textoReserva = "aceptad";
                break;
            case "2":
                textoReserva = "rechazad";
                break;
            case "3":
                textoReserva = "cancelad";
                break;
            default:
                textoReserva = "";
        }
        return textoReserva;
    }

    public String getEstadoReservas2(String e) {
        return e.equals("S") ? "Solicitada"
                : (e.equals("A") ? "Aceptada"
                : (e.equals("R") ? "Rechazada"
                : (e.equals("C") ? "Cancelada"
                : (e.equals("E") ? "Entregada"
                : (e.equals("D") ? "Devuelta" : "")))));
    }

    public String getEstadoReservas1(String estado) {
        String textoReserva;
        switch (estado) {
            case "S":
                textoReserva = "solicitad";
                break;
            case "A":
                textoReserva = "aceptad";
                break;
            case "R":
                textoReserva = "rechazad";
                break;
            case "C":
                textoReserva = "cancelad";
                break;
            case "E":
                textoReserva = "entregad";
                break;
            case "D":
                textoReserva = "devuelt";
                break;
            default:
                textoReserva = "";
        }
        return textoReserva;
    }

    public List<Persona> getPersonasEnReserva(Reserva r) {
        List<Persona> i = new ArrayList<>();
        r.getPersonasReservaList().forEach((ps) -> {
            i.add(ps.getPersona());
        });
        return i;
    }

    public Integer getAñoActual() {
        return Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
    }

    public axHorario llenar(Horario h, GradoPK pk, MestroHorarioMateriasFacadeLocal mhmFL) {
        axHorario x = new axHorario();
        x.setHoras(h);
        List<MestroHorarioMaterias> mhmList = mhmFL.findByIdHoraAndGradopk(h.getIdhorario(), pk);
        for (MestroHorarioMaterias mhm : mhmList) {
            switch (mhm.getDiasEstudio().getIdDias()) {
                case 1:
                    x.setLunes(mhm.getMateria());
                    x.setNomL(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 2:
                    x.setMartes(mhm.getMateria());
                    x.setNomM(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 3:
                    x.setMiercoles(mhm.getMateria());
                    x.setNomX(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 4:
                    x.setJueves(mhm.getMateria());
                    x.setNomJ(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 5:
                    x.setViernes(mhm.getMateria());
                    x.setNomV(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 6:
                    x.setSabado(mhm.getMateria());
                    x.setNomS(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
                case 7:
                    x.setDomingo(mhm.getMateria());
                    x.setNomD(" (" + getNombreCortoPersona(mhm.getMaestro().getPersona()) + ") ");
                    break;
            }
        }
        return x;
    }

    public axHorario llenar(Integer año, Horario h, Integer idMaestro, MestroHorarioMateriasFacadeLocal mhmFL) {
        axHorario x = new axHorario();
        x.setHoras(h);
        for (MestroHorarioMaterias mhm : mhmFL.findByIdHoraAndMaestro(año, h.getIdhorario(), idMaestro)) {
            switch (mhm.getDiasEstudio().getIdDias()) {
                case 1:
                    x.setLunes(mhm.getMateria());
                    x.setNomL(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 2:
                    x.setMartes(mhm.getMateria());
                    x.setNomM(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 3:
                    x.setMiercoles(mhm.getMateria());
                    x.setNomX(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 4:
                    x.setJueves(mhm.getMateria());
                    x.setNomJ(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 5:
                    x.setViernes(mhm.getMateria());
                    x.setNomV(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 6:
                    x.setSabado(mhm.getMateria());
                    x.setNomS(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
                case 7:
                    x.setDomingo(mhm.getMateria());
                    x.setNomD(" (" + getGradoNombreCorto(mhm.getGrado().getGradoPK()) + ") ");
                    break;
            }
        }
        return x;
    }

    public String getGradoNombre(GradoPK gr) {
        return gr == null ? ""
                : (gr.getIdgrado() + "° "
                + getModalidadNombre(gr.getGradoModalidad())
                + ((gr.getGradoSeccion() == null || gr.getGradoSeccion().isEmpty() || gr.getGradoSeccion().equals(" "))
                ? "" : " Sección " + gr.getGradoSeccion()));
    }

    public String getGradoNombreCorto(GradoPK gr) {
        return gr == null ? "" : (gr.getIdgrado() + gr.getGradoModalidad() + gr.getGradoSeccion());
    }

    public String getModalidadNombre(String gr) {
        return (gr.equals("C") ? "TVC Contador"
                : (gr.equals("S") ? "TVC Secretariado"
                : (gr.equals("G") ? "General" : "??")));
    }

    public String getNombreCortoPersona(Persona p) {
        return p == null ? "" : p.getPersonaNombre().split(" ")[0] + " " + p.getPersonaApellido().split(" ")[0];
    }

    public String getNombreCompletoPersona(Persona p) {
        return p == null ? "" : p.getPersonaNombre() + " " + p.getPersonaApellido();
    }

    public String setComentario(Integer ind, String v, String com) {
        String c[] = com.split("¿¿");
        String rr = "";
        for (Integer y = 0; y < c.length; y++) {
            rr += (y > 0 ? "¿¿" : "") + (Objects.equals(y, ind) ? v : c[y]);
        }
        return rr;
    }

    public String getDoc(byte[] doc, String ex) {
        String a = doc == null ? ""
                : "data:" + ex + ";base64, " + new String(Base64.encodeBase64(doc));
        return a;
    }

    public List<Integer> getAñosParaMostrar(int numeroAños) {
        List<Integer> i = new ArrayList<>();
        for (int t = 0; t < numeroAños; t++) {
            i.add(getAñoActual() - t);
        }
        return i;
    }

    public List<horarioGlobal> llenar(Integer año, List<Horario> hs, DiasEstudio dh, MestroHorarioMateriasFacadeLocal mhmFL, GradoFacadeLocal gFL) {
        List<horarioGlobal> i = new ArrayList<>();
        hs.stream().map((h) -> {
            horarioGlobal gl = new horarioGlobal(h.getIdhorario() + "-" + dh.getIdDias(), h, dh);
            List<Integer> idGs = gFL.getIdPorAñoyModalidad(año, "G");
            List<Integer> idCs = gFL.getIdPorAñoyModalidad(año, "C");
            idGs.forEach((idg) -> {
                List<String> sGs = gFL.getSeccionPorAñoModalidadyId(año, "G", idg);
                sGs.forEach((sg) -> {
                    GradoPK pkg = new GradoPK(idg, "G", sg, año);
                    List<MestroHorarioMaterias> lm1 = mhmFL.findByIdDiaAndGradopkAndidHora(h.getIdhorario(), pkg, dh.getIdDias());
                    MestroHorarioMaterias m1 = lm1.size() > 0 ? lm1.get(0) : null;
                    if (m1 != null) {
                        switch (sg + idg) {
                            case "A1":
                                gl.getGenerales().setA1(m1.getMestroHorarioMateriasPK());
                                break;
                            case "B1":
                                gl.getGenerales().setB1(m1.getMestroHorarioMateriasPK());
                                break;
                            case "A2":
                                gl.getGenerales().setA2(m1.getMestroHorarioMateriasPK());
                                break;
                            case "B2":
                                gl.getGenerales().setB2(m1.getMestroHorarioMateriasPK());
                        }
                    }
                });
            });
            idCs.forEach((idc) -> {
                List<String> sCs = gFL.getSeccionPorAñoModalidadyId(año, "C", idc);
                sCs.forEach((sc) -> {
                    GradoPK pkg = new GradoPK(idc, "C", sc, año);
                    List<MestroHorarioMaterias> lm1 = mhmFL.findByIdDiaAndGradopkAndidHora(h.getIdhorario(), pkg, dh.getIdDias());
                    MestroHorarioMaterias m1 = lm1.size() > 0 ? lm1.get(0) : null;
                    if (m1 != null) {
                        switch (sc + idc) {
                            case "A1":
                                gl.getComercios().setA1(m1.getMestroHorarioMateriasPK());
                                break;
                            case "B1":
                                gl.getComercios().setB1(m1.getMestroHorarioMateriasPK());
                                break;
                            case "A2":
                                gl.getComercios().setA2(m1.getMestroHorarioMateriasPK());
                                break;
                            case "B2":
                                gl.getComercios().setB2(m1.getMestroHorarioMateriasPK());
                                break;
                            case "A3":
                                gl.getComercios().setA3(m1.getMestroHorarioMateriasPK());
                                break;
                            case "B3":
                                gl.getComercios().setB3(m1.getMestroHorarioMateriasPK());
                        }
                    }
                });
            });
            return gl;
        }).forEachOrdered((gl) -> {
            i.add(gl);
        });
        return i;
    }

    public Integer getAñoInscripcion() {
        Date r = new Date();
        Integer y;
        try {
            y = r.before(new SimpleDateFormat("dd-MM-yyyy").parse("24-11-" + getAñoActual()))
                    ? getAñoActual() + 0
                    : (getAñoActual() + 1);
        } catch (ParseException ex) {
            y = getAñoActual();
        }
        return y;
    }

    public boolean isTimeToInsciption() {
        try {
            Date d = new Date();
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse("22-11-" + getAñoActual());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse("31-01-" + getAñoActual());
            return !d.before(d1) || !d.after(d2);
        } catch (ParseException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public String getDateTimeToString(Date s) {
        return new SimpleDateFormat("dd/MM/yyyy hh:mm a").format(s);
    }

    public String getDateToString(Date s) {
        return new SimpleDateFormat("dd/MM/yyyy").format(s);
    }

    public String getTimeToString(Date s) {
        return new SimpleDateFormat("hh:mm a").format(s);
    }

    public void onBlour(AjaxBehaviorEvent e) {
        System.out.println("Evento desde: " + e.getComponent().getClientId());
    }

    public String getFecha(Date a) {
        return a != null ? new SimpleDateFormat("dd/MM/yyyy").format(a) : " ";
    }

    public String getHora(Date a) {
        return a != null ? new SimpleDateFormat("hh:mm a").format(a) : " ";
    }

    public String getFechaS(Date i, Date f) {
        String g = "";
        if (i != null) {
            String in = getFecha(i);
            String fi = getFecha(f);
            if (in.equals(fi)) {
                g = in;
            } else {
                g = "Entre " + in + " y " + fi;
            }
        }
        return g;
    }

    public String getHoras(Date i, Date f) {
        String g = "";
        long min = getMinutos(i, f);
        if (min > 0) {
            long hor = min / 60;
            String in = getHora(i);
            String fi = getHora(f);
            min = min - (hor * 60);
            g = "Entre las " + in + " y las "
                    + fi + " (" + hor + " horas y "
                    + min + " minutos).";
        }
        return g;
    }

    public long getMinutos(Date i, Date f) {
        long min = 0;
        if (i != null && f != null) {
            min = Duration.between(i.toInstant(), f.toInstant()).toMinutes();
        }
        return min;
    }

    public String onFlowProcess(FlowEvent event) {
        String st = event.getNewStep();
        try {
            PrimeFaces.current().ajax().update("hn:ws");
        } catch (Exception e) {
        }
        return st;
    }

    public String[] getDependencia(Estudiante e) {
        String d[] = e.getEstudianteDependenciaEconomica().split("¿");
        String ot[] = d[0].split("#");
        return ot;
    }

    public String getOtraDependenciaEcon(Estudiante e) {
        String d[] = e.getEstudianteDependenciaEconomica().split("¿");
        String ot = d.length > 1 ? d[1] : " ";
        return ot;
    }

    public void partida(FileUploadEvent f, Estudiante e) {
        e.getDocumentos().setEstudianteDocPartida(f.getFile().getContents());
        e.getDocumentos().setEstudianteExtencionPartida(f.getFile().getFileName() + "¿¿" + f.getFile().getContentType());
    }

    public boolean getHayPartida(Estudiante e) {
        return e == null || e.getDocumentos() == null
                ? false : e.getDocumentos().getEstudianteExtencionPartida() != null;
    }

    public String getDocPartida(Estudiante e) {
        return e == null ? ""
                : (getDoc(
                        e.getDocumentos().getEstudianteDocPartida(),
                        (e.getDocumentos().getEstudianteExtencionPartida() == null
                        || e.getDocumentos().getEstudianteExtencionPartida().isEmpty())
                        ? "" : e.getDocumentos().getEstudianteExtencionPartida().split("¿¿")[1]));
    }

    public void certificado(FileUploadEvent f, Estudiante e) {
        e.getDocumentos().setEstudianteDocCertificado(f.getFile().getContents());
        e.getDocumentos().setEstudianteExtencionCertificado(f.getFile().getFileName() + "¿¿" + f.getFile().getContentType());
    }

    public boolean getHayCertifcado(Estudiante e) {
        return e == null || e.getDocumentos() == null ? false
                : e.getDocumentos().getEstudianteExtencionCertificado() != null;
    }

    public String getDocCertificado(Estudiante e) {
        return e == null ? ""
                : (getDoc(
                        e.getDocumentos().getEstudianteDocCertificado(),
                        (e.getDocumentos().getEstudianteExtencionCertificado() == null
                        || e.getDocumentos().getEstudianteExtencionCertificado().isEmpty())
                        ? "" : e.getDocumentos().getEstudianteExtencionCertificado().split("¿¿")[1]));
    }

    public void conducta(FileUploadEvent f, Estudiante e) {
        e.getDocumentos().setEstudianteDocConducta(f.getFile().getContents());
        e.getDocumentos().setEstudianteExtencionConducta(f.getFile().getFileName() + "¿¿" + f.getFile().getContentType());
    }

    public boolean getHayConducta(Estudiante e) {
        return e == null || e.getDocumentos() == null
                ? false : e.getDocumentos().getEstudianteExtencionConducta() != null;
    }

    public String getDocConducta(Estudiante e) {
        return e == null ? ""
                : (getDoc(
                        e.getDocumentos().getEstudianteDocConducta(),
                        (e.getDocumentos().getEstudianteExtencionConducta() == null
                        || e.getDocumentos().getEstudianteExtencionConducta().isEmpty())
                        ? "" : e.getDocumentos().getEstudianteExtencionConducta().split("¿¿")[1]));
    }

    public void dui(FileUploadEvent f, Estudiante e) {
        e.getDocumentos().setEstudianteDocDui(f.getFile().getContents());
        e.getDocumentos().setEstudianteExtencionDui(f.getFile().getFileName() + "¿¿" + f.getFile().getContentType());
    }

    public boolean getHayDui(Estudiante e) {
        return e == null || e.getDocumentos() == null
                ? false : e.getDocumentos().getEstudianteExtencionDui() != null;
    }

    public String getDocDui(Estudiante e) {
        return e == null ? ""
                : (getDoc(
                        e.getDocumentos().getEstudianteDocDui(),
                        (e.getDocumentos().getEstudianteExtencionDui() == null
                        || e.getDocumentos().getEstudianteExtencionDui().isEmpty())
                        ? "" : e.getDocumentos().getEstudianteExtencionDui().split("¿¿")[1]));
    }

    public void notas(FileUploadEvent f, Estudiante e) {
        e.getDocumentos().setEstudianteDocNotas(f.getFile().getContents());
        e.getDocumentos().setEstudianteExtencionNotas(f.getFile().getFileName() + "¿¿" + f.getFile().getContentType());
    }

    public boolean getHayNotas(Estudiante e) {
        return e == null || e.getDocumentos() == null
                ? false : e.getDocumentos().getEstudianteExtencionNotas() != null;
    }

    public String getDocNotas(Estudiante e) {
        return e == null ? ""
                : (getDoc(
                        e.getDocumentos().getEstudianteDocNotas(),
                        (e.getDocumentos().getEstudianteExtencionNotas() == null
                        || e.getDocumentos().getEstudianteExtencionNotas().isEmpty())
                        ? "" : e.getDocumentos().getEstudianteExtencionNotas().split("¿¿")[1]));
    }

    public PieChartModel createPieModel(HashMap<String, Integer> vals, String tit, String lp) {
        PieChartModel pm = new PieChartModel();
        vals.forEach((String k, Integer v) -> {
            pm.set(k, v);
        });
        pm.setTitle(tit);
        pm.setLegendPosition(lp);
        pm.setFill(false);
        pm.setShowDataLabels(true);
        pm.setDiameter(300);
        pm.setShadow(false);
        return pm;
    }

    private List<MatriculaSeccion> llenar(MatriculaFacadeLocal mFL, GradoFacadeLocal gFL, Integer año, String m) {
        List<MatriculaSeccion> i = new ArrayList<>();
        List<Integer> ns = gFL.getIdPorAñoyModalidad(año, m);
        for (Integer n : ns) {
            List<String> ss = gFL.getSeccionPorAñoModalidadyId(año, m, n);
            ss.stream().map((s) -> gFL.find(new GradoPK(n, m, s, año))).map((g) -> {
                MatriculaSeccion mas = new MatriculaSeccion(g.getGradoPK(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                List<Matricula> matrs = mFL.findByGradoPK(g.getGradoPK());
                matrs.stream().forEachOrdered((ma) -> {
                    mas.setMatriculaM(mas.getMatriculaM() + (!ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setMatriculaF(mas.getMatriculaF() + (ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setRepitenciaM(mas.getRepitenciaM() + (ma.getMatriculaRepite() && !ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setRepitenciaF(mas.getRepitenciaF() + (ma.getMatriculaRepite() && ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setRetiradosM(mas.getRetiradosM() + (!ma.getEstudiante().getPersona().getPersonaActivo() && !ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setRetiradosF(mas.getRetiradosF() + (!ma.getEstudiante().getPersona().getPersonaActivo() && ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setSobreEdadM(mas.getSobreEdadM() + (getEdad(ma.getEstudiante().getPersona().getPersonaNacimiento()) > (15 + n) && !ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setSobreEdadF(mas.getSobreEdadF() + (getEdad(ma.getEstudiante().getPersona().getPersonaNacimiento()) > (15 + n) && ma.getEstudiante().getPersona().getPersonaSexo() ? 1 : 0));
                    mas.setReprobadosM(0);
                    mas.setReprobadosF(0);
                });
                return mas;
            }).forEachOrdered((mas) -> {
                i.add(mas);
            });
        }

        return i;

    }

    public List<ReporteMatricula> llenar(MatriculaFacadeLocal mFL, GradoFacadeLocal gFL, Integer año) {
        List<ReporteMatricula> i = new ArrayList<>();
        List<String> mm = gFL.getModalidadPorAño(año);
        mm.forEach((m) -> {
            i.add(new ReporteMatricula(m, llenar(mFL, gFL, año, m)));
        });
        return i;
    }

    private Integer getEdad(Date d) {
        d = d == null ? new Date() : d;
        int aa = getAñoActual(),
                ma = Integer.valueOf(new SimpleDateFormat("MM").format(new Date())),
                da = Integer.valueOf(new SimpleDateFormat("dd").format(new Date())),
                ad = Integer.valueOf(new SimpleDateFormat("yyyy").format(d)),
                md = Integer.valueOf(new SimpleDateFormat("MM").format(d)),
                dd = Integer.valueOf(new SimpleDateFormat("dd").format(d)),
                e;
        e = aa - ad;
        if (md > ma || (md == ma && dd > da)) {
            e -= 1;
        }
        return e;
    }

    public void agregarImagenAHojaExcel(HSSFWorkbook doc, HSSFSheet hoja, int row, int rowi, int col, int rowf, String ruta) {
        try {
            int index;
            try (InputStream is = new FileInputStream(ruta)) {
                byte[] bs = IOUtils.toByteArray(is);
                index = doc.addPicture(bs, Workbook.PICTURE_TYPE_PNG);
            }
            CreationHelper ch = doc.getCreationHelper();
            Drawing d = hoja.createDrawingPatriarch();
            ClientAnchor c = ch.createClientAnchor();
            c.setCol1(col);
            c.setRow1(row);
            Picture p = d.createPicture(c, index);
            p.resize(rowi, rowf);
        } catch (IOException e) {
            System.out.println("Error en agregarImagenAHojaExcel\n\n" + e);
        }
    }

    public String getPeriodoPermisos(Permisos p) {
        String h = "";
        if (p != null) {
            if (p.getPermisosPK().getPermisoFechaInicio().equals(p.getPermisoFechafin())) {
                h = getDateToString(p.getPermisosPK().getPermisoFechaInicio());
            } else {
                h = "De " + getDateToString(p.getPermisosPK().getPermisoFechaInicio())
                        + " a " + getDateToString(p.getPermisoFechafin());
            }
        }
        return h;
    }

    public String getSolicitadoPor(Permisos s) {
        if (s != null && s.getPermisosSolicitante() != null) {
            Persona solicitante;
            boolean e = s.getPermisosSolicitante().getTipoPersona().getIdtipoPersona() == 3 ? true
                    : s.getPermisosSolicitante().getTipoPersona().getIdtipoPersona() == 2 ? true
                    : s.getPermisosSolicitante().getTipoPersona().getIdtipoPersona() == 1;
            if (e) {
                solicitante = new Persona();
                new Auxiliar().setDui(s.getPermisosComentario().split("¿¿")[0], solicitante);
                solicitante.setPersonaNombre(s.getPermisosComentario().split("¿¿")[1]);
                solicitante.setPersonaApellido(s.getPermisosComentario().split("¿¿")[2]);
            } else {
                solicitante = s.getPermisosSolicitante();
            }
            String h = getNombreCompletoPersona(solicitante);
            return h;
        } else {
            return "";
        }
    }

    public Date getFechaUnicamente(Date fecha) {
        try {
            fecha = new SimpleDateFormat("dd/MM/yyyy").parse(new SimpleDateFormat("dd/MM/yyyy").format(fecha));
        } catch (ParseException ex) {
        }
        return fecha;
    }

    public Date getHoraUnicamente(Date fecha) {
        try {
            fecha = new SimpleDateFormat("hh:mm a").parse(new SimpleDateFormat("hh:mm a").format(fecha));
        } catch (ParseException ex) {
        }
        return fecha;
    }

    public long getCantidadDias(Date i, Date f) {
        long d = 0;
        if (i != null && f != null) {
            d = Duration.between(i.toInstant(), f.toInstant()).toDays() + 1;
        }
        if (d >= 7) {
            d = d - ((int) (d / 7)) * 2;
        } else {
            String ee = new SimpleDateFormat("EEE").format(i);
            System.out.println(ee);
            switch (ee) {
                case "lun":
                    if (d > 5) {
                        d = d - 2;
                    }
                    break;
                case "mar":
                    if (d > 4) {
                        d = d - 2;
                    }
                    break;
                case "mie":
                    if (d > 3) {
                        d = d - 2;
                    }
                    break;
                case "jue":
                    if (d > 2) {
                        d = d - 2;
                    }
                    break;
                case "vie":
                    if (d > 1) {
                        d = d - 2;
                    }
                    break;
            }
        }
        return d;
    }

    public boolean getPermisoGoceDeSueldo(Permisos p) {
        return p == null ? false : p.getPermisosComentario().split("¿¿")[0].equals("1");
    }

    public boolean getPermisoLicenciasAnteriores(Permisos p) {
        return p == null ? false : p.getPermisosComentario().split("¿¿")[1].equals("1");
    }

    public void setPermisoGoceDeSueldo(boolean goce, Permisos p) {
        p.setPermisosComentario((goce ? "1" : "0") + "¿¿" + (getPermisoLicenciasAnteriores(p) ? "1" : "0") + "¿¿¿¿ ");
    }

    public void setPermisoLicenciasAnteriores(boolean lic, Permisos p) {
        p.setPermisosComentario((getPermisoGoceDeSueldo(p) ? "1" : "0") + "¿¿" + (lic ? "1" : "0") + "¿¿¿¿");
    }
}
