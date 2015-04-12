/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.Tracking;
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
public class TrackingDAO {
    
    public static void agregarTracking(Tracking tracking) {
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO helpdesk.tracking(Persona,EstadoAnterior,EstadoActual,Fecha,Ticket) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, tracking.getPersona());
            ps.setInt(2, tracking.getEstadoAnterior());
            ps.setInt(3, tracking.getEstadoActual());
            ps.setDate(4,tracking.getFecha() != null ? new java.sql.Date(tracking.getFecha().getTime()) : null);
            ps.setInt(5, tracking.getTicket());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public static List<Tracking> buscarTracking(int Id){
        List<Tracking> tracking = new ArrayList<Tracking>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.tracking where Ticket = " + Id;
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Tracking tracking_ = new Tracking();
                tracking_.setIdTracking(rs.getInt("idTracking"));
                tracking_.setTicket(rs.getInt("Ticket"));
                tracking_.setEstadoAnterior(rs.getInt("EstadoAnterior"));
                tracking_.setEstadoActual(rs.getInt("EstadoActual"));
                tracking_.setFecha(rs.getDate("Fecha"));
                tracking_.setPersona(rs.getInt("Persona"));
                
                tracking.add(tracking_);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tracking;
    }
    
}
