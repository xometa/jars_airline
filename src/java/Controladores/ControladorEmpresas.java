/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_empresas;
import Entidades.Empresas;
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
public class ControladorEmpresas extends HttpServlet {

    Noeliminacion ne = new Noeliminacion();
    Norepeticion nr = new Norepeticion();
    int idempresa;

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
            out.println("<title>Servlet ControladorAerolineas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorAerolineas at " + request.getContextPath() + "</h1>");
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
                idempresa = Integer.parseInt(ID);
                dao_empresas t = new dao_empresas();
                if (ne.buscarempresa(idempresa) != null) {
                    request.setAttribute("borrar2", t.getempresa(idempresa));
                } else {
                    t.Elimininar(new Dao.dao_empresas().getempresa(idempresa));
                    request.setAttribute("borrar1", t.getempresa(idempresa));
                }

            } catch (SQLException e) {
                Logger.getLogger(ControladorEmpresas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroempresas.jsp").forward(request, response);
        }
        if (request.getParameter("guardar") != null) {
            try {
                Empresas a = new Empresas();
                a.setNombreempresa(request.getParameter("nombreempresas"));
                a.setTelefono(request.getParameter("telefono"));
                a.setRuc(request.getParameter("ruc"));
                String e = request.getParameter("nombreempresas");
                String h=request.getParameter("ruc");
                if (nr.buscarempresa(e,h) != null) {
                    request.setAttribute("destino1", a);
                } else {
                    new dao_empresas().setRegistrar(a);
                    request.setAttribute("destino", a);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorEmpresas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registroempresas.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Empresas a = new Empresas();
            a.setIdempresa(idempresa);
            a.setNombreempresa(request.getParameter("nombreempresas"));
            a.setTelefono(request.getParameter("telefono"));
            a.setRuc(request.getParameter("ruc"));

            try {
                new dao_empresas().setModificar(a);
                request.setAttribute("modi", a);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorEmpresas.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registroempresas.jsp").forward(request, response);
        }

        if (request.getParameter("editar") != null) {
            try {
                dao_empresas autorrecuperado = new dao_empresas();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Empresas autormodificar = autorrecuperado.getempresa(id);
                idempresa = autormodificar.getIdempresa();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registroempresas.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorEmpresas.class.getName()).log(Level.SEVERE, null, ex);
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
