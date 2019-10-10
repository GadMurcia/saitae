/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.delsas.saitae.ax;

import com.thetransactioncompany.cors.CORSFilter;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author delsas
 */
public class corsonf extends CORSFilter implements Serializable{

    private static final long serialVersionUID = 1L;	
	
	
	public final boolean allowGenericHttpRequests=true;

	public final boolean allowAnyOrigin=true;
	
	public final boolean allowSubdomains=true;
    /**
     *
     */
    public final Set<String> supportedMethods;
	
	public final boolean supportAnyHeader= true;

    public corsonf() {
        this.supportedMethods = new HashSet<>();
        this.supportedMethods.add("GET, POST, HEAD, OPTIONS");
    }	
}