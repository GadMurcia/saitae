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
package net.delsas;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.faces.model.SelectItem;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.Anuncio;
import net.delsas.saitae.entities.Capacitaciones;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.EvaluacionMaestro;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.MestroHorarioMaterias;
import net.delsas.saitae.entities.Notificaciones;
import net.delsas.saitae.entities.Permisos;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.PersonasReserva;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
public class prueba {

    private Persona user;

    public prueba() {
        user = new Persona(0, "", "", true);
        user.setPersonaContrasenya("");
        user.setPersonaNacimiento(new Date(91, 1, 17));
        user.setPersonaDireccion("");
        user.setPersonaTelefono("");
        user.setPersonaCodigoResidencia(0);
        user.setPersonaZonaVivienda(0);
        user.setPersonaLugarNac("02#13");
        user.setPersonaOCupacion("");
        user.setPersonaNit("");
        user.setPersonaSexo(false);
        user.setPersonaEstadoFamiliar(0);
        user.setPersonaNacionalidad("");
        user.setPersonaEmail("");
        user.setPersonaDiscapacidades("");
        user.setPersonaComentarios("");
    }

    public Persona getEstudiante() {
        Estudiante e = new Estudiante(user.getIdpersona(), true, 0, true, "");
        user.getEstudiante().setEstudianteRiesgoVulnerabilidad("");
        user.getEstudiante().setEstudianteMedioTransporte(0);
        user.getEstudiante().setEstudianteDistanciaAlCentro(BigDecimal.valueOf(5.00));
        user.getEstudiante().setEstudianteTrabaja(true);
        user.getEstudiante().setEstudianteDependenciaEconomica("");
        user.getEstudiante().setEstudianteParvularia(true);
        user.getEstudiante().setEstudianteEnfermedades("");
        user.getEstudiante().setEstudianteMedicamentos("");
        user.getEstudiante().setEstudianteParentescoRepresentante("");
        user.getEstudiante().setEstudianteFormaTrabajo("");
        user.getEstudiante().setEstudianteCentroProcedencia("");
        user.getEstudiante().setEstudianteNoPartida("");
        user.getEstudiante().setEstudianteRepresentanteFamiliar(true);
        user.getEstudiante().setEstudiantePadre(getPadre());
        user.getEstudiante().setEstudianteMadre(getMadre());
        user.getEstudiante().setEstudianteRepresentante(getRepresentante().getEstudiante());
        user.getEstudiante().setEstudianteComentario("");
        user.getEstudiante().setPersona(user);
        user.setEstudiante(e);
        TipoPersona tp = new TipoPersona(8, "Estudiante");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        return user;
    }

    public Persona getRepresentante() {
        user.setEstudiante(new Estudiante(user.getIdpersona(), true, 0, true, ""));
        user.getEstudiante().setEstudianteRiesgoVulnerabilidad("");
        user.getEstudiante().setEstudianteMedioTransporte(null);
        user.getEstudiante().setEstudianteDistanciaAlCentro(null);
        user.getEstudiante().setEstudianteTrabaja(true);
        user.getEstudiante().setEstudianteDependenciaEconomica(null);
        user.getEstudiante().setEstudianteParvularia(null);
        user.getEstudiante().setEstudianteEnfermedades(null);
        user.getEstudiante().setEstudianteMedicamentos(null);
        user.getEstudiante().setEstudianteParentescoRepresentante("");
        user.getEstudiante().setEstudianteFormaTrabajo("");
        user.getEstudiante().setEstudianteCentroProcedencia(null);
        user.getEstudiante().setEstudianteNoPartida("");
        user.getEstudiante().setEstudianteRepresentanteFamiliar(true);
        user.getEstudiante().setEstudiantePadre(null);
        user.getEstudiante().setEstudianteMadre(null);
        user.getEstudiante().setEstudianteRepresentante(null);
        user.getEstudiante().setEstudianteComentario("");
        user.setTipoPersona(new TipoPersona(9, "Representante"));
        user.getTipoPersona().setAccesoTipoPersonaList(new ArrayList<AccesoTipoPersona>());
        user.getEstudiante().setPersona(user);
        return user;
    }

    public Persona getMadre() {
        TipoPersona tp = new TipoPersona(10, "Madre");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        user.setIdpersona(1045367074);
        return user;
    }

    public Persona getPadre() {
        TipoPersona tp = new TipoPersona(11, "Padre");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        user.setIdpersona(1045367075);
        return user;
    }

    public Persona getMaestro() {
        user.setEstudiante(null);
        user.setMaestro(new Maestro(user.getIdpersona()));
        user.getMaestro().setMaestroAfp("");
        user.getMaestro().setMaestroBienestar(0);
        user.getMaestro().setMaestroCapacitacionesVirtuales(true);
        user.getMaestro().setMaestroCategoria(0);
        user.getMaestro().setMaestroCodigo(0);
        user.getMaestro().setMaestroComentario("");
        user.getMaestro().setMaestroEspecialidad("");
        user.getMaestro().setMaestroFechaInstitucion(Calendar.getInstance().getTime());
        user.getMaestro().setMaestroFechaMagisterio(Calendar.getInstance().getTime());
        user.getMaestro().setMaestroFechaProximoAsenso(Calendar.getInstance().getTime());
        user.getMaestro().setMaestroHorasUsoTecnologia(0);
        user.getMaestro().setMaestroNip(0);
        user.getMaestro().setMaestroNivel(0);
        user.getMaestro().setMaestroNup(0);
        user.getMaestro().setMaestroPartidas(0);
        user.getMaestro().setMaestroRecursosWeb(true);
        user.getMaestro().setMaestroSinEscalafon(true);
        user.getMaestro().setMaestroSubnumeros(0);
        user.getMaestro().setMaestroTiempoCategoria("");
        user.getMaestro().setMaestroTipoSalario("");
        user.getMaestro().setMaestroTurno("");
        user.getMaestro().setMaestroUsoVideoconferencias(true);
        user.getMaestro().setMaestroUtilidadTecnologica(true);
        user.getMaestro().setMaestrocolTelefonoResidencia("");
        user.getMaestro().setPersona(user);
        user.getMaestro().setCapacitacionesList(new ArrayList<Capacitaciones>());
        user.getMaestro().setEvaluacionMaestroList(new ArrayList<EvaluacionMaestro>());
        user.getMaestro().setGradoList(new ArrayList<Grado>());
        user.getMaestro().setMestroHorarioMateriasList(new ArrayList<MestroHorarioMaterias>());
        user.setTipoPersona(new TipoPersona(4, "Maestro"));
        user.setNotificacionesList(new ArrayList<Notificaciones>());
        user.setPermisosList(new ArrayList<Permisos>());
        user.setPersonasReservaList(new ArrayList<PersonasReserva>());
        user.getTipoPersona().setAccesoTipoPersonaList(new ArrayList<AccesoTipoPersona>());
        user.getTipoPersona().setAnuncioList(new ArrayList<Anuncio>());
        return user;
    }

    public Persona getBibliotecario() {
        user = getMaestro();
        user.setMaestro(null);
        user.setTipoPersona(new TipoPersona(5, "Bibliotecario"));
        return user;
    }

    public Persona getAdministradorCra() {
        user = getBibliotecario();
        user.setTipoPersona(new TipoPersona(6, "Administrador CRA"));
        return user;
    }

    public Persona getSubDirector() {
        user = getAdministradorCra();
        user.setTipoPersona(new TipoPersona(3, "Subdirector"));
        return user;
    }

    public Persona getLAboratorista() {
        user = getAdministradorCra();
        user.setTipoPersona(new TipoPersona(7, "Laboratorista"));
        return user;
    }

    public Persona getAmin() {
        user.setEstudiante(getEstudiante().getEstudiante());
        user.setMaestro(getMaestro().getMaestro());
        user.setTipoPersona(new TipoPersona(7, "Laboratorista"));
        return user;
    }

    public List<SelectItem> getMunicipioLista(String dep, Persona p) {
        List<SelectItem> items = new ArrayList<>();
        items.add(new SelectItem(" ", "Seleccione"));

        int i = 1;
        switch (dep) {
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
        items.add(new SelectItem(" ", "Seleccione"));
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
        p.setPersonaLugarNac(p.getPersonaLugarNac().split("#")[1] + "#" + mun);
    }

    public String getMunicipio(Persona p) {
        return p.getPersonaLugarNac().split("#")[1];
    }

    public void setDui(String dui, Persona p) {
        String i = "1";
        for (String g : dui.split("")) {
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

}

/**
 * administrador 1 
 * Director 2 
 * Subdirector 3 
 * maestro 4 
 * bibliotecario 5
 * administrador cra 6 
 * laboratorista 7 
 * estudiante 8 
 * representante 9 
 * madre de famiia 10 
 * padre de familia 11
 */
