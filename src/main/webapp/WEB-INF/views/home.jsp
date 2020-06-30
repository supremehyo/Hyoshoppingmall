<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

	<style>
	
	 nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
 nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
 nav#nav div#nav_box li a { color:#333; }
	#searchinput {
    width: 300px;
    margin: auto;
}
#searchclear {
    position: absolute;
    right: 5px;
    top: 0;
    bottom: 0;
    height: 14px;
    margin: auto;
    font-size: 14px;
    cursor: pointer;
    color: #ccc;
}
#searchclear2 {
    position: absolute;
    right: 5px;
    top: 0;
    bottom: 0;
    height: 14px;
    margin: auto;
    font-size: 14px;
    cursor: pointer;
    color: #ccc;
}
.hn{font-family: 'Hanna', sans-serif;}
aside#aside li { position:relative; }
aside#aside li:hover { background:#eee; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }

	</style>
	
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>HyoShopping</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />


	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="resources/css/flexslider.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="resources/css/flexslider.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

	<link rel="stylesheet" href="resources/css/style.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<nav id ="nav" >
		<div id="nav_box">
			<%@ include file = "insert/navi.jsp" %>
		</div>
	</nav>
	
<!--  햄버거 버튼을 누르면 뒤에 등장하는 화면 -->
	<nav id="colorlib-main-nav" role="navigation">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle active"><i></i></a>
		<div class="js-fullheight colorlib-table">
			<div class="colorlib-table-cell js-fullheight">
				<ul>
					<input id="searchinput" placeholder="검색" type="text" class="form-control">
  					<span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
					<li><a href="/shop/list?c=100&l=1">의류</a></li>
					<li><a href="/shop/list?c=200&l=1">도서</a></li>
					<li><a href="/shop/list?c=300&l=1">디지털/가전</a></li>
					<li><a href="/shop/list?c=400&l=1">스포츠/취미</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div id="colorlib-page">
		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="colorlib-navbar-brand">
							<a class="colorlib-logo" href="/">HyoShopping</a>
						</div>
						<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
					</div>
				</div>
			</div>
		</header>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(resources/images/img_bg_1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-md-offset-2 col-md-pull-2 slider-text">
				   				<div class="slider-text-inner">
				   					<h2>Welcome  &amp; Enjoy</h2>
				   					<h1 class="hn">HyoShopping 에 오신 것을 환영합니다!</h1>
									<!--  	<p><a class="btn btn-primary btn-learn">기획전 바로가기</a></p>-->
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(resources/images/img_bg_2.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-md-offset-2 col-md-pull-2 slider-text">
				   				<div class="slider-text-inner">
				   					<h2 class="hn">오픈 행사 준비 중</h2>
				   					<h1 class="hn">오픈 기념 &amp; 기획전</h1>
										<p><a class="btn btn-primary btn-learn">Available For Hire!</a></p>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
		<div id="colorlib-services">
			<div class="container">
			<div class="btn-group">
				
				<input id="searchinput2" placeholder="검색" type="search" class="form-control">
  				<span id="searchclear2" class="glyphicon glyphicon-remove-circle"></span>
					
			</div>
			</div>
		</div>
	

		<div id="colorlib-testimony" class="colorlib-light-grey">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center animate-box intro-heading">
						<h2>최근 등록된 후기</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="row animate-box">
							<div class="owl-carousel1">
							<c:forEach items="${latestReply}" var="latestReply">
								<div class="item">
									<div class="testimony-slide text-center active">
										<figure>
											<img src="${latestReply.gdsThumbImg}" alt="user">
										</figure>
										<blockquote>
											<p><i class="icon-quotes-left"></i>${latestReply.repCon}</p>
											<span>${latestReply.userId}님</span>
										</blockquote>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="colorlib-hire">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box">
						<h2 class="heading">아직 가입을 안하셨나요? 얼른 가입하고 쇼핑을 즐겨보세요!</h2>
						<p><a href="/member/signup" class="btn btn-primary btn-lg">가입하러 가기</a></p>
					
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- jQuery -->
	<script src="resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="resources/js/jquery.flexslider-min.js"></script>
	<!-- Counters -->
	<script src="resources/js/jquery.countTo.js"></script>
	<!-- Owl Carousel -->
	<script src="resources/js/owl.carousel.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="resources/js/main.js"></script>
	<script>
	$("#searchclear").click(function(){
	    $("#searchinput").val('');
	});
	
	$("#searchinput2").keypress(function(e){
		if(e.which == 13)
			{
		var title = $("#searchinput2").val();
		location.href="/shop/searchlist?title="+title;
			}
	});
	$("#searchclear2").click(function(){
	    $("#searchinput2").val('');
	});
	
	$("#searchinput").keypress(function(e){
		if(e.which == 13)
			{
		var title = $("#searchinput").val();
		location.href="/shop/searchlist?title="+title;
			}
	});
	</script>
	</body>
</html>

