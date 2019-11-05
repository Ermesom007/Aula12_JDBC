<%-- 
    Document   : custormers
    Created on : 04/11/2019, 21:08:30
    Author     : emers
--%>

<%@page import="br.com.fatecpg.db.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes - JavaDB</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Clientes</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>E-mail</th>
            </tr>
            <%try{%>
                <%for(Customer c: Customer.getList()){%>
            <tr>
                    <td><%= c.getId()%></td>
                    <td><%=c.getName()%></td>
                    <td><%=c.getEmail()%></td>
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
