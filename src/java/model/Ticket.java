/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Frankmer
 */
public class Ticket {
    
    private Integer idTicket;
    protected String Titulo;
    protected String Descripcion;
    protected Date FechaCreacion;
    public Integer Estado;
    public Integer Empleado;
    public Integer Soporte;
    
    public Ticket(){
        
    }
    
    public Ticket(String Titulo, String Descripcion, Date FechaCreacion, Integer Estado, Integer Empleado, Integer Soporte){
        this.Titulo = Titulo;
        this.Descripcion = Descripcion;
        this.FechaCreacion = FechaCreacion;
        this.Estado = Estado;
        this.Empleado = Empleado;
        this.Soporte = Soporte;
    }
    
    public Ticket(Integer idTicket, Integer Estado, Integer Soporte){
        this.idTicket = idTicket;
        this.Estado = Estado;
        this.Soporte = Soporte;
    }
    
    public Ticket(Integer idTicket, String Titulo, String Descripcion, Date FechaCreacion, Integer Estado, Integer Empleado, Integer Soporte){
        this.idTicket = idTicket;
        this.Titulo = Titulo;
        this.Descripcion = Descripcion;
        this.FechaCreacion = FechaCreacion;
        this.Estado = Estado;
        this.Empleado = Empleado;
        this.Soporte = Soporte;
    }
    
    public Integer getIdTicket(){
        return idTicket;
    }
    public void setIdTicket(Integer idTicket){
        this.idTicket = idTicket;
    }
    public String getTitulo(){
        return Titulo; 
    }
    public void setTitulo(String Titulo){
        this.Titulo = Titulo;
    }
    public String getDescripcion(){
        return Descripcion;
    }
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
    public Date getFechaCreacion(){
        return FechaCreacion;
    }
    public void setFechaCreacion(Date FechaCreacion){
        this.FechaCreacion = FechaCreacion;
    }
    public Integer getEstado(){
        return Estado;
    }
    public void setEstado(Integer Estado){
        this.Estado = Estado;
    }
    public Integer getEmpleado(){
        return Empleado;
    }
    public void setEmpleado(Integer Empleado){
        this.Empleado = Empleado;
    }
    public Integer getSoporte(){
        return Soporte;
    }
    public void setSoporte(Integer Soporte){
        this.Soporte = Soporte;
    }
}
