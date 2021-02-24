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
public class Tarjetas implements Serializable{
    private int idtarjeta;
    private String nombre;
    private String fecha;
    private String codigo;

    public Tarjetas() {
    }

    public Tarjetas(int idtarjeta, String nombre) {
        this.idtarjeta = idtarjeta;
        this.nombre = nombre;
    }

    public Tarjetas(int idtarjeta, String nombre, String fecha, String codigo) {
        this.idtarjeta = idtarjeta;
        this.nombre = nombre;
        this.fecha = fecha;
        this.codigo = codigo;
    }

    public Tarjetas(String nombre, String fecha, String codigo) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.codigo = codigo;
    }

    public int getIdtarjeta() {
        return idtarjeta;
    }

    public void setIdtarjeta(int idtarjeta) {
        this.idtarjeta = idtarjeta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
}
