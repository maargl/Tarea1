/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jeremy
 */
public class Usuario {
    private String rut, contrasenna,nombre;//, tipo;
    
    public Usuario(String rut, String contrasenna, String nombre){//, String tipo){
        this.rut= rut;
        this.contrasenna= contrasenna;
        this.nombre= nombre;
        //this.tipo=tipo;
    }
    
    public String obtenerRut(){
        return this.rut;   
    }
    
    public String obtenerContrasenna(){
        return this.contrasenna;   
    }
    
    public String obtenerNombre(){
        return this.nombre;   
    }
    
    /*public String obtenerTipo(){
        return this.tipo;   
    }*/
    
}
