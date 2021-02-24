/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Usuarios;
import Validaciones.Encriptacion;
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
public class dao_usuarios {
    private conexion conexion;
    private Usuarios user;
        Encriptacion e=new Encriptacion();
        String j;

    public dao_usuarios() {
        this.conexion = new conexion();
    }
    
    public void setRegistrar(Usuarios u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO usuario(nombreusuario, sexo,tipo,contrasenia,nombre,apellido) VALUES ('" + u.getNombreusuario()+ "', '" + u.getSexo()+ "', '" + u.getTipo()+ "',"
                    + " '" + u.getContrasena()+ "', '" + u.getNombre()+ "', '" + u.getApellido()+ "')");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Usuarios u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE usuario SET nombreusuario='" + u.getNombreusuario()+ "', "
                    + "sexo='" + u.getSexo()+ "', "
                    + "tipo='" + u.getTipo()+ "', "
                    + "contrasenia='" + u.getContrasena()+ "', "
                    + "nombre='" + u.getNombre()+ "', "
                    + "apellido='" + u.getApellido()+ "' "
                    + "WHERE idusuario='" + u.getIdusuario() + "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void setModificaringresar(Usuarios u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE usuario SET nombreusuario='" + u.getNombreusuario()+ "', "
                    + "sexo='" + u.getSexo()+ "', "
                    + "tipo='" + u.getTipo()+ "', "
                    + "nombre='" + u.getNombre()+ "', "
                    + "apellido='" + u.getApellido()+ "' "
                    + "WHERE idusuario='" + u.getIdusuario() + "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void Elimininar(Usuarios u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM usuario WHERE idusuario='" + u.getIdusuario()+ "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public Usuarios getuser(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE idusuario='" + id + "'");
            user=new Usuarios();
            while (rs.next()) {
                user.setIdusuario(rs.getInt("idusuario"));
                user.setNombreusuario(rs.getString("nombreusuario"));
                user.setSexo(rs.getString("sexo"));
                user.setTipo(rs.getString("tipo"));
                user.setContrasena(rs.getString("contrasenia"));
                user.setNombre(rs.getString("nombre"));
                user.setApellido(rs.getString("apellido"));
            }
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return user;
    }
    
     public ArrayList<Usuarios> listadousuarios() throws SQLException {
        ArrayList<Usuarios> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select *from usuario");
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setIdusuario(rs.getInt("idusuario"));
                usuario.setNombreusuario(rs.getString("nombreusuario"));
                usuario.setSexo(rs.getString("sexo"));
                usuario.setTipo(rs.getString("tipo"));
                usuario.setContrasena(rs.getString("contrasenia"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                lista.add(usuario);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
}
