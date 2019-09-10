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

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.faces.model.SelectItem;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Matricula;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
public class prueba {
    
    private Persona user;
    
    public prueba() {
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
        Persona e = (new prueba()).getUser();
        e.setPersonaNacimiento(getEdad(12));
        e.setEstudiante(new Estudiante(e.getIdpersona(), false, 0, false, ""));
        e.getEstudiante().setEstudianteRiesgoVulnerabilidad("");
        e.getEstudiante().setEstudianteMedioTransporte(0);
        e.getEstudiante().setEstudianteDistanciaAlCentro(BigDecimal.valueOf(0));
        e.getEstudiante().setEstudianteTrabaja(false);
        e.getEstudiante().setEstudianteDependenciaEconomica(" ¿ ");
        e.getEstudiante().setEstudianteParvularia(false);
        e.getEstudiante().setEstudianteEnfermedades("");
        e.getEstudiante().setEstudianteMedicamentos("");
        e.getEstudiante().setEstudianteParentescoRepresentante("");
        e.getEstudiante().setEstudianteFormaTrabajo("");
        e.getEstudiante().setEstudianteCentroProcedencia("");
        e.getEstudiante().setEstudianteNoPartida("");
        e.getEstudiante().setEstudianteRepresentanteFamiliar(false);
        e.getEstudiante().setEstudiantePadre(getPadre());
        e.getEstudiante().setEstudianteMadre(getMadre());
        e.getEstudiante().setMatriculaList(new ArrayList<Matricula>());
        e.getEstudiante().setEstudianteComentario("");
        e.getEstudiante().setPersona(e);
        e.getEstudiante().setEstudianteEsEstudiante(true);
        e.setTipoPersona(new TipoPersona(8, "Estudiante"));
        e.setPersonaActivo(true);
        return e;
    }
    
    public Persona getRepresentante() {
        Persona r = (new prueba()).getUser();
        r.setEstudiante(new Estudiante(r.getIdpersona(), false, 0, false, ""));
        r.getEstudiante().setEstudianteRiesgoVulnerabilidad("");
        r.getEstudiante().setEstudianteMedioTransporte(null);
        r.getEstudiante().setEstudianteDistanciaAlCentro(null);
        r.getEstudiante().setEstudianteTrabaja(false);
        r.getEstudiante().setEstudianteDependenciaEconomica(null);
        r.getEstudiante().setEstudianteParvularia(null);
        r.getEstudiante().setEstudianteEnfermedades(null);
        r.getEstudiante().setEstudianteMedicamentos(null);
        r.getEstudiante().setEstudianteParentescoRepresentante("");
        r.getEstudiante().setEstudianteFormaTrabajo("");
        r.getEstudiante().setEstudianteCentroProcedencia(null);
        r.getEstudiante().setEstudianteNoPartida("");
        r.getEstudiante().setEstudianteRepresentanteFamiliar(false);
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
        Persona m = (new prueba()).getUser();
        m.setTipoPersona(new TipoPersona(10, "Madre de familia"));
        m.setPersonaEmail(null);
        m.setPersonaNit(null);
        m.setPersonaNacimiento(null);
        m.setPersonaSexo(true);
        return m;
    }
    
    public Persona getPadre() {
        Persona p = (new prueba()).getUser();
        p.setTipoPersona(new TipoPersona(11, "Padre de familia"));
        p.setPersonaEmail(null);
        p.setPersonaNit(null);
        p.setPersonaSexo(true);
        p.setPersonaNacimiento(null);
        return p;
    }
    
    public Persona getMaestro() {
        Persona ma = (new prueba()).getUser();
        ma.setEstudiante(null);
        ma.setMaestro(new Maestro(ma.getIdpersona()));
        ma.getMaestro().setMaestroAfp("");
        ma.getMaestro().setMaestroBienestar(0);
        ma.getMaestro().setMaestroCapacitacionesVirtuales(false);
        ma.getMaestro().setMaestroCategoria(0);
        ma.getMaestro().setMaestroCodigo(0);
        ma.getMaestro().setMaestroComentario("");
        ma.getMaestro().setMaestroEspecialidad("");
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
        ma.getMaestro().setMaestroTipoSalario("");
        ma.getMaestro().setMaestroTurno("");
        ma.getMaestro().setMaestroUsoVideoconferencias(false);
        ma.getMaestro().setMaestroUtilidadTecnologica(false);
        ma.getMaestro().setMaestrocolTelefonoResidencia("");
        ma.getMaestro().setPersona(ma);
        ma.getMaestro().setMaestoCargoList(new ArrayList<MaestoCargo>());
        ma.setTipoPersona(new TipoPersona(4, "Maestro"));
        ma.setPersonaActivo(true);
        return ma;
    }
    
    public Persona getBibliotecario() {
        Persona b = (new prueba()).getUser();
        b.setTipoPersona(new TipoPersona(5, "Bibliotecario"));
        b.setPersonaActivo(true);
        return b;
    }
    
    public Persona getAdministradorCra() {
        Persona a = (new prueba()).getUser();
        a.setTipoPersona(new TipoPersona(6, "Administrador CRA"));
        a.setPersonaActivo(true);
        return a;
    }
    
    public Persona getSubDirector() {
        Persona sd = (new prueba()).getUser();
        sd.setTipoPersona(new TipoPersona(3, "Subdirector"));
        sd.setPersonaActivo(true);
        return sd;
    }
    
    public Persona getLAboratorista() {
        Persona l = (new prueba()).getUser();
        l.setTipoPersona(new TipoPersona(7, "Laboratorista"));
        l.setPersonaActivo(true);
        return l;
    }
    
    public Persona getAmin() {
        Persona ad = (new prueba()).getUser();
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
        
        int i = 1;
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
                p.setPersonaLugarNac(" # ");
            
        }
        
        return items;
    }
    
    public List<SelectItem> getDepartamentoLista(Persona p) {
        List<SelectItem> items = new ArrayList<>();
        SelectItem u = new SelectItem(" ", "Seleccione");
        u.setNoSelectionOption(true);
        items.add(u);
        switch (p.getPersonaNacionalidad()) {
            case "Salvadoreña":
                int t = 1;
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
                p.setPersonaLugarNac(" # ");
                break;
        }
        return items;
        
    }
    
    public void setDepartamento(String dep, Persona p) {
        p.setPersonaLugarNac(dep + "#" + p.getPersonaLugarNac().split("#")[1]);
    }
    
    public String getDepartamento(Persona p) {
        return p.getPersonaLugarNac().split("#")[0];
    }
    
    public void setMunicipio(String mun, Persona p) {
        p.setPersonaLugarNac(p.getPersonaLugarNac().split("#")[0] + "#" + mun);
    }
    
    public String getMunicipio(Persona p) {
        return p.getPersonaLugarNac().split("#")[1];
    }
    
    public void setDui(String dui, Persona p) {
        String x[] = dui.split("=>");
        String i = "1";
        for (String g : (x.length > 1 ? x[1].substring(1) : x[0]).split("")) {// dui.split("")) {
            if (!g.equals("-")) {
                i += g;
            }
        }
        p.setIdpersona(Integer.valueOf(i));
    }
    
    public String getDui(Persona p) {
        String i = "";
        String[] h = p.getIdpersona().toString().split("");
        for (int g = 1; g < h.length; g++) {
            if (!h[g].equals("-")) {
                i += h[g];
            }
        }
        return i;
    }
    
    public Persona getUser() {
        return user;
    }
    
    public void setUser(Persona user) {
        this.user = user;
    }
    
    private Date getEdad(int menos) {
        String g = new SimpleDateFormat("dd-mm").format(new Date()) + (Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date())) - menos);
        Date d;
        try {
            d = new SimpleDateFormat("dd-mm-yyyy").parse(g);
        } catch (ParseException ex) {
            d = null;
        }
        return d;
    }
    
}
