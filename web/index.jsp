<%-- 
    Document   : index
    Created on : Apr 5, 2015, 2:32:27 PM
    Author     : Frankmer
--%>

<%@page import="DAO.TicketDAO"%>
<%@page import="DAO.EstadoDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Estado"%>
<%@page import="model.Ticket"%>
<%
    List<Ticket> tickets = TicketDAO.listarTickets();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My cool help desk</title>
        <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
    </head>
    <body>
        <section>
            <div class="encabezado">Mis Tickets</div>
            <div class="Modulo-gestion-ticket">
                <ul>
                    <li><a href="Ticket/" class="link dark">Crear Ticket</a></li>
                    <li><a href="Ticket/Buscar/" class="link dark">Buscar mis ticket</a></li>
                    <li><a href="Ticket/help.html" class="link dark">Ayuda</a></li>
                </ul>
            </div>
            <div class="Contenedor">
                    <table class="ticket">
                    <tr>
                        <th>Titulo</th>
                        <th>Fecha</th>
                        <th>Estado</th>
                        <th>Descripción</th>
                        <th></th>
                    </tr>
                        <%
                            for(Ticket ticket : tickets){
                                out.print("<tr>");
                                out.print("<td>"+ ticket.getTitulo() +"</td>");
                                out.print("<td>"+ ticket.getFechaCreacion() +"</td>");
                                List<Estado> estados = EstadoDAO.buscarEstados(ticket.getEstado());
                                for(Estado estado : estados){
                                    out.print("<td>"+ estado.getDescripcion() +"</td>");
                                }
                                out.print("<td>"+ ticket.getDescripcion() +"</td>");
                                out.print("<td><a class=\"link\" href=\"Ticket/Detalles?ID="+ ticket.getIdTicket() +"\"> Detalles </a>");
                                out.print("<a class=\"link\" href=\"Ticket/Comentar?ID="+ ticket.getIdTicket() +"\"> Comentar </a>");
                                out.print("<a class=\"link\" href=\"Ticket/Editar?ID="+ ticket.getIdTicket() +"\"> Editar </a></td>");
                                out.print("</tr>");
                            }
                        %>
                </table>
            </div>
        </section>
    </body>
</html>
