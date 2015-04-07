<%-- 
    Document   : DetallesTicket.jsp
    Created on : Apr 6, 2015, 2:49:19 PM
    Author     : Frankmer
--%>

<%@page import="DAO.*" %>
<%@page import="model.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My cool help desk - Detalles</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/style.css"/>
    </head>
    <body>
        <%
            int ticketId = Integer.parseInt(request.getParameter("ID"));
            List<Ticket> tickets = TicketDAO.buscarTickets(ticketId);
            String titulo_ = null;
            String descripcion_ = null;
            String empleado_ = null;
            String soporte_ = null;
            String estado_ = null;
            int EstadoId;
            int TicketId;
            int PersonaId;
            Date fecha = null;
            for (Ticket ticket : tickets){
                titulo_ = ticket.getTitulo();
                descripcion_ = ticket.getDescripcion();
                TicketId = ticket.getIdTicket();
                List<Estado> estados = EstadoDAO.buscarEstados(ticket.getEstado());
                for(Estado estado : estados){
                    estado_ = estado.getDescripcion();
                }
                List<Persona> empleados = PersonaDAO.buscarPersonas(ticket.getEmpleado());
                for (Persona empleado : empleados){
                    empleado_ = empleado.getNombre();
                }
                List<Persona> soportes = PersonaDAO.buscarPersonas(ticket.getSoporte());
                for (Persona soporte : soportes){
                    soporte_ = soporte.getNombre();
                }
                fecha = ticket.getFechaCreacion();
            }
        %>
        <section>
            <div class="encabezado"><a href="../.." class="link">Mis Tickets</a></div>
            <div class="Modulo-gestion-ticket">
                    <ul>
                    <li><a href="../../Ticket/" class="link dark">Crear Ticket</a></li>
                    <li><a href="" class="link dark">Buscar mis ticket</a></li>
                    <li><a href="../../Ticket/help.html" class="link dark">Ayuda</a></li>
                </ul>
            </div>
            <div class="Contenedor">
                <table class="ticket">
                    <%
                        for(Ticket ticket : tickets){
                            
                        }
                    %>
                    <tr>
                        <th colspan="2"><%out.print(ticketId+" - ");out.print(titulo_);%></th>
                    </tr>
                    <tr>
                        <td><h3>Estado: </h3> <%out.print(estado_);%></td>
                        <td><h3>Fecha: </h3> <%out.print(fecha);%></td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Descripcion: </h3> <%out.print(descripcion_);%></td>
                    </tr>
                    <tr>
                        <td><h3>Empleado: </h3> <%out.print(empleado_);%></td>
                        <td><h3>Soporte: </h3> <%out.print(soporte_);%></td>
                    </tr>
                </table>
            </div>
        </section>
    </body>
</html>
