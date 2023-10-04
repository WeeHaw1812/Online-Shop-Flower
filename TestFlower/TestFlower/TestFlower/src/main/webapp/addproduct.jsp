<%-- 
    Document   : addproduct
    Created on : Jul 17, 2023, 9:47:35 AM
    Author     : MSI GTX
--%>

<%@page import="DAOs.AdminDAO"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Login</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>
    <body class="bg-gradient-primary">
        <div class="container">
            <%
                if (request.getParameter("btnAddProduct") != null && request.getParameter("btnAddProduct").equals("AddProduct")) {
                    int ID = Integer.parseInt(request.getParameter("Id"));
                    String FlowerName = request.getParameter("FlowerName");
                    String Linkimage = request.getParameter("Linkimage");
                    String Quantity = request.getParameter("Quantity");
                    String Price = request.getParameter("Price");
                    String Description = request.getParameter("Description");

                    AdminDAO dao = new AdminDAO();
                    
                        Product apr = new Product(ID, FlowerName, Linkimage, Quantity, Price, Description);
                        int ketqua = dao.AddProduct(apr);
                        if (ketqua == 0) {
                            response.sendRedirect("addproduct.jsp");
                        } else {
                            response.sendRedirect("Admin.jsp");
                        }
                    }
                
            %>
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Add Product</h1>
                                        </div>
                                        <form class="user" method="post" onsubmit="return validateForm()">
                                            <div class="form-group">
                                                ID <input class="form-control form-control-user" type="text" name="Id" id="IdField" />
                                                <div id="IdFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>
                                            <div class="form-group">
                                                Flower Name <input class="form-control form-control-user" type="text" name="FlowerName" id="flowernameField" />
                                                <div id="flowernameFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Link image <input class="form-control form-control-user" type="text" name="Linkimage" id="linkimageField" />
                                                <div id="linkimageFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Quantity <input class="form-control form-control-user" type="text" name="Quantity" id="quantityField" />
                                                <div id="quantityFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Price <input class="form-control form-control-user" type="text" name="Price" id="priceField" />
                                                <div id="priceFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Description <input class="form-control form-control-user" type="text" name="Description" id="descriptionField" />
                                                <div id="descriptionFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>
                                            <input type="submit" value="AddProduct" name="btnAddProduct" class="btn btn-primary btn-user btn-block" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function validateForm() {
                    var fields = [
                        //{id: "IdField", message: "Vui lòng nhập Id."},
                        {id: "flowernameField", message: "Vui lòng nhập Flower Name."},
                        {id: "linkimageField", message: "Vui lòng nhập Link image."},
                        {id: "quantityField", message: "Vui lòng nhập Quantity."},
                        {id: "priceField", message: "Vui lòng nhập Price."},
                        {id: "descriptionField", message: "Vui lòng nhập Description."}
                    ];

                    var errorFields = [];

                    for (var i = 0; i < fields.length; i++) {
                        var field = fields[i];
                        var element = document.getElementById(field.id);

                        if (element.value.trim() === "") {
                            errorFields.push(field.id);
                            document.getElementById(field.id + "Error").textContent = field.message;
                        } else {
                            document.getElementById(field.id + "Error").textContent = "";
                        }
                    }
                    if (errorFields.length > 0) {
                        return false; // Không gửi form khi có lỗi
                    }
                    return true; // Gửi form khi không có lỗi
                }
            </script>
        </div>
    </body>
</html>
