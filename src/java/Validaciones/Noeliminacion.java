/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validaciones;

import Dao.dao_aviones;
import Dao.dao_destino;
import Dao.dao_origen;
import Dao.dao_pagos;
import Dao.dao_reservas;
import Dao.dao_vuelos;
import Entidades.Aviones;
import Entidades.Pagos;
import Entidades.Reservas;
import Entidades.Vuelo;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hernandez
 */
public class Noeliminacion {

    dao_aviones avion = new dao_aviones();
    dao_reservas re = new dao_reservas();
    dao_vuelos vuelo = new dao_vuelos();
    dao_destino destino = new dao_destino();
    dao_origen origen = new dao_origen();
    dao_pagos pagos = new dao_pagos();

    public Noeliminacion() {
    }
    
      public Pagos buscarreserva(int id) {
        try {
            for (Pagos x : pagos.listadopagos()) {
                if (x.getReservas().getIdreserva()== id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Aviones buscarempresa(int id) {
        try {
            for (Aviones x : avion.listadoaviones()) {
                if (x.getAerolineas().getIdempresa() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
      public Reservas buscarpasajero(int id) {
        try {
            for (Reservas x : re.listadoreservas()) {
                if (x.getPasajeros().getIdpasajero()== id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

      
    /**
     * ************usuarios*******************
     */
    public Reservas buscaruser(int id) {
        try {
            for (Reservas x : re.listadoreservas()) {
                if (x.getUsuarios().getIdusuario() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * ********************Aviones***********************
     */
    public Vuelo buscaravion(int id) {
        try {
            for (Vuelo x : vuelo.listadovuelos()) {
                if (x.getAviones().getIdavion() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * ***************Origen**************************
     */
    public Vuelo buscarorigen(int id) {
        try {
            for (Vuelo x : vuelo.listadovuelos()) {
                if (x.getOrigenes().getIdorigen() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * ***************Destino**************************
     */
    public Vuelo buscardestino(int id) {
        try {
            for (Vuelo x : vuelo.listadovuelos()) {
                if (x.getDestinos().getIddestino() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * ***************Asientos****************
     */
    public Reservas buscarasiento(int id) {
        try {
            for (Reservas x : re.listadoreservas()) {
                if (x.getAsientos().getIdasiento() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * ***************tarjetas****************
     */
    public Pagos buscartarjeta(int id) {
        try {
            for (Pagos x : pagos.listadopagos()) {
                if (x.getTarjetas().getIdtarjeta() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     * *******************Vuelos****************************
     */
    public Reservas buscarvuelos(int id) {
        try {
            for (Reservas x : re.listadoreservas()) {
                if (x.getVuelo().getIdvuelo() == id) {
                    return x;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Noeliminacion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
