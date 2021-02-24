/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Destinos;
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
public class dao_destino {

    private conexion conexion;
    private Destinos destinos;

    public dao_destino() {
        this.conexion = new conexion();
    }

    public void setRegistrar(Destinos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO destino (nombreaeropuerto,pais,ciudad) "
                    + "VALUES ('" + u.getNombreaeropuerto() + "', '" + u.getPais() + "', '" + u.getCiudad() + "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Destinos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE destino SET nombreaeropuerto='" + u.getNombreaeropuerto() + "', "
                    + "pais='" + u.getPais() + "', "
                    + "ciudad='" + u.getCiudad() + "' "
                    + "WHERE iddestino='" + u.getIddestino() + "';");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void Elimininar(Destinos u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM destino WHERE iddestino='" + u.getIddestino() + "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Destinos getdestino(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM destino WHERE iddestino='" + id + "'");
            destinos = new Destinos();
            while (rs.next()) {
                destinos.setIddestino(rs.getInt("iddestino"));
                destinos.setNombreaeropuerto(rs.getString("nombreaeropuerto"));
                destinos.setPais(rs.getString("pais"));
                destinos.setCiudad(rs.getString("ciudad"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return destinos;
    }

    public int cantidadestino() throws SQLException {
        int n = 0;
        ResultSet rs = null;
        try {
            String sql = "select count(des.iddestino)as cantidad from destino as des";
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt("cantidad");
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return n;
    }

    public ArrayList<Destinos> listadodestinos() throws SQLException {
        ArrayList<Destinos> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select *from destino");
            rs = ps.executeQuery();
            while (rs.next()) {
                Destinos t = new Destinos();
                t.setIddestino(rs.getInt("iddestino"));
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
