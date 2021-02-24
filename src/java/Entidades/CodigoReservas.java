/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Dao.dao_reservas;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hernandez
 */
public class CodigoReservas {

    public CodigoReservas() {
    }

    dao_reservas lista = new dao_reservas();

    public int generarnumero() {
        int n = 0;
        try {
            if (lista.listadoreservas().size() > 0) {
                n = lista.listadoreservas().get(lista.listadoreservas().size() - 1).getIdreserva() + 1;
            } else {
                n = 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CodigoReservas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    String g = "res09999";

    public String generarCodigo() {
        int n = generarnumero();
        String letras = "RES";
        String codigo = "";
        if (n < 10) {
            codigo = letras + "0000" + n;
        } else if (n >= 10 && n < 100) {
            codigo = letras + "000" + n;
        } else if (n >= 100 && n < 1000) {
            codigo = letras + "00" + n;
        } else if (n >= 1000 && n < 10000) {
            codigo = letras + "0" + n;
        } else {
            codigo = letras + n;
        }
        return codigo;
    }
}
