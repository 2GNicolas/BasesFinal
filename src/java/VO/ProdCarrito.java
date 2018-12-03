/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author Nicolas
 */
public class ProdCarrito {
    private int id;
    private String nombre;
    private int Cantidad;
    private int precioT;

    public ProdCarrito(int id, String nombre,int Cantidad, int precioT) {
        this.id = id;
        this.nombre = nombre;
        this.Cantidad = Cantidad;
        this.precioT = precioT;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecioT() {
        return precioT;
    }

    public void setPrecioT(int precioT) {
        this.precioT = precioT;
    }
    
}
