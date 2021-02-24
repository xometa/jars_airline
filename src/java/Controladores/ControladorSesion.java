/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Comprobacion.ComprobarUsuario;
import Entidades.Usuarios;
import Validaciones.Encriptacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hernandez
 */
public class ControladorSesion extends HttpServlet {

    Usuarios user = new Usuarios();
    ComprobarUsuario com = new ComprobarUsuario();
    Encriptacion enc = new Encriptacion();

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
        if (request.getParameter("ingresar") != null) {
            try {
                String usuario = request.getParameter("usuario");
                String password = request.getParameter("contra");
                String encrip = Encriptacion.getStringMessageDigest(password, Encriptacion.MD5);
                user = com.buscar(usuario, encrip);
                if (user != null) {
                    HttpSession nueva_sesion = request.getSession();
                    HttpSession nueva_sesion1 = request.getSession();
                    HttpSession nueva_sesion2 = request.getSession();
                    HttpSession nueva_sesion3 = request.getSession();
                    nueva_sesion.setAttribute("user", user.getNombreusuario());
                    nueva_sesion1.setAttribute("nomuser", (user.getNombre()+" "+user.getApellido()));
                    nueva_sesion2.setAttribute("iduser", user.getIdusuario());
                    nueva_sesion3.setAttribute("tipo", user.getTipo());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("iniciosesion.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ControladorSesion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("cancelar") != null) {
            request.getRequestDispatcher("iniciosesion.jsp").forward(request, response);
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
        processRequest(request, response);
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
