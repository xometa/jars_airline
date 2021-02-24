/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Pagos;
import Entidades.Reservas;
import Entidades.Tarjetas;
import Entidades.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Hernandez
 */
public class dao_pagos {

    private conexion conexion;
    private Pagos pagos;

    public dao_pagos() {
        this.conexion = new conexion();
    }
    public void setRegistrar(Pagos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO pago(formapago, costo,idtarjeta,idreserva) VALUES ('" + u.getFormapago()+ "', '" + u.getCosto()+ "', '" + u.getIdtarjeta()+ "', '" + u.getIdreserva()+ "')");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void setModificar(Pagos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE pago SET formapago='" + u.getFormapago()+ "', "
                    + "costo='" + u.getCosto()+ "', "
                    + "idtarjeta='" + u.getIdtarjeta()+ "', "
                    + "idreserva='" + u.getIdreserva()+ "' "
                    + "WHERE idpago='" + u.getIdpago()+ "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void Elimininar(Pagos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM pago WHERE idpago='" + u.getIdpago()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Pagos getpagos(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("select pa.idpago,\n"
                    + "pa.formapago,\n"
                    + "pa.costo,\n"
                    + "tar.idtarjeta,\n"
                    + "tar.nombretitular,\n"
                    + "re.idreserva,\n"
                    + "re.codigo ,\n"
                    + "re.estadopago\n"
                    + "from pago as pa \n"
                    + "INNER JOIN tarjeta as tar on tar.idtarjeta=pa.idtarjeta \n"
                    + "inner join  reserva as re on re.idreserva=pa.idreserva\n"
                    + "where re.estadopago='Pagada' and pa.idpago='" + id + "'");
            while (rs.next()) {
                pagos = new Pagos(rs.getInt("idpago"), rs.getString("formapago"), rs.getDouble("costo"),
                        new Tarjetas(rs.getInt("idtarjeta"), rs.getString("nombretitular")),
                        new Reservas(rs.getInt("idreserva"), rs.getString("codigo"), rs.getString("estadopago")));
            }
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return pagos;
    }
    
    public ArrayList<Pagos> listadopagos() throws SQLException {
        ArrayList<Pagos> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select pa.idpago,\n"
                    + "pa.formapago,\n"
                    + "pa.costo,\n"
                    + "tar.idtarjeta,\n"
                    + "tar.nombretitular,\n"
                    + "re.idreserva,\n"
                    + "re.codigo ,\n"
                    + "re.estadopago\n"
                    + "from pago as pa \n"
                    + "INNER JOIN tarjeta as tar on tar.idtarjeta=pa.idtarjeta \n"
                    + "inner join  reserva as re on re.idreserva=pa.idreserva\n"
                    + " where re.estadopago='Pagada'");
            rs = ps.executeQuery();
            while (rs.next()) {
                Pagos t = new Pagos(rs.getInt("idpago"), rs.getString("formapago"), rs.getDouble("costo"),
                        new Tarjetas(rs.getInt("idtarjeta"), rs.getString("nombretitular")),
                        new Reservas(rs.getInt("idreserva"), rs.getString("codigo"), rs.getString("estadopago")));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
    public double ingresos() throws SQLException {
        ResultSet rs = null;
        double ingresos = 0;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select sum(p.costo) as ingresos from pago as p inner join reserva as re on re.idreserva=p.idreserva where re.estadopago='Pagada'");
            rs = ps.executeQuery();
            while (rs.next()) {
                ingresos = rs.getDouble("ingresos");
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return ingresos;
    }
}
