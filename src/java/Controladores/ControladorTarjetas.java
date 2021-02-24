/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_tarjetas;
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
 * @author Hernandez
 */
public class ControladorTarjetas extends HttpServlet {

    int idtarjeta;
    Noeliminacion ne=new Noeliminacion();
    Norepeticion nr=new Norepeticion();

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
            out.println("<title>Servlet ControladorTarjetas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorTarjetas at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("cancelar") != null) {
            request.getRequestDispatcher("registrotarjetas.jsp").forward(request, response);
        }
        if (request.getParameter("borrar") != null) {
            try {
                String ID = request.getParameter("borrar");
                idtarjeta = Integer.parseInt(ID);
                dao_tarjetas t=new dao_tarjetas();
                if (ne.buscartarjeta(idtarjeta) != null) {
                    request.setAttribute("borrar2", t.gettarjetas(idtarjeta));
                } else {
                t.Elimininar(new Dao.dao_tarjetas().gettarjetas(idtarjeta));
                    request.setAttribute("borrar1", t.gettarjetas(idtarjeta));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorTarjetas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrotarjetas.jsp").forward(request, response);
        }
        if (request.getParameter("guardar") != null) {
            try {
                Tarjetas t = new Tarjetas();
                t.setNombre(request.getParameter("nombredeltitular"));
                t.setFecha(request.getParameter("fechadecaducidad"));
                t.setCodigo(request.getParameter("codseguridad"));
                String cod=request.getParameter("codseguridad");
                if (nr.buscartarjeta(cod) != null) {
                    request.setAttribute("destino1", t);
                } else {
                new dao_tarjetas().setRegistrar(t);
                    request.setAttribute("destino", t);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorTarjetas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrotarjetas.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Tarjetas t = new Tarjetas();
            t.setIdtarjeta(idtarjeta);
            t.setNombre(request.getParameter("nombredeltitular"));
            t.setFecha(request.getParameter("fechadecaducidad"));
            t.setCodigo(request.getParameter("codseguridad"));

            try {
                new dao_tarjetas().setModificar(t);
                request.setAttribute("modi", t);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorTarjetas.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registrotarjetas.jsp").forward(request, response);
        }

        if (request.getParameter("editar") != null) {
            try {
                dao_tarjetas autorrecuperado = new dao_tarjetas();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Tarjetas autormodificar = autorrecuperado.gettarjetas(id);
                idtarjeta = autormodificar.getIdtarjeta();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registrotarjetas.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorTarjetas.class.getName()).log(Level.SEVERE, null, ex);
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
