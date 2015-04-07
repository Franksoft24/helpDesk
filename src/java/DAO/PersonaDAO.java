/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.Persona;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Frankmer
 */
public class PersonaDAO {
    
    public static List<Persona> listarPersonas(){
        List<Persona> personas = new ArrayList<Persona>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.persona";
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Persona persona = new Persona();
                persona.setIdPersona(rs.getInt("idPersona"));
                persona.setNombre(rs.getString("Nombre"));
                
                personas.add(persona);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return personas;
    }
    
    public static List<Persona> buscarPersonas(int id){
        List<Persona> personas = new ArrayList<Persona>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM helpdesk.persona WHERE idPersona = " + id;
        try {
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Persona persona = new Persona();
                persona.setIdPersona(rs.getInt("idPersona"));
                persona.setNombre(rs.getString("Nombre"));
                
                personas.add(persona);
            }
            rs.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return personas;
    }
    
}
