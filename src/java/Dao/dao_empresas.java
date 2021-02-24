/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Empresas;
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
public class dao_empresas {

    private conexion conexion;
    private Empresas empresas;

    public dao_empresas() {
        this.conexion = new conexion();
    }
      
    public void setRegistrar(Empresas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO empresa (nombreempresa,telefono,ruc) VALUES ('" + u.getNombreempresa()+ "', '" + u.getTelefono()+ "', '" + u.getRuc()+ "')");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Empresas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE empresa SET nombreempresa='" + u.getNombreempresa()+ "', "
                    + "telefono='" + u.getTelefono()+ "', "
                    + "ruc='" + u.getRuc()+ "' "
                    + "WHERE idempresa='" + u.getIdempresa()+ "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void Elimininar(Empresas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM empresa WHERE idempresa='" + u.getIdempresa()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Empresas getempresa(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM empresa WHERE idempresa='" + id + "'");
            empresas=new Empresas();
            while (rs.next()) {
                empresas.setIdempresa(rs.getInt("idempresa"));
                empresas.setNombreempresa(rs.getString("nombreempresa"));
                empresas.setTelefono(rs.getString("telefono"));
                empresas.setRuc(rs.getString("ruc"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return empresas;
    }
    

    public ArrayList<Empresas> listaempresas() throws SQLException {
        ArrayList<Empresas> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select *from empresa order by idempresa asc");
            rs = ps.executeQuery();
            while (rs.next()) {
                Empresas a = new Empresas();
                a.setIdempresa(rs.getInt("idempresa"));
                a.setNombreempresa(rs.getString("nombreempresa"));
                a.setTelefono(rs.getString("telefono"));
                a.setRuc(rs.getString("ruc"));
                lista.add(a);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
}
