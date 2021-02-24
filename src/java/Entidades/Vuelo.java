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
public class Vuelo implements Serializable {

    private int idvuelo;
    private String fechasalida;
    private String fechallegada;
    private String horasalida;
    private String horallegada;
    private double costo;
    private int idavion;
    private Aviones aviones;
    private int iddestino;
    private Destinos destinos;
    private int idorigen;
    private Origenes origenes;

    public Vuelo() {
    }

    public Vuelo(int idvuelo, String fechasalida, String fechallegada, String horasalida, String horallegada, double costo, int idavion, Aviones aviones, int iddestino, Destinos destinos, int idorigen, Origenes origenes) {
        this.idvuelo = idvuelo;
        this.fechasalida = fechasalida;
        this.fechallegada = fechallegada;
        this.horasalida = horasalida;
        this.horallegada = horallegada;
        this.costo = costo;
        this.idavion = idavion;
        this.aviones = aviones;
        this.iddestino = iddestino;
        this.destinos = destinos;
        this.idorigen = idorigen;
        this.origenes = origenes;
    }
/*para insertar*/
    public Vuelo(String fechasalida, String fechallegada, String horasalida, String horallegada, double costo, int idavion, int iddestino, int idorigen) {
        this.fechasalida = fechasalida;
        this.fechallegada = fechallegada;
        this.horasalida = horasalida;
        this.horallegada = horallegada;
        this.costo = costo;
        this.idavion = idavion;
        this.iddestino = iddestino;
        this.idorigen = idorigen;
    }
    /*para mostrar datos en la tabla*/

    public Vuelo(int idvuelo, String fechasalida, String fechallegada, String horasalida, String horallegada, double costo, Aviones aviones, Destinos destinos, Origenes origenes) {
        this.idvuelo = idvuelo;
        this.fechasalida = fechasalida;
        this.fechallegada = fechallegada;
        this.horasalida = horasalida;
        this.horallegada = horallegada;
        this.costo = costo;
        this.aviones = aviones;
        this.destinos = destinos;
        this.origenes = origenes;
    }

    public int getIdvuelo() {
        return idvuelo;
    }

    public void setIdvuelo(int idvuelo) {
        this.idvuelo = idvuelo;
    }

    public String getFechasalida() {
        return fechasalida;
    }

    public void setFechasalida(String fechasalida) {
        this.fechasalida = fechasalida;
    }

    public String getFechallegada() {
        return fechallegada;
    }

    public void setFechallegada(String fechallegada) {
        this.fechallegada = fechallegada;
    }

    public String getHorasalida() {
        return horasalida;
    }

    public void setHorasalida(String horasalida) {
        this.horasalida = horasalida;
    }

    public String getHorallegada() {
        return horallegada;
    }

    public void setHorallegada(String horallegada) {
        this.horallegada = horallegada;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getIdavion() {
        return idavion;
    }

    public void setIdavion(int idavion) {
        this.idavion = idavion;
    }

    public Aviones getAviones() {
        return aviones;
    }

    public void setAviones(Aviones aviones) {
        this.aviones = aviones;
    }

    public int getIddestino() {
        return iddestino;
    }

    public void setIddestino(int iddestino) {
        this.iddestino = iddestino;
    }

    public Destinos getDestinos() {
        return destinos;
    }

    public void setDestinos(Destinos destinos) {
        this.destinos = destinos;
    }

    public int getIdorigen() {
        return idorigen;
    }

    public void setIdorigen(int idorigen) {
        this.idorigen = idorigen;
    }

    public Origenes getOrigenes() {
        return origenes;
    }

    public void setOrigenes(Origenes origenes) {
        this.origenes = origenes;
    }
    
}
