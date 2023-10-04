<%-- 
    Document   : adminorder
    Created on : Jul 17, 2023, 3:45:13 PM
    Author     : MSI GTX
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css"/>
    </head>
    <body>
         <style>
            .link-box {
                border: 1px solid #333 ;
                padding: 5px;
                display: inline-block;
                text-decoration: none;
            }

            .link-box a {
                text-decoration: none;
                color: #000;
            }

        </style>
        <table id="example" class="mdl-data-table" style="width:100%">
            <h2>Order</h2>
            <div class="link-box">
                <a href="Admin.jsp">Quay Về Admin</a>
            </div>
            <thead>
                <tr>
                    <td>Customer Name</td>
                    <td>Address</td> 
                    <td>Phone</td>
                    <td>Product Buy</td>
                    <td>Quantity</td>
                    <td>Price</td>
                    <td>Total</td>
                </tr>
            </thead>
            <tbody>
                <%
                    AdminDAO dao = new AdminDAO();
                    ResultSet rs = dao.GetAllOrder();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("CustomerName")%></td>
                    <td><%= rs.getString("Address")%></td>
                    <td><%= rs.getString("Phone")%></td>
                    <td><%= rs.getString("ProductBuy")%></td>
                    <td><%= rs.getString("Quantity")%></td>
                    <td><%= rs.getString("Price")%></td>
                    <td><%= rs.getString("Total")%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
