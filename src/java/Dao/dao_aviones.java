/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Empresas;
import Entidades.Aviones;
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
public class dao_aviones {
    private conexion conexion;
    private Aviones aviones;

    public dao_aviones() {
        this.conexion = new conexion();
    }
    
    public void setRegistrar(Aviones u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO avion(modelo, capacidad,estado,idempresa,nombre,numserie) VALUES ('" + u.getModelo()+ "', '" + u.getCapacidad()+ "','" + u.getEstado()+ "','" + u.getIdaerolinea()+ "','" + u.getNombre()+ "', '" + u.getNumserie()+ "')");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Aviones u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE avion SET modelo='" + u.getModelo()+ "', "
                    + "capacidad='" + u.getCapacidad()+ "', "
                    + "estado='" + u.getEstado()+ "', "
                    + "idempresa='" + u.getIdaerolinea()+ "', "
                    + "nombre='" + u.getNombre()+ "', "
                    + "numserie='" + u.getNumserie()+ "' "
                    + "WHERE idavion='" + u.getIdavion()+ "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
        
    public void Elimininar(Aviones u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM avion WHERE idavion='" + u.getIdavion()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Aviones getavion(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("select avi.idavion,avi.modelo,avi.capacidad,avi.estado,em.idempresa,em.nombreempresa,avi.nombre,avi.numserie from avion as avi inner join empresa as em on em.idempresa=avi.idempresa where avi.idavion='"+ id +"'");

            while (rs.next()) {
                aviones = new Aviones(rs.getInt("idavion"), 
                        rs.getString("modelo"), 
                        rs.getInt("capacidad"), 
                        rs.getString("estado"),
                        new Empresas(rs.getInt("idempresa"), 
                                rs.getString("nombreempresa")), 
                        rs.getString("nombre"), 
                        rs.getString("numserie"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return aviones;
    }
    
    public ArrayList<Aviones> listadoaviones() throws SQLException {
        ArrayList<Aviones> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select avi.idavion,avi.modelo,avi.capacidad,avi.estado,em.idempresa,em.nombreempresa,avi.nombre,avi.numserie from avion as avi inner join empresa as em on em.idempresa=avi.idempresa");
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(new Aviones(rs.getInt("idavion"),rs.getString("modelo"),rs.getInt("capacidad"),rs.getString("estado"),
                        new Empresas(rs.getInt("idempresa"),rs.getString("nombreempresa")),rs.getString("nombre"),rs.getString("numserie")));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }

    public ArrayList<Aviones> listadoavionesdisponibles() throws SQLException {
        ArrayList<Aviones> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select v.idavion,v.nombre,v.estado,v.capacidad,v.modelo,v.numserie from avion as v where v.estado='Disponible'");
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(new Aviones(rs.getInt("idavion"), rs.getString("modelo"), rs.getInt("capacidad"), rs.getString("estado"), rs.getString("nombre"), rs.getString("numserie")));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }

    public int cantidadAvionesDisponibles() throws SQLException {
        int n = 0;
        ResultSet rs = null;
        try {
            String sql = "select count(avi.idavion)as cant from avion as avi where avi.estado='Disponible'";
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt("cant");
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return n;
    }
    public int cantaviones() throws SQLException {
        ResultSet rs = null;
        int cant = 0;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select count(d.idavion) as  cant from avion as d");
            rs = ps.executeQuery();
            while (rs.next()) {
                cant = rs.getInt("cant");
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return cant;
    }
}
