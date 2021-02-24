/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.Serializable;

/**
 *
 * @author Alex
 */
public class Pasajeros  extends Documentos implements Serializable{
    private int idpasajero;
    private String nombre;
    private String apellido;
    private String sexo;
    private int edad;
    private String telefono;
    private String direccion;
    private String correo;

    public Pasajeros() {
    }

    public Pasajeros(int idpasajero, String nombre, String apellido) {
        this.idpasajero = idpasajero;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public Pasajeros(String nombre, String apellido, String sexo, int edad, String telefono, String direccion, String correo, String tipo, String fechacaducidad, String nacionalidad, String numerodocumento) {
        super(tipo, fechacaducidad, nacionalidad, numerodocumento);
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = sexo;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.correo = correo;
    }

    public Pasajeros(String nombre, String apellido, String sexo, int edad, String telefono, String direccion, String correo, int iddocumento, String tipo, String fechacaducidad, String nacionalidad, String numerodocumento) {
        super(iddocumento, tipo, fechacaducidad, nacionalidad, numerodocumento);
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = sexo;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.correo = correo;
    }

    public Pasajeros(int idpasajero, String nombre, String apellido, String sexo, int edad, String telefono, String direccion, String correo, int iddocumento, String tipo, String fechacaducidad, String nacionalidad, String numerodocumento) {
        super(iddocumento, tipo, fechacaducidad, nacionalidad, numerodocumento);
        this.idpasajero = idpasajero;
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = sexo;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.correo = correo;
    }

    public Pasajeros(int idpasajero, String nombre, String apellido, String sexo, int edad, String telefono, String direccion, String correo, String tipo, String fechacaducidad, String nacionalidad, String numerodocumento) {
        super(tipo, fechacaducidad, nacionalidad, numerodocumento);
        this.idpasajero = idpasajero;
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = sexo;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.correo = correo;
    }

    public Pasajeros(String nombre, String apellido, String sexo, int edad, String telefono, String direccion, String correo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = sexo;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.correo = correo;
    }

    public Pasajeros(int idpasajero, String nombre, String apellido, String sexo, int edad, String telefono, String direccion, String correo) {
        this.idpasajero = idpasajero;
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = sexo;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.correo = correo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getIdpasajero() {
        return idpasajero;
    }

    public void setIdpasajero(int idpasajero) {
        this.idpasajero = idpasajero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String concatenar(){
    return nombre+" "+apellido;
    }
}
