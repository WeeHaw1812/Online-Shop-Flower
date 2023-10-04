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
                        boolean containsRose = flowerName.toLowerCase().contains("mẫu đơn");

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
            <a>Mẫu đơn : là loài hoa đẹp được biết đến với màu sắc tươi sáng và những bông hoa to, tươi tốt. Chúng là một lựa chọn phổ biến cho các bó hoa, cho một dịp đặc biệt hay đơn giản là một món quà cho người bạn yêu thương. </a>
            <br>
            <div class="image_fade_in_back center-align ">
                <a href="https://i.pinimg.com/236x/fb/5c/89/fb5c899437fa646378d776613f92c53e.jpg">
                    <img width="250" height="250"
                         src="https://i.pinimg.com/236x/fb/5c/89/fb5c899437fa646378d776613f92c53e.jpg"> </a>
            </div>
            <div>
                <h2>Ý nghĩa hoa mẫu đơn</h2>
                <a>Bên cạnh vẻ đẹp và ý nghĩa của nó trong các nền văn hóa khác nhau, hoa mẫu đơn còn có ý nghĩa tâm linh. Trong Phong Thủy, nó được cho là mang lại may mắn, thịnh vượng và hạnh phúc, khiến nó trở thành một lựa chọn phổ biến để trang trí nhà cửa. Loài hoa này cũng tượng trưng cho sự chữa lành, cân bằng và biến đổi, khiến nó trở thành một công cụ mạnh mẽ để thiền định và phát triển tâm linh. Trong một số thực hành tâm linh, Hoa mẫu đơn được cho là có tác dụng mở luân xa tim, nâng cao khả năng yêu thương và lòng trắc ẩn.

                    Hơn nữa, Hoa mẫu đơn cũng gắn liền với năng lượng nữ tính thần thánh. Nó đại diện cho sự duyên dáng, vẻ đẹp và phẩm chất nuôi dưỡng, khiến nó trở thành biểu tượng của tình mẫu tử và tình mẫu tử. Những cánh hoa mềm mại và mỏng manh cũng tượng trưng cho sự dễ bị tổn thương và nhạy cảm, nhắc nhở chúng ta hãy đón nhận cảm xúc và kết nối với nội tâm của mình. Ở một số nền văn hóa, Hoa mẫu đơn cũng được cho là biểu tượng của danh dự, sự tôn trọng và sự giàu có, khiến nó trở thành món quà phổ biến cho những dịp đặc biệt như đám cưới và ngày kỷ niệm.

                    Hoa mẫu đơn có nhiều màu sắc khác nhau, và mỗi sắc thái có ý nghĩa và biểu tượng riêng. Hoa mẫu đơn màu hồng mềm mại tượng trưng cho sự duyên dáng, ngây thơ và lòng trắc ẩn. Hoa mẫu đơn màu hồng đậm hơn tượng trưng cho niềm đam mê, sự lãng mạn và sự chân thành. Hoa mẫu đơn màu đỏ tươi biểu thị sức mạnh, sự tự tin và quyền lực. Bất kể sắc thái nào, Hoa mẫu đơn tượng trưng cho tình yêu, vẻ đẹp và sự nữ tính, khiến nó trở thành một món quà hoàn hảo cho người bạn yêu thương.

                    Ngoài các sắc thái khác nhau của màu hồng, hoa mẫu đơn còn có các màu khác như trắng, đỏ và vàng. Hoa mẫu đơn trắng tượng trưng cho sự thuần khiết, ngây thơ và những khởi đầu mới. Hoa mẫu đơn đỏ tượng trưng cho đam mê, khát khao và sức mạnh. Hoa mẫu đơn màu vàng tượng trưng cho hạnh phúc, tình bạn và sự may mắn.

                    Hoa mẫu đơn đã được sử dụng trong nhiều thế kỷ trong y học cổ truyền Trung Quốc vì đặc tính chữa bệnh của chúng. Chúng được cho là có tác dụng chống viêm, chống oxy hóa và chống ung thư. Hoa mẫu đơn cũng được sử dụng trong liệu pháp mùi hương vì tính chất làm dịu và thư giãn của chúng.</a>            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa mẫu đơn trắng : </strong>
                Mẫu đơn trắng tượng trưng cho sự thuần khiết, ngây thơ, trung thực và sự thật. Vì lý do này, chúng thường được sử dụng trong đám cưới và các dịp nghi lễ khác.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa mẫu đơn hồng : </strong>
                Hoa mẫu đơn màu hồng tượng trưng cho sự dịu dàng, tình yêu, tình bạn và lòng biết ơn. Chúng cũng có thể được hiểu là biểu hiện của vẻ đẹp và sự sang trọng. Những bông hoa này là một món quà hoàn hảo cho những người thân yêu hoặc bạn bè.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa mẫu đơn đỏ : </strong>
                Mẫu đơn đỏ tượng trưng cho niềm đam mê, tình yêu, sự đánh giá cao và sự tôn trọng. Những ý nghĩa nổi tiếng hơn cũng bao gồm lòng dũng cảm và sức mạnh. Mẫu đơn đỏ thường được dùng trong những dịp lãng mạn như lễ tình nhân hay ngày kỷ niệm.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa mẫu đơn vàng : </strong>
                Tình bạn, hạnh phúc, niềm vui và sự lạc quan đều là những ý nghĩa khác nhau của hoa mẫu đơn màu vàng. Màu này đặc biệt thích hợp nhất để làm quà tặng cho bạn bè hoặc trang trí trong các dịp lễ tết.
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