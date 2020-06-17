/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author delsas
 */
@Entity
@Table(name = "evaluacionMaestro", catalog = "intex", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EvaluacionMaestro.findAll", query = "SELECT e FROM EvaluacionMaestro e"),
    @NamedQuery(name = "EvaluacionMaestro.findByIdMaestro", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroPK.idMaestro = :idMaestro"),
    @NamedQuery(name = "EvaluacionMaestro.findByFechaHora", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroPK.fechaHora = :fechaHora"),
    @NamedQuery(name = "EvaluacionMaestro.findByTurno", query = "SELECT e FROM EvaluacionMaestro e WHERE e.turno = :turno"),
    @NamedQuery(name = "EvaluacionMaestro.findByEstudiantes", query = "SELECT e FROM EvaluacionMaestro e WHERE e.estudiantes = :estudiantes"),
    @NamedQuery(name = "EvaluacionMaestro.findByHoraInicio", query = "SELECT e FROM EvaluacionMaestro e WHERE e.horaInicio = :horaInicio"),
    @NamedQuery(name = "EvaluacionMaestro.findByHoraFin", query = "SELECT e FROM EvaluacionMaestro e WHERE e.horaFin = :horaFin"),
    @NamedQuery(name = "EvaluacionMaestro.findByUnidad", query = "SELECT e FROM EvaluacionMaestro e WHERE e.unidad = :unidad"),
    @NamedQuery(name = "EvaluacionMaestro.findByObjetivo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.objetivo = :objetivo"),
    @NamedQuery(name = "EvaluacionMaestro.findByResumen", query = "SELECT e FROM EvaluacionMaestro e WHERE e.resumen = :resumen"),
    @NamedQuery(name = "EvaluacionMaestro.findByPropuestaMejora", query = "SELECT e FROM EvaluacionMaestro e WHERE e.propuestaMejora = :propuestaMejora"),
    @NamedQuery(name = "EvaluacionMaestro.findByEvaluacionMaestroComentario", query = "SELECT e FROM EvaluacionMaestro e WHERE e.evaluacionMaestroComentario = :evaluacionMaestroComentario"),
    @NamedQuery(name = "EvaluacionMaestro.findByPlanGrado", query = "SELECT e FROM EvaluacionMaestro e WHERE e.planGrado = :planGrado"),
    @NamedQuery(name = "EvaluacionMaestro.findByJornalizaci\u00f3n", query = "SELECT e FROM EvaluacionMaestro e WHERE e.jornalizaci\u00f3n = :jornalizaci\u00f3n"),
    @NamedQuery(name = "EvaluacionMaestro.findByCartaDidactica", query = "SELECT e FROM EvaluacionMaestro e WHERE e.cartaDidactica = :cartaDidactica"),
    @NamedQuery(name = "EvaluacionMaestro.findByGuionClase", query = "SELECT e FROM EvaluacionMaestro e WHERE e.guionClase = :guionClase"),
    @NamedQuery(name = "EvaluacionMaestro.findByAgendaDiaria", query = "SELECT e FROM EvaluacionMaestro e WHERE e.agendaDiaria = :agendaDiaria"),
    @NamedQuery(name = "EvaluacionMaestro.findByColocaObjetivo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.colocaObjetivo = :colocaObjetivo"),
    @NamedQuery(name = "EvaluacionMaestro.findByAmbientacion", query = "SELECT e FROM EvaluacionMaestro e WHERE e.ambientacion = :ambientacion"),
    @NamedQuery(name = "EvaluacionMaestro.findByPuntual", query = "SELECT e FROM EvaluacionMaestro e WHERE e.puntual = :puntual"),
    @NamedQuery(name = "EvaluacionMaestro.findByComites", query = "SELECT e FROM EvaluacionMaestro e WHERE e.comites = :comites"),
    @NamedQuery(name = "EvaluacionMaestro.findByEjesTransversales", query = "SELECT e FROM EvaluacionMaestro e WHERE e.ejesTransversales = :ejesTransversales"),
    @NamedQuery(name = "EvaluacionMaestro.findByHorarioLimpiezaHOrnato", query = "SELECT e FROM EvaluacionMaestro e WHERE e.horarioLimpiezaHOrnato = :horarioLimpiezaHOrnato"),
    @NamedQuery(name = "EvaluacionMaestro.findByValores", query = "SELECT e FROM EvaluacionMaestro e WHERE e.valores = :valores"),
    @NamedQuery(name = "EvaluacionMaestro.findByAsistencia", query = "SELECT e FROM EvaluacionMaestro e WHERE e.asistencia = :asistencia"),
    @NamedQuery(name = "EvaluacionMaestro.findByRevisaTareas", query = "SELECT e FROM EvaluacionMaestro e WHERE e.revisaTareas = :revisaTareas"),
    @NamedQuery(name = "EvaluacionMaestro.findByRepasoClaseAnterior", query = "SELECT e FROM EvaluacionMaestro e WHERE e.repasoClaseAnterior = :repasoClaseAnterior"),
    @NamedQuery(name = "EvaluacionMaestro.findByOrganizaClase", query = "SELECT e FROM EvaluacionMaestro e WHERE e.organizaClase = :organizaClase"),
    @NamedQuery(name = "EvaluacionMaestro.findByAmbienteAdecuado", query = "SELECT e FROM EvaluacionMaestro e WHERE e.ambienteAdecuado = :ambienteAdecuado"),
    @NamedQuery(name = "EvaluacionMaestro.findByUsaGuiaClase", query = "SELECT e FROM EvaluacionMaestro e WHERE e.usaGuiaClase = :usaGuiaClase"),
    @NamedQuery(name = "EvaluacionMaestro.findByPresentaAgenda", query = "SELECT e FROM EvaluacionMaestro e WHERE e.presentaAgenda = :presentaAgenda"),
    @NamedQuery(name = "EvaluacionMaestro.findByPresentaObjetivo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.presentaObjetivo = :presentaObjetivo"),
    @NamedQuery(name = "EvaluacionMaestro.findByPresentaContenido", query = "SELECT e FROM EvaluacionMaestro e WHERE e.presentaContenido = :presentaContenido"),
    @NamedQuery(name = "EvaluacionMaestro.findByIdeasClaras", query = "SELECT e FROM EvaluacionMaestro e WHERE e.ideasClaras = :ideasClaras"),
    @NamedQuery(name = "EvaluacionMaestro.findByClaseCentradaDocente", query = "SELECT e FROM EvaluacionMaestro e WHERE e.claseCentradaDocente = :claseCentradaDocente"),
    @NamedQuery(name = "EvaluacionMaestro.findByParticipanAlumnos", query = "SELECT e FROM EvaluacionMaestro e WHERE e.participanAlumnos = :participanAlumnos"),
    @NamedQuery(name = "EvaluacionMaestro.findByRecursosDidacticos", query = "SELECT e FROM EvaluacionMaestro e WHERE e.recursosDidacticos = :recursosDidacticos"),
    @NamedQuery(name = "EvaluacionMaestro.findByEspecialidadPractica", query = "SELECT e FROM EvaluacionMaestro e WHERE e.especialidadPractica = :especialidadPractica"),
    @NamedQuery(name = "EvaluacionMaestro.findByDisciplinaDigna", query = "SELECT e FROM EvaluacionMaestro e WHERE e.disciplinaDigna = :disciplinaDigna"),
    @NamedQuery(name = "EvaluacionMaestro.findByLlamarEstudianteNombre", query = "SELECT e FROM EvaluacionMaestro e WHERE e.llamarEstudianteNombre = :llamarEstudianteNombre"),
    @NamedQuery(name = "EvaluacionMaestro.findByDespazaSalon", query = "SELECT e FROM EvaluacionMaestro e WHERE e.despazaSalon = :despazaSalon"),
    @NamedQuery(name = "EvaluacionMaestro.findByPreguntaEstudiantes", query = "SELECT e FROM EvaluacionMaestro e WHERE e.preguntaEstudiantes = :preguntaEstudiantes"),
    @NamedQuery(name = "EvaluacionMaestro.findByAprovechaTiempo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.aprovechaTiempo = :aprovechaTiempo"),
    @NamedQuery(name = "EvaluacionMaestro.findByVerificaComprensionContenido", query = "SELECT e FROM EvaluacionMaestro e WHERE e.verificaComprensionContenido = :verificaComprensionContenido"),
    @NamedQuery(name = "EvaluacionMaestro.findByTratoIgualitario", query = "SELECT e FROM EvaluacionMaestro e WHERE e.tratoIgualitario = :tratoIgualitario"),
    @NamedQuery(name = "EvaluacionMaestro.findByTrabajosGrupos", query = "SELECT e FROM EvaluacionMaestro e WHERE e.trabajosGrupos = :trabajosGrupos"),
    @NamedQuery(name = "EvaluacionMaestro.findByTecnicasAdecuadas", query = "SELECT e FROM EvaluacionMaestro e WHERE e.tecnicasAdecuadas = :tecnicasAdecuadas"),
    @NamedQuery(name = "EvaluacionMaestro.findByAprendizajeCreativo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.aprendizajeCreativo = :aprendizajeCreativo"),
    @NamedQuery(name = "EvaluacionMaestro.findByDiferenciasIndividuaes", query = "SELECT e FROM EvaluacionMaestro e WHERE e.diferenciasIndividuaes = :diferenciasIndividuaes"),
    @NamedQuery(name = "EvaluacionMaestro.findBySoloLibro", query = "SELECT e FROM EvaluacionMaestro e WHERE e.soloLibro = :soloLibro"),
    @NamedQuery(name = "EvaluacionMaestro.findByListaCotejo", query = "SELECT e FROM EvaluacionMaestro e WHERE e.listaCotejo = :listaCotejo"),
    @NamedQuery(name = "EvaluacionMaestro.findByCopiaPizarron", query = "SELECT e FROM EvaluacionMaestro e WHERE e.copiaPizarron = :copiaPizarron"),
    @NamedQuery(name = "EvaluacionMaestro.findByEjerciciosPizarron", query = "SELECT e FROM EvaluacionMaestro e WHERE e.ejerciciosPizarron = :ejerciciosPizarron"),
    @NamedQuery(name = "EvaluacionMaestro.findByDominaContenido", query = "SELECT e FROM EvaluacionMaestro e WHERE e.dominaContenido = :dominaContenido"),
    @NamedQuery(name = "EvaluacionMaestro.findByMetodoDefinido", query = "SELECT e FROM EvaluacionMaestro e WHERE e.metodoDefinido = :metodoDefinido"),
    @NamedQuery(name = "EvaluacionMaestro.findByDesarrollaEjezTransv", query = "SELECT e FROM EvaluacionMaestro e WHERE e.desarrollaEjezTransv = :desarrollaEjezTransv"),
    @NamedQuery(name = "EvaluacionMaestro.findByPorcentajesEvaluacion", query = "SELECT e FROM EvaluacionMaestro e WHERE e.porcentajesEvaluacion = :porcentajesEvaluacion"),
    @NamedQuery(name = "EvaluacionMaestro.findByAsignaTareas", query = "SELECT e FROM EvaluacionMaestro e WHERE e.asignaTareas = :asignaTareas"),
    @NamedQuery(name = "EvaluacionMaestro.findByFuentesConsulta", query = "SELECT e FROM EvaluacionMaestro e WHERE e.fuentesConsulta = :fuentesConsulta"),
    @NamedQuery(name = "EvaluacionMaestro.findByClaridadEvaluacion", query = "SELECT e FROM EvaluacionMaestro e WHERE e.claridadEvaluacion = :claridadEvaluacion"),
    @NamedQuery(name = "EvaluacionMaestro.findByRefuerzoContenido", query = "SELECT e FROM EvaluacionMaestro e WHERE e.refuerzoContenido = :refuerzoContenido"),
    @NamedQuery(name = "EvaluacionMaestro.findByAclaraDudas", query = "SELECT e FROM EvaluacionMaestro e WHERE e.aclaraDudas = :aclaraDudas"),
    @NamedQuery(name = "EvaluacionMaestro.findByClasePlanificada", query = "SELECT e FROM EvaluacionMaestro e WHERE e.clasePlanificada = :clasePlanificada")})
public class EvaluacionMaestro implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "jornalizaci\u00c3\u00b3n")
    private boolean jornalizaciÃn;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EvaluacionMaestroPK evaluacionMaestroPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "turno")
    private String turno;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Estudiantes")
    private int estudiantes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaInicio")
    @Temporal(TemporalType.TIME)
    private Date horaInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horaFin")
    @Temporal(TemporalType.TIME)
    private Date horaFin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "unidad")
    private String unidad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "objetivo")
    private String objetivo;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "actitudicionales")
    private String actitudicionales;
    @Size(max = 250)
    @Column(name = "resumen")
    private String resumen;
    @Size(max = 145)
    @Column(name = "propuestaMejora")
    private String propuestaMejora;
    @Size(max = 145)
    @Column(name = "evaluacionMaestroComentario")
    private String evaluacionMaestroComentario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "planGrado")
    private boolean planGrado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "jornalizaci\u00f3n")
    private boolean jornalización;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cartaDidactica")
    private boolean cartaDidactica;
    @Basic(optional = false)
    @NotNull
    @Column(name = "guionClase")
    private boolean guionClase;
    @Basic(optional = false)
    @NotNull
    @Column(name = "agendaDiaria")
    private boolean agendaDiaria;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ColocaObjetivo")
    private boolean colocaObjetivo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ambientacion")
    private boolean ambientacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "puntual")
    private boolean puntual;
    @Basic(optional = false)
    @NotNull
    @Column(name = "comites")
    private boolean comites;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ejesTransversales")
    private boolean ejesTransversales;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horarioLimpiezaHOrnato")
    private boolean horarioLimpiezaHOrnato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valores")
    private boolean valores;
    @Basic(optional = false)
    @NotNull
    @Column(name = "asistencia")
    private boolean asistencia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "revisaTareas")
    private boolean revisaTareas;
    @Basic(optional = false)
    @NotNull
    @Column(name = "repasoClaseAnterior")
    private boolean repasoClaseAnterior;
    @Basic(optional = false)
    @NotNull
    @Column(name = "organizaClase")
    private boolean organizaClase;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ambienteAdecuado")
    private boolean ambienteAdecuado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "usaGuiaClase")
    private boolean usaGuiaClase;
    @Basic(optional = false)
    @NotNull
    @Column(name = "presentaAgenda")
    private boolean presentaAgenda;
    @Basic(optional = false)
    @NotNull
    @Column(name = "presentaObjetivo")
    private boolean presentaObjetivo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "presentaContenido")
    private boolean presentaContenido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ideasClaras")
    private boolean ideasClaras;
    @Basic(optional = false)
    @NotNull
    @Column(name = "claseCentradaDocente")
    private boolean claseCentradaDocente;
    @Basic(optional = false)
    @NotNull
    @Column(name = "participanAlumnos")
    private boolean participanAlumnos;
    @Basic(optional = false)
    @NotNull
    @Column(name = "recursosDidacticos")
    private boolean recursosDidacticos;
    @Basic(optional = false)
    @NotNull
    @Column(name = "especialidadPractica")
    private boolean especialidadPractica;
    @Basic(optional = false)
    @NotNull
    @Column(name = "disciplinaDigna")
    private boolean disciplinaDigna;
    @Basic(optional = false)
    @NotNull
    @Column(name = "llamarEstudianteNombre")
    private boolean llamarEstudianteNombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "despazaSalon")
    private boolean despazaSalon;
    @Basic(optional = false)
    @NotNull
    @Column(name = "preguntaEstudiantes")
    private boolean preguntaEstudiantes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "aprovechaTiempo")
    private boolean aprovechaTiempo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "verificaComprensionContenido")
    private boolean verificaComprensionContenido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tratoIgualitario")
    private boolean tratoIgualitario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "trabajosGrupos")
    private boolean trabajosGrupos;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tecnicasAdecuadas")
    private boolean tecnicasAdecuadas;
    @Basic(optional = false)
    @NotNull
    @Column(name = "aprendizajeCreativo")
    private boolean aprendizajeCreativo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "diferenciasIndividuaes")
    private boolean diferenciasIndividuaes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "soloLibro")
    private boolean soloLibro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "listaCotejo")
    private boolean listaCotejo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "copiaPizarron")
    private boolean copiaPizarron;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ejerciciosPizarron")
    private boolean ejerciciosPizarron;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dominaContenido")
    private boolean dominaContenido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "metodoDefinido")
    private boolean metodoDefinido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "desarrollaEjezTransv")
    private boolean desarrollaEjezTransv;
    @Basic(optional = false)
    @NotNull
    @Column(name = "porcentajesEvaluacion")
    private boolean porcentajesEvaluacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "asignaTareas")
    private boolean asignaTareas;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fuentesConsulta")
    private boolean fuentesConsulta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "claridadEvaluacion")
    private boolean claridadEvaluacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "refuerzoContenido")
    private boolean refuerzoContenido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "aclaraDudas")
    private boolean aclaraDudas;
    @Basic(optional = false)
    @NotNull
    @Column(name = "clasePlanificada")
    private boolean clasePlanificada;
    @JoinColumn(name = "idMaestro", referencedColumnName = "idmaestro", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Maestro maestro;
    @JoinColumns({
        @JoinColumn(name = "grado", referencedColumnName = "idgrado"),
        @JoinColumn(name = "seccion", referencedColumnName = "gradoSeccion"),
        @JoinColumn(name = "a\u00f1o", referencedColumnName = "gradoA\u00f1o"),
        @JoinColumn(name = "gradoModalidad", referencedColumnName = "gradoModalidad")})
    @ManyToOne(optional = false)
    private Grado grado;
    @JoinColumn(name = "evaluador", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona evaluador;
    @JoinColumn(name = "materia", referencedColumnName = "idmateria")
    @ManyToOne(optional = false)
    private Materia materia;

    public EvaluacionMaestro() {
    }

    public EvaluacionMaestro(EvaluacionMaestroPK evaluacionMaestroPK) {
        this.evaluacionMaestroPK = evaluacionMaestroPK;
    }

    public EvaluacionMaestro(EvaluacionMaestroPK evaluacionMaestroPK, String turno, int estudiantes, Date horaInicio, Date horaFin, String unidad, String objetivo, String actitudicionales, boolean planGrado, boolean jornalización, boolean cartaDidactica, boolean guionClase, boolean agendaDiaria, boolean colocaObjetivo, boolean ambientacion, boolean puntual, boolean comites, boolean ejesTransversales, boolean horarioLimpiezaHOrnato, boolean valores, boolean asistencia, boolean revisaTareas, boolean repasoClaseAnterior, boolean organizaClase, boolean ambienteAdecuado, boolean usaGuiaClase, boolean presentaAgenda, boolean presentaObjetivo, boolean presentaContenido, boolean ideasClaras, boolean claseCentradaDocente, boolean participanAlumnos, boolean recursosDidacticos, boolean especialidadPractica, boolean disciplinaDigna, boolean llamarEstudianteNombre, boolean despazaSalon, boolean preguntaEstudiantes, boolean aprovechaTiempo, boolean verificaComprensionContenido, boolean tratoIgualitario, boolean trabajosGrupos, boolean tecnicasAdecuadas, boolean aprendizajeCreativo, boolean diferenciasIndividuaes, boolean soloLibro, boolean listaCotejo, boolean copiaPizarron, boolean ejerciciosPizarron, boolean dominaContenido, boolean metodoDefinido, boolean desarrollaEjezTransv, boolean porcentajesEvaluacion, boolean asignaTareas, boolean fuentesConsulta, boolean claridadEvaluacion, boolean refuerzoContenido, boolean aclaraDudas, boolean clasePlanificada) {
        this.evaluacionMaestroPK = evaluacionMaestroPK;
        this.turno = turno;
        this.estudiantes = estudiantes;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.unidad = unidad;
        this.objetivo = objetivo;
        this.actitudicionales = actitudicionales;
        this.planGrado = planGrado;
        this.jornalización = jornalización;
        this.cartaDidactica = cartaDidactica;
        this.guionClase = guionClase;
        this.agendaDiaria = agendaDiaria;
        this.colocaObjetivo = colocaObjetivo;
        this.ambientacion = ambientacion;
        this.puntual = puntual;
        this.comites = comites;
        this.ejesTransversales = ejesTransversales;
        this.horarioLimpiezaHOrnato = horarioLimpiezaHOrnato;
        this.valores = valores;
        this.asistencia = asistencia;
        this.revisaTareas = revisaTareas;
        this.repasoClaseAnterior = repasoClaseAnterior;
        this.organizaClase = organizaClase;
        this.ambienteAdecuado = ambienteAdecuado;
        this.usaGuiaClase = usaGuiaClase;
        this.presentaAgenda = presentaAgenda;
        this.presentaObjetivo = presentaObjetivo;
        this.presentaContenido = presentaContenido;
        this.ideasClaras = ideasClaras;
        this.claseCentradaDocente = claseCentradaDocente;
        this.participanAlumnos = participanAlumnos;
        this.recursosDidacticos = recursosDidacticos;
        this.especialidadPractica = especialidadPractica;
        this.disciplinaDigna = disciplinaDigna;
        this.llamarEstudianteNombre = llamarEstudianteNombre;
        this.despazaSalon = despazaSalon;
        this.preguntaEstudiantes = preguntaEstudiantes;
        this.aprovechaTiempo = aprovechaTiempo;
        this.verificaComprensionContenido = verificaComprensionContenido;
        this.tratoIgualitario = tratoIgualitario;
        this.trabajosGrupos = trabajosGrupos;
        this.tecnicasAdecuadas = tecnicasAdecuadas;
        this.aprendizajeCreativo = aprendizajeCreativo;
        this.diferenciasIndividuaes = diferenciasIndividuaes;
        this.soloLibro = soloLibro;
        this.listaCotejo = listaCotejo;
        this.copiaPizarron = copiaPizarron;
        this.ejerciciosPizarron = ejerciciosPizarron;
        this.dominaContenido = dominaContenido;
        this.metodoDefinido = metodoDefinido;
        this.desarrollaEjezTransv = desarrollaEjezTransv;
        this.porcentajesEvaluacion = porcentajesEvaluacion;
        this.asignaTareas = asignaTareas;
        this.fuentesConsulta = fuentesConsulta;
        this.claridadEvaluacion = claridadEvaluacion;
        this.refuerzoContenido = refuerzoContenido;
        this.aclaraDudas = aclaraDudas;
        this.clasePlanificada = clasePlanificada;
    }

    public EvaluacionMaestro(int idMaestro, Date fechaHora) {
        this.evaluacionMaestroPK = new EvaluacionMaestroPK(idMaestro, fechaHora);
    }

    public EvaluacionMaestroPK getEvaluacionMaestroPK() {
        return evaluacionMaestroPK;
    }

    public void setEvaluacionMaestroPK(EvaluacionMaestroPK evaluacionMaestroPK) {
        this.evaluacionMaestroPK = evaluacionMaestroPK;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public int getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(int estudiantes) {
        this.estudiantes = estudiantes;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getActitudicionales() {
        return actitudicionales;
    }

    public void setActitudicionales(String actitudicionales) {
        this.actitudicionales = actitudicionales;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getPropuestaMejora() {
        return propuestaMejora;
    }

    public void setPropuestaMejora(String propuestaMejora) {
        this.propuestaMejora = propuestaMejora;
    }

    public String getEvaluacionMaestroComentario() {
        return evaluacionMaestroComentario;
    }

    public void setEvaluacionMaestroComentario(String evaluacionMaestroComentario) {
        this.evaluacionMaestroComentario = evaluacionMaestroComentario;
    }

    public boolean getPlanGrado() {
        return planGrado;
    }

    public void setPlanGrado(boolean planGrado) {
        this.planGrado = planGrado;
    }

    public boolean getJornalización() {
        return jornalización;
    }

    public void setJornalización(boolean jornalización) {
        this.jornalización = jornalización;
    }

    public boolean getCartaDidactica() {
        return cartaDidactica;
    }

    public void setCartaDidactica(boolean cartaDidactica) {
        this.cartaDidactica = cartaDidactica;
    }

    public boolean getGuionClase() {
        return guionClase;
    }

    public void setGuionClase(boolean guionClase) {
        this.guionClase = guionClase;
    }

    public boolean getAgendaDiaria() {
        return agendaDiaria;
    }

    public void setAgendaDiaria(boolean agendaDiaria) {
        this.agendaDiaria = agendaDiaria;
    }

    public boolean getColocaObjetivo() {
        return colocaObjetivo;
    }

    public void setColocaObjetivo(boolean colocaObjetivo) {
        this.colocaObjetivo = colocaObjetivo;
    }

    public boolean getAmbientacion() {
        return ambientacion;
    }

    public void setAmbientacion(boolean ambientacion) {
        this.ambientacion = ambientacion;
    }

    public boolean getPuntual() {
        return puntual;
    }

    public void setPuntual(boolean puntual) {
        this.puntual = puntual;
    }

    public boolean getComites() {
        return comites;
    }

    public void setComites(boolean comites) {
        this.comites = comites;
    }

    public boolean getEjesTransversales() {
        return ejesTransversales;
    }

    public void setEjesTransversales(boolean ejesTransversales) {
        this.ejesTransversales = ejesTransversales;
    }

    public boolean getHorarioLimpiezaHOrnato() {
        return horarioLimpiezaHOrnato;
    }

    public void setHorarioLimpiezaHOrnato(boolean horarioLimpiezaHOrnato) {
        this.horarioLimpiezaHOrnato = horarioLimpiezaHOrnato;
    }

    public boolean getValores() {
        return valores;
    }

    public void setValores(boolean valores) {
        this.valores = valores;
    }

    public boolean getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(boolean asistencia) {
        this.asistencia = asistencia;
    }

    public boolean getRevisaTareas() {
        return revisaTareas;
    }

    public void setRevisaTareas(boolean revisaTareas) {
        this.revisaTareas = revisaTareas;
    }

    public boolean getRepasoClaseAnterior() {
        return repasoClaseAnterior;
    }

    public void setRepasoClaseAnterior(boolean repasoClaseAnterior) {
        this.repasoClaseAnterior = repasoClaseAnterior;
    }

    public boolean getOrganizaClase() {
        return organizaClase;
    }

    public void setOrganizaClase(boolean organizaClase) {
        this.organizaClase = organizaClase;
    }

    public boolean getAmbienteAdecuado() {
        return ambienteAdecuado;
    }

    public void setAmbienteAdecuado(boolean ambienteAdecuado) {
        this.ambienteAdecuado = ambienteAdecuado;
    }

    public boolean getUsaGuiaClase() {
        return usaGuiaClase;
    }

    public void setUsaGuiaClase(boolean usaGuiaClase) {
        this.usaGuiaClase = usaGuiaClase;
    }

    public boolean getPresentaAgenda() {
        return presentaAgenda;
    }

    public void setPresentaAgenda(boolean presentaAgenda) {
        this.presentaAgenda = presentaAgenda;
    }

    public boolean getPresentaObjetivo() {
        return presentaObjetivo;
    }

    public void setPresentaObjetivo(boolean presentaObjetivo) {
        this.presentaObjetivo = presentaObjetivo;
    }

    public boolean getPresentaContenido() {
        return presentaContenido;
    }

    public void setPresentaContenido(boolean presentaContenido) {
        this.presentaContenido = presentaContenido;
    }

    public boolean getIdeasClaras() {
        return ideasClaras;
    }

    public void setIdeasClaras(boolean ideasClaras) {
        this.ideasClaras = ideasClaras;
    }

    public boolean getClaseCentradaDocente() {
        return claseCentradaDocente;
    }

    public void setClaseCentradaDocente(boolean claseCentradaDocente) {
        this.claseCentradaDocente = claseCentradaDocente;
    }

    public boolean getParticipanAlumnos() {
        return participanAlumnos;
    }

    public void setParticipanAlumnos(boolean participanAlumnos) {
        this.participanAlumnos = participanAlumnos;
    }

    public boolean getRecursosDidacticos() {
        return recursosDidacticos;
    }

    public void setRecursosDidacticos(boolean recursosDidacticos) {
        this.recursosDidacticos = recursosDidacticos;
    }

    public boolean getEspecialidadPractica() {
        return especialidadPractica;
    }

    public void setEspecialidadPractica(boolean especialidadPractica) {
        this.especialidadPractica = especialidadPractica;
    }

    public boolean getDisciplinaDigna() {
        return disciplinaDigna;
    }

    public void setDisciplinaDigna(boolean disciplinaDigna) {
        this.disciplinaDigna = disciplinaDigna;
    }

    public boolean getLlamarEstudianteNombre() {
        return llamarEstudianteNombre;
    }

    public void setLlamarEstudianteNombre(boolean llamarEstudianteNombre) {
        this.llamarEstudianteNombre = llamarEstudianteNombre;
    }

    public boolean getDespazaSalon() {
        return despazaSalon;
    }

    public void setDespazaSalon(boolean despazaSalon) {
        this.despazaSalon = despazaSalon;
    }

    public boolean getPreguntaEstudiantes() {
        return preguntaEstudiantes;
    }

    public void setPreguntaEstudiantes(boolean preguntaEstudiantes) {
        this.preguntaEstudiantes = preguntaEstudiantes;
    }

    public boolean getAprovechaTiempo() {
        return aprovechaTiempo;
    }

    public void setAprovechaTiempo(boolean aprovechaTiempo) {
        this.aprovechaTiempo = aprovechaTiempo;
    }

    public boolean getVerificaComprensionContenido() {
        return verificaComprensionContenido;
    }

    public void setVerificaComprensionContenido(boolean verificaComprensionContenido) {
        this.verificaComprensionContenido = verificaComprensionContenido;
    }

    public boolean getTratoIgualitario() {
        return tratoIgualitario;
    }

    public void setTratoIgualitario(boolean tratoIgualitario) {
        this.tratoIgualitario = tratoIgualitario;
    }

    public boolean getTrabajosGrupos() {
        return trabajosGrupos;
    }

    public void setTrabajosGrupos(boolean trabajosGrupos) {
        this.trabajosGrupos = trabajosGrupos;
    }

    public boolean getTecnicasAdecuadas() {
        return tecnicasAdecuadas;
    }

    public void setTecnicasAdecuadas(boolean tecnicasAdecuadas) {
        this.tecnicasAdecuadas = tecnicasAdecuadas;
    }

    public boolean getAprendizajeCreativo() {
        return aprendizajeCreativo;
    }

    public void setAprendizajeCreativo(boolean aprendizajeCreativo) {
        this.aprendizajeCreativo = aprendizajeCreativo;
    }

    public boolean getDiferenciasIndividuaes() {
        return diferenciasIndividuaes;
    }

    public void setDiferenciasIndividuaes(boolean diferenciasIndividuaes) {
        this.diferenciasIndividuaes = diferenciasIndividuaes;
    }

    public boolean getSoloLibro() {
        return soloLibro;
    }

    public void setSoloLibro(boolean soloLibro) {
        this.soloLibro = soloLibro;
    }

    public boolean getListaCotejo() {
        return listaCotejo;
    }

    public void setListaCotejo(boolean listaCotejo) {
        this.listaCotejo = listaCotejo;
    }

    public boolean getCopiaPizarron() {
        return copiaPizarron;
    }

    public void setCopiaPizarron(boolean copiaPizarron) {
        this.copiaPizarron = copiaPizarron;
    }

    public boolean getEjerciciosPizarron() {
        return ejerciciosPizarron;
    }

    public void setEjerciciosPizarron(boolean ejerciciosPizarron) {
        this.ejerciciosPizarron = ejerciciosPizarron;
    }

    public boolean getDominaContenido() {
        return dominaContenido;
    }

    public void setDominaContenido(boolean dominaContenido) {
        this.dominaContenido = dominaContenido;
    }

    public boolean getMetodoDefinido() {
        return metodoDefinido;
    }

    public void setMetodoDefinido(boolean metodoDefinido) {
        this.metodoDefinido = metodoDefinido;
    }

    public boolean getDesarrollaEjezTransv() {
        return desarrollaEjezTransv;
    }

    public void setDesarrollaEjezTransv(boolean desarrollaEjezTransv) {
        this.desarrollaEjezTransv = desarrollaEjezTransv;
    }

    public boolean getPorcentajesEvaluacion() {
        return porcentajesEvaluacion;
    }

    public void setPorcentajesEvaluacion(boolean porcentajesEvaluacion) {
        this.porcentajesEvaluacion = porcentajesEvaluacion;
    }

    public boolean getAsignaTareas() {
        return asignaTareas;
    }

    public void setAsignaTareas(boolean asignaTareas) {
        this.asignaTareas = asignaTareas;
    }

    public boolean getFuentesConsulta() {
        return fuentesConsulta;
    }

    public void setFuentesConsulta(boolean fuentesConsulta) {
        this.fuentesConsulta = fuentesConsulta;
    }

    public boolean getClaridadEvaluacion() {
        return claridadEvaluacion;
    }

    public void setClaridadEvaluacion(boolean claridadEvaluacion) {
        this.claridadEvaluacion = claridadEvaluacion;
    }

    public boolean getRefuerzoContenido() {
        return refuerzoContenido;
    }

    public void setRefuerzoContenido(boolean refuerzoContenido) {
        this.refuerzoContenido = refuerzoContenido;
    }

    public boolean getAclaraDudas() {
        return aclaraDudas;
    }

    public void setAclaraDudas(boolean aclaraDudas) {
        this.aclaraDudas = aclaraDudas;
    }

    public boolean getClasePlanificada() {
        return clasePlanificada;
    }

    public void setClasePlanificada(boolean clasePlanificada) {
        this.clasePlanificada = clasePlanificada;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    public Grado getGrado() {
        return grado;
    }

    public void setGrado(Grado grado) {
        this.grado = grado;
    }

    public Persona getEvaluador() {
        return evaluador;
    }

    public void setEvaluador(Persona evaluador) {
        this.evaluador = evaluador;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (evaluacionMaestroPK != null ? evaluacionMaestroPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvaluacionMaestro)) {
            return false;
        }
        EvaluacionMaestro other = (EvaluacionMaestro) object;
        if ((this.evaluacionMaestroPK == null && other.evaluacionMaestroPK != null) || (this.evaluacionMaestroPK != null && !this.evaluacionMaestroPK.equals(other.evaluacionMaestroPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "net.delsas.saitae.entities.EvaluacionMaestro[ evaluacionMaestroPK=" + evaluacionMaestroPK + " ]";
    }

    public boolean getJornalizaciÃn() {
        return jornalizaciÃn;
    }

    public void setJornalizaciÃn(boolean jornalizaciÃn) {
        this.jornalizaciÃn = jornalizaciÃn;
    }
    
}
