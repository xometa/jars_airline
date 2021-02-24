/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Destinos;
import Entidades.Origenes;
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
public class dao_origen {

    private conexion conexion;
    Origenes origenes;

    public dao_origen() {
        this.conexion = new conexion();
    }
        
     public void setRegistrar(Origenes u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO origen (nombreaeropuerto,pais,ciudad) "
                    + "VALUES ('" + u.getNombreaeropuerto()+ "', '" + u.getPais()+ "', '" + u.getCiudad()+ "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Origenes u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE origen SET nombreaeropuerto='" + u.getNombreaeropuerto()+ "', "
                    + "pais='" + u.getPais()+ "', "
                    + "ciudad='" + u.getCiudad()+ "' "
                    + "WHERE idorigen='" + u.getIdorigen()+ "';");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void Elimininar(Origenes u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM origen WHERE idorigen='" + u.getIdorigen()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Origenes getorigen(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM origen WHERE idorigen='" + id + "'");
            origenes=new Origenes();
            while (rs.next()) {
                origenes.setIdorigen(rs.getInt("idorigen"));
               origenes.setNombreaeropuerto(rs.getString("nombreaeropuerto"));
               origenes.setPais(rs.getString("pais"));
               origenes.setCiudad(rs.getString("ciudad"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return origenes;
    }
     public ArrayList<Origenes> listadoorigenes() throws SQLException {
        ArrayList<Origenes> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select *from origen");
            rs = ps.executeQuery();
            while (rs.next()) {
               Origenes t=new Origenes();
               t.setIdorigen(rs.getInt("idorigen"));
               t.setNombreaeropuerto(rs.getString("nombreaeropuerto"));
               t.setPais(rs.getString("pais"));
               t.setCiudad(rs.getString("ciudad"));
               lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
}
