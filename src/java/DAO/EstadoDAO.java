/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.Estado;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Frankmer
 */
public class EstadoDAO {
    public static List<Estado> listarEstados(){
        List<Estado> estados = new ArrayList<Estado>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.estado";
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Estado estado = new Estado();
                estado.setIdEstado(rs.getInt("idEstado"));
                estado.setDescripcion(rs.getString("Descripcion"));
                
                estados.add(estado);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return estados;
    }
}
