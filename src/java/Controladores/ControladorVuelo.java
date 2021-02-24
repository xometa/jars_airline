/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_aviones;
import Dao.dao_destino;
import Dao.dao_origen;
import Dao.dao_vuelos;
import Entidades.Aviones;
import Entidades.Destinos;
import Entidades.Origenes;
import Entidades.Vuelo;
import Validaciones.Noeliminacion;
import Validaciones.Norepeticion;
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
public class ControladorVuelo extends HttpServlet {

    int idvuelo;
    Noeliminacion ne = new Noeliminacion();
    Norepeticion nr = new Norepeticion();

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
            out.println("<title>Servlet ControladorVuelo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorVuelo at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("guardar") != null) {
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
                int idav = Integer.parseInt(request.getParameter("idavion"));
                int idori = Integer.parseInt(request.getParameter("idorigen"));
                int iddes = Integer.parseInt(request.getParameter("iddestino"));

                if (nr.buscarvuelo(idav, idori, iddes) != null) {
                    request.setAttribute("destino1", t);
                } else {
                    new dao_vuelos().setRegistrar(t);
                    request.setAttribute("destino", t);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
        }

        if (request.getParameter("btneditar") != null) {
            try {
                dao_vuelos autorrecuperado = new dao_vuelos();
                String ID = request.getParameter("btneditar");
                int id = Integer.parseInt(ID);
                Vuelo autormodificar = autorrecuperado.getvuelo(id);
                idvuelo = autormodificar.getIdvuelo();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("borrar") != null) {
            try {
                String ID = request.getParameter("borrar");
                idvuelo = Integer.parseInt(ID);
                dao_vuelos t = new dao_vuelos();
                if (ne.buscarvuelos(idvuelo) != null) {
                    request.setAttribute("borrar2", t.getvuelo(idvuelo));
                } else {
                    t.Elimininar(new Dao.dao_vuelos().getvuelo(idvuelo));
                    request.setAttribute("borrar1", t.getvuelo(idvuelo));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Vuelo t = new Vuelo();
            t.setIdvuelo(idvuelo);
            t.setFechasalida(request.getParameter("fechasalida"));
            t.setFechallegada(request.getParameter("fechallegada"));
            t.setHorasalida(request.getParameter("horasalida"));
            t.setHorallegada(request.getParameter("horallegada"));
            t.setIdavion(Integer.parseInt(request.getParameter("idavion")));
            t.setIddestino(Integer.parseInt(request.getParameter("iddestino")));
            t.setCosto(Double.parseDouble(request.getParameter("costo")));
            t.setIdorigen(Integer.parseInt(request.getParameter("idorigen")));

            try {
                new dao_vuelos().setModificar(t);
                request.setAttribute("modi", t);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
        }

        if (request.getParameter("btnorigen") != null) {
            try {
                Origenes t = new Origenes();
                t.setNombreaeropuerto(request.getParameter("nombreaeropuerto"));
                t.setPais(request.getParameter("pais"));
                t.setCiudad(request.getParameter("ciudad"));
                new dao_origen().setRegistrar(t);
            } catch (SQLException e) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
        }

        if (request.getParameter("btndestino") != null) {
            try {
                Destinos t = new Destinos();
                t.setNombreaeropuerto(request.getParameter("nombreaeropuerto"));
                t.setPais(request.getParameter("pais"));
                t.setCiudad(request.getParameter("ciudad"));
                new dao_destino().setRegistrar(t);
            } catch (SQLException e) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
        }
        if (request.getParameter("btnavion") != null) {
            try {
                Aviones a = new Aviones();
                a.setModelo(request.getParameter("modelo"));
                a.setCapacidad(Integer.parseInt(request.getParameter("capacidad")));
                a.setEstado(request.getParameter("estado"));
                a.setIdaerolinea(Integer.parseInt(request.getParameter("aerolinea")));
                a.setNombre(request.getParameter("nombre"));
                a.setNumserie(request.getParameter("serie"));
                new dao_aviones().setRegistrar(a);
            } catch (SQLException e) {
                Logger.getLogger(ControladorVuelo.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrovuelos.jsp").forward(request, response);
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
