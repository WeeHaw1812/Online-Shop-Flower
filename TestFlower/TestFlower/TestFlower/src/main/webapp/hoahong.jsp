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
                        boolean containsRose = flowerName.toLowerCase().contains("hoa hồng");

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
            <a>Hoa Hồng từ lâu đã  là một trong những món quà ấn tượng, phổ biến và xứng đáng mà ai cũng có thể nhận được.
                Cho dù bạn đang tìm kiếm một món quà tặng bạn gái cho Ngày lễ tình nhân hay tặng một bó hoa hồng cổ điển và vượt thời gian cho Ngày của mẹ,
                Giáng sinh, sinh nhật hay lời cảm ơn, loài hoa bất khuất này thực sự là món quà ý nghĩa nhất. 
                Cùng Điện Hoa Xanh tìm hiểu ý nghĩa hoa hồng để bó hoa của bạn không chỉ đẹp mà còn mang ý nghĩa sâu sắc .</a>
            <br>
            <div class="image_fade_in_back center-align ">
                <a href="https://i.pinimg.com/236x/cc/e4/70/cce470ecd82eb5fcab25fbd021d858e9.jpg">
                    <img width="250" height="250"
                         src="https://i.pinimg.com/236x/cc/e4/70/cce470ecd82eb5fcab25fbd021d858e9.jpg"> </a>
            </div>
            <div>
                <h2>Ý nghĩa hoa hồng</h2>
                <a>Hoa hồng được biết đến với vẻ đẹp mê hoặc và biểu tượng mơ hồ nhưng hấp dẫn.  Vẻ đẹp của chúng thật quyến rũ, và biểu tượng của chúng rất bí ẩn và đa dạng. 

                    Từ Rosal có nguồn gốc từ tiếng Hy Lạp ‘rodon’, có nghĩa là hoa hồng.  Những bông hoa xinh đẹp này truyền tải nhiều thông điệp tinh thần và cảm xúc khác nhau tùy thuộc vào màu sắc của chúng và người nhận chúng. Chúng tượng trưng cho tình yêu, tình cảm và niềm vui, và chúng đã được sử dụng để thể hiện những cảm xúc tinh thần khác nhau trong nhiều thế kỷ.

                    Ngoài ra, hoa hồng cũng có liên quan đến sự chữa lành và đổi mới. Người ta tin rằng màu sắc rực rỡ và hương thơm ngọt ngào của hoa có tác dụng làm dịu tâm trí và cơ thể, giúp thư giãn và giảm căng thẳng. Ở một số nền văn hóa, hoa hồng được sử dụng trong y học cổ truyền để điều trị các bệnh khác nhau, bao gồm đau đầu, sốt và các vấn đề về tiêu hóa. Đặc tính chữa bệnh của hoa cũng được cho là mở rộng đến việc chữa lành cảm xúc và tinh thần, giúp các cá nhân vượt qua đau buồn, chấn thương và những thử thách cảm xúc khác.</a>
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hồng đỏ : </strong>
                Hoa hồng đỏ là biểu hiện của tình yêu. Ngoài hoa tươi, hoa hồng sáp điển hình nhất với màu đỏ truyền tải những cảm xúc sâu sắc – 
                có thể là tình yêu, khao khát. Hoa hồng đỏ cũng có thể được sử dụng để thể hiện sự tôn trọng, ngưỡng mộ hoặc sự tận tâm. 
                Số lượng hoa hồng đỏ có ý nghĩa lãng mạn đặc biệt gắn liền với chúng. 12 bông hồng đỏ là phổ biến nhất trong đó truyền tải
                “Hãy là của tôi” và “Tôi yêu bạn”
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hồng trắng :</strong>
                Màu trắng là màu của sự tinh khiết, trong trắng và ngây thơ . Hoa màu trắng thường liên quan đến sự khởi đầu mới nên là loài hoa lý tưởng cho bó hoa cô dâu . Hoa màu trắng có thể được sử dụng để truyền đạt sự cảm thông hoặc khiêm tốn. Chúng cũng là biểu hiện của tâm linh. Do đó, hoa hồng trắng là bông hoa linh hoạt, chúng được sử dụng trong bó hoa cô dâu, hoa sinh nhật và cũng được sử dụng trong hoa chia buồn để bày tỏ sự tôn kính, trang nghiêm.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hồng màu hồng :</strong>
                Có rất nhiều biến thể của hoa hồng màu hồng. Hơn hết, hoa hồng hồng được sử dụng để truyền tải những cảm xúc nhẹ nhàng như sự ngưỡng mộ, niềm vui và lòng biết ơn . Những bông hoa hồng màu hồng nhạt là biểu hiện của sự ngọt ngào và ngây thơ. Những bông hoa hồng màu hồng đậm thể hiện lòng biết ơn sâu sắc và sự đánh giá cao. Hoa hồng màu hồng cũng biểu thị sự sang trọng và duyên dáng, hoa hồng màu hồng là món quà hoàn hảo dành tặng cho cô giáo của Bạn ngày nhà giáo Việt Nam, để bày tỏ lòng biết ơn và tri ân người đã dạy dỗ mình.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hồng vàng :</strong>
                Hoa hồng vàng là biểu hiện của sự hoa lệ. Hoa hồng vàng gợi lên cảm giác vui vẻ, ấm áp và chào đón đầy nắng. Chúng là biểu tượng của tình bạn và sự quan tâm . Hoa hồng vàng là bó hoa sinh nhật tốt nhất cho một người Bạn thân.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hồng tím: </strong>
                Hoa hồng tím truyền tải sự mê hoặc. Nó cũng thể hiện “tình yêu sét đánh“ . Các sắc thái đậm hơn của hoa hồng tím truyền tải cảm giác uy nghi và lộng lẫy của vương giả. Những bông hồng này được sử dụng để thể hiện sự mê hoặc và tôn thờ.
            </div>
            <br>
            <div style="font-size: 100%;">
                <strong>Hoa hồng xanh :</strong>
                Bông hồng xanh rất hiếm vì vậy chúng tượng trưng cho điều không thể đạt được hoặc bí ẩn. Hoa hồng xanh do đó thể hiện mong muốn cho những điều không thể đạt được.
            </div> 
            <br>
            <div style="font-size: 100%;">
                <strong>Bó hoa hỗn hợp :</strong>
                Bằng cách chủ ý trộn các bông hoa hồng có màu sắc khác nhau, bạn có thể tạo ra một bó hoa nhiều cảm xúc. Ví dụ, một bó hoa hồng đỏ và trắng có nghĩa là tôi yêu bạn mãnh liệt. Một sự kết hợp ngẫu nhiên của hoa hồng sẽ truyền tải những cảm xúc lẫn lộn hoặc gửi một thông điệp: “Tôi không biết cảm xúc của tôi là gì nhưng tôi chắc chắn thích bạn đủ để gửi cho bạn những bông hoa hồng này.”
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