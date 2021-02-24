/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Conexion.conexion;
import Entidades.Asientos;
import Entidades.Aviones;
import Entidades.Destinos;
import Entidades.Origenes;
import Entidades.Pasajeros;
import Entidades.Reservas;
import Entidades.Usuarios;
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
public class dao_reservas {

    private conexion conexion;
    private Reservas reservas;

    public dao_reservas() {
        this.conexion = new conexion();
    }

    public void setRegistrar(Reservas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("INSERT INTO reserva (clase,fecharegreso,idpasajero,idusuario,idasiento,estadoreserva,codigo,fechareserva,idvuelo,estadopago) "
                    + "VALUES ('" + u.getClase() + "', '" + u.getFecharegreso() + "', '" + u.getIdpasajero() + "', '" + u.getIdusuario() + "', "
                    + "'" + u.getIdasiento() + "','" + u.getEstadoreserva() + "', '" + u.getCodigo() + "', '" + u.getFechareserva() + "', '" + u.getIdvuelo() + "', '" + u.getEstadopago() + "')");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR:" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificar(Reservas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE reserva SET clase='" + u.getClase() + "', "
                    + "fecharegreso='" + u.getFecharegreso() + "', "
                    + "idpasajero='" + u.getIdpasajero() + "', "
                    + "idusuario='" + u.getIdusuario() + "', "
                    + "idasiento='" + u.getIdasiento() + "', "
                    + "estadoreserva='" + u.getEstadoreserva() + "', "
                    + "codigo='" + u.getCodigo() + "', "
                    + "fechareserva='" + u.getFechareserva() + "', "
                    + "idvuelo='" + u.getIdvuelo() + "', "
                    + "estadopago='" + u.getEstadopago() + "' "
                    + "WHERE idreserva='" + u.getIdreserva() + "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void setModificarEstadoReserva(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("UPDATE reserva SET estadopago='Pagada' WHERE idreserva='" + id + "';");
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void Elimininar(Reservas u) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            st.executeUpdate("DELETE FROM reserva WHERE idreserva='" + u.getIdreserva() + "'");
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Reservas getreserva(int id) throws SQLException {
        try {
            this.conexion.getConexion();
            Statement st = this.conexion.getConexion().createStatement();
            ResultSet rs = st.executeQuery("select re.idreserva,\n"
                    + "re.clase,\n"
                    + "re.fecharegreso,\n"
                    + "p.idpasajero,\n"
                    + "p.nombre,\n"
                    + "p.apellido,\n"
                    + "usu.idusuario,\n"
                    + "(usu.nombre)as nombreuser,\n"
                    + "(usu.apellido) as apellidouser,\n"
                    + "asi.idasiento,\n"
                    + "(asi.nombre) as asientonombre,\n"
                    + "re.estadoreserva,\n"
                    + "re.codigo,\n"
                    + "v.idvuelo,\n"
                    + "v.fechasalida,\n"
                    + "v.fechallegada,\n"
                    + "v.horasalida,\n"
                    + "v.horallegada,\n"
                    + "v.costo,\n"
                    + "av.idavion,\n"
                    + "av.capacidad,\n"
                    + "av.estado,\n"
                    + "(av.nombre) as nombreavion,\n"
                    + "de.iddestino,\n"
                    + "(de.pais) as nombredestino,\n"
                    + "(de.ciudad) as nombreciudaddestino,\n"
                    + "(de.nombreaeropuerto)as nombreaeropuertodestino,\n"
                    + "(ori.pais) as nombreorigen,\n"
                    + "ori.idorigen,\n"
                    + "(ori.nombreaeropuerto)as nombreaeropuertoorigen,\n"
                    + "(ori.ciudad) as nombreciudadorigen,\n"
                    + "re.fechareserva,\n"
                    + "re.estadopago\n"
                    + "from reserva as re inner join pasajero as p on p.idpasajero=re.idpasajero \n"
                    + "inner join usuario as usu on usu.idusuario=re.idusuario\n"
                    + "inner join asiento as asi on asi.idasiento=re.idasiento\n"
                    + "inner join vuelo as v on v.idvuelo=re.idvuelo\n"
                    + "inner join avion as av on av.idavion=v.idavion\n"
                    + "inner join destino as de on de.iddestino=v.iddestino\n"
                    + "inner join origen as ori on ori.idorigen=v.idorigen \n"
                    + "where re.idreserva='" + id + "'");
            while (rs.next()) {
                reservas = new Reservas(rs.getInt("idreserva"),
                        rs.getString("clase"),
                        rs.getString("fecharegreso"),
                        new Pasajeros(rs.getInt("idpasajero"), rs.getString("nombre"), rs.getString("apellido")),
                        new Usuarios(rs.getInt("idusuario"), rs.getString("nombreuser"), rs.getString("apellidouser")),
                        new Asientos(rs.getInt("idasiento"), rs.getString("asientonombre")),
                        rs.getString("estadoreserva"),
                        rs.getString("codigo"),
                        new Vuelo(rs.getInt("idvuelo"),
                                rs.getString("fechasalida"),
                                rs.getString("fechallegada"),
                                rs.getString("horasalida"),
                                rs.getString("horallegada"),
                                rs.getDouble("costo"),
                                new Aviones(rs.getInt("idavion"), rs.getInt("capacidad"), rs.getString("estado"), rs.getString("nombreavion")),
                                new Destinos(rs.getInt("iddestino"), rs.getString("nombredestino"), rs.getString("nombreciudaddestino"), rs.getString("nombreaeropuertodestino")),
                                new Origenes(rs.getString("nombreorigen"), rs.getInt("idorigen"), rs.getString("nombreciudadorigen"), rs.getString("nombreaeropuertoorigen"))),
                        rs.getString("fechareserva"),
                        rs.getString("estadopago"));
            }
            conexion.cerrarConexiones();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return reservas;
    }

    public ArrayList<Reservas> listadoreservas() throws SQLException {
        ArrayList<Reservas> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select re.idreserva,\n"
                    + "re.clase,\n"
                    + "re.fecharegreso,\n"
                    + "p.idpasajero,\n"
                    + "p.nombre,\n"
                    + "p.apellido,\n"
                    + "usu.idusuario,\n"
                    + "(usu.nombre)as nombreuser,\n"
                    + "(usu.apellido) as apellidouser,\n"
                    + "asi.idasiento,\n"
                    + "(asi.nombre) as asientonombre,\n"
                    + "re.estadoreserva,\n"
                    + "re.codigo,\n"
                    + "v.idvuelo,\n"
                    + "v.fechasalida,\n"
                    + "v.fechallegada,\n"
                    + "v.horasalida,\n"
                    + "v.horallegada,\n"
                    + "v.costo,\n"
                    + "av.idavion,\n"
                    + "av.capacidad,\n"
                    + "av.estado,\n"
                    + "(av.nombre) as nombreavion,\n"
                    + "de.iddestino,\n"
                    + "(de.pais) as nombredestino,\n"
                    + "(de.ciudad) as nombreciudaddestino,\n"
                    + "(de.nombreaeropuerto)as nombreaeropuertodestino,\n"
                    + "(ori.pais) as nombreorigen,\n"
                    + "ori.idorigen,\n"
                    + "(ori.nombreaeropuerto)as nombreaeropuertoorigen,\n"
                    + "(ori.ciudad) as nombreciudadorigen,\n"
                    + "re.fechareserva,\n"
                    + "re.estadopago \n"
                    + "from reserva as re inner join pasajero as p on p.idpasajero=re.idpasajero \n"
                    + "inner join usuario as usu on usu.idusuario=re.idusuario\n"
                    + "inner join asiento as asi on asi.idasiento=re.idasiento\n"
                    + "inner join vuelo as v on v.idvuelo=re.idvuelo\n"
                    + "inner join avion as av on av.idavion=v.idavion\n"
                    + "inner join destino as de on de.iddestino=v.iddestino\n"
                    + "inner join origen as ori on ori.idorigen=v.idorigen\n"
                    + "order by re.idreserva asc");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reservas t = new Reservas(rs.getInt("idreserva"),
                        rs.getString("clase"),
                        rs.getString("fecharegreso"),
                        new Pasajeros(rs.getInt("idpasajero"), rs.getString("nombre"), rs.getString("apellido")),
                        new Usuarios(rs.getInt("idusuario"), rs.getString("nombreuser"), rs.getString("apellidouser")),
                        new Asientos(rs.getInt("idasiento"), rs.getString("asientonombre")),
                        rs.getString("estadoreserva"),
                        rs.getString("codigo"),
                        new Vuelo(rs.getInt("idvuelo"),
                                rs.getString("fechasalida"),
                                rs.getString("fechallegada"),
                                rs.getString("horasalida"),
                                rs.getString("horallegada"),
                                rs.getDouble("costo"),
                                new Aviones(rs.getInt("idavion"), rs.getInt("capacidad"), rs.getString("estado"), rs.getString("nombreavion")),
                                new Destinos(rs.getInt("iddestino"), rs.getString("nombredestino"), rs.getString("nombreciudaddestino"), rs.getString("nombreaeropuertodestino")),
                                new Origenes(rs.getString("nombreorigen"), rs.getInt("idorigen"), rs.getString("nombreciudadorigen"), rs.getString("nombreaeropuertoorigen"))),
                        rs.getString("fechareserva"),
                        rs.getString("estadopago"));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }

    public ArrayList<Reservas> listadoreservaspagadas() throws SQLException {
        ArrayList<Reservas> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select re.idreserva,re.codigo,re.estadopago from reserva as re where re.estadopago='Pagada'");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reservas t = new Reservas(rs.getInt("idreserva"), rs.getString("codigo"), rs.getString("estadopago"));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }

    public ArrayList<Reservas> listadoreservasnopagadas() throws SQLException {
        ArrayList<Reservas> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select re.idreserva,re.codigo,re.estadopago from reserva as re where re.estadopago='No pagada'");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reservas t = new Reservas(rs.getInt("idreserva"), rs.getString("codigo"), rs.getString("estadopago"));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }

    public int reservasnuevas() throws SQLException {
        int n = 0;
        ResultSet rs = null;
        try {
            String sql = "select count(re.idreserva)as cantidad from reserva as re where re.fechareserva=CURRENT_DATE";
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

    public int cantreservasnopagadas() throws SQLException {
        ResultSet rs = null;
        int notpay = 0;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select count(re.idreserva)as nopagada from reserva as re where re.estadopago='No pagada'");
            rs = ps.executeQuery();
            while (rs.next()) {
                notpay = rs.getInt("nopagada");
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return notpay;
    }
    
    public ArrayList<Reservas> listadoreservasempleado(int id) throws SQLException {
        ArrayList<Reservas> lista = new ArrayList<>();
        ResultSet rs = null;
        try {
            Connection accesoDB = conexion.getConexion();
            PreparedStatement ps = accesoDB.prepareStatement("select re.idreserva,\n"
                    + "re.clase,\n"
                    + "re.fecharegreso,\n"
                    + "p.idpasajero,\n"
                    + "p.nombre,\n"
                    + "p.apellido,\n"
                    + "usu.idusuario,\n"
                    + "(usu.nombre)as nombreuser,\n"
                    + "(usu.apellido) as apellidouser,\n"
                    + "asi.idasiento,\n"
                    + "(asi.nombre) as asientonombre,\n"
                    + "re.estadoreserva,\n"
                    + "re.codigo,\n"
                    + "v.idvuelo,\n"
                    + "v.fechasalida,\n"
                    + "v.fechallegada,\n"
                    + "v.horasalida,\n"
                    + "v.horallegada,\n"
                    + "v.costo,\n"
                    + "av.idavion,\n"
                    + "av.capacidad,\n"
                    + "av.estado,\n"
                    + "(av.nombre) as nombreavion,\n"
                    + "de.iddestino,\n"
                    + "(de.pais) as nombredestino,\n"
                    + "(de.ciudad) as nombreciudaddestino,\n"
                    + "(de.nombreaeropuerto)as nombreaeropuertodestino,\n"
                    + "(ori.pais) as nombreorigen,\n"
                    + "ori.idorigen,\n"
                    + "(ori.nombreaeropuerto)as nombreaeropuertoorigen,\n"
                    + "(ori.ciudad) as nombreciudadorigen,\n"
                    + "re.fechareserva,\n"
                    + "re.estadopago \n"
                    + "from reserva as re inner join pasajero as p on p.idpasajero=re.idpasajero \n"
                    + "inner join usuario as usu on usu.idusuario=re.idusuario\n"
                    + "inner join asiento as asi on asi.idasiento=re.idasiento\n"
                    + "inner join vuelo as v on v.idvuelo=re.idvuelo\n"
                    + "inner join avion as av on av.idavion=v.idavion\n"
                    + "inner join destino as de on de.iddestino=v.iddestino\n"
                    + "inner join origen as ori on ori.idorigen=v.idorigen\n"
                    + " where usu.idusuario='"+id+"' order by re.idreserva asc");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reservas t = new Reservas(rs.getInt("idreserva"),
                        rs.getString("clase"),
                        rs.getString("fecharegreso"),
                        new Pasajeros(rs.getInt("idpasajero"), rs.getString("nombre"), rs.getString("apellido")),
                        new Usuarios(rs.getInt("idusuario"), rs.getString("nombreuser"), rs.getString("apellidouser")),
                        new Asientos(rs.getInt("idasiento"), rs.getString("asientonombre")),
                        rs.getString("estadoreserva"),
                        rs.getString("codigo"),
                        new Vuelo(rs.getInt("idvuelo"),
                                rs.getString("fechasalida"),
                                rs.getString("fechallegada"),
                                rs.getString("horasalida"),
                                rs.getString("horallegada"),
                                rs.getDouble("costo"),
                                new Aviones(rs.getInt("idavion"), rs.getInt("capacidad"), rs.getString("estado"), rs.getString("nombreavion")),
                                new Destinos(rs.getInt("iddestino"), rs.getString("nombredestino"), rs.getString("nombreciudaddestino"), rs.getString("nombreaeropuertodestino")),
                                new Origenes(rs.getString("nombreorigen"), rs.getInt("idorigen"), rs.getString("nombreciudadorigen"), rs.getString("nombreaeropuertoorigen"))),
                        rs.getString("fechareserva"),
                        rs.getString("estadopago"));
                lista.add(t);
            }
            conexion.cerrarConexiones();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e, "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return lista;
    }
}
