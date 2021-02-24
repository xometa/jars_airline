/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_empresas;
import Dao.dao_aviones;
import Entidades.Empresas;
import Entidades.Aviones;
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
public class ControladorAviones extends HttpServlet {

    int idavion;
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
            out.println("<title>Servlet ControladorAviones</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorAviones at " + request.getContextPath() + "</h1>");
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
        /*para las aerolineas*/
        if (request.getParameter("registrar") != null) {
            try {
                Empresas a = new Empresas();
                a.setNombreempresa(request.getParameter("nombreaerolinea"));
                a.setTelefono(request.getParameter("telefono"));
                a.setRuc(request.getParameter("ruc"));
                new dao_empresas().setRegistrar(a);
            } catch (SQLException e) {
                Logger.getLogger(ControladorAviones.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroavion.jsp").forward(request, response);
        }
        /*para los aviones*/
        if (request.getParameter("guardar") != null) {
            try {
                Aviones a = new Aviones();
                a.setModelo(request.getParameter("modelo"));
                a.setCapacidad(Integer.parseInt(request.getParameter("capacidad")));
                a.setEstado(request.getParameter("estado"));
                a.setIdaerolinea(Integer.parseInt(request.getParameter("aerolinea")));
                a.setNombre(request.getParameter("nombre"));
                a.setNumserie(request.getParameter("serie"));
                new dao_aviones().setRegistrar(a);
                request.setAttribute("destino", a);
            } catch (SQLException e) {
                Logger.getLogger(ControladorAviones.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroavion.jsp").forward(request, response);
        }
        if (request.getParameter("editar") != null) {
            try {
                dao_aviones autorrecuperado = new dao_aviones();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Aviones autormodificar = autorrecuperado.getavion(id);
                idavion = autormodificar.getIdavion();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registroavion.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorAviones.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("modificar") != null) {
            Aviones a = new Aviones();
            a.setIdavion(idavion);
            a.setModelo(request.getParameter("modelo"));
            a.setCapacidad(Integer.parseInt(request.getParameter("capacidad")));
            a.setEstado(request.getParameter("estado"));
            a.setIdaerolinea(Integer.parseInt(request.getParameter("aerolinea")));
            a.setNombre(request.getParameter("nombre"));
            a.setNumserie(request.getParameter("serie"));
            try {
                new dao_aviones().setModificar(a);
                request.setAttribute("modi", a);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorAviones.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registroavion.jsp").forward(request, response);
        }

        if (request.getParameter("borrar") != null) {
            try {
                dao_aviones te = new dao_aviones();
                String ID = request.getParameter("borrar");
                idavion = Integer.parseInt(ID);
                if (ne.buscaravion(idavion) != null) {
                    request.setAttribute("borrar2", te.getavion(idavion));
                } else {
                    te.Elimininar(new Dao.dao_aviones().getavion(idavion));
                    request.setAttribute("borrar1", te.getavion(idavion));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorAviones.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroavion.jsp").forward(request, response);
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
