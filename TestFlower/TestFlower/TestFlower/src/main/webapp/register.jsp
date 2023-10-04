<%-- 
    Document   : register
    Created on : Jul 16, 2023, 6:25:38 PM
    Author     : MSI GTX
--%>

<%@page import="DAOs.AccountDAO"%>
<%@page import="Models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Register</title>

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
            <%
                if (request.getParameter("register") != null && request.getParameter("register").equals("Create Account")) {
                    String name = request.getParameter("fullname");
                    String email = request.getParameter("txtemail");
                    String password = request.getParameter("txtpassword");
                    AccountDAO dao = new AccountDAO();
                    String hashedPassword = dao.encryptToMD5(password);

                    Account pr = new Account(name, email, hashedPassword);

                    int ketqua = dao.AddAccount(pr);
                    if (ketqua == 0) {
                        response.sendRedirect("register.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                }
            %>


            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form class="user" method="post" onsubmit="return validateForm()">
                                    <div class="form-group">     
                                        <input type="text" class="form-control form-control-user" id="FullnameField" name="fullname"
                                               placeholder="FullName">
                                        <div id="FullnameFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                    </div>

                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" id="EmailField" name="txtemail"
                                               placeholder="Email Address">
                                        <div id="EmailFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                    </div>

                                    <div class="form-group">   
                                        <input type="password" class="form-control form-control-user" name="txtpassword" 
                                               id="PasswordField" placeholder="Password">
                                        <div id="PasswordFieldError" class="text-center text-danger mt-3" style="font-size: 12px;"></div>
                                    </div>

                                    <input type="submit" value="Create Account" name="register" class="btn btn-primary btn-user btn-block">

                                </form>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function validateForm() {
                    var fields = [
                        //{id: "IdField", message: "Vui lòng nhập Id."},
                        {id: "FullnameField", message: "Vui lòng nhập Full Name."},
                        {id: "EmailField", message: "Vui lòng nhập Email must have '@'!"},
                        {id: "PasswordField", message: "Vui lòng nhập Password."}
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
