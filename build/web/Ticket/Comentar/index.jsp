<%-- 
    Document   : index
    Created on : Apr 7, 2015, 10:37:11 AM
    Author     : Frankmer
--%>
<%@page import="DAO.PersonaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Persona" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentar Ticket</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/css/style.css"/>
    </head>
    <body>
        <%
            int TicketId = Integer.parseInt(request.getParameter("ID"));
        %>
        <section>
            <div class="encabezado"><a href="../.." class="link">Mis Tickets</a></div>
            <div class="Modulo-gestion-ticket">
                <ul>
                    <a href="../.." class="link dark"><li>Ver tickets</li></a>
                    <a href="../" class="link dark"><li>Crear Ticket</li></a>
                    <a href="../Buscar/" class="link dark"><li>Buscar mis ticket</li></a>
                    <a href="../help.html" class="link dark"><li>Ayuda</li></a>
                </ul>
            </div>
            <div class="Contenedor">
                <form method="post" action="../../RegistrarFedback">
                    <table class="ticket">
                        <tr style="display: none;">
                            <th>Ticket ID: </th>
                            <td><% out.print("<input type=\"text\" name=\"Ticket\" value=\""+ TicketId +"\" />");%></td>
                        </tr>
                        <tr>
                            <th>Comentario: </th>
                            <td><input type="text" name="Comentario" required /></td>
                        </tr>
                        <tr>
                            <th>Empleado:</th>
                            <td><select name="Empleado" required>
                                <%
                                   List<Persona> personas = PersonaDAO.listarPersonas();
                                    for (Persona persona : personas) {
                                        out.print("<option value='" + persona.getIdPersona() +"'>" + persona.getNombre() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <th></th><td><input type="submit" class="button aceptar" value="Comentar"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
    </body>
</html>
