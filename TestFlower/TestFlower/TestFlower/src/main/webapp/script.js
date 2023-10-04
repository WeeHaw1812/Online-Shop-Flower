/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



// JavaScript cho dropdown
function myFunction(dropdownId) {
    var dropdown = document.getElementById(dropdownId);
    if (dropdown.classList.contains("show")) {
        dropdown.classList.remove("show");
    } else {
        dropdown.classList.add("show");
    }
}

// Đóng dropdown nếu người dùng nhấp chuột bên ngoài dropdown
window.onclick = function (event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
};


// JS của phần chuyển Banner
var banners = document.querySelectorAll('.banner');
var currentBannerIndex = 0;

function showBanner(index) {
    // Ẩn tất cả các banner
    for (var i = 0; i < banners.length; i++) {
        banners[i].classList.remove('active');
    }

    // Hiển thị banner tại vị trí index
    banners[index].classList.add('active');
}

function nextBanner() {
    currentBannerIndex++;
    if (currentBannerIndex >= banners.length) {
        currentBannerIndex = 0;
    }
    showBanner(currentBannerIndex);
}

// Tự động chuyển đổi banner sau mỗi 3 giây (3000ms)
setInterval(nextBanner, 1000);
//-------------------------------------------------
//chi tiết
function navigateToDetail(flowerId) {
    // Chuyển hướng sang trang chi tiết hoa với thông tin hoa tương ứng
    window.location.href = `chitiet.html?id=${flowerId}`;
}

// FOOTER
window.onload = function () {
    var socialMediaIcon = document.querySelector(".social-media img");
    socialMediaIcon.addEventListener("mouseover", function () {
        this.style.transform = "rotate(360deg)";
    });

    socialMediaIcon.addEventListener("mouseout", function () {
        this.style.transform = "rotate(0deg)";
    });
};



// sắp xếp hoa theo tên
// Lấy danh sách tất cả các nút hoa
var flowerButtons = Array.from(document.querySelectorAll(".flower-button"));

// Lấy danh sách tất cả các hoa
var flowers = Array.from(document.querySelectorAll(".flower"));

// Xử lý sự kiện click trên các nút hoa
flowerButtons.forEach(function(button) {
  button.addEventListener("click", function() {
    var flowerId = button.id; // Lấy ID của nút hoa
    
    // Hiển thị hoa có ID trùng với nút hoa và ẩn các hoa khác
    flowers.forEach(function(flower) {
      if (flower.id === flowerId + "-details") {
        flower.style.display = "block";
      } else {
        flower.style.display = "none";
      }
    });
  });
});

// search hoa

  function searchFlowers() {
    var input = document.getElementById("searchInput");
    var filter = input.value.toUpperCase();
    var flowerItems = document.getElementsByClassName("flower");

    for (var i = 0; i < flowerItems.length; i++) {
      var title = flowerItems[i].getElementsByClassName("product-title")[0];
      var textValue = title.textContent || title.innerText;

      if (textValue.toUpperCase().indexOf(filter) > -1) {
        flowerItems[i].style.display = "";
      } else {
        flowerItems[i].style.display = "none";
      }
    }
  }

  var searchInput = document.getElementById("searchInput");
  searchInput.addEventListener("keyup", searchFlowers);


