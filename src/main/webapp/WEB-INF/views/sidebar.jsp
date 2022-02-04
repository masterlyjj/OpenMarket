<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="/resources/js/sidebar.js" type="text/javascript"></script>

<title>사이드바 메뉴</title>
<style type="text/css">

ul { list-style: none;
}

a { 
text-decoration: none; color: black;
}

body {
   font-family: 'Dosis', sans-serif;
  background: white;
}

#menu-wrapper {
background-color : olive;
    overflow: hidden;
    max-width: 55px;
    border:1px solid;
    cursor: pointer;
}

#menu-wrapper #hamburger-menu {
    position: relative;
    width: 25px;
    height: 20px;
    margin: 15px;
}

#menu-wrapper #hamburger-menu span {
    opacity: 1;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
    left: 0;
    display: block;
    width: 100%;
    height: 2px;
    border-radius: 10px;
    color: black;
    background-color: white;
    position: absolute;
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
    -webkit-transition: .4s ease-in-out;
    transition: .4s ease-in-out;
}

#menu-wrapper #hamburger-menu span:nth-child(1) {
    top: 0;
}
#menu-wrapper #hamburger-menu span:nth-child(2) {
    top: 9px;
}
#menu-wrapper #hamburger-menu span:nth-child(3) {
    top: 18px;
}
#menu-wrapper #hamburger-menu.open span:nth-child(1) {
    top: 9px;
    -webkit-transform: rotate(135deg);
    transform: rotate(135deg);
}
#menu-wrapper #hamburger-menu.open span:nth-child(2) {
    opacity: 0;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
    left: -60px;
}
#menu-wrapper #hamburger-menu.open span:nth-child(3) {
    top: 9px;
    -webkit-transform: rotate(-135deg);
    transform: rotate(-135deg);
}

#menu-container .menu-list .menu-submenu {
    padding:0;
}
#menu-container .menu-list .menu-submenu li a {
    display:block;
    padding:10px 0 10px 20px;

}
#menu-container .menu-list .menu-submenu li a:hover {
    background:#eee;
}
#menu-container .menu-list {
    padding-left: 0;
    display: block;
    position: absolute;
    width: 100%;
    max-width: 200px;
    background: white;
    box-shadow: rgba(100,100,100,0.2) 6px 2px 10px;
    z-index: 999;
    overflow-y: auto;
    overflow-x: hidden;
    left: -100%;
}

#menu-container .menu-list li.accordion-toggle, #menu-container .menu-list .menu-login {
    font-size: 16px;
    padding: 20px;
    text-transform: uppercase;
    border-top: 1px solid #dbdcd2;
}
#menu-container .menu-list li:first-of-type {
    border-top: 0;
}

.accordion-toggle, .accordion-content {
    cursor: pointer;
    font-size: 16px;
    position: relative;
    letter-spacing: 1px;
}

  .accordion-content {
    display: none;
}

.accordion-toggle a:before, .accordion-toggle a:after {
    content: '';
    display: block;
    position: absolute;
    top: 50%;
    right: 30px;
    width: 15px;
    height: 2px;
    margin-top: -1px;
    background-color: #5a5858;
    -webkit-transform-origin: 50% 50%;
    -ms-transform-origin: 50% 50%;
    transform-origin: 50% 50%;
    -webkit-transition: all 0.3s;
    transition: all 0.3s ease-out;
}

.accordion-toggle a:before {
    -webkit-transform: rotate(-90deg);
    -ms-transform: rotate(-90deg);
    transform: rotate(-90deg);
    opacity: 1;
    z-index: 2;
}

.accordion-toggle.active-tab {
  background: #dae0e5;
  transition: all 0.3s ease;
}
.accordion-toggle a.active:before {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
    background: #fff !important;
}

.accordion-toggle a.active:after {
    -webkit-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    transform: rotate(180deg);
    background: #fff !important;
    opacity: 0;
}
</style>
</head>
<body>
 <div id="menu-container">
            <div id="menu-wrapper">
                <div id="hamburger-menu"><span></span><span></span><span></span></div>
                <!-- hamburger-menu -->
            </div>
            <!-- menu-wrapper -->
            <ul class="menu-list accordion">
                <li id="nav1" class="toggle accordion-toggle"> 
                    <span class="icon-plus"></span>
                    <a class="menu-link" href="#">고정카테고리1</a>
                </li>
               		 <ul id="cat-menu" class="menu-submenu accordion-content">
               		 </ul> 
            </ul>
            <!-- menu-list accordion-->
        </div>

	<script type="text/javascript">
	$(function() {
        function slideMenu() {
            var activeState = $("#menu-container .menu-list").hasClass("active");
            $("#menu-container .menu-list").animate({left: activeState ? "0%" : "-100%"}, 400);
        }
        $("#menu-wrapper").click(function(event) {
            event.stopPropagation();
            $("#hamburger-menu").toggleClass("open");
            $("#menu-container .menu-list").toggleClass("active");
            slideMenu();

            $("body").toggleClass("overflow-hidden");
        });

        $(".menu-list").find(".accordion-toggle").click(function() {
            $(this).next().toggleClass("open").slideToggle("fast");
            $(this).toggleClass("active-tab").find(".menu-link").toggleClass("active");

            $(".menu-list .accordion-content").not($(this).next()).slideUp("fast").removeClass("open");
            $(".menu-list .accordion-toggle").not(jQuery(this)).removeClass("active-tab").find(".menu-link").removeClass("active");
        });
    }); // jQuery load
		$(document).ready(function() {

			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.display === "block") {
						panel.style.display = "none";
					} else {
						panel.style.display = "block";
					}
				});
			}
			$.getJSON("/category/categorylist", function(result) {
				for (var i = 0; i < result.length; i++) {
					var msg = categorylist(result[i].item_category);
					$("#cat-menu").append(msg)
				}
			});
		});
	</script>
</body>
</html>