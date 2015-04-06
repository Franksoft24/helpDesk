/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Frankmer
 */
public class Persona {
    private Integer idPersona;
    protected String Nombre;
    protected String Cargo;
    
    public Persona(){
        
    }
    
    public Persona(String Nombre, String Cargo){
        this.Nombre = Nombre;
        this.Cargo = Cargo;
    }
    
    public Persona(Integer idPersona, String Nombre, String Cargo){
        this.idPersona = idPersona;
        this.Nombre = Nombre;
        this.Cargo = Cargo;
    }
    
    public Integer getIdPersona(){
        return idPersona;
    }
    public void setIdPersona(Integer idPersona){
        this.idPersona = idPersona;
    }
    public String getNombre(){
        return Nombre;
    }
    public void setNombre(String Nombre){
        this.Nombre = Nombre;
    }
    public String getCargo(){
        return Cargo;
    }
    public void setCargo(String Cargo){
        this.Cargo = Cargo;
    }
    
}
