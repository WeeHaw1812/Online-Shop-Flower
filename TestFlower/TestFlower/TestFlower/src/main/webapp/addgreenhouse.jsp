<%-- 
    Document   : addgreenhouse
    Created on : Jul 16, 2023, 11:00:57 PM
    Author     : MSI GTX
--%>

<%@page import="DAOs.AdminDAO"%>
<%@page import="Models.GreenHouse"%>
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
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>
    <body class="bg-gradient-primary">
        <div class="container">
            <% if (request.getParameter("btnGreenHouse") != null && request.getParameter("btnGreenHouse").equals("GreenHouse")) {
                    String name = request.getParameter("Name");
                    String manager = request.getParameter("Manager");
                    String owner = request.getParameter("Owner");
                    String address = request.getParameter("Address");
                    String managerPhoneString = request.getParameter("ManagerPhone");

                    // Kiểm tra dữ liệu nhập vào
                    GreenHouse pr = new GreenHouse(name, manager, owner, address, managerPhoneString);
                    AdminDAO dao = new AdminDAO();
                    int ketqua = dao.AddGreenHouse(pr);

                    if (ketqua == 0) {
                        response.sendRedirect("addgreenhouse.jsp");
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
                                            <h1 class="h4 text-gray-900 mb-4">Add GreenHouse</h1>
                                        </div>
                                        <form class="user" method="post" onsubmit="return validateForm()">
                                            <div class="form-group">
                                                Name <input class="form-control form-control-user" type="text" name="Name" id="nameField" />
                                                <div id="nameFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Manager <input class="form-control form-control-user" type="text" name="Manager" id="managerField" />
                                                <div id="managerFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Owner <input class="form-control form-control-user" type="text" name="Owner" id="ownerField" />
                                                <div id="ownerFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Address <input class="form-control form-control-user" type="text" name="Address" id="addressField" />
                                                <div id="addressFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>

                                            <div class="form-group">
                                                Manager Phone <input class="form-control form-control-user" type="text" name="ManagerPhone" id="managerPhoneField" />
                                                <div id="managerPhoneFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                            </div>
                                            <input type="submit" value="GreenHouse" name="btnGreenHouse" class="btn btn-primary btn-user btn-block" />
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
                        {id: "nameField", message: "Vui lòng nhập Name."},
                        {id: "managerField", message: "Vui lòng nhập Manager."},
                        {id: "ownerField", message: "Vui lòng nhập Owner."},
                        {id: "addressField", message: "Vui lòng nhập Address."},
                        {id: "managerPhoneField", message: "Vui lòng nhập ManagerPhone."}
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