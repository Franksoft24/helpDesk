<%-- 
    Document   : index
    Created on : Apr 7, 2015, 12:16:33 PM
    Author     : Frankmer
--%>

<%@page import="DAO.PersonaDAO"%>
<%@page import="DAO.FedbackDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Persona" %>
<%@page import="model.Fedback"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentar Ticket</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/style.css"/>
    </head>
    <body>
        <%
            int FedbackId = Integer.parseInt(request.getParameter("ID"));
            List<Fedback> comentarios = FedbackDAO.editarComentarios(FedbackId);
            String Comentario_ = null;
            String Empleado_ = null;
            int TicketID = 0;
            for (Fedback comentario : comentarios){
                Comentario_ = comentario.getComentario();
                List<Persona> personas = PersonaDAO.buscarPersonas(comentario.getEmpleado());
                for (Persona empleado : personas){
                    Empleado_ = empleado.getNombre();
                }
                TicketID = comentario.getTicket();
            }
        %>
        <section>
            <div class="encabezado"><a href="../.." class="link">Mis Tickets</a></div>
            <div class="Modulo-gestion-ticket">
                <ul>
                    <li><a href="../" class="link dark">Crear Ticket</a></li>
                    <li><a href="../Buscar/" class="link dark">Buscar mis ticket</a></li>
                    <li><a href="../help.html" class="link dark">Ayuda</a></li>
                </ul>
            </div>
            <div class="Contenedor">
                <form method="get" action="../../ActualizarFedback">
                    <table class="ticket">
                        <tr style="display: none;">
                            <th>Tedback ID: </th>
                            <td><% out.print("<input type=\"text\" name=\"idFedback\" value=\""+ FedbackId +"\" />");%></td>
                        </tr>
                        <tr style="display: none;">
                            <th>Ticket ID: </th>
                            <td><% out.print("<input type=\"text\" name=\"Ticket\" value=\""+ TicketID +"\" />");%></td>
                        </tr>
                        <tr>
                            <th>Comentario: </th>
                            <td><% out.print("<input type=\"text\" name=\"Comentario\" value=\""+ Comentario_ +"\" required />");%></td>
                        </tr>
                        <tr>
                            <th>Empleado:</th>
                            <td><% out.print("<input type=\"text\" name=\"Empleado\" value=\""+ Empleado_ +"\" required disabled=\"true\" />");%></td>
                        </tr>
                        <tr>
                            <th></th><td><input type="submit" class="button" value="Guardar"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
    </body>
</html>
