<%-- 
    Document   : product
    Created on : 10/11/2019, 20:42:37
    Author     : beatriz
--%>

<%@page import="br.com.fatecpg.db.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos - JavaDB</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Produtos</h1>
        <table border="1">
            <tr>
                <th>ID Produto</th>
                <th>ID Fabricante</th>
                <th>Descrição</th>

            </tr>
            <%try{%>
                <%for(Product p: Product.getList()){%>
            <tr>
                    <td><%= p.getIdProduto()%></td>
                    <td><%=p.getIdFabricante()%></td>
                    <td><%=p.getDescricao()%></td>
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

