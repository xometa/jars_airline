/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_asientos;
import Dao.dao_reservas;
import Dao.dao_vuelos;
import Entidades.Asientos;
import Entidades.Pasajeros;
import Entidades.Reservas;
import Entidades.Vuelo;
import Validaciones.Noeliminacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hernandez
 */
public class ControladorReservas extends HttpServlet {

    dao_reservas lista = new dao_reservas();
    int idreserva;
    Noeliminacion ne = new Noeliminacion();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorReservas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorReservas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*vuelos*/
        if (request.getParameter("addvuelo") != null) {
            try {
                dao_vuelos autorrecuperado = new dao_vuelos();
                String ID = request.getParameter("addvuelo");
                int id = Integer.parseInt(ID);
                Vuelo autormodificar = autorrecuperado.getvuelo(id);
//                idvuelo = autormodificar.getIdvuelo();
                request.setAttribute("modi", autormodificar);
                request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        /*reservas*/
        if (request.getParameter("editar") != null) {
            try {
                dao_reservas autorrecuperado = new dao_reservas();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Reservas autormodificar = autorrecuperado.getreserva(id);
                idreserva = autormodificar.getIdreserva();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("borrar") != null) {
            try {
                String ID = request.getParameter("borrar");
                idreserva = Integer.parseInt(ID);
                dao_reservas t = new dao_reservas();
                if (ne.buscarreserva(idreserva) != null) {
                    request.setAttribute("borrar2", t.getreserva(idreserva));
                } else {
                    t.Elimininar(new Dao.dao_reservas().getreserva(idreserva));
                    request.setAttribute("borrar12", t.getreserva(idreserva));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            System.out.println(request.getParameter("borrar"));
            request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
        }

        if (request.getParameter("guardar") != null) {
            try {
                Reservas a = new Reservas();
                a.setClase(request.getParameter("clase"));
                a.setFecharegreso(request.getParameter("fecharegreso"));
                a.setIdpasajero(Integer.parseInt(request.getParameter("idpasajero")));
                a.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
                a.setIdasiento(Integer.parseInt(request.getParameter("idasiento")));
                a.setIdvuelo(Integer.parseInt(request.getParameter("idvuelo")));
                a.setEstadopago(request.getParameter("estadopago"));
                a.setEstadoreserva(request.getParameter("estadoreserva"));
                a.setCodigo(request.getParameter("codigo"));
                a.setFechareserva(request.getParameter("fechareserva"));
                new dao_reservas().setRegistrar(a);
                request.setAttribute("destino", a);
            } catch (SQLException e) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Reservas a = new Reservas();
            a.setIdreserva(idreserva);
            a.setClase(request.getParameter("clase"));
            a.setFecharegreso(request.getParameter("fecharegreso"));
            a.setIdpasajero(Integer.parseInt(request.getParameter("idpasajero")));
            a.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
            a.setIdasiento(Integer.parseInt(request.getParameter("idasiento")));
            a.setIdvuelo(Integer.parseInt(request.getParameter("idvuelo")));
            a.setEstadopago(request.getParameter("estadopago"));
            a.setEstadoreserva(request.getParameter("estadoreserva"));
            a.setCodigo(request.getParameter("codigo"));
            a.setFechareserva(request.getParameter("fechareserva"));
            try {
                new dao_reservas().setModificar(a);
                request.setAttribute("modifr", a);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
        }
        if (request.getParameter("btnasiento") != null) {
            try {
                Asientos t = new Asientos();
                t.setNombre(request.getParameter("nombre"));
                t.setFila(Integer.parseInt(request.getParameter("fila")));
                t.setColumna(request.getParameter("columna"));
                new dao_asientos().setRegistrar(t);
            } catch (SQLException e) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
        }

        if (request.getParameter("btnpasajero") != null) {
            try {
                Pasajeros cl = new Pasajeros();
                cl.setNombre(request.getParameter("nombre"));
                cl.setApellido(request.getParameter("apellido"));
                cl.setSexo(request.getParameter("sexo"));
                cl.setEdad(Integer.parseInt(request.getParameter("edad")));
                cl.setTelefono(request.getParameter("telefono"));
                cl.setDireccion(request.getParameter("direccion"));
                cl.setCorreo(request.getParameter("correo"));

                cl.setTipo(request.getParameter("tipodocumento"));
                cl.setNumerodocumento(request.getParameter("numerodocumento"));
                cl.setFechacaducidad(request.getParameter("fechavencimiento"));
                cl.setNacionalidad(request.getParameter("nacionalidad"));

                new Dao.dao_pasajeros().setRegistrar(cl);
            } catch (SQLException e) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
        }

        if (request.getParameter("btnvuelo") != null) {
            try {
                Vuelo t = new Vuelo();
                t.setFechasalida(request.getParameter("fechasalida"));
                t.setFechallegada(request.getParameter("fechallegada"));
                t.setHorasalida(request.getParameter("horasalida"));
                t.setHorallegada(request.getParameter("horallegada"));
                t.setIdavion(Integer.parseInt(request.getParameter("idavion")));
                t.setIddestino(Integer.parseInt(request.getParameter("iddestino")));
                t.setCosto(Double.parseDouble(request.getParameter("costo")));
                t.setIdorigen(Integer.parseInt(request.getParameter("idorigen")));
                new dao_vuelos().setRegistrar(t);
            } catch (SQLException e) {
                Logger.getLogger(ControladorReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroreservas.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
