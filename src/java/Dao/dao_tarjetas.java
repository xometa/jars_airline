/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Tarjetas;
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
public class dao_tarjetas {
     private conexion conexion;
    private Tarjetas tarjetas;

    public dao_tarjetas() {
        this.conexion = new conexion();
    }
    
     public void setRegistrar(Tarjetas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO tarjeta (nombretitular,fechacaducidad,codseguridad) "
                    + "VALUES ('" + u.getNombre()+ "', '" + u.getFecha()+ "', '" + u.getCodigo()+ "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Tarjetas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE tarjeta SET nombretitular='" + u.getNombre()+ "', "
                    + "fechacaducidad='" + u.getFecha()+ "', "
                    + "codseguridad='" + u.getCodigo()+ "' "
                    + "WHERE idtarjeta='" + u.getIdtarjeta()+ "';");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void Elimininar(Tarjetas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM tarjeta WHERE idtarjeta='" + u.getIdtarjeta()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Tarjetas gettarjetas(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM tarjeta WHERE idtarjeta='" + id + "'");
            tarjetas=new Tarjetas();
            while (rs.next()) {
                tarjetas.setIdtarjeta(rs.getInt("idtarjeta"));
                tarjetas.setNombre(rs.getString("nombretitular"));
                tarjetas.setFecha(rs.getString("fechacaducidad"));
                tarjetas.setCodigo(rs.getString("codseguridad"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return tarjetas;
    }
    public ArrayList<Tarjetas> listadotarjetas() throws SQLException {
        ArrayList<Tarjetas> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select *from tarjeta");
            rs = ps.executeQuery();
            while (rs.next()) {
               Tarjetas t=new Tarjetas();
               t.setIdtarjeta(rs.getInt("idtarjeta"));
               t.setNombre(rs.getString("nombretitular"));
               t.setFecha(rs.getString("fechacaducidad"));
               t.setCodigo(rs.getString("codseguridad"));
               lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
}
