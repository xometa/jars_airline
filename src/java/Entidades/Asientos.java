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
public class Asientos implements Serializable{
    private int idasiento;
    private String nombre;
    private int fila;
    private String columna;

    public Asientos() {
    }

    public Asientos(int idasiento, String nombre, int fila, String columna) {
        this.idasiento = idasiento;
        this.nombre = nombre;
        this.fila = fila;
        this.columna = columna;
    }

    public Asientos(String nombre, int fila, String columna) {
        this.nombre = nombre;
        this.fila = fila;
        this.columna = columna;
    }

    public Asientos(int idasiento, String nombre) {
        this.idasiento = idasiento;
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdasiento() {
        return idasiento;
    }

    public void setIdasiento(int idasiento) {
        this.idasiento = idasiento;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public String getColumna() {
        return columna;
    }

    public void setColumna(String columna) {
        this.columna = columna;
    }
}
