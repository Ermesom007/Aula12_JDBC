<%-- 
    Document   : product
    Created on : 10/11/2019, 20:42:37
    Author     : romario
--%>

<%@page import="br.com.fatecpg.db.Purchase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos - JavaDB</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <h1>Compra</h1>
        <table border="1">
            <tr>
                <th>ID Compra</th>
                <th>Cliente</th>
                <th>ID Produto</th>
                <th>Quantidade</th>
                <th>Custo de Envio</th>
                <th>Data da Venda</th>
                <th>Data de Envio </th>
                <th>Entregadora</th>

            </tr>
            <%try{%>
                
                <%
                    int id = Integer.parseInt(request.getParameter("costumer_id"));
                    if(Purchase.getById(id).isEmpty()) { %>
                    <td colspan="8">Nenhuma compra cadastrada para o cliente... <a href="<%= request.getContextPath()%>/customers.jsp">voltar para lista de clientes</a></td>
                    <% } 
                    for(Purchase p: Purchase.getById(id)){%>
            <tr>
                    <td><%=p.getIdPurchase() %></td>
                    <td><%=p.getCustomer()%></td>
                    <td><%=p.getProduct()%></td>
                    <td><%=p.getQuantity()%></td>
                    <td><%=p.getShippingCost()%></td>
                    <td><%=p.getSalesDate()%></td>
                    <td><%=p.getShippingDate()%></td>
                    <td><%=p.getFreightCompany()%></td>
                   <%}
                   %>
            <%}catch(Exception e){ %>
                <tr>
                    <td colspan="3"><%= e.getMessage() %></td>
                </tr>
                <%} %>
            </tr>
        </table>
    </body>
</html>

