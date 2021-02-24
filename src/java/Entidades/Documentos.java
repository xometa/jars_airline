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
public class Documentos implements Serializable{
    private int iddocumento;
    private String tipo;
    private String fechacaducidad;
    private String nacionalidad;
    private String numerodocumento;

    public Documentos() {
    }

    public Documentos(int iddocumento, String tipo, String fechacaducidad, String nacionalidad, String numerodocumento) {
        this.iddocumento = iddocumento;
        this.tipo = tipo;
        this.fechacaducidad = fechacaducidad;
        this.nacionalidad = nacionalidad;
        this.numerodocumento = numerodocumento;
    }

    public Documentos(String tipo, String fechacaducidad, String nacionalidad, String numerodocumento) {
        this.tipo = tipo;
        this.fechacaducidad = fechacaducidad;
        this.nacionalidad = nacionalidad;
        this.numerodocumento = numerodocumento;
    }

    public String getNumerodocumento() {
        return numerodocumento;
    }

    public void setNumerodocumento(String numerodocumento) {
        this.numerodocumento = numerodocumento;
    }

    public int getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(int iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getFechacaducidad() {
        return fechacaducidad;
    }

    public void setFechacaducidad(String fechacaducidad) {
        this.fechacaducidad = fechacaducidad;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    
}
