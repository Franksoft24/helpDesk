<%-- 
    Document   : index
    Created on : Apr 12, 2015, 2:21:42 PM
    Author     : Frankmer
--%>

<%@page import="DAO.TrackingDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Tracking"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My cool help desk - tracking</title>
    </head>
    <body>
        <%
            int ticketId = Integer.parseInt(request.getParameter("ID"));
            List<Tracking> tracking = TrackingDAO.buscarTracking(ticketId);
            for(Tracking tracking_ : tracking){
                out.print("<table><tr></tr></table>");
            }
        %>
    </body>
</html>
