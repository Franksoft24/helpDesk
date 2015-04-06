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
public class Estado {
    private Integer idEstado;
    protected String Descripcion;
    
    public Estado(){
        
    }
    
    public Estado (String Descripcion){
        this.Descripcion = Descripcion;
    }
    
    public Estado (Integer idEstado, String Descripcion){
        this.idEstado = idEstado;
        this.Descripcion = Descripcion;
    }
    
    public Integer getIdEstado(){
        return idEstado;
    }
    public void setIdEstado( Integer idEstado){
        this.idEstado = idEstado;
    }
    public String getDescripcion(){
        return Descripcion;
    }
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
}
