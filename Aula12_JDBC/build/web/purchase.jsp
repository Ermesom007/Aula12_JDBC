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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Produtos - JavaDB</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navbar.jspf" %>
         
        <h1 text align="center">Compra</h1>
        <table class="table responsive table-hover table-sm table-dark">
            <tr>
                <th scope="col">ID Compra</th>
                <th scope="col">Cliente</th>
                <th scope="col">ID Produto</th>
                <th scope="col">Quantidade</th>
                <th scope="col">Custo de Envio</th>
                <th scope="col">Data da Venda</th>
                <th scope="col">Data de Envio </th>
                <th scope="col">Entregadora</th>

            </tr>
            <%try{%>
                
                <%
                    int id = Integer.parseInt(request.getParameter("costumer_id"));
                    if(Purchase.getById(id).isEmpty()) { %>
                    <td colspan="8">Nenhuma compra cadastrada para o cliente... <a href="<%= request.getContextPath()%>/customers.jsp">voltar para lista de clientes</a></td>
                    <% } 
                    for(Purchase p: Purchase.getById(id)){%>
            <tr>
                    <td class="table-primary text-dark"><%=p.getIdPurchase() %></td>
                    <td class="table-primary text-dark"><%=p.getCustomer()%></td>
                    <td class="table-primary text-dark"><%=p.getProduct()%></td>
                    <td class="table-primary text-dark"><%=p.getQuantity()%></td>
                    <td class="table-primary text-dark"><%=p.getShippingCost()%></td>
                    <td class="table-primary text-dark"><%=p.getSalesDate()%></td>
                    <td class="table-primary text-dark"><%=p.getShippingDate()%></td>
                    <td class="table-primary text-dark"><%=p.getFreightCompany()%></td>
                   <%}
                   %>
            <%}catch(Exception e){ %>
                <tr>
                    <td colspan="3"><%= e.getMessage() %></td>
                </tr>
                <%} %>
            </tr>
        </table>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    </body>
</html>

