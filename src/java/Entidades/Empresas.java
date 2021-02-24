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
public class Empresas implements Serializable{
    private int idempresa;
    private String nombreempresa;
    private String telefono;
    private String ruc;

    public Empresas() {
    }

    public Empresas(int idempresa, String nombreempresa) {
        this.idempresa = idempresa;
        this.nombreempresa = nombreempresa;
    }

    public Empresas(String nombreempresa, String telefono, String ruc) {
        this.nombreempresa = nombreempresa;
        this.telefono = telefono;
        this.ruc = ruc;
    }

    public Empresas(int idempresa, String nombreempresa, String telefono, String ruc) {
        this.idempresa = idempresa;
        this.nombreempresa = nombreempresa;
        this.telefono = telefono;
        this.ruc = ruc;
    }

    public int getIdempresa() {
        return idempresa;
    }

    public void setIdempresa(int idempresa) {
        this.idempresa = idempresa;
    }

    public String getNombreempresa() {
        return nombreempresa;
    }

    public void setNombreempresa(String nombreempresa) {
        this.nombreempresa = nombreempresa;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

}
