/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_destino;
import Entidades.Destinos;
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
public class ControladorDestinos extends HttpServlet {

    int iddestino;
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
            out.println("<title>Servlet ControladorDestinos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorDestinos at " + request.getContextPath() + "</h1>");
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
                iddestino = Integer.parseInt(ID);
                dao_destino t = new dao_destino();
                if (ne.buscardestino(iddestino) != null) {
                    request.setAttribute("borrar2", t.getdestino(iddestino));
                } else {
                    t.Elimininar(new Dao.dao_destino().getdestino(iddestino));
                    request.setAttribute("borrar1", t.getdestino(iddestino));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorDestinos.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrodestino.jsp").forward(request, response);
        }
        if (request.getParameter("guardar") != null) {
            try {
                Destinos t = new Destinos();
                t.setNombreaeropuerto(request.getParameter("nombreaeropuerto"));
                t.setPais(request.getParameter("pais"));
                t.setCiudad(request.getParameter("ciudad"));
                String pais = request.getParameter("pais");
                if (nr.buscarpais(pais) != null) {
                    request.setAttribute("destino1", t);
                } else {
                    new dao_destino().setRegistrar(t);
                    request.setAttribute("destino", t);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorDestinos.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrodestino.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Destinos t = new Destinos();
            t.setIddestino(iddestino);
            t.setNombreaeropuerto(request.getParameter("nombreaeropuerto"));
            t.setPais(request.getParameter("pais"));
            t.setCiudad(request.getParameter("ciudad"));

            try {
                new dao_destino().setModificar(t);
                request.setAttribute("modi", t);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorDestinos.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registrodestino.jsp").forward(request, response);
        }

        if (request.getParameter("editar") != null) {
            try {
                dao_destino autorrecuperado = new dao_destino();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Destinos autormodificar = autorrecuperado.getdestino(id);
                iddestino = autormodificar.getIddestino();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registrodestino.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorDestinos.class.getName()).log(Level.SEVERE, null, ex);
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
