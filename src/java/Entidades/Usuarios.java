/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.Serializable;

/**
 *
 * @author Hernandez
 */
public class Usuarios implements Serializable{
    private int idusuario;
    private String nombreusuario;
    private String sexo;
    private String tipo;
    private String contrasena;
    private String nombre;
    private String apellido;

    public Usuarios() {
    }

    public Usuarios(int idusuario, String nombre, String apellido) {
        this.idusuario = idusuario;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public Usuarios(int idusuario, String nombreusuario, String sexo, String tipo, String contrasena, String nombre, String apellido) {
        this.idusuario = idusuario;
        this.nombreusuario = nombreusuario;
        this.sexo = sexo;
        this.tipo = tipo;
        this.contrasena = contrasena;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public Usuarios(String nombreusuario, String sexo, String tipo, String contrasena, String nombre, String apellido) {
        this.nombreusuario = nombreusuario;
        this.sexo = sexo;
        this.tipo = tipo;
        this.contrasena = contrasena;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String concatenar(){
    return nombre+" "+apellido;
    }
}
