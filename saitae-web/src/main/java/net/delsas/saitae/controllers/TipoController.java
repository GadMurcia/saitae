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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import net.delsas.saitae.ax.mensaje;
import net.delsas.saitae.ax.Auxiliar;
import net.delsas.saitae.beans.AccesoFacadeLocal;
import net.delsas.saitae.beans.AccesoTipoPersonaFacadeLocal;
import net.delsas.saitae.beans.AulaFacadeLocal;
import net.delsas.saitae.beans.AutorFacadeLocal;
import net.delsas.saitae.beans.CargoFacadeLocal;
import net.delsas.saitae.beans.CategoriaFacadeLocal;
import net.delsas.saitae.beans.DiasEstudioFacadeLocal;
import net.delsas.saitae.beans.EditorialFacadeLocal;
import net.delsas.saitae.beans.FinanciamientoFacadeLocal;
import net.delsas.saitae.beans.GradoFacadeLocal;
import net.delsas.saitae.beans.HorarioFacadeLocal;
import net.delsas.saitae.beans.MaestroFacadeLocal;
import net.delsas.saitae.beans.MateriaFacadeLocal;
import net.delsas.saitae.beans.NotificacionesFacadeLocal;
import net.delsas.saitae.beans.PaisFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;
import net.delsas.saitae.beans.TipoCargoFacadeLocal;
import net.delsas.saitae.beans.TipoEspecialidadesFacadeLocal;
import net.delsas.saitae.beans.TipoMateriaFacadeLocal;
import net.delsas.saitae.beans.TipoNombramientoFacadeLocal;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipoProyectoFacadeLocal;
import net.delsas.saitae.beans.TipoRecursoFacadeLocal;
import net.delsas.saitae.beans.TipoReservaFacadeLocal;
import net.delsas.saitae.beans.TipoSueldosFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.beans.ZonaFacadeLocal;
import net.delsas.saitae.entities.Aula;
import net.delsas.saitae.entities.Autor;
import net.delsas.saitae.entities.Cargo;
import net.delsas.saitae.entities.Categoria;
import net.delsas.saitae.entities.DiasEstudio;
import net.delsas.saitae.entities.Editorial;
import net.delsas.saitae.entities.Financiamiento;
import net.delsas.saitae.entities.Grado;
import net.delsas.saitae.entities.GradoPK;
import net.delsas.saitae.entities.Horario;
import net.delsas.saitae.entities.Maestro;
import net.delsas.saitae.entities.Materia;
import net.delsas.saitae.entities.Pais;
import net.delsas.saitae.entities.Persona;
import net.delsas.saitae.entities.TipoCargo;
import net.delsas.saitae.entities.TipoEspecialidades;
import net.delsas.saitae.entities.TipoMateria;
import net.delsas.saitae.entities.TipoNombramiento;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipoProyecto;
import net.delsas.saitae.entities.TipoRecurso;
import net.delsas.saitae.entities.TipoReserva;
import net.delsas.saitae.entities.TipoSueldos;
import net.delsas.saitae.entities.TipopersonaPermiso;
import net.delsas.saitae.entities.Zona;
import org.omnifaces.cdi.Push;
import org.omnifaces.cdi.PushContext;
import org.primefaces.PrimeFaces;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.DualListModel;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class TipoController extends Auxiliar implements Serializable {

    private static final long serialVersionUID = 1L;
    //Tipo Recurso
    private List<TipoRecurso> recursos;
    @EJB
    private TipoRecursoFacadeLocal tipoRecursoFL;

    //Tipo Permiso
    @EJB
    private TipoPermisoFacadeLocal tpfl;
    private List<TipoPermiso> all;

    //Tipo Cargo
    private List<TipoCargo> cargos;
    @EJB
    private TipoCargoFacadeLocal tipoCargoFL;

    //Tipo Persona
    @EJB
    private TipopersonaPermisoFacadeLocal tppfl;
    @EJB
    private TipoPermisoFacadeLocal permisoFL;
    @EJB
    private TipoPersonaFacadeLocal personaFL;
    @EJB
    private PersonaFacadeLocal pFL;
    private List<TipoPersona> Personas;
    private TipoPersona tipoPersona;
    private DualListModel<String> model;

    //Tipo Zona
    @EJB
    private ZonaFacadeLocal zfl;
    private List<Zona> zonas;

    //Tipo Reserva
    @EJB
    private TipoReservaFacadeLocal tipoReservaFL;
    private List<TipoReserva> reservas;

    //Tipo Nombramiento
    @EJB
    private TipoNombramientoFacadeLocal tipoNombramientoFL;
    private List<TipoNombramiento> nombramientos;

    //TipoMateria
    @EJB
    private TipoMateriaFacadeLocal tipoMateriaFL;
    private List<TipoMateria> tipoMaterias;

    //Materia
    @EJB
    private MateriaFacadeLocal materiaFL;
    private List<Materia> materias;

    //Aulas
    @EJB
    private AulaFacadeLocal afl;
    private List<Aula> aulas;

    //Autor
    @EJB
    private AutorFacadeLocal autorFL;
    private List<Autor> autor;

    //Cargo
    @EJB
    private CargoFacadeLocal cargoFL;
    private List<Cargo> cargo;

    //Categoria
    @EJB
    private CategoriaFacadeLocal categoriaFL;
    private List<Categoria> categoria;

    //Editorial
    @EJB
    private EditorialFacadeLocal editorialFL;
    private List<Editorial> editorial;

    //Horario
    @EJB
    private HorarioFacadeLocal horarioFL;
    private List<Horario> horario;
    private Horario hora;

    //Fiannciamiento
    @EJB
    private FinanciamientoFacadeLocal financiamientoFL;
    private List<Financiamiento> financiamientos;

    //Grado
    @EJB
    private GradoFacadeLocal gradoFL;
    private List<Grado> grados;
    private Integer añoSelected;
    private List<Integer> añosDisponibles;
    @EJB
    private MaestroFacadeLocal maestroFL;

    //diasEstudio
    @EJB
    private DiasEstudioFacadeLocal diasEstudioFL;
    private List<DiasEstudio> dias;
    private List<DiasEstudio> diasSeleccionables;
    private DiasEstudio diasSelected;

    //TipoDeEspecialidades
    @EJB
    private TipoEspecialidadesFacadeLocal tipoeFL;
    private List<TipoEspecialidades> tipoE;

    //tipoDeSueldos
    @EJB
    private TipoSueldosFacadeLocal tiposFL;
    private List<TipoSueldos> tipoS;

    //tipoProyectos
    @EJB
    private TipoProyectoFacadeLocal tipoProyectoFL;
    private List<TipoProyecto> tipopp;

    //paises
    @EJB
    private PaisFacadeLocal paisFL;
    private List<Pais> paises;

    //controlde usuarios    
    private FacesContext context;
    private Persona usuario;
    @EJB
    private AccesoTipoPersonaFacadeLocal accesoTPFL;
    @EJB
    private AccesoFacadeLocal accesoFL;
    @Inject
    @Push
    private PushContext notificacion;
    @EJB
    private NotificacionesFacadeLocal notiFL;
    String pagina;

    @PostConstruct
    public void init() {
        context = FacesContext.getCurrentInstance();
        usuario = (Persona) context.getExternalContext().getSessionMap().get("usuario");
        pagina = context.getExternalContext().getRequestServletPath().split("/")[2];
        controlUsuarios();
    }

    public void controlUsuarios() {
        try {
            if (!(permitirAcceso(usuario, accesoTPFL.findTipoPersonaPermitidos(accesoFL.getAccesoByUrl(pagina)), pFL))) {
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("mensaje",
                        new FacesMessage(FacesMessage.SEVERITY_WARN, "Página prohibida",
                                "Usted no tiene los permisos suficientes para ver y utilizar esa página."));
                FacesContext.getCurrentInstance().getExternalContext().redirect("./../");
            }
            variables();
        } catch (Exception ex) {
            FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error Inesperado",
                            ex.getMessage() == null ? "Error de causa desconocida." : ex.getMessage()));
        }

    }

    private void variables() {
        switch (pagina) {
            case "tipopp.intex":
                aulas = afl.findAll();
                cargo = cargoFL.findAll();
                zonas = zfl.findAll();
                nombramientos = tipoNombramientoFL.findAll();
                financiamientos = financiamientoFL.findAll();
                Personas = new ArrayList<>();
                personaFL.findAll().stream().filter(tp -> !tp.getIdtipoPersona().equals(1)).forEach(Personas::add);
                tipoS = tiposFL.findAll();
                tipoE = tipoeFL.findAll();
                break;
            case "lictp.intex":
                model = new DualListModel<>(new ArrayList<>(), new ArrayList<>());
                tipoPersona = new TipoPersona(0);
                Personas = new ArrayList<>();
                personaFL.findAll().stream().filter(tp -> !tp.getIdtipoPersona().equals(1)).forEach(Personas::add);
                all = tpfl.findAll();
                break;
            case "academico.intex":
                tipoMaterias = tipoMateriaFL.findAll();
                materias = materiaFL.findAll();
                horario = horarioFL.findAll();
                añoSelected = getAño();
                añosDisponibles = gradoFL.findAños();
                grados = gradoFL.findByGradoAño(añoSelected);
                hora = new Horario(0, new Date(), new Date());
                aulas = afl.findAll();
                dias = diasEstudioFL.findAll();
                diasSelected = new DiasEstudio(0, "");
                diasSeleccionables = new ArrayList<>();
                diasSeleccionables.add(new DiasEstudio(1, "Lunes"));
                diasSeleccionables.add(new DiasEstudio(2, "Martes"));
                diasSeleccionables.add(new DiasEstudio(3, "Miércoles"));
                diasSeleccionables.add(new DiasEstudio(4, "Jueves"));
                diasSeleccionables.add(new DiasEstudio(5, "Viernes"));
                diasSeleccionables.add(new DiasEstudio(6, "Sábado"));
                diasSeleccionables.add(new DiasEstudio(7, "Domingo"));
                editarDia = 0;
                break;
            case "inventario.intex":
                tipopp = tipoProyectoFL.findAll();
                recursos = tipoRecursoFL.findAll();
                reservas = tipoReservaFL.findAll();
                break;
            case "libros.intex":
                cargos = tipoCargoFL.findAll();
                autor = autorFL.findAll();
                categoria = categoriaFL.findAll();
                editorial = editorialFL.findAll();
                paises = paisFL.findAll();
                break;
        }
    }

    public void nuevoDias() {
        diasSelected = new DiasEstudio(0, "");
        editarDia = 0;
    }

    public void onRowSelected(SelectEvent event) {
        if (event.getObject() instanceof DiasEstudio) {
            setDiasSelected((DiasEstudio) event.getObject());
            this.editarDia = diasSelected.getIdDias();
        }
    }

    private Integer editarDia = 0;

    public void editarDias() {
        editarDia = diasSelected.getIdDias();
        PrimeFaces.current().ajax().update(":form:tw:dias", "f1");
    }

    public void eliminarDias() {
        try {
            if (diasSelected != null) {
                diasEstudioFL.remove(diasSelected);
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Eliminación exitosa.",
                        "La eliminación se llevo a cabo con éxito."));
                notificar(
                        new mensaje(
                                0,
                                usuario.getIdpersona(),
                                pagina.split(".intex")[0] + "<form¿¿¿tp¿¿" + usuario.getTipoPersona().getIdtipoPersona(),
                                new FacesMessage(
                                        FacesMessage.SEVERITY_INFO,
                                        "Se ha eliminado un día laboral", "El día que se ha eliminado es: "
                                        + diasSelected.getDiasEstudioNombre() + ". Eliminado por "
                                        + usuario.getPersonaNombre() + " " + usuario.getPersonaApellido())),
                        new Persona(0), notificacion);
            } else {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "No se encuentra la orden.",
                        "Al parecer no se seleccionó nada."));
            }
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL,
                    "No es posible proceder con la eliminación.",
                    "Seguramente ya había datos que dependían del día seleccionado."
                    + " Por lo que no es posible continuar con su eiminación."));
        }
        init();
        PrimeFaces.current().ajax().update(":form0:msgs", ":form:tw:dias", "f1");
    }

    public void guardarDias() {
        if (diasSelected != null) {
            if (editarDia > 0) {
                diasEstudioFL.remove(diasEstudioFL.find(editarDia));
            }
            diasEstudioFL.create(diasSelected);
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
                    "Agregación exitosa.",
                    "La agregación se llevó a cabo con éxito."));
            notificar(
                    new mensaje(
                            0,
                            usuario.getIdpersona(),
                            pagina.split(".intex")[0] + "<form¿¿¿tp¿¿" + usuario.getTipoPersona().getIdtipoPersona(),
                            new FacesMessage(
                                    FacesMessage.SEVERITY_INFO,
                                    "Se ha " + (editarDia > 0 ? "editado " : "agregado ")
                                    + "un día laboral", "El día que se ha "
                                    + (editarDia > 0 ? "editado " : "agregado ")
                                    + "es: " + diasSelected.getDiasEstudioNombre()
                                    + ". " + (editarDia > 0 ? "Editado " : "Agregado ")
                                    + "por " + usuario.getPersonaNombre() + " "
                                    + usuario.getPersonaApellido())),
                    new Persona(0), notificacion);
        }
        init();
        PrimeFaces.current().ajax().update(":form0", ":form:tw:dias", "f1");
    }

    public void onAddNew(String id) {
        // Add one new car to the table:
        switch (id) {
            case "recursos":
                TipoRecurso tr = new TipoRecurso(0);
                if (!recursos.contains(tr)) {
                    recursos.add(tr);
                }
                break;
            case "permiso":
                TipoPermiso tp = new TipoPermiso(0);
                if (!all.contains(tp)) {
                    all.add(tp);
                }
                break;
            case "cargo":
                TipoCargo tc = new TipoCargo(0);
                if (!cargos.contains(tc)) {
                    cargos.add(tc);
                }
                break;
            case "nombramiento":
                TipoNombramiento tn = new TipoNombramiento(0);
                if (!nombramientos.contains(tn)) {
                    nombramientos.add(tn);
                }
                break;
            case "zona":
                Zona z = new Zona(0);
                if (!zonas.contains(z)) {
                    zonas.add(z);
                }
                break;
            case "reserva":
                TipoReserva tre = new TipoReserva(0);
                if (!reservas.contains(tre)) {
                    reservas.add(tre);
                }
                break;
            case "tipomateria":
                TipoMateria tm = new TipoMateria(0);
                if (!tipoMaterias.contains(tm)) {
                    tipoMaterias.add(tm);
                }
                break;
            case "materia":
                Materia m = new Materia(0);
                m.setTipoMateria(new TipoMateria(0));
                if (!materias.contains(m)) {
                    materias.add(m);
                }
                break;
            case "aula":
                Aula a = new Aula(0);
                a.setZonaAula(new Zona(0));
                if (!aulas.contains(a)) {
                    aulas.add(a);
                }
                break;
            case "autor":
                Autor au = new Autor(0);
                if (!autor.contains(au)) {
                    autor.add(au);
                }
                break;
            case "cargo1":
                Cargo c = new Cargo(0);
                if (!cargo.contains(c)) {
                    cargo.add(c);
                }
                break;
            case "categoria":
                Categoria ca = new Categoria(-1);
                if (!categoria.contains(ca)) {
                    categoria.add(ca);
                }
                break;
            case "editorial":
                Editorial e = new Editorial(0);
                if (!editorial.contains(e)) {
                    editorial.add(e);
                }
                break;
            case "proyectos":
                TipoProyecto pp = new TipoProyecto(0);
                if (!tipopp.contains(pp)) {
                    tipopp.add(pp);
                }
                break;
            case "horario":
                Horario h = new Horario(0);
                if (!horario.contains(h)) {
                    horario.add(h);
                }
                break;
            case "financiamiento":
                Financiamiento f = new Financiamiento(0);
                if (!financiamientos.contains(f)) {
                    financiamientos.add(f);
                }
                break;
            case "especialidades":
                TipoEspecialidades te = new TipoEspecialidades(0);
                if (!tipoE.contains(te)) {
                    tipoE.add(te);
                }
                break;
            case "sueldos":
                TipoSueldos ts = new TipoSueldos(0);
                if (!tipoS.contains(ts)) {
                    tipoS.add(ts);
                }
                break;
            case "pais":
                Pais pa = new Pais(0);
                if (!paises.contains(pa)) {
                    paises.add(pa);
                }
                break;
            case "grado":
                Grado g = new Grado(new GradoPK(0, "", "",
                        Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()))), true);
                g.setAulaGrado(new Aula(0));
                g.getAulaGrado().setZonaAula(new Zona(0, ""));
                g.setGradoMaestroGuia(new Auxiliar().getMaestro().getMaestro());
                if (!grados.contains(g)) {
                    grados.add(g);
                }
                break;
            default:
                System.out.println(id);

        }
        FacesMessage msg = new FacesMessage("Campos Nuevos agregados.",
                "Edite los campos para que las modificaciones sean permenentes");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowEdit(RowEditEvent event) {
        FacesMessage msg = null;
        try {
            String titulo = "", mensaje = "", id = event.getComponent().getId();
            switch (id) {
                case "recurso":
                    tipoRecursoFL.edit((TipoRecurso) event.getObject());
                    titulo = "Tipo de recurso";
                    mensaje = ((TipoRecurso) event.getObject()).getTipoRecursoNombre();
                    break;
                case "tp1":
                    TipoPermiso name = (TipoPermiso) event.getObject();
                    tpfl.edit(name);
                    titulo = "Tipo de Permiso";
                    mensaje = ((TipoPermiso) event.getObject()).getTipoPermisoNombre();
                    tipoPersona = new TipoPersona(0);
                    onItemSelect(null);
                    break;
                case "cargo":
                    TipoCargo tc = (TipoCargo) event.getObject();
                    tipoCargoFL.edit(tc);
                    titulo = "Tipo Cargo";
                    mensaje = tc.getNombre();
                    break;
                case "nombramiento":
                    tipoNombramientoFL.edit((TipoNombramiento) event.getObject());
                    titulo = "Tipo Nombramiento";
                    mensaje = ((TipoNombramiento) event.getObject()).getTipoNombramientoNombre();
                    break;
                case "zona":
                    zfl.edit((Zona) event.getObject());
                    titulo = "Zona";
                    mensaje = ((Zona) event.getObject()).getZonaNombre();
                    break;
                case "reserva":
                    tipoReservaFL.edit((TipoReserva) event.getObject());
                    titulo = "Tipo Reserva";
                    mensaje = ((TipoReserva) event.getObject()).getTipoReservaNombre();
                    break;
                case "tipomateria":
                    TipoMateria m = (TipoMateria) event.getObject();
                    tipoMateriaFL.edit(m);
                    titulo = "Tipo de Materia";
                    mensaje = m.getTipoMateriaNombre();
                    break;
                case "materia":
                    Materia ma = (Materia) event.getObject();
                    ma.setTipoMateria(tipoMateriaFL.find(ma.getTipoMateria().getIdtipoMateria()));
                    materiaFL.edit(ma);
                    titulo = "Materia";
                    mensaje = ma.getMateriaNombre();
                    break;
                case "aula":
                    Aula a = (Aula) event.getObject();
                    a.setZonaAula(zfl.find(a.getZonaAula().getIdzona()));
                    afl.edit(a);
                    titulo = "Aula";
                    mensaje = "Aula N° " + a.getIdaula();
                    break;
                case "autor":
                    Autor au = (Autor) event.getObject();
                    autorFL.edit(au);
                    titulo = "Autor";
                    mensaje = au.getAutorNombre();
                    break;
                case "cargo1":
                    Cargo c = (Cargo) event.getObject();
                    cargoFL.edit(c);
                    titulo = "Cargo";
                    mensaje = c.getCargoNombre();
                    break;
                case "categoria":
                    Categoria ca = (Categoria) event.getObject();
                    categoriaFL.edit(ca);
                    titulo = "Categoría ";
                    mensaje = ca.getCategoriaNombre();
                    break;
                case "editorial":
                    Editorial e = (Editorial) event.getObject();
                    editorialFL.edit(e);
                    titulo = "Editorial ";
                    mensaje = e.getEditorialNombre();
                    break;
                case "proyectos":
                    TipoProyecto pp = (TipoProyecto) event.getObject();
                    tipoProyectoFL.edit(pp);
                    titulo = "Tipo de proyecto informático ";
                    mensaje = pp.getTipoProyectoNombre();
                    break;
                case "horario":
                    Horario h = (Horario) event.getObject();
                    horarioFL.edit(h);
                    titulo = "Horario";
                    mensaje = "Horario Agregado";
                    break;
                case "financiamiento":
                    Financiamiento f = (Financiamiento) event.getObject();
                    financiamientoFL.edit(f);
                    titulo = "Fianciamiento";
                    mensaje = f.getFinanciamientoNombre();
                    break;
                case "especialidades":
                    TipoEspecialidades es = (TipoEspecialidades) event.getObject();
                    tipoeFL.edit(es);
                    titulo = "Tipo De Especialidades";
                    mensaje = es.getTipoEspecialidadesNombre();
                    break;
                case "sueldos":
                    TipoSueldos s = (TipoSueldos) event.getObject();
                    tiposFL.edit(s);
                    titulo = "Tipo De Sueldo";
                    mensaje = s.getTipoSueldoNombre();
                    break;
                case "pais":
                    Pais p = (Pais) event.getObject();
                    paisFL.edit(p);
                    titulo = "Pais";
                    mensaje = p.getPaisNombre();
                    break;
                case "grado":
                    Grado g = (Grado) event.getObject();
                    g.setAulaGrado(afl.find(g.getAulaGrado().getIdaula()));
                    g.setGradoMaestroGuia(g.getGradoMaestroGuia() == null
                            || g.getGradoMaestroGuia().getIdmaestro() == 0
                            ? null : maestroFL.find(g.getGradoMaestroGuia().getIdmaestro()));
                    Grado gcontrol = gradoFL.find(g.getGradoPK());
                    if (g.getGradoMaestroGuia() != null) {
                        Maestro mae = g.getGradoMaestroGuia();
                        mae.setGradoList(mae.getGradoList() == null
                                ? new ArrayList<>() : mae.getGradoList());
                        if (!mae.getGradoList().contains(g)) {
                            mae.getGradoList().add(g);
                        }
                        maestroFL.edit(mae);
                        Persona maep = pFL.find(mae.getIdmaestro());
                        maep.setMaestro(mae);
                        pFL.edit(maep);
                        persistirNotificación(
                                new mensaje(0,
                                        usuario.getIdpersona(),
                                        "gradoEvalH<form",
                                        new FacesMessage(FacesMessage.SEVERITY_INFO,
                                                "Nuevo tutelaje",
                                                getNombreCortoPersona(usuario)
                                                + " le ha entregado el tutelaje del grado "
                                                + getGradoNombre(g.getGradoPK()) + " año "
                                                + g.getGradoPK().getGradoAño())),
                                maep,
                                notiFL, notificacion);
                    }
                    if (gcontrol != null
                            && gcontrol.getGradoMaestroGuia() != null
                            && ((g.getGradoMaestroGuia() != null && !g.getGradoMaestroGuia().equals(gcontrol.getGradoMaestroGuia()))
                            || g.getGradoMaestroGuia() == null)) {
                        Persona maep = pFL.find(gcontrol.getGradoMaestroGuia().getIdmaestro());
                        gcontrol.getGradoMaestroGuia().getGradoList().remove(g);
                        maep.setMaestro(gcontrol.getGradoMaestroGuia());
                        pFL.edit(maep);
                        persistirNotificación(
                                new mensaje(0,
                                        usuario.getIdpersona(),
                                        "gradoEvalH<form",
                                        new FacesMessage(FacesMessage.SEVERITY_INFO,
                                                "Tutelaje removido",
                                                getNombreCortoPersona(usuario)
                                                + " le ha quitado el tutelaje del grado "
                                                + getGradoNombre(g.getGradoPK()) + " año "
                                                + g.getGradoPK().getGradoAño())),
                                maep,
                                notiFL, notificacion);
                    }
                    if (gcontrol == null) {
                        try {
                            gradoFL.create(g);
                        } catch (Exception ex) {
                        }
                    }
                    gradoFL.edit(g);
                    titulo = "Grado";
                    mensaje = g.getGradoPK().getIdgrado() + "° " + g.getGradoPK().getGradoModalidad() + " "
                            + g.getGradoPK().getGradoSeccion() + " para el año"
                            + g.getGradoPK().getGradoAño() + (gcontrol == null ? " fue agregado." : " fue modificado.");
                    break;
                default:
                    System.out.println(id);
            }
            init();
            PrimeFaces.current().ajax().update(event.getComponent().getClientId());
            notificar(
                    new mensaje(
                            0,
                            usuario.getIdpersona(),
                            pagina.split(".intex")[0] + "<form¿¿¿tp¿¿" + usuario.getTipoPersona().getIdtipoPersona(),
                            new FacesMessage(
                                    FacesMessage.SEVERITY_INFO,
                                    titulo + " Editado",
                                    mensaje)),
                    new Persona(0), notificacion);
        } catch (Exception e) {
            msg = new FacesMessage("Error en la edición", e.getMessage() != null ? e.getMessage() : "Error desconocido");
            FacesContext.getCurrentInstance().addMessage(null, msg);
            PrimeFaces.current().ajax().update("form");
        }
    }

    public void onRowCancel(RowEditEvent event) {
        String mensaje = "", id = event.getComponent().getId();
        switch (id) {
            case "recurso":
                TipoRecurso z = ((TipoRecurso) event.getObject());
                if (z.getTipoRecursoNombre() == null || z.getTipoRecursoNombre().isEmpty()) {
                    recursos.remove(z);
                }
                mensaje = z.getTipoRecursoNombre();
                break;
            case "tp1":
                TipoPermiso tp1 = (TipoPermiso) event.getObject();
                if (tp1.getTipoPermisoNombre() == null || tp1.getTipoPermisoNombre().isEmpty()) {
                    all.remove(tp1);
                }
                mensaje = tp1.getTipoPermisoNombre();
                break;
            case "cargo":
                TipoCargo tc = (TipoCargo) event.getObject();
                if (tc.getNombre() == null || tc.getNombre().isEmpty()) {
                    cargos.remove(tc);
                }
                mensaje = tc.getNombre();
                break;
            case "persona":
                TipoPersona tp = (TipoPersona) event.getObject();
                if (tp.getTipoPersonaNombre() == null || tp.getTipoPersonaNombre().isEmpty()) {
                    Personas.remove(tp);
                }
                mensaje = tp.getTipoPersonaNombre();
                break;
            case "zona":
                Zona zon = (Zona) event.getObject();
                if (zon.getZonaNombre() == null || zon.getZonaNombre().isEmpty()) {
                    zonas.remove(zon);
                }
                mensaje = zon.getZonaNombre();
                break;
            case "reserva":
                TipoReserva res = (TipoReserva) event.getObject();
                if (res.getTipoReservaNombre() == null || res.getTipoReservaNombre().isEmpty()) {
                    reservas.remove(res);
                }
                mensaje = res.getTipoReservaNombre();
                break;
            case "tipomateria":
                TipoMateria m = (TipoMateria) event.getObject();
                if (m.getTipoMateriaNombre() == null || m.getTipoMateriaNombre().isEmpty()) {
                    tipoMaterias.remove(m);
                }
                mensaje = m.getTipoMateriaNombre();
                break;
            case "materia":
                Materia ma = (Materia) event.getObject();
                if (ma.getMateriaNombre() == null || ma.getMateriaNombre().isEmpty()) {
                    materias.remove(ma);
                }
                mensaje = ma.getMateriaNombre();
                break;
            case "aula":
                Aula a = (Aula) event.getObject();
                if (a.getZonaAula().getIdzona() == null || a.getZonaAula().getIdzona() == 0) {
                    aulas.remove(aulas.indexOf(a));
                }
                mensaje = "Aula N° " + a.getIdaula();
                break;
            case "autor":
                Autor au = (Autor) event.getObject();
                if (au.getAutorNombre() == null || au.getAutorNombre().isEmpty()) {
                    autor.remove(au);
                }
                mensaje = au.getAutorNombre();
                break;
            case "cargo1":
                Cargo c = (Cargo) event.getObject();
                if (c.getCargoNombre() == null || c.getCargoNombre().isEmpty()) {
                    cargo.remove(c);
                }
                mensaje = c.getCargoNombre();
                break;

            case "categoria":
                Categoria ca = (Categoria) event.getObject();
                if (ca.getCategoriaNombre() == null || ca.getCategoriaNombre().isEmpty()) {
                    categoria.remove(ca);
                }
                mensaje = ca.getCategoriaNombre();
                break;
            case "editorial":
                Editorial e = (Editorial) event.getObject();
                if (e.getEditorialNombre() == null || e.getEditorialNombre().isEmpty()) {
                    editorial.remove(e);
                }
                mensaje = e.getEditorialNombre();
                break;
            case "proyectos":
                TipoProyecto pp = (TipoProyecto) event.getObject();
                if (pp.getTipoProyectoNombre() == null || pp.getTipoProyectoNombre().isEmpty()) {
                    tipopp.remove(pp);
                }
                mensaje = pp.getTipoProyectoNombre();
                break;
            case "horario":
                Horario h = (Horario) event.getObject();
                if (h.getHoraInicio() == null && h.getHoraFin() == null) {
                    horario.remove(h);
                }
                mensaje = "Horario Cancelado";
                break;
            case "financiamiento":
                Financiamiento f = (Financiamiento) event.getObject();
                if (f.getFinanciamientoNombre() == null || f.getFinanciamientoNombre().isEmpty()) {
                    financiamientos.remove(f);
                }
                mensaje = "Financiamiento";
                break;
            case "especialidades":
                TipoEspecialidades es = (TipoEspecialidades) event.getObject();
                if (es.getTipoEspecialidadesNombre() == null || es.getTipoEspecialidadesNombre().isEmpty()) {
                    tipoE.remove(es);
                }
                mensaje = "Tipo De Especialidades";
                break;
            case "sueldos":
                TipoSueldos s = (TipoSueldos) event.getObject();
                if (s.getTipoSueldoNombre() == null || s.getTipoSueldoNombre().isEmpty()) {
                    tipoS.remove(s);
                }
                mensaje = "Tipo De Sueldo";
                break;
                case "pais":
                Pais p = (Pais)event.getObject();
                if (p.getPaisNombre() == null || p.getPaisNombre().isEmpty()) {
                    paises.remove(p);
                }
                mensaje = "Pais";
                break;
            case "grado":
                Grado g = (Grado) event.getObject();
                if (g.getGradoPK().getIdgrado() == 0 | g.getGradoPK().getGradoModalidad().isEmpty()
                        | g.getGradoPK().getGradoSeccion().isEmpty() | g.getAulaGrado().getIdaula() == 0) {
                    grados.remove(g);
                }
                mensaje = "Grado";
                break;
            default:
                System.out.println(id);
        }
        init();
        PrimeFaces.current().ajax().update(event.getComponent().getClientId());
        FacesMessage msg = new FacesMessage("Edición cancelada", mensaje);
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public List<SelectItem> getListaZonas() {
        List<SelectItem> ListaZonas = new ArrayList<>();
        zonas.forEach((z) -> {
            ListaZonas.add(new SelectItem(z.getIdzona(), z.getZonaNombre()));
        });
        return ListaZonas;

    }

    public List<SelectItem> getListaTipoMateria() {
        List<SelectItem> ListaTipoMateria = new ArrayList<>();
        tipoMaterias.forEach((tp) -> {
            ListaTipoMateria.add(new SelectItem(tp.getIdtipoMateria(), tp.getTipoMateriaNombre()));
        });
        return ListaTipoMateria;
    }

    public void onItemSelect(ItemSelectEvent event) {
        tipoPersona = personaFL.find(tipoPersona.getIdtipoPersona());
        tipoPersona = tipoPersona == null ? new TipoPersona(0) : tipoPersona;
        List<TipoPermiso> l = new ArrayList<>();
        List<String> target = new ArrayList<>();
        List<String> source = new ArrayList<>();
        if (tipoPersona.getIdtipoPersona() > 0) {
            tipoPersona.getTipopersonaPermisoList().stream().map((a) -> {
                l.add(a.getTipoPermiso());
                return a;
            }).forEachOrdered((a) -> {
                target.add(a.getTipoPermiso().getTipoPermisoNombre());
            });

            permisoFL.findAll().stream().filter((p) -> (!l.contains(p))).forEachOrdered((p) -> {
                source.add(p.getTipoPermisoNombre());
            });
            FacesMessage msg = new FacesMessage("Persona seleccionada", tipoPersona.getTipoPersonaNombre());
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        model.setTarget(target);
        model.setSource(source);
    }

    public List<SelectItem> getTiposPersonas() {
        List<SelectItem> list = new ArrayList<>();
        list.add(new SelectItem(0, "Seleccione"));
        Personas.forEach((p) -> {
            list.add(new SelectItem(p.getIdtipoPersona(), p.getTipoPersonaNombre()));
        });
        return list;
    }

    public void guardar() {
        if (tipoPersona.getIdtipoPersona() > 0) {
            List<TipopersonaPermiso> permisos = new ArrayList<>();
            model.getTarget().forEach((g) -> {
                permisoFL.findAll().stream().filter((t) -> (g.equals(t.getTipoPermisoNombre()))).map((t) -> {
                    TipopersonaPermiso r = new TipopersonaPermiso(tipoPersona.getIdtipoPersona(), t.getIdtipoPermiso());
                    r.setTipoPermiso(t);
                    return r;
                }).map((r) -> {
                    r.setTipoPersona(tipoPersona);
                    return r;
                }).map((r) -> {
                    r.setTipopersonaPermisoComentario("");
                    return r;
                }).forEachOrdered((r) -> {
                    permisos.add(r);
                });
            });
            tipoPersona.getTipopersonaPermisoList().stream().filter((t) -> (!permisos.contains(t))).forEachOrdered((t) -> {
                tppfl.remove(t);
            });
            tipoPersona.setTipopersonaPermisoList(permisos);
            personaFL.edit(tipoPersona);
            String m = "Al Tipo de Ususario " + tipoPersona.getTipoPersonaNombre();
            if (model.getTarget().size() > 0) {
                m += " se le han asignado los Tipos de permisos:";
                m = model.getTarget().stream().map((d) -> "\n* " + d + ".").reduce(m, String::concat);
            } else {
                m += " Se le han removido todos los tipos de permisos.";
            }
            FacesMessage msg = new FacesMessage("Las modificaciones se han realizado:", m);
            FacesContext.getCurrentInstance().addMessage(null, msg);
            PrimeFaces.current().ajax().update("form:msgs");
        }
    }

    public void agregarHorario() {
        FacesMessage msg;
        if (hora.getIdhorario() > 0) {
            horarioFL.edit(hora);
            horario = horarioFL.findAll();
            hora = new Horario(0, new Date(), new Date());
            msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Agregación Exitosa",
                    "El horario n° " + hora.getIdhorario() + ", entre las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraInicio()))
                    + " y las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraFin())) + ", ha sido agregado.");
        } else {
            msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Horario", "no se ha agregado nada.");
        }
        FacesContext.getCurrentInstance().addMessage(null, msg);
        PrimeFaces.current().ajax().update("form", "h1");
    }

    public void eliminarHorario() {
        FacesMessage ms;
        try {
            horarioFL.remove(hora);
            horario.remove(hora);
            ms = new FacesMessage(FacesMessage.SEVERITY_INFO, "Eliminación",
                    "El horario n° " + hora.getIdhorario() + ", entre las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraInicio()))
                    + " y las " + (new SimpleDateFormat("hh:mm a").format(hora.getHoraFin())) + ", ha sido eliminado.");
            hora = new Horario(0, new Date(), new Date());
        } catch (Exception ex) {
            ms = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "¡Vaya, hubo un error!",
                    ex.getMessage() != null ? ex.getMessage()
                    : "Un error inesperado se ha interceptado mientras se hacía la operación indicada.");
        }
        FacesContext.getCurrentInstance().addMessage(null, ms);
        PrimeFaces.current().ajax().update("form", "h1");
    }

    public List<TipoRecurso> getRecursos() {
        return Collections.unmodifiableList(recursos);
    }

    public List<TipoPermiso> getAll() {
        return Collections.unmodifiableList(all);
    }

    public List<TipoCargo> getCargos() {
        return Collections.unmodifiableList(cargos);
    }

    public List<TipoPersona> getPersonas() {
        return Collections.unmodifiableList(Personas);
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public DualListModel<String> getModel() {
        return model;
    }

    public void setModel(DualListModel<String> model) {
        this.model = model;
    }

    public List<Zona> getZonas() {
        return Collections.unmodifiableList(zonas);
    }

    public List<TipoReserva> getReservas() {
        return Collections.unmodifiableList(reservas);
    }

    public List<TipoNombramiento> getNombramientos() {
        return Collections.unmodifiableList(nombramientos);
    }

    public List<Materia> getMaterias() {
        return Collections.unmodifiableList(materias);
    }

    public List<TipoMateria> getTipoMaterias() {
        return Collections.unmodifiableList(tipoMaterias);
    }

    public List<Aula> getAulas() {
        return Collections.unmodifiableList(aulas);
    }

    public List<Autor> getAutor() {
        return Collections.unmodifiableList(autor);
    }

    public List<Cargo> getCargo() {
        return Collections.unmodifiableList(cargo);
    }

    public List<Categoria> getCategoria() {
        return Collections.unmodifiableList(categoria);
    }

    public List<Editorial> getEditorial() {
        return Collections.unmodifiableList(editorial);
    }

    public List<Horario> getHorario() {
        return Collections.unmodifiableList(horario);
    }

    public List<Financiamiento> getFinanciamientos() {
        return Collections.unmodifiableList(financiamientos);
    }

    public List<Grado> getGrados() {
        List<Grado> i = new ArrayList<>();
        grados.stream().map((g) -> {
            if (g.getGradoMaestroGuia() == null) {
                g.setGradoMaestroGuia(new Maestro(0));
                g.getGradoMaestroGuia().setPersona(new Persona(0, "", "", true));
            }
            return g;
        }).forEachOrdered((g) -> {
            i.add(g);
        });
        return i;
    }

    public List<Maestro> getMaestros() {
        return maestroFL.findAll();
    }

    public Horario getHora() {
        return hora;
    }

    public void setHora(Horario horario) {
        this.hora = horario == null ? new Horario(0, new Date(), new Date()) : horario;
    }

    public List<DiasEstudio> getDias() {
        return Collections.unmodifiableList(dias);
    }

    public DiasEstudio getDiasSelected() {
        return diasSelected;
    }

    public void setDiasSelected(DiasEstudio diasSelected) {
        this.diasSelected = diasSelected;
    }

    public List<DiasEstudio> getDiasSeleccionables() {
        return Collections.unmodifiableList(diasSeleccionables);
    }

    public List<Integer> getAñosGrados(Grado g) {
        List<Integer> i = new ArrayList<>();
        Integer a = getAño();
        if (a > g.getGradoPK().getGradoAño()) {
            a = g.getGradoPK().getGradoAño();
        }
        for (int y = 0; y < 3; y++) {
            i.add(a + y);
        }
        return i;
    }

    public Integer getAño() {
        return getAñoActual();
    }

    public List<Integer> getAñosG() {
        return gradoFL.findAños();
    }

    public List<TipoEspecialidades> getTipoE() {
        return Collections.unmodifiableList(tipoE);
    }

    public List<TipoSueldos> getTipoS() {
        return Collections.unmodifiableList(tipoS);
    }

    public void onSelectAños(SelectEvent ev) {
        grados = añoSelected == null ? new ArrayList<>() : gradoFL.findByGradoAño(añoSelected);
    }

    public Integer getAñoSelected() {
        return añoSelected;
    }

    public void setAñoSelected(Integer añoSelected) {
        this.añoSelected = añoSelected;
    }

    public List<Integer> getAñosDisponibles() {
        return añosDisponibles;
    }

    public List<TipoProyecto> getTipopp() {
        return tipopp;
    }

    public List<Pais> getPaises() {
        return paises;
    }
}
