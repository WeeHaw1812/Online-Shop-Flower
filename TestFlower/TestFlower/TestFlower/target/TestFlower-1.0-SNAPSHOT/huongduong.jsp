<%-- 
    Document   : hoahong
    Created on : Jul 13, 2023, 12:06:32 AM
    Author     : MSI GTX
--%>

<%@page import="Models.Account"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Detail" %>
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
                    Account sv = null;
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("quantri")) {
                                loggedIn = true;
                                loggedInUser = cookie.getValue();
                                sv = daos.GetAccount(loggedInUser);
                                dv = sv.getName();
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
        <div class="shop-container" >

            <div class="products row row-small large-columns-4 medium-columns-3 small-columns-2 equalize-box center-align">

                <%
                    DetailDAO dao = new DetailDAO();
                    ResultSet rs = dao.GetAll();
                    while (rs.next()) {
                        String flowerName = rs.getString("FlowerName");
                        boolean containsRose = flowerName.toLowerCase().contains("hướng dương");


                        if (containsRose) {
                %>
                <div class="flower">
                    <div class="col-inner">
                        <div class="box-image">
                            <div class="image_fade_in_back">                                
                                <img width="250" height="250" src="<%= rs.getString("Linkimage")%>" alt="Product Image">
                            </div>
                        </div>
                        <!--chuyển sang trang chi tiết-->
                        <div class="box-text">
                            <div class="title-wrapper">
                                <p class="product-title" style="height: 31px;"><a href="chitiet.jsp?maso=<%= rs.getString("ID")%>"><%= rs.getString("FlowerName")%></a></p>
                            </div>

                            <div class="price-wrapper" style="height: 19px;">
                                <span class="price"><%= rs.getString("Price")%>₫</span>
                            </div>
                            <div type="button" class="add-to-cart-button" style="height: 49px;" ><a href="datHang.jsp?maso=<%= rs.getString("ID")%>">Mua hàng</a></div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>


        <div class="introduct">
            <a>Hoa hướng dương là một trong những loài hoa rực rỡ và lộng lẫy nhất thế giới. Rạng rỡ, tươi sáng, vui tươi, tươi tốt và tràn đầy hạnh phúc 
                với những cánh hoa màu vàng tươi và thân cao xanh, khỏe mạnh, thật dễ hiểu tại sao rất nhiều người yêu thích chúng.Thường được sử dụng như một 
                biểu tượng của hạnh phúc và lời chúc mừng, Hoa hướng dương mang nhiều ý nghĩa từ sự tích cực và sức mạnh đến sự ngưỡng mộ và lòng trung thành,
                đó là lý do tại sao chúng thường được tặng khi tốt nghiệp và khi bắt đầu một công việc kinh doanh mới, cuộc sống mới.</a>
            <br>
            <div class="image_fade_in_back center-align ">
                <a href="https://i.pinimg.com/236x/a8/62/52/a862527e2398d207f8947b6ba1297651.jpg">
                    <img width="250" height="250"
                         src="https://i.pinimg.com/236x/a8/62/52/a862527e2398d207f8947b6ba1297651.jpg"> </a>
            </div>
            <div>
                <h2>Ý nghĩa hoa hướng dương</h2>
                <a>Mỗi loại hoa đều mang một ý nghĩa, sắc thái riêng. Hoa hướng dương là biểu thị của hạnh phúc và lạc quan. Chúng đại diện cho tuổi thọ, tình yêu và lòng trung thành đây là lí do tại sao chúng được ưu ái tặng như một món quà, những bông hoa màu vàng tươi của chúng có thể nâng cao tâm trạng của bất kì ai khi nhận được chúng.

                    Hoa hướng dương cũng đề cập đến khả năng sinh sản và vòng tròn của cuộc sống, biểu tượng của chúng như sự bảo vệ và khai sáng cho tâm trí, cơ thể, linh hồn và tinh thần, chúng đại diện cho nguồn cảm hứng, một thời điểm đáng nhớ hoặc một thời gian để tiến về phía trước.

                    Về mặt tâm linh, hoa hướng dương tượng trưng cho đức tin và được tôn thờ trên khắp nhiều nền văn hóa, hoa hướng dương giống như mặt trời, vốn là niềm khao khát tôn giao và tâm linh về khả năng tìm khiếm sự giác ngộ và chân lý, hoa hướng dương được người inca sử dụng để tượng trưng cho thần mặt trời</a>
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hướng dương đỏ : </strong>
                tượng trưng cho sức sống, ham muốn, năng lượng và niềm đam mê, cũng thịnh vượn và may mắn. Hoa hướng dương đỏ thường được sử dụng những những kệ hoa khai trương để chúc may mắn, khai trương hồng phát, kinh doanh thuận lợi.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hướng dương cam : </strong>
                là biểu tượng của tinh thần, hạnh phúc, năng lượng, khả năng sinh sản và may mắn. Chúng cũng đại diện cho sự cân bằng trong chúng ta. Hoa hướng dương cam sẽ làm cho ngôi nhà của bạn trở nên rực rỡ, thêm sức sống khi đặt chúng ở phòng khách hoặc phòng ăn của gia đình.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hướng dương vàng : </strong>
                giống như mặt trời, quyền lực và uy quyền đầy nguồn năng lượng, một bông hoa hướng dương vàng tượng trưng cho lòng tốt, sự sống, sự thật và sự bền bỉ, trường tồn, chúng là bản chất của thình yêu và lòng trung thành. Hoa hướng dương vàng là loài hoa sinh nhật lý tưởng để tặng bạn bè, hoặc tặng hoa tốt nghiệp, chúng cũng thích hợp tặng người lớn tuổi như ông bà vì màu vàng và ý nghĩa của chúng.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hướng dương trắng : </strong>
                là loại hoa hướng dương hiếm nhất, rất khó để có thể dễ dàng mua trong vườn hoặc để làm quà cho ai đó. Những bông hoa hướng dương màu trắng không phải là màu trắng tinh khiết mà có một chút bên màu vàng nhạt. Có hoa hướng dương xung quanh tượng trưng cho sự tinh khiết, hy vọng mới, tái sinh và hòa bình. Bạn có thể đặt hoa hướng dương cho những người thân yêu bắt đầu một chương mới của cuộc đời.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hướng dương hồng : </strong>
                không chỉ bắt mắt, lộng lẫy mà giống hoa này có thể khiến bất cứ ai mê mẩn bởi màu sắc độc đáo của nó. Những bông hoa hướng dương màu hồng đại diện cho sức khỏe tốt, sự ngây thơ, vinh quang, hoàng gia, sức khỏe và có ấn tượng sâu sắc với mọi người.
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