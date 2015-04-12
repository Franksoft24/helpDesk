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
public class Tracking {
    private Integer idTracking;
    public Integer Ticket;
    protected Date Fecha;
    public Integer EstadoAnterior;
    public Integer EstadoActual;
    public Integer Persona;
    
    public Tracking(){
        
    }
    
    public Tracking(Integer Ticket, Date Fecha, Integer EstadoAnterior, Integer EstadoActual, Integer Persona){
        this.Ticket = Ticket;
        this.Fecha = Fecha;
        this.EstadoAnterior = EstadoAnterior;
        this.EstadoActual = EstadoActual;
        this.Persona = Persona;
    }
    
    public Tracking(Integer idTracking, Integer Ticket, Date Fecha, Integer EstadoAnterior, Integer EstadoActual, Integer Persona){
        this.idTracking = idTracking;
        this.Ticket = Ticket;
        this.Fecha = Fecha;
        this.EstadoAnterior = EstadoAnterior;
        this.EstadoActual = EstadoActual;
        this.Persona = Persona;
    }
    
    public Integer getIdTracking(){
        return idTracking;
    }
    
    public void setIdTracking(Integer idTracking){
        this.idTracking = idTracking;
    }
    
    public Integer getTicket(){
        return Ticket;
    }
    
    public void setTicket(Integer Ticket){
        this.Ticket = Ticket;
    }
    
    public Date getFecha(){
        return Fecha;
    }
    
    public void setFecha (Date Fecha){
        this.Fecha = Fecha;
    }
    
    public Integer getEstadoAnterior (){
        return EstadoAnterior;
    }
    
    public void setEstadoAnterior(Integer EstadoAnterior){
        this.EstadoAnterior = EstadoAnterior;
    }
    
    public Integer getEstadoActual(){
        return EstadoActual;
    }
    
    public void setEstadoActual(Integer EstadoActual){
        this.EstadoActual = EstadoActual;
    }
    
    public Integer getPersona(){
        return Persona;
    }
    
    public void setPersona(Integer Persona){
        this.Persona = Persona;
    }
    
}
