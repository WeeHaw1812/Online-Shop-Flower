<%-- 
    Document   : login
    Created on : Jul 16, 2023, 3:54:43 PM
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
            <% if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Submit")) {
                    String email = request.getParameter("txtemail");
                    String pwd = request.getParameter("txtPWD");

                    if (email.isEmpty() || pwd.isEmpty()) {
                        // Kiểm tra nếu email hoặc mật khẩu bị bỏ trống
                        String errorMessage = "Vui lòng nhập đầy đủ email và mật khẩu.";
                        request.setAttribute("errorMessage", errorMessage);
                    } else {
                        Account tk = new Account(null, email, pwd);
                        AccountDAO dao = new AccountDAO();

                        boolean kq = dao.login(tk);

                        if (email.equals("PhucPHCE171653@fpt.edu.vn") || email.equals("hunghpce170046@fpt.edu.vn")) { // Nếu email là "Phucphce171653@fpt.edu.vn"
                            if (kq) { // Đăng nhập thành công
                                // thời gian đăng nhập là 3 ngày (3 * 24 * 60 * 60 giây)
                                // Session c = new Session("quantri", us);
                                Cookie c = new Cookie("quantri", email);
                                c.setMaxAge(3600);
                                response.addCookie(c);
                                // Chuyển hướng đến trang admin
                                response.sendRedirect("Admin.jsp");
                            } else { // Đăng nhập thất bại
                                // Báo lỗi đăng nhập thất bại
                                String errorMessage = "Email hoặc mật khẩu không đúng.";
                                request.setAttribute("errorMessage", errorMessage);
                            }
                        } else {
                            if (kq) { // Đăng nhập thành công
                                // thời gian đăng nhập là 3 ngày (3 * 24 * 60 * 60 giây)
                                // Session c = new Session("quantri", us);
                                Cookie c = new Cookie("quantri", email);
                                c.setMaxAge(3600);
                                response.addCookie(c);
                                // Chuyển hướng đến trang listProduct
                                response.sendRedirect("index.jsp");
                            } else { // Đăng nhập thất bại
                                // Báo lỗi đăng nhập thất bại
                                String errorMessage = "Email hoặc mật khẩu không đúng.";
                                request.setAttribute("errorMessage", errorMessage);
                            }
                        }
                    }
                }
            %>
            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-6 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">

                                <div class="col-lg-12">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        </div>
                                        <form class="user" method="post">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user"
                                                       id="exampleInputEmail" aria-describedby="emailHelp" name="txtemail"
                                                       placeholder="Enter Email Address...">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user" name="txtPWD"
                                                       id="exampleInputPassword" placeholder="Password">
                                            </div>
<!--                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Remember
                                                        Me</label>
                                                </div>
                                            </div>-->
                                            <input type="submit" value="Submit" name="btnSubmit" class="btn btn-primary btn-user btn-block" />
                                        </form>
                                        <% if (request.getAttribute("errorMessage") != null) {%>
                                        <div class="text-center text-danger mt-3">
                                            <p><%= request.getAttribute("errorMessage")%></p>
                                        </div>
                                        <% }%>
                                        <hr>

                                        </form>
                                        <hr>
<!--                                        <div class="text-center">
                                            <a class="small" href="forgot-password.jsp">Forgot Password?</a>
                                        </div>-->
                                        <div class="text-center">
                                            <a class="small" href="register.jsp">Create an Account!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>     

    </body>
</html>
