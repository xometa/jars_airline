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
public class Destinos implements Serializable {

    private int iddestino;
    private String nombreaeropuerto;
    private String pais;
    private String ciudad;

    public Destinos() {
    }

    public Destinos(int iddestino, String pais, String ciudad,String nombreaeropuerto) {
        this.iddestino = iddestino;
        this.pais = pais;
        this.ciudad = ciudad;
        this.nombreaeropuerto = nombreaeropuerto;
    }

    public Destinos(int iddestino, String pais) {
        this.iddestino = iddestino;
        this.pais = pais;
    }

    public Destinos(int iddestino, String pais, String ciudad) {
        this.iddestino = iddestino;
        this.pais = pais;
        this.ciudad = ciudad;
    }

    public Destinos(String nombreaeropuerto, String pais, String ciudad) {
        this.nombreaeropuerto = nombreaeropuerto;
        this.pais = pais;
        this.ciudad = ciudad;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getIddestino() {
        return iddestino;
    }

    public void setIddestino(int iddestino) {
        this.iddestino = iddestino;
    }

    public String getNombreaeropuerto() {
        return nombreaeropuerto;
    }

    public void setNombreaeropuerto(String nombreaeropuerto) {
        this.nombreaeropuerto = nombreaeropuerto;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

}
