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
    
    public Persona getBibliotecario(){
        user=getMaestro();
        user.setMaestro(null);
        user.setTipoPersona(new TipoPersona(5, "Bibliotecario"));
        return user;
    }
    
    public Persona getAdministradorCra(){
        user=getBibliotecario();
        user.setTipoPersona(new TipoPersona(6, "Administrador CRA"));
        return user;
    }
    
    public Persona getSubDirector(){
        user=getAdministradorCra();
        user.setTipoPersona(new TipoPersona(3, "Subdirector"));
        return user;
    }
    
    public Persona getLAboratorista(){
        user=getAdministradorCra();
        user.setTipoPersona(new TipoPersona(7, "Laboratorista"));
        return user;
    }
    
    public Persona getAmin(){
        user.setEstudiante(getEstudiante().getEstudiante());
        user.setMaestro(getMaestro().getMaestro());
        user.setTipoPersona(new TipoPersona(7, "Laboratorista"));
        return user;
    }

}

/**administrador 1
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
 * 
 */