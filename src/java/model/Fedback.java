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
public class Fedback {
    private Integer idFedback;
    protected String Comentario;
    public Integer Ticket;
    public Integer Empleado;
    
    public Fedback(){
        
    }
    
    public Fedback(String Comentario, Integer Ticket, Integer Empleado){
        this.Comentario = Comentario;
        this.Ticket = Ticket;
        this.Empleado = Empleado;
    }
    
    public Fedback(Integer idFedback, String Comentario){
        this.idFedback = idFedback;
        this.Comentario = Comentario;
    }
    
    public Fedback(Integer idFedback, String Comentario, Integer Ticket, Integer Empleado){
        this.idFedback = idFedback;
        this.Comentario = Comentario;
        this.Ticket = Ticket;
        this.Empleado = Empleado;
    }
    
    public Integer getIdFedback(){
        return idFedback;
    }
    public void setIdFedback(Integer idFedback){
        this.idFedback = idFedback;
    }
    public String getComentario(){
        return Comentario;
    }
    public void setComentario(String Comentario){
        this.Comentario = Comentario;
    }
    public Integer getTicket(){
        return Ticket;
    }
    public void setTicket(Integer Ticket){
        this.Ticket = Ticket;
    }
    public Integer getEmpleado(){
        return Empleado;
    }
    public void setEmpleado(Integer Empleado){
        this.Empleado = Empleado;
    }
    
}
