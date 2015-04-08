<%-- 
    Document   : index.jsp
    Created on : Apr 6, 2015, 10:47:51 PM
    Author     : Frankmer
--%>

<%@page import="DAO.*"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Estado> Estados = EstadoDAO.listarEstados();
    List<Persona> personas = PersonaDAO.listarPersonas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Ticket</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css"/>
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
            int EstadoId = 0;
            int TicketId = 0;
            int PersonaId = 0;
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
                EstadoId=ticket.getEstado();
                PersonaId=ticket.getSoporte();//Este es el id del soporte
            }
        %>
        <section>
            <div class="encabezado"><a href="../.." class="link">Mis Tickets</a></div>
            <div class="Modulo-gestion-ticket">
                <ul>
                    <a href="../" class="link dark"><li>Crear Ticket</li></a>
                    <a href="../Buscar/" class="link dark"><li>Buscar mis ticket</li></a>
                    <a href="../help.html" class="link dark"><li>Ayuda</li></a>
                </ul>
            </div>
            <div class="Contenedor">
                <form method="post" action="../../ActualizarTicket"><table class="ticket">
                        <tr>
                            <th>Ticket ID:</th>
                            <td><% out.print(TicketId +"<input style=\"display: none;\" type=\"text\" name=\"idTicket\" value=\""+ TicketId +"\" />");%></td>
                        </tr>
                        <tr>
                            <th>Titulo:</th>
                            <td><% out.print("<input type=\"text\" name=\"Titulo\" value=\""+ titulo_ +"\" disabled=\"true\" />");%></td>
                        </tr>
                        <tr>
                            <th>Descripción:</th>
                            <td><% out.print("<input type=\"text\" name=\"Descripcion\" value=\""+ descripcion_ +"\" disabled=\"true\" />");%></td>
                        </tr>
                        <tr>
                            <th>Fecha Creacion:</th>
                            <td><% out.print("<input type=\"text\" name=\"FechaCreacion\" value=\""+ fecha +"\" disabled=\"true\" />");%></td>
                        </tr>
                        <tr>
                            <th>Estado:</th>
                            <td><select name="Estado" id="Estado" required>
                                <%
                                    for (Estado estado : Estados) {
                                        out.print("<option value='" + estado.getIdEstado() +"'>" + estado.getDescripcion() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <th>Empleado:</th>
                            <td><% out.print("<input type=\"text\" name=\"Empleado\" value=\""+ empleado_ +"\" disabled=\"true\" />");%></td>
                        </tr>
                        <tr>
                            <th>Soporte:</th>
                            <td><select name="Soporte" id="Soporte" required>
                                <%
                                    for (Persona persona : personas) {
                                        out.print("<option value='" + persona.getIdPersona() +"'>" + persona.getNombre() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="submit" value="Actualizar" class="button aceptar"/></td>
                        </tr>
                </table></form>
            </div>
        </section>
        <script type="text/javascript">
            function asignarValor(){
                document.getElementById("Estado").value=<%out.print(EstadoId);%>;
                document.getElementById("Soporte").value=<%out.print(PersonaId);%>;
            }
            asignarValor();
        </script>
    </body>
</html>
