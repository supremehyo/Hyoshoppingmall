<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>HyoShopping</title>
<style>

 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 
 
aside#aside li { position:relative; }
aside#aside li:hover { background:#eee; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }

 body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 /* ---------- */
 
 div#root { width:900px; margin:0 auto; }
 header#header { }
 nav#nav { }
 section#container { }
  section#content { float:right; width:700px; }
  aside#aside { float:left; width:180px; }
  section#container::after { content:""; display:block; clear:both; } 
 footer#footer { background:#eee; padding:20px; }
 
 /* ---------- */
 
 header#header div#header_box { text-align:center; padding:30px 0; }
 header#header div#header_box h1 { font-size:50px; }
 header#header div#header_box h1 a { color:#000; }
 
 nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
 nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
 nav#nav div#nav_box li a { color:#333; }
 
 section#container { }
 
 aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 aside#aside li { font-size:16px; text-align:center; }
 aside#aside li a { color:#000; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#eee; }
 
 footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
 footer#footer div#footer_box { padding:0 20px; }
 
</style>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />


	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/resources/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="/resources/css/flexslider.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="/resources/css/flexslider.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

	<link rel="stylesheet" href="/resources/css/style.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<nav id ="nav">
		<div id="nav_box">
			<%@ include file = "insert/navi.jsp" %>
		</div>
	</nav>

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

		<header>
			<div class="container">
				<div class="row" style="margin-top:5%;">
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
			   	<li style="background-image: url(/resources/images/cover_img_4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-xs-12 col-md-offset-2 text-center slider-text">
				   				<div class="slider-text-inner">

										<h1>검색 결과</h1>

				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
		
	<section id ="container">
			<div id="colorlib-work">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center animate-box intro-heading">
						<h2>Our Works</h2>
					</div>
				</div>
				<div class="row">
						<c:forEach items="${searchlist}" var="searchlist">
					<div class="col-md-6 animate-box text-center">
					  
						<a href="/shop/view?n=${searchlist.gdsNum}" class="work-img">
							<img src= "${searchlist.gdsThumbImg}"">
							<div class="overlay"></div>
							<div class="desc">
								<span class="icon"><i class="icon-heart-outline"></i></span>
								<p class="tag"><span>클릭시</span>, <span>상품으로</span></p>
								<h3>${searchlist.gdsName}</h3>
								<span class="read-more">Read more <i class="icon-arrow-right3"></i></span>
							</div>
						</a>
					</div>
					</c:forEach>
					
					
									<div class="col-md-8 col-md-offset-2 text-center animate-box intro-heading">
						<h2>추천 상품</h2>
					</div>
						<c:forEach items="${recommendGoods}" var="recommendGoods">
					<div class="col-md-6 animate-box text-center">
					
						<a href="/shop/view?n=${recommendGoods.gdsNum}" class="work-img" style="background-image: url(/resources/images/work-1.jpg);">
							<img src= "${recommendGoods.gdsThumbImg}"">
							<div class="overlay"></div>
							<div class="desc">
								<span class="icon"><i class="icon-heart-outline"></i></span>
								<p class="tag"><span>클릭시</span>, <span>상품으로</span></p>
								<h3>${recommendGoods.gdsName}</h3>
								<span class="read-more">Read more <i class="icon-arrow-right3"></i></span>
							</div>
						</a>
					</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
			   <div id ="contaninerDiv">
				<section id="content">
			<!--	<ul>
 					<c:forEach items="${searchlist}" var="searchlist">
 					<li>
  						<div class="goodsThumb">
   							<img src="${searchlist.gdsThumbImg}">
  						</div> 
  						<div class="goodsName">
   							<a href="/shop/view?n=${searchlist.gdsNum}">${searchlist.gdsName}</a>
  						</div>
 					</li>
 					</c:forEach>
				</ul>-->

				</section>
				



			</div>
	</section>
	
	<footer id="footer">
			<div id="footerDiv">
				<%@ include file = "insert/footer.jsp" %>
			</div>
	</footer>


<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="/resources/js/jquery.flexslider-min.js"></script>
	<!-- Counters -->
	<script src="/resources/js/jquery.countTo.js"></script>
	<!-- Owl Carousel -->
	<script src="/resources/js/owl.carousel.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="/resources/js/main.js"></script>
	
	<script>
	$("#searchinput").keypress(function(e){
		if(e.which == 13)
			{
		var title = $("#searchinput").val();
		location.href="/shop/searchlist?title="+title;
			}
	});
	$("#searchclear").click(function(){
	    $("#searchinput").val('');
	});
	</script>
</body>
</html>
