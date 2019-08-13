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
package net.delsas.saitae.socket;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.ClientEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
/**
 *
 * @author delsas
 */

@ClientEndpoint
public class saitaeClient {
    private Session mySession;
    
    @OnOpen
    public void open(Session session) throws IOException{
        mySession = session;        
        System.out.println(session.getId() + ". Cliente conectado.");
    }
    
    @OnMessage
    public void onMessage(String text, Session ses)  {
        System.out.println("El cliente escuchó: "+text);
    }
    
    public void enviarmensaje(String mensaje) throws IOException{
        mySession.getBasicRemote().sendText(mensaje);
        System.out.println("se enció: "+mensaje);
    }
    
    @OnError
    public void error(Session session, Throwable e) {
        System.out.println(session.getId() + ". Hubo un error. cerremos cesión."+e.getMessage());
        if (session.isOpen()) {
            try {
                session.close();
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        }
    }
    
    @OnClose
    public void close(Session session) {
        try {
            cerrarconexión();
            System.out.println(session.getId() + " was closed. La conexión del cliente se perdió.");
        } catch (IOException ex) {
            Logger.getLogger(saitaeClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void cerrarconexión() throws IOException{
        mySession.close();
        System.out.println("Usted ha decidido desconectarse.\n\n");
    }
}
