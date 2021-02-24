/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Pasajeros;
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
public class dao_pasajeros {

    private conexion conexion;
    Pasajeros pasajeros;

    public dao_pasajeros() {
        this.conexion = new conexion();
    }

    public void setRegistrar(Pasajeros u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO documento(tipo, fechacaducidad,nacionalidad,numerodocumento) VALUES ('" + u.getTipo() + "', '" + u.getFechacaducidad() + "', '" + u.getNacionalidad() + "','" + u.getNumerodocumento() + "')");
            Statement st2 = this.conexion.getConexion().createStatement();
            st2.executeUpdate("INSERT INTO pasajero(idpasajero,nombre,apellido,sexo,edad,telefono,direccion,correo) VALUES ((select iddocumento from documento order by iddocumento desc LIMIT 1), '" + u.getNombre() + "', '" + u.getApellido() + "', '" + u.getSexo() + "','" + u.getEdad() + "','" + u.getTelefono() + "','" + u.getDireccion() + "','" + u.getCorreo() + "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Pasajeros u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE documento SET tipo='" + u.getTipo() + "', "
                    + "fechacaducidad='" + u.getFechacaducidad() + "', "
                    + "nacionalidad='" + u.getNacionalidad() + "', "
                    + "numerodocumento='" + u.getNumerodocumento() + "' "
                    + "WHERE iddocumento='" + u.getIddocumento() + "';");

            Statement st2 = this.conexion.getConexion().createStatement();
            st2.executeUpdate("UPDATE pasajero SET nombre='" + u.getNombre() + "', "
                    + "apellido='" + u.getApellido() + "', "
                    + "sexo='" + u.getSexo() + "', "
                    + "edad='" + u.getEdad() + "', "
                    + "telefono='" + u.getTelefono() + "', "
                    + "direccion='" + u.getDireccion() + "', "
                    + "correo='" + u.getCorreo() + "' "
                    + "WHERE idpasajero='" + u.getIddocumento() + "';");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void Elimininar(Pasajeros u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st2 = this.conexion.getConexion().createStatement();
            st2.executeUpdate("DELETE FROM pasajero WHERE idpasajero='" + u.getIddocumento() + "'");
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM documento WHERE iddocumento='" + u.getIddocumento() + "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Pasajeros getpasajero(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("select pa.idpasajero,doc.iddocumento, pa.nombre,pa.apellido,pa.sexo,pa.edad,\n"
                    + "pa.telefono,pa.direccion,pa.correo,doc.tipo,\n"
                    + "doc.numerodocumento,doc.fechacaducidad,doc.nacionalidad\n"
                    + " from pasajero as pa inner join documento as doc \n"
                    + "on doc.iddocumento=pa.idpasajero where doc.iddocumento='" + id + "'");
            pasajeros = new Pasajeros();
            while (rs.next()) {
                pasajeros.setIdpasajero(rs.getInt("idpasajero"));
                pasajeros.setIddocumento(rs.getInt("iddocumento"));
                pasajeros.setNombre(rs.getString("nombre"));
                pasajeros.setApellido(rs.getString("apellido"));
                pasajeros.setSexo(rs.getString("sexo"));
                pasajeros.setEdad(rs.getInt("edad"));
                pasajeros.setTelefono(rs.getString("telefono"));
                pasajeros.setDireccion(rs.getString("direccion"));
                pasajeros.setCorreo(rs.getString("correo"));
                pasajeros.setTipo(rs.getString("tipo"));
                pasajeros.setNumerodocumento(rs.getString("numerodocumento"));
                pasajeros.setFechacaducidad(rs.getString("fechacaducidad"));
                pasajeros.setNacionalidad(rs.getString("nacionalidad"));
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return pasajeros;
    }

    public ArrayList<Pasajeros> listadopasajeros() throws SQLException {
        ArrayList<Pasajeros> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select pa.idpasajero,doc.iddocumento, pa.nombre,pa.apellido,pa.sexo,pa.edad,\n"
                    + "pa.telefono,pa.direccion,pa.correo,doc.tipo,\n"
                    + "doc.numerodocumento,doc.fechacaducidad,doc.nacionalidad\n"
                    + " from pasajero as pa inner join documento as doc \n"
                    + "on doc.iddocumento=pa.idpasajero");
            rs = ps.executeQuery();
            while (rs.next()) {
                Pasajeros t = new Pasajeros();
                t.setIdpasajero(rs.getInt("idpasajero"));
                t.setIddocumento(rs.getInt("iddocumento"));
                t.setNombre(rs.getString("nombre"));
                t.setApellido(rs.getString("apellido"));
                t.setSexo(rs.getString("sexo"));
                t.setEdad(rs.getInt("edad"));
                t.setTelefono(rs.getString("telefono"));
                t.setDireccion(rs.getString("direccion"));
                t.setCorreo(rs.getString("correo"));
                t.setTipo(rs.getString("tipo"));
                t.setNumerodocumento(rs.getString("numerodocumento"));
                t.setFechacaducidad(rs.getString("fechacaducidad"));
                t.setNacionalidad(rs.getString("nacionalidad"));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }

}
