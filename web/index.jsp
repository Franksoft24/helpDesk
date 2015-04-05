<%-- 
    Document   : index
    Created on : Apr 5, 2015, 2:32:27 PM
    Author     : Frankmer
--%>

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
                    <li><a href="#" class="link dark">Crear Ticket</a></li>
                    <li><a href="#" class="link dark">Buscar mis ticket</a></li>
                    <li><a href="#" class="link dark">Ayuda</a></li>
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
                </table>
            </div>
        </section>
    </body>
</html>
