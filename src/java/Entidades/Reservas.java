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
public class Reservas implements Serializable{
    private int idreserva;
    private String clase;
    private String fecharegreso;
    private int idpasajero;
    private Pasajeros pasajeros;
    private int idusuario;
    private Usuarios usuarios;
    private int idasiento;
    private Asientos asientos;
    private String estadoreserva;
    private String codigo;
    private int idvuelo;
    private Vuelo vuelo;
    private String fechareserva;
    private String estadopago;

    public Reservas() {
    }

    public Reservas(int idreserva, String codigo, String estadopago) {
        this.idreserva = idreserva;
        this.codigo = codigo;
        this.estadopago = estadopago;
    }
    
    /*para insertar*/

    public Reservas(String clase, String fecharegreso, int idpasajero, int idusuario, int idasiento, String estadoreserva, String codigo, int idvuelo, String fechareserva,String estadopago) {
        this.clase = clase;
        this.fecharegreso = fecharegreso;
        this.idpasajero = idpasajero;
        this.idusuario = idusuario;
        this.idasiento = idasiento;
        this.estadoreserva = estadoreserva;
        this.codigo = codigo;
        this.idvuelo = idvuelo;
        this.fechareserva = fechareserva;
        this.estadopago=estadopago;
    }
    /*para mostrar*/

    public Reservas(int idreserva, String clase, String fecharegreso, Pasajeros pasajeros, Usuarios usuarios, Asientos asientos, String estadoreserva, String codigo, Vuelo vuelo, String fechareserva,String estadopago) {
        this.idreserva = idreserva;
        this.clase = clase;
        this.fecharegreso = fecharegreso;
        this.pasajeros = pasajeros;
        this.usuarios = usuarios;
        this.asientos = asientos;
        this.estadoreserva = estadoreserva;
        this.codigo = codigo;
        this.vuelo = vuelo;
        this.fechareserva = fechareserva;
        this.estadopago=estadopago;
    }
    /*constructor general*/

    public Reservas(int idreserva, String clase, String fecharegreso, int idpasajero, Pasajeros pasajeros, int idusuario, Usuarios usuarios, int idasiento, Asientos asientos, String estadoreserva, String codigo, int idvuelo, Vuelo vuelo, String fechareserva) {
        this.idreserva = idreserva;
        this.clase = clase;
        this.fecharegreso = fecharegreso;
        this.idpasajero = idpasajero;
        this.pasajeros = pasajeros;
        this.idusuario = idusuario;
        this.usuarios = usuarios;
        this.idasiento = idasiento;
        this.asientos = asientos;
        this.estadoreserva = estadoreserva;
        this.codigo = codigo;
        this.idvuelo = idvuelo;
        this.vuelo = vuelo;
        this.fechareserva = fechareserva;
    }

    public String getFechareserva() {
        return fechareserva;
    }

    public void setFechareserva(String fechareserva) {
        this.fechareserva = fechareserva;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }

    public String getFecharegreso() {
        return fecharegreso;
    }

    public void setFecharegreso(String fecharegreso) {
        this.fecharegreso = fecharegreso;
    }

    public int getIdpasajero() {
        return idpasajero;
    }

    public void setIdpasajero(int idpasajero) {
        this.idpasajero = idpasajero;
    }

    public Pasajeros getPasajeros() {
        return pasajeros;
    }

    public void setPasajeros(Pasajeros pasajeros) {
        this.pasajeros = pasajeros;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public Usuarios getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
    }

    public int getIdasiento() {
        return idasiento;
    }

    public void setIdasiento(int idasiento) {
        this.idasiento = idasiento;
    }

    public Asientos getAsientos() {
        return asientos;
    }

    public void setAsientos(Asientos asientos) {
        this.asientos = asientos;
    }

    public String getEstadoreserva() {
        return estadoreserva;
    }

    public void setEstadoreserva(String estadoreserva) {
        this.estadoreserva = estadoreserva;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getIdvuelo() {
        return idvuelo;
    }

    public void setIdvuelo(int idvuelo) {
        this.idvuelo = idvuelo;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public int getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
    }

    public String getEstadopago() {
        return estadopago;
    }

    public void setEstadopago(String estadopago) {
        this.estadopago = estadopago;
    }
    
}
