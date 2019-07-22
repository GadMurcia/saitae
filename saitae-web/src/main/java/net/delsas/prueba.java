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
import java.util.Date;
import java.util.List;
import net.delsas.saitae.entities.Acceso;
import net.delsas.saitae.entities.AccesoTipoPersona;
import net.delsas.saitae.entities.Estudiante;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoPersona;

/**
 *
 * @author delsas
 */
public class prueba {

    private Persona user;

    public prueba() {
        user = new Persona(1045367073, "User0 User1", "User2 User3", true);
        user.setPersonaContrasenya("02951a6cb9595ef475fed783e59c687e");
        user.setPersonaNacimiento(new Date(1991, 1, 17));
        user.setPersonaDireccion("dirección dirección");
        user.setPersonaTelefono("7878-7878");
        user.setPersonaCodigoResidencia(0);
        user.setPersonaZonaVivienda(0);
        user.setPersonaLugarNac("depto#muni");
        user.setPersonaOCupacion("ocupa");
        user.setPersonaNit("0000-000000-000-0");
        user.setPersonaSexo(false);
        user.setPersonaEstadoFamiliar(0);
        user.setPersonaNacionalidad("Salvadoreña");
        user.setPersonaEmail("email@email");
        user.setPersonaDiscapacidades("nada nada nada");
        user.setPersonaComentarios("comentarios comentarios");
    }

    public Estudiante getEstudiante() {
        Estudiante e = new Estudiante(user.getIdpersona(), true, 0, true, "Noveno Grado");
        e.setEstudianteRiesgoVulnerabilidad("riego o vulnerabilidad");
        e.setEstudianteMedioTransporte(0);
        e.setEstudianteDistanciaAlCentro(BigDecimal.valueOf(5.00));
        e.setEstudianteTrabaja(true);
        e.setEstudianteDependenciaEconomica("uno#dos#tres");
        e.setEstudianteParvularia(true);
        e.setEstudianteEnfermedades("enfermedades");
        e.setEstudianteMedicamentos("medicamentos");
        e.setEstudianteParentescoRepresentante("parentesco");
        e.setEstudianteFormaTrabajo("forma de trabajo");
        e.setEstudianteCentroProcedencia("Centro de procedencia");
        e.setEstudianteNoPartida("no partida");
        e.setEstudianteRepresentanteFamiliar(true);
        e.setEstudiantePadre(getPadre());
        e.setEstudianteMadre(getMadre());
        e.setEstudianteRepresentante(getRepresentante());
        e.setEstudianteComentario("comentarios");
        e.setPersona(user);
        user.setEstudiante(e);
        TipoPersona tp = new TipoPersona(8, "Estudiante");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            AccesoTipoPersona acc=new AccesoTipoPersona();
            acc.setAcceso(new Acceso(i, "Acceso"+i,".0", "/pages/perfil"+i+".intex"));
            acc.setTipoPersona(tp);
            atps.add(acc);
        }
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        return user.getEstudiante();
    }

    public Persona getUser() {
        return user;
    }

    public void setUser(Persona user) {
        this.user = user;
    }

    private Estudiante getRepresentante() {
        user.setIdpersona(1045367076);
        Estudiante e = new Estudiante(user.getIdpersona(), true, 0, true, "Noveno Grado");
        e.setEstudianteRiesgoVulnerabilidad("riego o vulnerabilidad");
        e.setEstudianteMedioTransporte(null);
        e.setEstudianteDistanciaAlCentro(null);
        e.setEstudianteTrabaja(true);
        e.setEstudianteDependenciaEconomica(null);
        e.setEstudianteParvularia(null);
        e.setEstudianteEnfermedades(null);
        e.setEstudianteMedicamentos(null);
        e.setEstudianteParentescoRepresentante("parentesco");
        e.setEstudianteFormaTrabajo("forma de trabajo");
        e.setEstudianteCentroProcedencia(null);
        e.setEstudianteNoPartida("no partida");
        e.setEstudianteRepresentanteFamiliar(true);
        e.setEstudiantePadre(null);
        e.setEstudianteMadre(null);
        e.setEstudianteRepresentante(null);
        e.setEstudianteComentario("comentarios");
        user.setEstudiante(e);
        TipoPersona tp = new TipoPersona(9, "Representante");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        return user.getEstudiante();
    }

    private Persona getMadre() {
        TipoPersona tp = new TipoPersona(10, "Madre");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        user.setIdpersona(1045367074);
        return user;
    }

    private Persona getPadre() {
        TipoPersona tp = new TipoPersona(11, "Padre");
        ArrayList<AccesoTipoPersona> atps = new ArrayList<>();
        tp.setAccesoTipoPersonaList(atps);
        user.setTipoPersona(tp);
        user.setIdpersona(1045367075);
        return user;
    }

}
