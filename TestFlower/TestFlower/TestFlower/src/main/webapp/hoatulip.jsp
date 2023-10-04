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
                        boolean containsRose = flowerName.toLowerCase().contains("tulip");

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
            <a>Hoa tulip là một trong những loài hoa rực rỡ và quyến rũ nhất nở vào mùa xuân. Chúng có nhiều màu sắc,
                và mỗi màu có một ý nghĩa và biểu tượng đặc biệt. Hơn nữa, chúng là một hiện vật văn hóa quan trọng giữ một vị trí đặc biệt trong trái 
                tim của mọi người trên khắp thế giới. Hoa tulip là một trong những loại hoa cắt cành phổ biến được sử dụng nhiều trong nghệ thuật cắm hoa,
                là loài hoa cưới, hoa sinh nhật, hoa kỷ niệm không thể thiếu.</a>
            <br>
            <div class="image_fade_in_back center-align ">
                <a href="https://i.pinimg.com/236x/cf/f5/1b/cff51b2b478239445e9340f76d3162bc.jpg">
                    <img width="250" height="250"
                         src="https://i.pinimg.com/236x/cf/f5/1b/cff51b2b478239445e9340f76d3162bc.jpg"> </a>
            </div>
            <div>
                <h2>Ý nghĩa hoa Tulip</h2>
                <a>Hoa tulip đã đóng một vai trò quan trọng trong văn hóa của nhiều xã hội khác nhau, từ Đế chế Ottoman đến Hà Lan. Ở Thổ Nhĩ Kỳ, chúng tượng trưng cho mùa xuân đến và gắn liền với sự khởi đầu của năm mới. Ở Hà Lan, chúng là một biểu tượng quốc gia và được tổ chức hàng năm trong Lễ hội hoa Tulip. Hơn nữa, hoa tulip tượng trưng cho tình yêu, sự thuần khiết và phong phú trong văn hóa Hindu, trong khi trong văn hóa Hồi giáo, chúng tượng trưng cho thiên đường.
                    Ngoài ý nghĩa văn hóa, hoa tulip còn có một lịch sử phong phú trong thế giới nghệ thuật. Trong Thời kỳ hoàng kim của Hà Lan, hoa tulip rất được săn đón và trở thành chủ đề phổ biến cho các bức tranh tĩnh vật. Các nghệ sĩ như Jan Davidsz de Heem và Ambrosius Bosschaert đã tạo ra những bức tranh phức tạp và chi tiết về hoa tulip, thể hiện vẻ đẹp và sự quý hiếm của chúng. Ngày nay, hoa tulip tiếp tục truyền cảm hứng cho các nghệ sĩ và nhà thiết kế, với màu sắc rực rỡ và hình dạng độc đáo thường được sử dụng trong thiết kế hoa và thiết kế thời trang.</a>
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu đỏ : </strong>
                Hoa tulip đỏ mang ý nghĩa là "tình yêu hoàn hảo", đây là loài hoa tượng trưng cho sự lãng mạn, đam mê nóng bỏng và tình yêu nồng cháy, khiến chúng trở thành lựa chọn hoàn hảo dành cho các cặp đôi đang yêu nhau, vợ chồng mới cưới...Một nửa kia của bạn chắc chắn sẽ rất hạnh phúc khi được tặng một bó hoa tulip đỏ rực rỡ, thay lời thổ lộ về một tình yêu bền vững.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu hồng : </strong>
                Ý nghĩa của hoa tulip hồng như một lời chúc may mắn, đầy tốt đẹp dành cho người nhận, bởi hoa tulip màu hồng là biểu tượng của  sự may mắn, hạnh phúc viên mãn hay thể hiện sự quan tâm, chăm sóc đặc biệt.
                Màu hoa này thường được lựa chọn để tặng trong những dịp trọng đại như lễ tốt nghiệp, mừng thăng chức...
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu tím : </strong>
                Hoa tulip màu tím thường được biết đến là biểu tượng của hoàng gia, đầy quyền lực, sang trọng. Không những vậy, nó còn đại diện cho sự lãng mạn, phấn khởi. Đây là loài hoa thường được các cô dâu phương Tây lựa chọn làm hoa cưới trong ngày trọng đại nhất của cuộc đời. 
                Với những thông điệp trên, bạn có thể chọn hoa tulip tím làm quà tặng trong những dịp như mừng tân gia, khai trương cửa hàng...           
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu trắng : </strong>
                Hoa tulip màu trắng đại diện cho sự thánh thiện, tinh khiết và danh dự, vì thế nó đã trở thành một món quà được nhiều người yêu quý dành cho một kỷ niệm, một cột mốc quan trọng trong tôn giáo như rửa tội, sự hiệp thông…           </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu cam : </strong>
                Hoa tulip màu cam là loài hoa được ưa chuộng nhất hiện nay, nó tượng trưng cho sự ấm áp, hạnh phúc và thường được dùng để truyền cảm giác thấu hiểu, liên kết giữa hai người trong một mối quan hệ phức tạp.
                Chính vì thế, màu hoa này thường được các cặp đôi yêu nhau, các cặp vợ chồng dành tặng cho nhau trong những dịp đặc biệt nhằm thể hiện sự nhiệt tình, nóng bỏng và hiểu biết lẫn nhau qua bó hoa.          
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu xanh : </strong>
                Ý nghĩa hoa tulip xanh rất đặc biệt, nó là một trong những loài hoa duy nhất đại diện cho sự độc lập, độc đáo và đầy cá tính. Mặc dù đây không nằm trong bảng màu tự nhiên của hoa và được lai tạo từ các nhà thực vật tài ba. Vì thế, hoa tulip màu xanh được rất nhiều người mê hoa "săn lùng".
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa tulip màu vàng : </strong>
                Màu vàng là màu đại diện cho hạnh phúc, vui vẻ, may mắn và hy vọng, nên hiện nay tulip vàng cũng rất được ưa chuộng. Nếu bạn đang muốn trang trí thêm sắc màu cho căn nhà, đồng thời đón thêm chút may mắn, thịnh vượng thì trồng hoa tulip vàng ở sân trước là một lựa chọn rất đáng thử đó nhé.     
            </div>
        </div>
            
            
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