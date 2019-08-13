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

import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author delsas
 */
@Named
@ApplicationScoped
@ServerEndpoint("/saitaeServer")
public class saitaeServer implements Serializable{
    
    private static final long serialVersionUID = 1L;
    @Inject
    manejador manejador;

    @OnMessage
    public String onMessage(String message, Session remitente) {
        System.out.println(message+" :: "+remitente.getId());
        String w=message.split("::")[0];
        switch(w){
            case "todos":
                manejador.sendToAllConnectedSessions(message.split("::")[1], remitente);
                break;
            default:
                manejador.sendToSession(remitente, "No se entendió lo que ha enviado. Intentelo de nuevo.");
        }
        return w;
    }

    @OnOpen
    public void open(Session session) {
        manejador.addSession(session);
        System.out.println("La session "+session.getId()+" se ha conectado.");
    }

    @OnClose
    public void close(Session session) {
        manejador.removeSession(session);
        System.out.println("La session "+session.getId()+" se ha desconectado.");
    }

    @OnError
    public void onError(Throwable error) {
        Logger.getLogger(saitaeServer.class.getName()).log(Level.SEVERE, null, error);
    }
    
}
