/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_pagos;
import Dao.dao_reservas;
import Entidades.Pagos;
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
public class ControladorPagosReservas extends HttpServlet {

    int idpago;

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
            out.println("<title>Servlet ControladorPagosReservas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPagosReservas at " + request.getContextPath() + "</h1>");
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
                Pagos cl = new Pagos();
                int r = Integer.parseInt(request.getParameter("reserva"));
                cl.setFormapago(request.getParameter("formapago"));
                cl.setCosto(Double.parseDouble(request.getParameter("costo")));
                cl.setIdtarjeta(Integer.parseInt(request.getParameter("titular")));
                cl.setIdreserva(r);
                new Dao.dao_pagos().setRegistrar(cl);
                new dao_reservas().setModificarEstadoReserva(r);
                request.setAttribute("destino", cl);
            } catch (SQLException e) {
                Logger.getLogger(ControladorPagosReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registropagos.jsp").forward(request, response);
        }
        if (request.getParameter("editar") != null) {
            try {
                dao_pagos autorrecuperado = new dao_pagos();
                String ID = request.getParameter("editar");
                int id = Integer.parseInt(ID);
                Pagos autormodificar = autorrecuperado.getpagos(id);
                idpago = autormodificar.getIdpago();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registropagos.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorPagosReservas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("borrar") != null) {
            try {
                String ID = request.getParameter("borrar");
                idpago = Integer.parseInt(ID);
                new Dao.dao_pagos().Elimininar(new Dao.dao_pagos().getpagos(idpago));
            } catch (SQLException e) {
                Logger.getLogger(ControladorPagosReservas.class.getName()).log(Level.SEVERE, null, e);
            }
            System.out.println(request.getParameter("borrar"));
            request.getRequestDispatcher("registropagos.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Pagos cl = new Pagos();
            cl.setIdpago(idpago);
            cl.setFormapago(request.getParameter("formapago"));
            cl.setCosto(Double.parseDouble(request.getParameter("costo")));
            cl.setIdtarjeta(Integer.parseInt(request.getParameter("titular")));
            cl.setIdreserva(Integer.parseInt(request.getParameter("reserva")));
            try {
                new Dao.dao_pagos().setModificar(cl);
                request.setAttribute("modi", cl);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorPagosReservas.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registropagos.jsp").forward(request, response);
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
