<%-- 
    Document   : Admin
    Created on : Jul 16, 2023, 6:48:53 PM
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
            table, th, td {
                border: 1px solid black;
            }
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
        <div class="link-box">
                <a href="adminproduct.jsp">Product</a>
            </div>
        <div class="link-box">
                <a href="adminorder.jsp">Order</a>
            </div>
        <div class="link-box">
            <a href="index.jsp">Quay Về Trang Chủ</a>
        </div>
        <table style="width:100%">
            <h2>Buy Flower</h2>
            <thead>
                <tr>
                    <td>ID</td>
                    <td>GreenHouse</td> 
                    <td>SalesPerson</td>
                    <td>Total</td>
                    <td>Buy Date</td>
                </tr>
            </thead>
            <tbody>
                <%
                    AdminDAO dao = new AdminDAO();
                    ResultSet rs = dao.GetAllBuy();
                    while (rs.next()) {
                %>

                <tr>
                    <td><%= rs.getInt("ID")%></td>
                    <td><%= rs.getInt("GreenHouseID")%></td>
                    <td><%= rs.getInt("SalesPersonID")%></td>
                    <td><%= rs.getInt("TotalPeyment")%></td>
                    <td><%= rs.getDate("BuyDate")%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div style="margin-top: 50px;"></div>

        <h2>GreenHouse</h2>
        <table style="width:100%">
            <div class="link-box">
                <a href="addgreenhouse.jsp">Add GreenHouse</a>
            </div>
            <thead>
                <tr>
                    <td>Id</td>
                    <td>Name</td> 
                    <td>Manager</td>
                    <td>Owner</td>
                    <td>Address</td>
                    <td>Manager Phone</td>
                </tr>
            </thead>
            <tbody>
                <%
                    if (request.getParameter("maso") != null && !request.getParameter("maso").equals("")) {
                        int id = Integer.parseInt(request.getParameter("maso"));
                        dao.Delete(id);
                        response.sendRedirect("Admin.jsp");
                    }
                    rs = dao.GetAllGreenHouse();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("ID")%></td>
                    <td><%= rs.getString("Name")%></td>
                    <td><%= rs.getString("Manager")%></td>
                    <td><%= rs.getString("Owner")%></td>
                    <td><%= rs.getString("Address")%></td>
                    <td><%= rs.getString("ManagerPhone")%></td>
                    <td> <div class="link-box">
                            <a href="Admin.jsp?maso=<%= rs.getString("ID")%>">Delete</a>
                        </div>
                        <div class="link-box">
                            <a href="updategreenhouse.jsp?maso=<%= rs.getString("ID")%>">Update</a>  
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
