<%-- 
    Document   : checkout
    Created on : Jul 13, 2023, 1:07:09 AM
    Author     : MSI GTX
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Detail"%>
<%@page import="DAOs.DetailDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
          <table id="example" class="cell-border" style="width:100%">
        <thead>
            <tr>
                <td>Sản Phẩm</td>
                <td>FlowerName</td>
                <td>Price</td>
                <td>Quantity</td>
            </tr>
        </thead>
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
        <tr>
            <td><img width="300" height="300" src="<%=pic%>" alt="hình ảnh"></td>
            <td><%=FlowerName%> </td>
            <td><%= Price%> ₫</td>
            <td>
                <input type="number" step="1" min="1" max="<%=Quan%>" name="quantity" value="1" title="SL" placeholder="" inputmode="numeric">
            </td>
        </tr>
    </table>

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

    </body>
</html>