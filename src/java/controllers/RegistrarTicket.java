/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import model.Ticket;
import DAO.TicketDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Frankmer
 */
@WebServlet(name = "RegistrarTicket", urlPatterns = {"/RegistrarTicket"})
public class RegistrarTicket extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Ejecutando el servlet.");
        String Titulo = request.getParameter("Titulo");
        String Descripcion = request.getParameter("Descripcion");
        int Estado = 1;//Integer.parseInt(request.getParameter("Estado"));
        int Empleado = Integer.parseInt(request.getParameter("Empleado"));
        int Soporte = 1;//Integer.parseInt(request.getParameter("Soporte"));
        Date FechaCreacion = null;
        
        try{
            FechaCreacion = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaCreacion"));
        }catch (ParseException ex){
            ex.printStackTrace();
        }
        Ticket ticket= new Ticket(Titulo, Descripcion, FechaCreacion, Estado, Empleado, Soporte);
        TicketDAO.agregarAmigo(ticket);
        response.sendRedirect("/helpDesk/");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
