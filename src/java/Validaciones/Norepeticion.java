/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validaciones;

import Dao.dao_asientos;
import Dao.dao_destino;
import Dao.dao_empresas;
import Dao.dao_origen;
import Dao.dao_pasajeros;
import Dao.dao_tarjetas;
import Dao.dao_usuarios;
import Dao.dao_vuelos;
import Entidades.Asientos;
import Entidades.Destinos;
import Entidades.Empresas;
import Entidades.Origenes;
import Entidades.Pasajeros;
import Entidades.Tarjetas;
import Entidades.Usuarios;
import Entidades.Vuelo;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hernandez
 */
public class Norepeticion {
    
    dao_destino d = new dao_destino();
    dao_usuarios user = new dao_usuarios();
    dao_empresas empresa = new dao_empresas();
    dao_asientos asiento = new dao_asientos();
    dao_tarjetas tarjeta = new dao_tarjetas();
    dao_origen o = new dao_origen();
    dao_vuelos dv = new dao_vuelos();
    dao_pasajeros dp=new dao_pasajeros();
    
    public Norepeticion() {
    }
    
    
     public Pasajeros buscardocunico(String doc) {
        try {
            for (Pasajeros x : dp.listadopasajeros()) {
                if (x.getNumerodocumento().equals(doc)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Norepeticion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
    public Vuelo buscarvuelo(int avion, int origen, int destino) {
        try {
            for (Vuelo x : dv.listadovuelos()) {
                if (x.getAviones().getIdavion()==avion && x.getOrigenes().getIdorigen()==origen && x.getDestinos().getIddestino()==destino) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Norepeticion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Origenes buscarpaiso(String pais) {
        try {
            for (Origenes x : o.listadoorigenes()) {
                if (x.getPais().equals(pais)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Norepeticion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Destinos buscarpais(String pais) {
        try {
            for (Destinos x : d.listadodestinos()) {
                if (x.getPais().equals(pais)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Norepeticion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Usuarios buscarusuario(String u) {
        try {
            for (Usuarios x : user.listadousuarios()) {
                if (x.getNombreusuario().equals(u)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public Empresas buscarempresa(String u, String r) {
        try {
            for (Empresas x : empresa.listaempresas()) {
                if (x.getNombreempresa().equals(u) || x.getRuc().equals(r)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public Asientos buscarasiento(int u, String r) {
        try {
            for (Asientos x : asiento.listadoasientos()) {
                if (x.getFila() == u && x.getColumna().equals(r)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public Tarjetas buscartarjeta(String u) {
        try {
            for (Tarjetas x : tarjeta.listadotarjetas()) {
                if (x.getCodigo().equals(u)) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
}
