/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Asientos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Alex
 */
public class dao_asientos {
    private conexion conexion;
    Asientos asientos;
    
    public dao_asientos(){
        this.conexion=new conexion();
    }
    
    public void setRegistrar(Asientos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO asiento (nombre,fila,columna) "
                    + "VALUES ('" + u.getNombre()+ "', '" + u.getFila()+ "', '" + u.getColumna()+ "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Asientos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE asiento SET nombre='" + u.getNombre()+ "', "
                    + "fila='" + u.getFila()+ "', "
                    + "columna='" + u.getColumna()+ "' "
                    + "WHERE idasiento='" + u.getIdasiento()+ "';");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void Elimininar(Asientos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM asiento WHERE idasiento='" + u.getIdasiento()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Asientos getasientos(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM asiento WHERE idasiento='" + id + "'");
            asientos=new Asientos();
            while (rs.next()) {
                asientos.setIdasiento(rs.getInt("idasiento"));
                asientos.setNombre(rs.getString("nombre"));
                asientos.setFila(rs.getInt("fila"));
                asientos.setColumna(rs.getString("columna"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return asientos;
    }
    public ArrayList<Asientos> listadoasientos() throws SQLException {
        ArrayList<Asientos> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select *from asiento");
            rs = ps.executeQuery();
            while (rs.next()) {
               Asientos t=new Asientos();
               t.setIdasiento(rs.getInt("idasiento"));
               t.setNombre(rs.getString("nombre"));
               t.setFila(rs.getInt("fila"));
               t.setColumna(rs.getString("columna"));
               lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
    
}
