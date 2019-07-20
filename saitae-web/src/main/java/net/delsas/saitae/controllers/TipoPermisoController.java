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
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.TipoPermisoFacadeLocal;
import net.delsas.saitae.beans.TipoPersonaFacadeLocal;
import net.delsas.saitae.beans.TipopersonaPermisoFacadeLocal;
import net.delsas.saitae.entities.TipoPermiso;
import net.delsas.saitae.entities.TipoPersona;
import net.delsas.saitae.entities.TipopersonaPermiso;
import org.primefaces.PrimeFaces;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.event.RowEditEvent;
import org.primefaces.model.DualListModel;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped
public class TipoPermisoController implements Serializable {

    private static final long serialVersionUID = 1L;

    @EJB
    private TipoPermisoFacadeLocal tpfl;
    private TipoPermiso tp;
    private List<TipoPermiso> all;

    @PostConstruct
    public void init() {
        tp = new TipoPermiso(0);
        all = tpfl.findAll();
    }

    public void nuevo() {
        try {
            tpfl.edit(tp);
            all.add(tp);
        } catch (Exception e) {

        }
    }

    public void onAddNew() {
        // Add one new car to the table:
        TipoPermiso p = new TipoPermiso(all.size() + 1);
        all.add(p);
        FacesMessage msg = new FacesMessage("Campos Nuevos agregados.",
                "Edite los campos para que las modificaciones sean permenentes");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowEdit(RowEditEvent event) {
        TipoPermiso name = (TipoPermiso) event.getObject();
        tpfl.edit(name);
        FacesMessage msg = new FacesMessage("Tipo Permiso Editado", ((TipoPermiso) event.getObject()).getTipoPermisoNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void onRowCancel(RowEditEvent event) {
        TipoPermiso z = (TipoPermiso) event.getObject();
        if (z.getTipoPermisoNombre() == null || z.getTipoPermisoNombre().isEmpty()) {
            all.remove(z);
        }
        FacesMessage msg = new FacesMessage("Edición cancelada", ((TipoPermiso) event.getObject()).getTipoPermisoNombre());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public TipoPermiso getTp() {
        return tp;
    }

    public void setTp(TipoPermiso tp) {
        this.tp = tp;
    }

    public List<TipoPermiso> getAll() {
        return all;
    }

    public void setAll(List<TipoPermiso> all) {
        this.all = all;
    }

}
