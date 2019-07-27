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

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.prueba;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.entities.MaestoCargo;
import net.delsas.saitae.entities.Maestro;

/**
 *
 * @author delsas
 */
@Named(value = "maestroController")
@ViewScoped
public class maestroController implements Serializable {

    private static final long serialVersionUID = 1L;
    private Maestro maestro;
    private MaestroFacadeLocal mfl;

    /**
     * Creates a new instance of maestro
     */
    @PostConstruct
    public void init() {
        maestro = new Maestro(0);
        maestro.setPersona(new prueba().getUser());
        maestro.getPersona().setPersonaLugarNac(" # ");
        maestro.setMaestoCargoList(new ArrayList<MaestoCargo>());

    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    public void setDepartamento(String dep) {
        maestro.getPersona().setPersonaLugarNac(dep + "#" + maestro.getPersona().getPersonaLugarNac().split("#")[1]);
    }

    public String getDepartamento() {
        return maestro.getPersona().getPersonaLugarNac().split("#")[0];
    }

    public void setMunicipio(String mun) {
        maestro.getPersona().setPersonaLugarNac(maestro.getPersona().getPersonaLugarNac().split("#")[1] + "#" + mun);
    }

    public String getMunicipio() {
        return maestro.getPersona().getPersonaLugarNac().split("#")[1];
    }

    public void setDui(String dui) {
        String i = "1";
        for (String g : dui.split("")) {
            if (!g.equals("-")) {
                i += g;
            }
        }
        maestro.getPersona().setIdpersona(Integer.valueOf(i));
    }

    public String getDui() {
        String i = "";
        String[] h = maestro.getPersona().getIdpersona().toString().split("");
        for (int g = 1; g < h.length; g++) {
            if (!h[g].equals("-")) {
                i += h[g];
            }
        }
        return i;
    }

    public List<SelectItem> getMunicipiosLista() {
        List<SelectItem> items = new ArrayList<>();
        int i = 1;
        switch (this.getDepartamento()) {
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
            default:
                items.add(new SelectItem("9", "Extrangero"));

        }

        return items;
    }

    public List<SelectItem> getDepartamentosLista() {
        List<SelectItem> items = new ArrayList<>();
        if (maestro.getPersona().getPersonaNacionalidad().equals("Salvadoreña")) {
            int t = 1;
            for (String f : new String[]{"Ahuachapán", "Santa Ana", "Sonsonate", "Chalatenango",
                "Cuscatlán", "San Salvador", "La Libertad", "San Vicente", "Cabañas", "La Paz",
                "Usulután", "San Miguel", "Morazán", "La Unión"}) {
                items.add(new SelectItem((t < 10 ? "0" : "") + t, f));
                t++;
            }            
        }else{
            maestro.getPersona().setPersonaLugarNac("9#9");
        }
        items.add(new SelectItem("9", "Extrangero"));
        return items;
    }

}
