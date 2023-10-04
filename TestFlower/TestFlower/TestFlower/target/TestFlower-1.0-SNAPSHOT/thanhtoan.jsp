<%-- 
    Document   : thanhtoan
    Created on : Jul 16, 2023, 5:01:47 PM
    Author     : HP
--%>

<%@page import="DAOs.OrderDAO"%>
<%@page import="Models.Order"%>
<%@page import="Models.Detail"%>
<%@page import="DAOs.DetailDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang thanh toán</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;

            }

            .form-section {
                display: flex;
                margin-bottom: 20px;
            }

            .form-section .label {
                flex-basis: 30%;
            }

            .form-section .input {
                flex-basis: 70%;
            }

            .form-section input[type="text"],
            .form-section textarea {
                width: 100%;
                padding: 5px;
            }

            .form-section .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .form-section .button-container button {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            .form-section .button-container a {
                text-decoration: none;
                color: #000;
                padding: 10px 20px;
                font-size: 16px;
                border: 1px solid #000;
                cursor: pointer;
            }
            .label label{
                white-space: nowrap;
                padding-right: 50px;
            }
            /*nút đặt hàng hủy đơn */
            .button-container input[type="submit"],
            .button-container input[type="button"] {
                margin-left: 10px;
                padding: 5px 10px;
                border: none;
                border-radius: 3px;
                background-color: #ccc;
                color: #fff;
                cursor: pointer;
            }

            .button-container input[type="submit"]:hover,
            .button-container input[type="button"]:hover {
                background-color: #555;
            }
        </style>

    </style>
</head>
<body>
    <%
        String pic = (String) session.getAttribute("pic");
        String flowerName = (String) session.getAttribute("flowerName");
        int price = (Integer) session.getAttribute("price");
        String quantity = request.getParameter("quantity");
        // Tính tổng giá trị
        int total = price;
        if (quantity != null && !quantity.isEmpty()) {
            total *= Integer.parseInt(quantity);
        }
        //============================================================================================================
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Đặt Hàng")) {
            String CustomerName = request.getParameter("CustomerName");
            String Address = request.getParameter("Address");
            String Phone = request.getParameter("Phone");
            String ProductBuy = flowerName;
            int Quantity = Integer.parseInt(request.getParameter("Quantity"));
            int Price = price;
            int totals = Price * Quantity;
            int Total = totals;

            Order od = new Order(CustomerName, Address, Phone, ProductBuy, Quantity, Price, Total);
            OrderDAO dao = new OrderDAO();
            int ketqua = dao.AddNew(od);
            if (ketqua == 0) {
                response.sendRedirect("thanhtoan.jsp"); //redirect la tro ve trang addnew nhung xoa het du lieu(khong co du lieu) # f5 (f5 la load trang nhung co gui du lieu)
            } else {
                response.sendRedirect("datathuongde.jsp");
            }
        }
    %>
    <form action="thanhtoan.jsp" method="POST">
        <div class="container">
            <h1>THANH TOÁN</h1>
            <div class="form-section">
                <div class="label">
                    <label for="name">Tên khách hàng:</label>
                </div>
                <div class="input">
                    <input type="text" id="name" name="CustomerName">
                </div>
            </div>
            <div class="form-section">
                <div class="label">
                    <label for="address">Địa chỉ:</label>
                </div>
                <div class="input">
                    <input type="text" id="address" name="Address">
                </div>
            </div>
            <div class="form-section">
                <div class="label">
                    <label for="phone">Số điện thoại:</label>
                </div>
                <div class="input">
                    <input type="text" id="phone" name="Phone">
                </div>
            </div>
            <div class="form-section">
                <div class="label">
                    <label for="products">Sản phẩm:</label>
                </div>
                <img width="200" height="150" src="<%= pic%>" alt="hình ảnh" readonly="true">
                <input  type="text" name="ProductBuy" value="<%= flowerName%>" readonly="true">
                <input type="text" name="Quantity" value="<%= quantity%>" readonly="true">
                <input type="text" name="Price" value="<%= price%>" readonly="true">
            </div>
            <div class="form-section">
                <div class="label">
                    <label for="total">Thành tiền:</label>
                </div>
                <div class="input">
                    <input type="text" id="total" name="Total" value="<%= total%>" readonly="true">
                </div>
            </div>
            <div class="button-container">
                <input type="submit" value="Đặt Hàng" name="btnSubmit"/>
                <input type="button" value="Hủy đơn" onclick="cancelOrder()">

                <script>
                    function cancelOrder() {
                        if (confirm("Bạn có chắc chắn muốn hủy đơn?")) {
                            window.location.href = 'index.jsp';
                        }
                    }
                </script>
            </div>
    </form>
</body>
</html>