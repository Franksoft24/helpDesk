<%-- 
    Document   : index
    Created on : Apr 5, 2015, 10:04:37 PM
    Author     : Frankmer
--%>

<%@page import="DAO.EstadoDAO"%>
<%@page import="DAO.PersonaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Estado"%>
<%@page import="model.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Estado> estados = EstadoDAO.listarEstados();
    List<Persona> personas = PersonaDAO.listarPersonas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Ticket</title>
        <link rel="stylesheet" type="text/css" href="../resources/css/style.css"/>
    </head>
    <body>
        <section>
            <div class="encabezado"><a href=".." class="link">Mis Tickets</a></div>
            <div class="Modulo-gestion-ticket">
                    <ul>
                    <li><a href="#" class="link dark">Crear Ticket</a></li>
                    <li><a href="" class="link dark">Buscar mis ticket</a></li>
                    <li><a href="help.html" class="link dark">Ayuda</a></li>
                </ul>
            </div>
            <div class="Contenedor">
                <form method="post" action="../RegistrarTicket"><table class="ticket">
                        <tr>
                            <th>Titulo:</th>
                            <td><input type="text" name="Titulo" placeholder="Mi pc no enciende" required/></td>
                        </tr>
                        <tr>
                            <th>Descripción:</th>
                            <td><input type="text" name="Descripcion" placeholder="motivo..." required/></td>
                        </tr>
                        <tr style="display:none;">
                            <th>Fecha Creacion:</th>
                            <td><input type="date" name="FechaCreacion" id="FechaCreacion"/></td>
                        </tr>
                        <tr>
                            <th>Estado:</th>
                            <td><select name="Estado" required disabled="true">
                                <%
                                    for (Estado estado : estados) {
                                        out.print("<option value='" + estado.getIdEstado() +"'>" + estado.getDescripcion() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <th>Empleado:</th>
                            <td><select name="Empleado" required>
                                <%
                                    for (Persona persona : personas) {
                                        out.print("<option value='" + persona.getIdPersona() +"'>" + persona.getNombre() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <th>Soporte:</th>
                            <td><select name="Soporte" required disabled="true">
                                <%
                                    for (Persona persona : personas) {
                                        out.print("<option value='" + persona.getIdPersona() +"'>" + persona.getNombre() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="reset" value="Cancelar" class="button"/><input type="submit" value="Registrar" class="button"/></td>
                        </tr>
                </table></form>
            </div>
        </section>
        <script type="text/javascript">
            function getDateNow(){
                var now = new Date();
                document.getElementById('FechaCreacion').value = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate();
            }
            getDateNow();
        </script>
    </body>
</html>
