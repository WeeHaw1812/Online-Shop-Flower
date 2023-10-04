<%-- 
    Document   : forgot-password
    Created on : Jul 16, 2023, 5:05:17 PM
    Author     : MSI GTX
--%>

<%@page import="Models.Account"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Forgot Password</title>

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
                if (request.getParameter("btnReset") != null && request.getParameter("btnReset").equals("Reset Password")) {
                    String email = request.getParameter("txtemail");
                    String password = request.getParameter("txtpassword");
                    AccountDAO dao = new AccountDAO();
                    String encryptedPassword = dao.encryptToMD5(password);
                    Account existingAccount = new Account(null, email, encryptedPassword);

                    if (existingAccount != null) {
                        // Email exists in the system

                        existingAccount.setPassword(encryptedPassword);
                        int updateResult = dao.Update(existingAccount);

                        if (updateResult == 0) {
                            // Password update successful
                            String resetMessage = "Failed to update your password. Please try again later.";
                            request.setAttribute("resetMessage", resetMessage);

                        } else {
                            // Error occurred while updating password
                            String resetMessage = "Your password has been updated successfully.";
                            request.setAttribute("resetMessage", resetMessage);
                        }
                    } else {
                        // Email does not exist in the system
                        String resetMessage = "Invalid email address. Please enter a valid email.";
                        request.setAttribute("resetMessage", resetMessage);
                    }
                }

            %>

            <!-- Outer Row -->
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                            <p class="mb-4">We get it, stuff happens. Just enter your email address below
                                                and we'll send you a link to reset your password!</p>
                                        </div>
                                        <form method="post">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                                       aria-describedby="emailHelp" name="txtemail" placeholder="Enter Email Address...">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user" name="txtpassword"
                                                       id="exampleInputPassword" placeholder="Password">
                                            </div>
                                            <input type="submit" value="Reset Password" name="btnReset"
                                                   class="btn btn-primary btn-user btn-block">
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="register.jsp">Create an Account!</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="login.jsp">Already have an account? Login!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <%-- Display reset message if available --%>
                <% String resetMessage = (String) request.getAttribute("resetMessage");
                    if (resetMessage != null && !resetMessage.isEmpty()) {
                        out.println("<p>" + resetMessage + "</p>");
                    }
                %>
            </div>

    </body>
</html>
