package net.delsas.saitae.ax;

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
//        Integer g=6018;
        String a=DigestUtils.md5Hex("delsas");
//        System.out.println("contrseña sin encriptar: "+g);
        System.out.println("contraseña encriptada: "+a);
        System.out.println("longitud contrseña encriptada: "+a.toCharArray().length);
//        System.out.println("Nu: "+Meses.Agosto.getNumero());
//        System.out.println("No: "+Meses.Enero.getNombre());
//        System.out.println("1No: "+Meses.getNombreByNumero(1));
//        System.out.println("12Nu: "+Meses.getNumeroByNombre("diciembre"));

    }

}
