/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.Fedback;
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
public class FedbackDAO {
    
    public static void agregarComentario(Fedback fedback) {
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO helpdesk.fedback(Comentario,Ticket) values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fedback.getComentario());
            ps.setInt(2, fedback.getTicket());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void actualizarComentario(Fedback fedback) {
        Connection con = ConexionDB.getConnectionDB();
        String query = "Update helpdesk.fedback SET Comentario = ? WHERE idFedback = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fedback.getComentario());
            ps.setInt(2, fedback.getIdFedback());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public static List<Fedback> buscarComentarios(int Id){
        List<Fedback> comentarios = new ArrayList<Fedback>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.fedback where Ticket = " + Id + "ORDER BY idFedback DESC";
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Fedback comentario = new Fedback();
                comentario.setIdFedback(rs.getInt("idFedback"));
                comentario.setComentario(rs.getString("Comentario"));
                comentario.setTicket(rs.getInt("Ticket"));
                
                comentarios.add(comentario);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return comentarios;
    }
    
}
