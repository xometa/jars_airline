/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Aviones;
import Entidades.Destinos;
import Entidades.Origenes;
import Entidades.Reservas;
import Entidades.Vuelo;
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
public class dao_vuelos {

    private conexion conexion;
    private Vuelo vuelo;

    public dao_vuelos() {
        this.conexion = new conexion();
    }

    public void setRegistrar(Vuelo u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO vuelo (fechasalida,fechallegada,idavion,iddestino,idorigen,horasalida,horallegada,costo) "
                    + "VALUES ('" + u.getFechasalida() + "', '" + u.getFechallegada() + "', '" + u.getIdavion() + "', '" + u.getIddestino() + "', "
                    + "'" + u.getIdorigen() + "','" + u.getHorasalida() + "', '" + u.getHorallegada() + "', '" + u.getCosto() + "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Vuelo u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE vuelo SET fechasalida='" + u.getFechasalida() + "', "
                    + "fechallegada='" + u.getFechallegada() + "', "
                    + "idavion='" + u.getIdavion() + "', "
                    + "iddestino='" + u.getIddestino() + "', "
                    + "idorigen='" + u.getIdorigen() + "', "
                    + "horasalida='" + u.getHorasalida() + "', "
                    + "horallegada='" + u.getHorallegada() + "', "
                    + "costo='" + u.getCosto() + "' "
                    + "WHERE idvuelo='" + u.getIdvuelo() + "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void Elimininar(Vuelo u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM vuelo WHERE idvuelo='" + u.getIdvuelo() + "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Vuelo getvuelo(int id) throws SQLException {
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select v.idvuelo,\n"
                    + "v.fechasalida,\n"
                    + "v.fechallegada,\n"
                    + "v.horasalida,\n"
                    + "v.horallegada,\n"
                    + "v.costo,\n"
                    + "av.idavion,\n"
                    + "av.capacidad,\n"
                    + "av.estado,\n"
                    + "av.nombre,\n"
                    + "de.iddestino,\n"
                    + "(de.pais) as nombredestino,\n"
                    + "(de.ciudad) as nombreciudaddestino,\n"
                    + "(de.nombreaeropuerto)as nombreaeropuertodestino,\n"
                    + "(ori.pais) as nombreorigen, \n"
                    + "ori.idorigen,\n"
                    + "(ori.nombreaeropuerto)as nombreaeropuertoorigen,\n"
                    + "(ori.ciudad) as nombreciudadorigen \n"
                    + "from vuelo as v \n"
                    + "inner join avion as av on av.idavion=v.idavion \n"
                    + "inner join destino as de on de.iddestino=v.iddestino \n"
                    + "inner join origen as ori on ori.idorigen=v.idorigen  \n"
                    + "where v.idvuelo='" + id + "'");
            rs = ps.executeQuery();
            while (rs.next()) {
                vuelo = new Vuelo(rs.getInt("idvuelo"),
                        rs.getString("fechasalida"),
                        rs.getString("fechallegada"),
                        rs.getString("horasalida"),
                        rs.getString("horallegada"),
                        rs.getDouble("costo"),
                        new Aviones(rs.getInt("idavion"), rs.getInt("capacidad"), rs.getString("estado"), rs.getString("nombre")),
                        new Destinos(rs.getInt("iddestino"), rs.getString("nombredestino"), rs.getString("nombreciudaddestino"), rs.getString("nombreaeropuertodestino")),
                        new Origenes(rs.getString("nombreorigen"), rs.getInt("idorigen"), rs.getString("nombreciudadorigen"), rs.getString("nombreaeropuertoorigen")));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return vuelo;
    }

    public ArrayList<Vuelo> listadovuelos() throws SQLException {
        ArrayList<Vuelo> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select v.idvuelo,\n"
                    + "v.fechasalida,\n"
                    + "v.fechallegada,\n"
                    + "v.horasalida,\n"
                    + "v.horallegada,\n"
                    + "v.costo,\n"
                    + "av.idavion,\n"
                    + "av.capacidad,\n"
                    + "av.estado,\n"
                    + "av.nombre,\n"
                    + "de.iddestino,\n"
                    + "(de.pais) as nombredestino,\n"
                    + "(de.ciudad) as nombreciudaddestino,\n"
                    + "(de.nombreaeropuerto)as nombreaeropuertodestino,\n"
                    + "(ori.pais) as nombreorigen, \n"
                    + "ori.idorigen,\n"
                    + "(ori.nombreaeropuerto)as nombreaeropuertoorigen,\n"
                    + "(ori.ciudad) as nombreciudadorigen \n"
                    + "from vuelo as v \n"
                    + "inner join avion as av on av.idavion=v.idavion \n"
                    + "inner join destino as de on de.iddestino=v.iddestino \n"
                    + "inner join origen as ori on ori.idorigen=v.idorigen  \n"
                    + "order by v.idvuelo asc");
            rs = ps.executeQuery();
            while (rs.next()) {
                Vuelo t = new Vuelo(rs.getInt("idvuelo"),
                        rs.getString("fechasalida"),
                        rs.getString("fechallegada"),
                        rs.getString("horasalida"),
                        rs.getString("horallegada"),
                        rs.getDouble("costo"),
                        new Aviones(rs.getInt("idavion"), rs.getInt("capacidad"), rs.getString("estado"), rs.getString("nombre")),
                        new Destinos(rs.getInt("iddestino"), rs.getString("nombredestino"), rs.getString("nombreciudaddestino"), rs.getString("nombreaeropuertodestino")),
                        new Origenes(rs.getString("nombreorigen"), rs.getInt("idorigen"), rs.getString("nombreciudadorigen"), rs.getString("nombreaeropuertoorigen")));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
}
