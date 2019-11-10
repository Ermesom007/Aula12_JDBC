<%-- 
    Document   : manufacturer
    Created on : 10/11/2019, 20:11:33
    Author     : beatriz
--%>

<%@page import="br.com.fatecpg.db.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fabricantes - JavaDB</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Fabricantes</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Cidade</th>
                <th>Estado</th>
            </tr>
            <%try{%>
                <%for(Manufacturer m: Manufacturer.getList()){%>
            <tr>
                    <td><%= m.getId()%></td>
                    <td><%=m.getNome()%></td>
                    <td><%=m.getEmail()%></td>
                    <td><%=m.getCidade()%></td>
                    <td><%=m.getEstado()%></td>
                   <%}%>
            <%}catch(Exception e){ %>
                <tr>
                    <td colspan="3"><%= e.getMessage() %></td>
                </tr>
                <%} %>
            </tr>
        </table>
    </body>
</html>
