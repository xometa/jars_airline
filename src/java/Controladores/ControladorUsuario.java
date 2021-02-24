/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_usuarios;
import Entidades.Usuarios;
import Validaciones.Encriptacion;
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
public class ControladorUsuario extends HttpServlet {

    int iduser;
    Encriptacion enc = new Encriptacion();
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
            out.println("<title>Servlet ControladorUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorUsuario at " + request.getContextPath() + "</h1>");
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
        /*new user*/
        if (request.getParameter("regresarinicio") != null) {
            request.getRequestDispatcher("iniciosesion.jsp").forward(request, response);
        }
        if (request.getParameter("guardarnewuser") != null) {
            try {
                Usuarios cl = new Usuarios();
                String pass = request.getParameter("contra");
                String encrip = Encriptacion.getStringMessageDigest(pass, Encriptacion.MD5);
                String oo = encrip;
                cl.setNombreusuario(request.getParameter("usuario"));
                cl.setSexo(request.getParameter("sexo"));
                cl.setTipo(request.getParameter("tipo"));
                cl.setContrasena(oo);
                cl.setNombre(request.getParameter("nombre"));
                cl.setApellido(request.getParameter("apellido"));
                new Dao.dao_usuarios().setRegistrar(cl);
            } catch (SQLException e) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("nuevouser.jsp").forward(request, response);
        }
        /*Usuerios*/
        if (request.getParameter("borrar") != null) {
            try {
                dao_usuarios t = new dao_usuarios();
                String ID = request.getParameter("borrar");
                iduser = Integer.parseInt(ID);
                if (ne.buscaruser(iduser) != null) {
                    request.setAttribute("borrar2", t.getuser(iduser));
                } else {
                    t.Elimininar(new Dao.dao_usuarios().getuser(iduser));
                    request.setAttribute("borrar1", t.getuser(iduser));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, e);
            }
            System.out.println(request.getParameter("borrar"));
            request.getRequestDispatcher("registrousuarios.jsp").forward(request, response);
        }
        if (request.getParameter("guardar") != null) {
            try {
                Usuarios cl = new Usuarios();
                String uu = request.getParameter("nombreusuario");
                String pass = request.getParameter("contrasenia");
                String encrip = Encriptacion.getStringMessageDigest(pass, Encriptacion.MD5);
                String oo = encrip;
                cl.setNombreusuario(request.getParameter("nombreusuario"));
                cl.setSexo(request.getParameter("sexo"));
                cl.setTipo(request.getParameter("tipo"));
                cl.setContrasena(oo);
                cl.setNombre(request.getParameter("nombre"));
                cl.setApellido(request.getParameter("apellido"));
                if (nr.buscarusuario(uu) != null) {
                    request.setAttribute("destino1", cl);
                } else {
                    new Dao.dao_usuarios().setRegistrar(cl);
                    request.setAttribute("destino", cl);
                }

            } catch (SQLException e) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registrousuarios.jsp").forward(request, response);
        }

        if (request.getParameter("modificar") != null) {
            Usuarios cl = new Usuarios();
            String p = request.getParameter("contrasenia1");
            cl.setIdusuario(iduser);
            cl.setNombreusuario(request.getParameter("nombreusuario"));
            cl.setSexo(request.getParameter("sexo"));
            cl.setTipo(request.getParameter("tipo"));
            cl.setNombre(request.getParameter("nombre"));
            cl.setApellido(request.getParameter("apellido"));

            if (p.equals("")) {
                try {
                    new Dao.dao_usuarios().setModificaringresar(cl);
                    request.setAttribute("modi", cl);
                } catch (SQLException ex) {
                    Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                String encrip = Encriptacion.getStringMessageDigest(p, Encriptacion.MD5);
                cl.setContrasena(encrip);
                try {
                    new Dao.dao_usuarios().setModificar(cl);
                    request.setAttribute("modi", cl);
                } catch (SQLException ex) {
                    Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            request.getRequestDispatcher("registrousuarios.jsp").forward(request, response);
        }

        if (request.getParameter("btneditar") != null) {
            try {
                dao_usuarios autorrecuperado = new dao_usuarios();
                String ID = request.getParameter("btneditar");
                int id = Integer.parseInt(ID);
                Usuarios autormodificar = autorrecuperado.getuser(id);
                iduser = autormodificar.getIdusuario();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registrousuarios.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
