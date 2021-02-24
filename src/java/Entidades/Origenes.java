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
public class Origenes implements Serializable{
    private String pais;
    private String ciudad;
    private int idorigen;
    private String nombreaeropuerto;

    public Origenes() {
    }

    public Origenes(String pais, int idorigen, String ciudad,String nombreaeropuerto) {
        this.pais = pais;
        this.idorigen = idorigen;
        this.ciudad = ciudad;
        this.nombreaeropuerto=nombreaeropuerto;
    }



    public Origenes(String pais, int idorigen) {
        this.pais = pais;
        this.idorigen = idorigen;
    }

    public Origenes(String pais, String ciudad, int idorigen, String nombreaeropuerto) {
        this.pais = pais;
        this.ciudad = ciudad;
        this.idorigen = idorigen;
        this.nombreaeropuerto = nombreaeropuerto;
    }

    public Origenes(String pais, String ciudad, String nombreaeropuerto) {
        this.pais = pais;
        this.ciudad = ciudad;
        this.nombreaeropuerto = nombreaeropuerto;
    }


    public int getIdorigen() {
        return idorigen;
    }

    public void setIdorigen(int idorigen) {
        this.idorigen = idorigen;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getNombreaeropuerto() {
        return nombreaeropuerto;
    }

    public void setNombreaeropuerto(String nombreaeropuerto) {
        this.nombreaeropuerto = nombreaeropuerto;
    }
    
    
}
