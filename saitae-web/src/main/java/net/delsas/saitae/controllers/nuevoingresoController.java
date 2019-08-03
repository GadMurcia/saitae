package net.delsas.saitae.controllers;

import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import net.delsas.saitae.beans.EstudianteFacadeLocal;
import net.delsas.saitae.beans.PersonaFacadeLocal;

/**
 *
 * @author delsas
 */
@Named
@ViewScoped        
public class nuevoingresoController implements Serializable{

    private static final long serialVersionUID = 1L;
    @EJB
    private PersonaFacadeLocal pfl;
    @EJB
    private EstudianteFacadeLocal efl;
    
    @PostConstruct
    public void init(){
        
    }

}
