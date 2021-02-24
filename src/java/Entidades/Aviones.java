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
public class Aviones implements Serializable{
    private int idavion;
    private String modelo;
    private int capacidad;
    private String estado;
    private int idaerolinea;
    private Empresas aerolineas;
    private String nombre;
    private String numserie;
    private int cantidadaviones;

    public Aviones() {
    }

    public Aviones(int cantidadaviones) {
        this.cantidadaviones = cantidadaviones;
    }

    public Aviones(int idavion, String modelo, int capacidad, String estado, String nombre, String numserie) {
        this.idavion = idavion;
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.estado = estado;
        this.nombre = nombre;
        this.numserie = numserie;
    }

    public Aviones(int idavion, int capacidad, String estado, String nombre) {
        this.idavion = idavion;
        this.capacidad = capacidad;
        this.estado = estado;
        this.nombre = nombre;
    }

    public Aviones(String modelo, int capacidad, String estado, int idaerolinea, String nombre, String numserie) {
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.estado = estado;
        this.idaerolinea = idaerolinea;
        this.nombre = nombre;
        this.numserie = numserie;
    }

    public Aviones(int idavion, String modelo, int capacidad, String estado, Empresas aerolineas, String nombre, String numserie) {
        this.idavion = idavion;
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.estado = estado;
        this.aerolineas = aerolineas;
        this.nombre = nombre;
        this.numserie = numserie;
    }

    public Aviones(String modelo, int capacidad, String estado, String nombre, String numserie) {
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.estado = estado;
        this.nombre = nombre;
        this.numserie = numserie;
    }

    public Aviones(String modelo, int capacidad, String estado, Empresas aerolineas, String nombre, String numserie) {
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.estado = estado;
        this.aerolineas = aerolineas;
        this.nombre = nombre;
        this.numserie = numserie;
    }

    public Aviones(int idavion, String modelo, int capacidad, String estado, Empresas aerolineas, String numserie) {
        this.idavion = idavion;
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.estado = estado;
        this.aerolineas = aerolineas;
        this.numserie = numserie;
    }

    public String getNumserie() {
        return numserie;
    }

    public void setNumserie(String numserie) {
        this.numserie = numserie;
    }

    public int getIdavion() {
        return idavion;
    }

    public void setIdavion(int idavion) {
        this.idavion = idavion;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Empresas getAerolineas() {
        return aerolineas;
    }

    public void setAerolineas(Empresas aerolineas) {
        this.aerolineas = aerolineas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdaerolinea() {
        return idaerolinea;
    }

    public void setIdaerolinea(int idaerolinea) {
        this.idaerolinea = idaerolinea;
    }

    public int getCantidadaviones() {
        return cantidadaviones;
    }

    public void setCantidadaviones(int cantidadaviones) {
        this.cantidadaviones = cantidadaviones;
    }
    
}
