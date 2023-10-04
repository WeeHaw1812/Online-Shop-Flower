<%-- 
    Document   : chitiet
    Created on : Jul 13, 2023, 12:06:26 AM
    Author     : MSI GTX
--%>

<%@page import="Models.Detail"%>
<%@page import="Models.Account"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="DAOs.DetailDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <!--Bắt đầu phần Header-->
        <div class="header">
            <div class="products row row-small large-columns-4 medium-columns-3 small-columns-4 equalize-box center-align">
                <div class="logo"> <!--logo-->
                    <a href="index.jsp"><img src="img/logo.jpg"></a>
                </div>
                <div class="search"> <!--content search-->
                    <form method="GET" action="search.jsp">
                        <input type="text" name="keyword" placeholder="Nhập tên loại hoa...">
                        <button type="submit">Tìm kiếm</button>
                    </form>
                </div>
<!--                <div class="cart">
                    <a href="index.jsp"><img src="img/cart.png"></a>
                </div>-->

                <%
                    AccountDAO daos = new AccountDAO();
                    String dv = "";
                    boolean loggedIn = false;
                    String loggedInUser = null;
                    Account sve = null;
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("quantri")) {
                                loggedIn = true;
                                loggedInUser = cookie.getValue();
                                sve = daos.GetAccount(loggedInUser);
                                dv = sve.getName();
                                break;
                            }
                        }
                    }

                    // Kiểm tra cookie "quantri" có tồn tại hay không
                    if (loggedInUser == null) {
                        response.sendRedirect("index.jsp");
                    }
                %>
                <style>
                    .user-container {
                        border: 1px solid black; /* Tạo viền khung */
                        padding: 10px; /* Tạo khoảng cách bên trong khung */
                        width: fit-content; /* Chỉ chiều rộng cần thiết */
                    }

                    .logout-button {
                        display: none; /* Ẩn ban đầu */
                    }
                </style>

                <div class="user-container" onclick="toggleLogoutButton()">
                    <% if (loggedIn) {%>
                    <!-- Hiển thị thông tin người dùng đã đăng nhập -->
                    <a><%= dv%></a>
                    <% } else { %>
                    <!-- Hiển thị nút đăng nhập -->
                    <form action="login.jsp" method="post">
                        <input type="submit" value="Login">
                    </form>
                    <% } %>

                    <form action="login.jsp" method="post" class="logout-button">
                        <input type="submit" value="Logout">
                    </form>
                </div>

                <script>
                    function toggleLogoutButton() {
                        var logoutButton = document.querySelector('.logout-button');
                        logoutButton.style.display = (logoutButton.style.display === 'none') ? 'block' : 'none';
                    }
                </script>



            </div>
        </div>
        <!--phần Banner-->
        <div class="slideshow">
            <img src="img/Spring.jpg" class="banner" alt="Banner 1">
            <img src="img/Summer.jpg" class="banner" alt="Banner 2">
            <img src="img/Autumn.jpg" class="banner" alt="Banner 3">
            <img src="img/Winter.jpg" class="banner" alt="Banner 3">
        </div>

        <!--Kết thúc Header-->
        <div class="menu" id="flower-list"> <!--content menu-->
            <div class="products row row-small large-columns-4 medium-columns-3 small-columns-2 equalize-box center-align">

                <li><a href="index.jsp" class="dropbtn">Home</a></li>
                <li class="dropdown">
                    <a href="#" onclick="myFunction('flowerDropdown')" class="dropbtn">Flower</a>
                    <div id="flowerDropdown" class="dropdown-content">
                        <a href="hoahong.jsp">Hoa Hồng</a>
                        <a href="huongduong.jsp">Hoa Hướng Dương</a>
                        <a href="hoatulip.jsp">Hoa Tulip</a>
                        <a href="hoamaudon.jsp">Hoa Mẫu Đơn</a>
                    </div>
                </li>
                <li><a href="hoabo.jsp" class="dropbtn">Hoa Bó</a></li><!-- comment -->
                <li><a href="hoagio.jsp" class="dropbtn">Hoa Giỏ</a></li><!-- comment -->
                <li><a href="hoasinhnhat.jsp" class="dropbtn">Hoa Sinh Nhật</a></li><!-- comment -->
            </div>
        </div>




        <footer>
            <div class="footer-links"></div>
        </footer>
        <%
            int maso = Integer.parseInt(request.getParameter("maso"));
            DetailDAO dao = new DetailDAO();
            Detail sv = dao.GetProduct(maso);
            String pic = sv.getLinkimage();
            String FlowerName = sv.getFlowerName();
            int Price = sv.getPrice();
            int Quan = sv.getQuantity();
            String quantity = request.getParameter("quantity");

            session.setAttribute("pic", pic);
            session.setAttribute("flowerName", FlowerName);
            session.setAttribute("price", Price);
            session.setAttribute("quan", Quan);
            session.setAttribute("quantity", quantity);
        %>
        <div class="table">
            <div class="image">
                <img width="300" height="300" src="<%=pic%>" alt="hình ảnh">
            </div>
            <div class="content">
                <div class="titleproduct">
                    <h1><%=FlowerName%> </h1>
                </div>
                <div class="titleproduct">
                    <a><%= Price%> ₫</a> 
                </div>
                <br>
                <div class="titleproduct">
                    <span>tình trạng: </span>
                    <a><%=Quan%></a>
                </div>             
                Số Lượng: <input type="number"class="quantity" step="1" min="1" max="<%=Quan%>" name="quantity" value="1" title="SL" placeholder="" inputmode="numeric">
                <div class="titleproduct">
                    <br>
                    <span>Mô tả chi tiết: </span>
                    <a> <%= sv.getDescription()%></a>
                </div>
                <br>
                <a href="#" id="buyButton" class="submit-link">
                    <input type="submit" value="Mua hàng" class="submit-button">
                </a>

                <script>
                    document.getElementById("buyButton").addEventListener("click", function (e) {
                        e.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

                        var quantity = document.getElementsByName("quantity")[0].value; // Lấy giá trị từ trường nhập liệu

                        // Kiểm tra nếu quantity là null hoặc rỗng
                        if (!quantity) {
                            alert("Vui lòng nhập số lượng.");
                            return;
                        }

                        // Kiểm tra nếu quantity không phải là số
                        if (isNaN(quantity)) {
                            alert("Số lượng phải là một số.");
                            return;
                        }

                        // Kiểm tra nếu quantity nhỏ hơn hoặc bằng 0
                        if (parseInt(quantity) <= 0) {
                            alert("Số lượng phải lớn hơn 0.");
                            return;
                        }

                        // Tạo URL mới với giá trị quantity
                        var url = "thanhtoan.jsp?quantity=" + encodeURIComponent(quantity);

                        // Chuyển hướng đến trang thanh toán với URL mới
                        window.location.href = url;
                    });
                </script>
            </div>

        </div>
        <br>
        <footer>
            <div class="back-ground">
                <div class="inner-content">

                    <div class="ft-contact">
                        <h2>Flower Shop FPT</h2>
                        <div class="ft-contact-address">Địa chỉ: Cầu Rau Răm, đường Nguyễn Văn Cừ nối dài, An Bình, Ninh Kiều, Cần Thơ
                            900000</div>
                        <div class="ft-contact-tele">Số điện thoại: <a href="https://zalo.me/0382247620">0382247620</a> </div>

                        <div class="social-icons">
                            <a href="https://www.facebook.com/profile.php?id=100079505487688">
                                <img src="https://i.pinimg.com/474x/31/65/e7/3165e7e62b12b0cc513e6f45971996aa.jpg" alt="Facebook">
                            </a>
                            <a href="https://www.facebook.com/messages/t/100079505487688">
                                <img src="https://i.pinimg.com/474x/5f/c0/0f/5fc00f979873e919a67869ffc001ac68.jpg" alt="Messenger">
                            </a>
                            <a href="https://instagram.com/phucphce171653?igshid=OGQ5ZDc2ODk2ZA==">
                                <img src="https://i.pinimg.com/474x/85/60/3b/85603b87f49c708429e1e9f64c263676.jpg" alt="Telegram">
                            </a>
                            <a href="https://www.youtube.com/watch?v=i810CxN5Q6Q">
                                <img src="https://i.pinimg.com/474x/a7/c8/ab/a7c8aba89803b5f051e60fbcb4dcc004.jpg" alt="Twitter">
                            </a>
                        </div>
                    </div>



                    <div class="quick-links">
                        <h2>LIÊN KẾT NHANH</h2>
                        <ul class="quick-links-address">
                            <li><a href="#">Hoa Hồng</a></li>
                            <li><a href="#">Hoa Đào</a></li>
                            <li><a href="#">Hoa Tulip</a></li>
                            <li><a href="#">Hoa Hướng Dương</a></li>
                            <li><a href="#">Hoa Mai</a></li>
                            <li><a href="#">Hoa Ly</a></li>
                        </ul>
                    </div>

                    <div class="information">
                        <h2>THÔNG TIN</h2>
                        <ul class="information-address">
                            <li><a href="#">Trang Chủ</a></li>
                            <li><a href="#">Giới Thiệu</a></li>
                            <li><a href="#">Bảo Mật</a></li>
                            <li><a href="#">Chính Sách Đổi Trả</a></li>
                            <li><a href="#">Điều Khoản Dịch Vụ</a></li>
                        </ul>
                    </div>


                    <div class="newsletter">
                        <h2>ĐĂNG KÝ NHẬN TIN</h2>
                        <p>Hãy nhập địa chỉ email của bạn vào ô dưới đây để có thể nhận được
                            tất cả các tin tức mới nhất của Shop hoa tươi về các sản phẩm mới,
                            các chương trình khuyến mãi mới. Chúng tôi xin đảm bảo sẽ không gửi mail rác,
                            mail spam tới bạn</p>
                        <form>
                            <input type="email" placeholder="Nhập email của bạn...">
                            <input type="image" src="https://i.pinimg.com/474x/6b/5c/49/6b5c492b10b5aa22bdb6002577eff6a3.jpg"
                                   alt="Submit">

                        </form>
                    </div>


                </div> <!--kết thúc của thẻ nội dung bên trong-->
            </div><!--footer-->
        </footer>

        <script src="script.js"></script>
    </body>

</html>