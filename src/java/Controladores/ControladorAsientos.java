/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_asientos;
import Dao.dao_tarjetas;
import Entidades.Asientos;
import Entidades.Tarjetas;
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
 * @author Alex
 */
public class ControladorAsientos extends HttpServlet {

    int idasiento;
    Norepeticion nr = new Norepeticion();
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
            out.println("<title>Servlet ControladorAsientos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorAsientos at " + request.getContextPath() + "</h1>");
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
                idasiento = Integer.parseInt(ID);
                dao_asientos t = new dao_asientos();
                if (ne.buscarasiento(idasiento) != null) {
                    request.setAttribute("borrar2", t.getasientos(idasiento));
                } else {
                    t.Elimininar(new Dao.dao_asientos().getasientos(idasiento));
                    request.setAttribute("borrar1", t.getasientos(idasiento));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorAsientos.class.getName()).log(Level.SEVERE, null, e);
            }
            System.out.println(request.getParameter("borrar"));
            request.getRequestDispatcher("registroasientos.jsp").forward(request, response);
        }
        if (request.getParameter("guardar") != null) {
            try {
                Asientos t = new Asientos();
                t.setNombre(request.getParameter("nombre"));
                t.setFila(Integer.parseInt(request.getParameter("fila")));
                t.setColumna(request.getParameter("columna"));

                int f = Integer.parseInt(request.getParameter("fila"));
                String c = request.getParameter("columna");
                if (nr.buscarasiento(f, c) != null) {
                    request.setAttribute("destino1", t);
                } else {
                    new dao_asientos().setRegistrar(t);
                    request.setAttribute("destino", t);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorAsientos.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroasientos.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Asientos t = new Asientos();
            t.setIdasiento(idasiento);
            t.setNombre(request.getParameter("nombre"));
            t.setFila(Integer.parseInt(request.getParameter("fila")));
            t.setColumna(request.getParameter("columna"));

            try {
                new dao_asientos().setModificar(t); 
                request.setAttribute("modi", t);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorAsientos.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registroasientos.jsp").forward(request, response);
        }

        if (request.getParameter("editar") != null) {
            try {
                dao_asientos autorrecuperado = new dao_asientos();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Asientos autormodificar = autorrecuperado.getasientos(id);
                idasiento = autormodificar.getIdasiento();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registroasientos.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorAsientos.class.getName()).log(Level.SEVERE, null, ex);
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
