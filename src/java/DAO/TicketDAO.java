/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.Ticket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Frankmer
 */
public class TicketDAO {
    public static void agregarTicket(Ticket ticket) {
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO helpdesk.ticket(Titulo,Descripcion,Empleado,Soporte,idEstado,FechaCreacion) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, ticket.getTitulo());
            ps.setString(2, ticket.getDescripcion());
            ps.setInt(3, ticket.getEmpleado());
            ps.setInt(4, ticket.getSoporte());
            ps.setInt(5, ticket.getEstado());
            ps.setDate(6,ticket.getFechaCreacion() != null ? new java.sql.Date(ticket.getFechaCreacion().getTime()) : null);
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public static void actualizarTicket(Ticket ticket) {
        Connection con = ConexionDB.getConnectionDB();
        String query = "Update helpdesk.ticket SET idEstado = ?, Soporte = ? WHERE idTicket = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ticket.getEstado());
            ps.setInt(2, ticket.getSoporte());
            ps.setInt(3, ticket.getIdTicket());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public static List<Ticket> listarTickets(){
        List<Ticket> tickets = new ArrayList<Ticket>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.ticket ORDER BY idTicket DESC";
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Ticket ticket = new Ticket();
                ticket.setIdTicket(rs.getInt("idTicket"));
                ticket.setTitulo(rs.getString("Titulo"));
                ticket.setDescripcion(rs.getString("Descripcion"));
                ticket.setFechaCreacion(rs.getDate("FechaCreacion"));
                ticket.setEstado(rs.getInt("idEstado"));
                ticket.setEmpleado(rs.getInt("Empleado"));
                ticket.setSoporte(rs.getInt("Soporte"));
                
                tickets.add(ticket);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tickets;
    }
    public static List<Ticket> buscarTickets(int Id){
        List<Ticket> tickets = new ArrayList<Ticket>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.ticket where idTicket = " + Id;
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Ticket ticket = new Ticket();
                ticket.setIdTicket(rs.getInt("idTicket"));
                ticket.setTitulo(rs.getString("Titulo"));
                ticket.setDescripcion(rs.getString("Descripcion"));
                ticket.setFechaCreacion(rs.getDate("FechaCreacion"));
                ticket.setEstado(rs.getInt("idEstado"));
                ticket.setEmpleado(rs.getInt("Empleado"));
                ticket.setSoporte(rs.getInt("Soporte"));
                
                tickets.add(ticket);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tickets;
    }
    
    public static List<Ticket> tabularTickets(int Id){
        List<Ticket> tickets = new ArrayList<Ticket>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.ticket where idEstado = " + Id;
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Ticket ticket = new Ticket();
                ticket.setIdTicket(rs.getInt("idTicket"));
                ticket.setTitulo(rs.getString("Titulo"));
                ticket.setDescripcion(rs.getString("Descripcion"));
                ticket.setFechaCreacion(rs.getDate("FechaCreacion"));
                ticket.setEstado(rs.getInt("idEstado"));
                ticket.setEmpleado(rs.getInt("Empleado"));
                ticket.setSoporte(rs.getInt("Soporte"));
                
                tickets.add(ticket);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tickets;
    }
    
}
