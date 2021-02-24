/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Dao.dao_pasajeros;
import Entidades.Pasajeros;
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
public class ControladorPasajeros extends HttpServlet {
    
    int iddocumento;
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
            out.println("<title>Servlet ControladorPasajeros</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPasajeros at " + request.getContextPath() + "</h1>");
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
                iddocumento = Integer.parseInt(ID);
                dao_pasajeros t = new dao_pasajeros();
                if (ne.buscarpasajero(iddocumento) != null) {
                    request.setAttribute("borrar2", t.getpasajero(iddocumento));
                } else {
                    t.Elimininar(new Dao.dao_pasajeros().getpasajero(iddocumento));
                    request.setAttribute("borrar1", t.getpasajero(iddocumento));
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorPasajeros.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registropersonas.jsp").forward(request, response);
        }
        if (request.getParameter("modificar") != null) {
            Pasajeros cl = new Pasajeros();
            cl.setIdpasajero(iddocumento);
            cl.setIddocumento(iddocumento);
            cl.setNombre(request.getParameter("nombre"));
            cl.setApellido(request.getParameter("apellido"));
            cl.setSexo(request.getParameter("sexo"));
            cl.setEdad(Integer.parseInt(request.getParameter("edad")));
            cl.setTelefono(request.getParameter("telefono"));
            cl.setDireccion(request.getParameter("direccion"));
            cl.setCorreo(request.getParameter("correo"));
            
            cl.setTipo(request.getParameter("tipodocumento"));
            cl.setNumerodocumento(request.getParameter("numerodocumento"));
            cl.setFechacaducidad(request.getParameter("fechavencimiento"));
            cl.setNacionalidad(request.getParameter("nacionalidad"));
            
            try {
                new Dao.dao_pasajeros().setModificar(cl);
                request.setAttribute("modi", cl);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorPasajeros.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("registropersonas.jsp").forward(request, response);
        }
        
        if (request.getParameter("guardar") != null) {
            try {
                Pasajeros cl = new Pasajeros();
                cl.setNombre(request.getParameter("nombre"));
                cl.setApellido(request.getParameter("apellido"));
                cl.setSexo(request.getParameter("sexo"));
                cl.setEdad(Integer.parseInt(request.getParameter("edad")));
                cl.setTelefono(request.getParameter("telefono"));
                cl.setDireccion(request.getParameter("direccion"));
                cl.setCorreo(request.getParameter("correo"));
                
                cl.setTipo(request.getParameter("tipodocumento"));
                cl.setNumerodocumento(request.getParameter("numerodocumento"));
                cl.setFechacaducidad(request.getParameter("fechavencimiento"));
                cl.setNacionalidad(request.getParameter("nacionalidad"));
                String doc = request.getParameter("numerodocumento");
                if (nr.buscardocunico(doc) != null) {
                    request.setAttribute("destino1", cl);
                } else {
                    new Dao.dao_pasajeros().setRegistrar(cl);
                    request.setAttribute("destino", cl);
                }
            } catch (SQLException e) {
                Logger.getLogger(ControladorPasajeros.class.getName()).log(Level.SEVERE, null, e);
            }
            request.getRequestDispatcher("registropersonas.jsp").forward(request, response);
        }
        if (request.getParameter("btneditar") != null) {
            try {
                dao_pasajeros autorrecuperado = new dao_pasajeros();
                String ID = request.getParameter("btneditar");
                int id = Integer.parseInt(ID);
                Pasajeros autormodificar = autorrecuperado.getpasajero(id);
                iddocumento = autormodificar.getIddocumento();
                request.setAttribute("modificar", autormodificar);
                request.getRequestDispatcher("registropersonas.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ControladorPasajeros.class.getName()).log(Level.SEVERE, null, ex);
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
