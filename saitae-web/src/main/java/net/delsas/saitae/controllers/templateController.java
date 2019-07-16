/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.controllers;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;

/**
 *
 * @author delsas
 */
@Named(value = "templateController")
@SessionScoped
public class templateController implements Serializable {

    /**
     * Creates a new instance of templateController
     */
    public templateController() {
    }
    
}
