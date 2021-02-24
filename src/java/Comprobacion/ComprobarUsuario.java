/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Comprobacion;

import Dao.dao_usuarios;
import Entidades.Usuarios;
import java.sql.SQLException;

/**
 *
 * @author Hernandez
 */
public class ComprobarUsuario {

    dao_usuarios user = new dao_usuarios();

    public ComprobarUsuario() {
    }
/*metodo para comprobar si el usuario existe en la base de datos*/
    public Usuarios buscar(String nombre, String pass) throws SQLException {
        for (Usuarios x : user.listadousuarios()) {
            if (x.getNombreusuario().equals(nombre) && x.getContrasena().equals(pass)) {
                return x;
            }
        }
        return null;
    }
}
