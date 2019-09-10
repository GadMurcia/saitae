
package net.delsas.saitae.aux;

import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author delsas
 */
public class delsas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int g=6018;
        String a=DigestUtils.md5Hex(g+"");
        System.out.println("contrseña sin encriptar: "+g);
        System.out.println("contraseña encriptada: "+a);
        System.out.println("longitud contrseña encriptada: "+a.toCharArray().length);
    }
    
}
