<%-- 
    Document   : index
    Created on : Apr 7, 2015, 12:35:38 AM
    Author     : Frankmer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Ticket</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="../../resources/css/style.css"/>
    </head>
    <body>
        <section>
            <div class="encabezado"><a href="../.." class="link">Mis Tickets</a></div>
            <div class="Modulo-gestion-ticket">
                <ul>
                    <a href="../.." class="link dark"><li>Ver tickets</li></a>
                    <a href="../" class="link dark"><li>Crear Ticket</li></a>
                    <a href="" class="link dark"><li>Buscar mis ticket</li></a>
                    <a href="../help.html" class="link dark"><li>Ayuda</li></a>
                </ul>
            </div>
            <div class="Contenedor">
                <form method="get" action="../Detalles">
                    <table class="ticket">
                        <tr>
                            <th>Buscar por ID: </th>
                            <td><input type="text" name="ID" required /></td>
                        </tr>
                        <tr>
                            <th></th><td><input type="submit" class="button aceptar" value="Buscar"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
    </body>
</html>

