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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Produtos - JavaDB</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/navbar.jspf" %>
         <% int id = Integer.parseInt(request.getParameter("id"));%>
        <h1>Produtos do Fabricante <%=id%></h1>
        <table class="table responsive table-hover table-sm table-dark">
            <tr>
                <th scope="col">ID Produto</th>
                <th scope="col">Codigo do Produto</th>
                <th scope="col">Descricao</th>
                 <th scope="col">Disponivel no Estoque</th>
                 <th scope="col">Preco</th>
                  <th scope="col">ID Fabricante</th>

            </tr>
            <%try{%>
                <%for(Product p: Product.getList(id)){%>
            <tr>
                    <td class="table-primary text-dark"><%= p.getIdProduto()%></td>
                    <td class="table-primary text-dark"><%=p.getCodigo()%></td>
                    <td class="table-primary text-dark"><%=p.getDesc()%></td>
                    <td class="table-primary text-dark"><%=p.getDisp()%></td>
                    <td class="table-primary text-dark"><%=p.getPreco()%></td>
                    <td class="table-primary text-dark"><%=p.getIdFabricante()%></td>
                    
                   <%}%>
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

