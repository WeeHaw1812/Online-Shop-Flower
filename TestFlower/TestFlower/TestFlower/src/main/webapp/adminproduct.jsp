<%-- 
    Document   : adminproduct
    Created on : Jul 17, 2023, 2:39:13 PM
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
            <h2>Product</h2>
            <div class="link-box">
                <a href="addproduct.jsp">Add Product</a>
            </div>
            <div class="link-box">
                <a href="Admin.jsp">Quay Về Admin</a>
            </div>
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Flower Name</td> 
                    <td>Image</td>
                    <td>Quantity</td>
                    <td>Price</td>
                    <td>Description</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    AdminDAO dao = new AdminDAO();
                    if (request.getParameter("maso") != null && !request.getParameter("maso").equals("")) {
                        int id = Integer.parseInt(request.getParameter("maso"));
                        dao.DeleteProduct(id);
                        response.sendRedirect("adminproduct.jsp");
                    }

                    ResultSet rs = dao.GetAllProduct();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("ID")%></td>
                    <td><%= rs.getString("FlowerName")%></td>
                    <td><img src="<%= rs.getString("Linkimage")%>" style="width:100px"alt="Product Image"></td>
                    <td><%= rs.getString("Quantity")%></td>
                    <td><%= rs.getString("Price")%></td>
                    <td><%= rs.getString("Description")%></td>
                    <td> <div class="link-box">
                            <a href="adminproduct.jsp?maso=<%= rs.getString("ID")%>">Delete</a>
                        </div>
                        <div class="link-box">
                            <a href="updateProduct.jsp?maso=<%= rs.getString("ID")%>">Update</a>  
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
