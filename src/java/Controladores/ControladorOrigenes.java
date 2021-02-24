/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_origen;
import Entidades.Origenes;
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
public class ControladorOrigenes extends HttpServlet {

    int idorigenes;

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
            out.println("<title>Servlet ControladorOrigenes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorOrigenes at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("borrar") != null) {
            try {
                String ID = request.getParameter("borrar");
                idorigenes = Integer.parseInt(ID);
                dao_origen t = new dao_origen();
                if (ne.buscarorigen(idorigenes) != null) {
                    request.setAttribute("borrar2", t.getorigen(idorigenes));
                } else {
                    t.Elimininar(new Dao.dao_origen().getorigen(idorigenes));
                    request.setAttribute("borrar1", t.getorigen(idorigenes));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorOrigenes.class.getName()).log(Level.SEVERE, null, e);
            }
            System.out.println(request.getParameter("borrar"));
            request.getRequestDispatcher("registroorigen.jsp").forward(request, response);
        }
        if (request.getParameter("guardar") != null) {
            try {
                Origenes t = new Origenes();
                t.setNombreaeropuerto(request.getParameter("nombreaeropuerto"));
                t.setPais(request.getParameter("pais"));
                t.setCiudad(request.getParameter("ciudad"));
                String pais = request.getParameter("pais");
                if (nr.buscarpaiso(pais) != null) {
                    request.setAttribute("destino1", t);
                } else {
                    new dao_origen().setRegistrar(t);
                    request.setAttribute("destino", t);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorOrigenes.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroorigen.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Origenes t = new Origenes();
            t.setIdorigen(idorigenes);
            t.setNombreaeropuerto(request.getParameter("nombreaeropuerto"));
            t.setPais(request.getParameter("pais"));
            t.setCiudad(request.getParameter("ciudad"));

            try {
                new dao_origen().setModificar(t);
                request.setAttribute("modi", t);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorOrigenes.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registroorigen.jsp").forward(request, response);
        }

        if (request.getParameter("editar") != null) {
            try {
                dao_origen autorrecuperado = new dao_origen();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Origenes autormodificar = autorrecuperado.getorigen(id);
                idorigenes = autormodificar.getIdorigen();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registroorigen.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorOrigenes.class.getName()).log(Level.SEVERE, null, ex);
            }
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
