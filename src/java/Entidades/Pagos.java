/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author Alex
 */
public class Pagos {
    private int idpago;
    private String formapago;
    private double costo;
    private int idtarjeta;
    private Tarjetas tarjetas;
    private int idreserva;
    private Reservas reservas;

    public Pagos() {
    }

    public Pagos(int idpago, String formapago, double costo, int idtarjeta, int idreserva) {
        this.idpago = idpago;
        this.formapago = formapago;
        this.costo = costo;
        this.idtarjeta = idtarjeta;
        this.idreserva = idreserva;
    }

    public Pagos(String formapago, double costo, int idtarjeta, int idreserva) {
        this.formapago = formapago;
        this.costo = costo;
        this.idtarjeta = idtarjeta;
        this.idreserva = idreserva;
    }

    public Pagos(int idpago, String formapago, double costo, Tarjetas tarjetas, Reservas reservas) {
        this.idpago = idpago;
        this.formapago = formapago;
        this.costo = costo;
        this.tarjetas = tarjetas;
        this.reservas = reservas;
    }

    public Pagos(int idpago, String formapago, double costo, int idtarjeta, Tarjetas tarjetas, int idreserva, Reservas reservas) {
        this.idpago = idpago;
        this.formapago = formapago;
        this.costo = costo;
        this.idtarjeta = idtarjeta;
        this.tarjetas = tarjetas;
        this.idreserva = idreserva;
        this.reservas = reservas;
    }

    public Reservas getReservas() {
        return reservas;
    }

    public void setReservas(Reservas reservas) {
        this.reservas = reservas;
    }

    public int getIdpago() {
        return idpago;
    }

    public void setIdpago(int idpago) {
        this.idpago = idpago;
    }

    public String getFormapago() {
        return formapago;
    }

    public void setFormapago(String formapago) {
        this.formapago = formapago;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getIdtarjeta() {
        return idtarjeta;
    }

    public void setIdtarjeta(int idtarjeta) {
        this.idtarjeta = idtarjeta;
    }

    public Tarjetas getTarjetas() {
        return tarjetas;
    }

    public void setTarjetas(Tarjetas tarjetas) {
        this.tarjetas = tarjetas;
    }

    public int getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(int idreserva) {
        this.idreserva = idreserva;
    }
    
    
}
