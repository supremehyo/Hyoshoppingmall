<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>HyoShopping</title>
<style>
table.type07 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
}
table.type07 thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #e7708d;
}
table.type07 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}
table.type07 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #fcf1f4;
}
table.type07 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
 div.replyModal { position:relative; z-index:1; display:none }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 
 
section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px;}
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
 
 
section#content ul li { margin:10px 0; padding:10px 0; border-bottom:1px solid #999; }
		section#content ul li img { width:250px; height:250px; }
		section#content ul li::after { content:""; display:block; clear:both; }
		section#content div.thumb { width:250px; }
		section#content div.gdsInfo { float:right; width:calc(100% - 320px); }
		section#content div.gdsInfo { font-size:20px; line-height:2; }
		section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		section#content div.gdsInfo .delete { text-align:right; }
		section#content div.gdsInfo .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.allCheck { float:left; width:200px; }
		.allCheck input { width:16px; height:16px; }
		.allCheck label { margin-left:10px; }
		.delBtn { float:right; width:300px; text-align:right; }
		.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.checkBox { float:left; width:30px; }
		.checkBox input { width:16px; height:16px; }
		
		.listResult { padding:20px; background:#eee; }
		.listResult .sum { float:left; width:45%; font-size:22px; }
		
		.listResult .orderOpne { float:right; width:45%; text-align:right; }
		.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
		.listResult::after { content:""; display:block; clear:both; } 
		
		.orderInfo { border:5px solid #eee; padding:20px; display:none; }
		.orderInfo .inputArea { margin:20px 0; }
		.orderInfo .inputArea label { display:inline-block; width:200px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
		
		.orderInfo .inputArea #sample2_address { width:230px; }
		.orderInfo .inputArea #sample2_detailAddress { width:280px; }
		.orderInfo .inputArea #sample2_extraAddress { width:280px; }
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
  section#content {width:700px; }
  aside#aside { float:left; width:180px; }
  section#container::after { content:""; display:block; clear:both; } 
 footer#footer { background:#eee; padding:20px; }
 
 /* ---------- */
 
 header#header div#header_box { text-align:center;  }
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function replyList(){
									
								
								 var gdsNum = ${view.gdsNum};
								 $.getJSON("/shop/view/replyList/" + gdsNum, function(data){
								  var str = "";
								  
								  $(data).each(function(){
								   
								   console.log(data);
								   
								   var repDate = new Date(this.repDate);
								   repDate = repDate.toLocaleDateString("ko-US")
								   
								   str += "<li data-repNum='" + this.repNum + "'>"
								     + "<div class='userInfo'>"
								     + "<span class='userName'>" + this.userName + "</span>"
								     + "<span class='date'>" + repDate + "</span>"
								     + "</div>"
								     + "<div class='replyContent'>" + this.repCon + "</div>"
								     +"<div class ='replyFooter'>"
								     + "<button type ='button' class ='modify' data-repNum='"+this.repNum +"'>M </button>"
								     + "<button type ='button' class ='delete' data-repNum='"+this.repNum +"'>D </button>"
								     + "</li>";           
								  });
								  
								  $("section.replyList ol").html(str);
								 });
								}
								

</script>
</head>
<body>
	<nav id ="nav" >
		<div id="nav_box">
			<%@ include file = "../insert/navi.jsp" %>
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

		<header style ="margin-top:5%;">
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
			   	<li style="background-image: url(/resources/images/cover_img_4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container">
			   			<div class="row">
				   			<div class="col-md-8 col-sm-12 col-xs-12 col-md-offset-2 text-center slider-text">
				   				<div class="slider-text-inner">
						 			<h1>카트 리스트</h1>
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
						 	<h2>물건 정보</h2>		
						</div>
				</div>
						<section id="content2" style="text-align:center;">
					<form role="form" method="post">
 						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					</form>

					<div class="goods">
 						<div class="goodsImg" style=" margin-bottom:10%;">
 							 <img src="${view.gdsImg}">
 						</div>
 
 						<div class="goodsInfo" style="display:inline-block;">
 							<table class="type07">
								    <thead>
								    <tr>
								        <th scope="cols"></th>
								        <th scope="cols">제품 상세</th>
								    </tr>
								    </thead>
								    <tbody>
								    <tr>
								        <th scope="row">제품 이름</th>
								        <td>${view.gdsName}</td>
								    </tr>
								    <tr>
								        <th scope="row">카테고리</th>
								        <td>${view.cateName}</td>
								    </tr>
								    <tr>
								        <th scope="row">가격</th>
								        <td>${view.gdsPrice}원</td>
								    </tr>
								    <tr>
								        <th scope="row">재고</th>
								        <td>${view.gdsStock}개</td>
								    </tr>
								    </tbody>
							</table>
  							<p class="cartStock">
   								<span>구입 수량</span>
   								 <button type="button" class="plus">+</button>
 								 <input type="number" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
 								 <button type="button" class="minus">-</button>
  								<script>
  							  $(".plus").click(function(){
  								   	var num = $(".numBox").val();
  								   	var plusNum = Number(num) + 1;
  								   
  								   	if(plusNum >= ${view.gdsStock}) {
  								    		$(".numBox").val(num);
  								   	} else {
  								    	$(".numBox").val(plusNum);          
  								   	}
  								  });
  								  
  							$(".minus").click(function(){
  								   var num = $(".numBox").val();
  								   var minusNum = Number(num) - 1;
  								   
  								   if(minusNum <= 0) {
  								    $(".numBox").val(num);
  								   } else {
  								    $(".numBox").val(minusNum);          
  								   }
  								  });
  					
  								</script>
  							</p>
  
  							<p class="addToCart">
   								<button type="button" class="addCart_btn">카트에 담기</button>
   								 <script>
 $(".addCart_btn").click(function(){
  var gdsNum = $("#gdsNum").val();
  var cartStock = $(".numBox").val();
           
  var data = {
    gdsNum : gdsNum,
    cartStock : cartStock
    };
  
  $.ajax({
   url : "/shop/view/addCart",
   type : "post",
   data : data,
   success : function(result){
    
    if(result == 1) {
     alert("카트 담기 성공");
     $(".numBox").val("1");
    } else {
     alert("회원만 사용할 수 있습니다.")
     $(".numBox").val("1");
    }
   },
   error : function(){
    alert("카트 담기 실패");
   }
  });
 });
</script>
   								
  							</p>
 					</div>
 
 						<div class="gdsDes">${view.gdsDes}</div>
				</div>
					
						<div id="reply">
						
						 <c:if test="${member == null }">
						  <p>소감을 남기시려면 <a href="/member/signin">로그인</a>해주세요</p>
						 </c:if>
						 
						 <c:if test="${member != null}">
						 <section class="replyForm">
						  <form role="form" method="post" autocomplete="off">
						   		<input type="hidden" name="gdsNum" id = "gdsNum" value="${view.gdsNum}">
						   <div class="input_area">
						    <textarea name="repCon" id="repCon"></textarea>
						   </div>
						   
						   <div class="input_area">
						    <button type="button" id="reply_btn">소감 남기기</button>
						   </div>
						   <script>
									 $("#reply_btn").click(function(){
									  
									  var formObj = $(".replyForm form[role='form']");
									  var gdsNum = $("#gdsNum").val();
									  var repCon = $("#repCon").val();
									  var data = { // json 데이터로 만든다.
									    gdsNum : gdsNum,
									    repCon : repCon
									    };
									  
									  $.ajax({
									   url : "/shop/view/registReply",
									   type : "post",
									   data : data, // json 데이터를 담아서 보낸다.
									   success : function(){ // 성공하면 아래의 함수를 실행한다.
									    replyList();
									   }
									  });
									 });
									</script>
						   
						  </form>
						 </section>
						 </c:if>
						 

						</div>
				</section>
										 <section class="replyList">
						  <ol>
						  <%-- 
						   	 <c:forEach items="${reply}" var="reply">
							  <li>
							      <div class="userInfo">
							       <span class="userName">${reply.userName}</span>
							       <span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
							      </div>
							      <div class="replyContent">${reply.repCon}</div>
							    </li>
							   </c:forEach>
							  --%>
						   </ol>
								<script> 
									replyList();
								</script>    
								<script> 
									$(document).on("click", ".modify", function(){
 									//$(".replyModal").attr("style", "display:block;");
										$(".replyModal").fadeIn(200);
										 var repNum = $(this).attr("data-repNum");
										 var repCon = $(this).parent().parent().children(".replyContent").text();
										 
										 $(".modal_repCon").val(repCon);
										 $(".modal_modify_btn").attr("data-repNum", repNum);
									});
								</script>
								<script>
								 $(document).on("click", ".delete", function(){
									  // click 이 아니라 on 인 이유는 스크립트로 인해 생성된 동적인 HTML 코드이기 때문
									  var data = {repNum : $(this).attr("data-repNum")};
									   
									  $.ajax({
									   url : "/shop/view/deleteReply",
									   type : "post",
									   data : data,
									   success : function(result){ // 컨트롤러에서 넘어오는 리턴값
									     	if(result ==1){
									     		  replyList();
									     	}
									     	else{
									     		alert("해당 댓글 작성자만 삭제할 수 있습니다.");
									     	}
										 
									   },
									   error : function(){
										   alert("로그인하셔야합니다.");
									   }
									  });
									 });
								</script>
						 </section>
			</div>
					
				
			</div>
		
	</section>
	
	<footer id="footer">
			<div id="footerDiv">
				<%@ include file = "insert/footer.jsp" %>
			</div>
	</footer>

		<div class="replyModal" style="display:none">
		
		 <div class="modalContent">
		  
		  <div>
		   <textarea class="modal_repCon" name="modal_repCon"></textarea>
		  </div>
		  
		  <div>
		   <button type="button" class="modal_modify_btn">수정</button>
		   <button type="button" class="modal_cancel">취소</button>
		   
		   
		   <script>
		   
		   $(".modal_cancel").click(function(){
			   $(".replyModal").fadeOut(200);
		   });
		   
		   $(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 
	 if(modifyConfirm) {
	  var data = {
	     repNum : $(this).attr("data-repNum"),
	     repCon : $(".modal_repCon").val()
	    };  // Reply 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/shop/view/modifyReply",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     replyList();
	     $(".replyModal").fadeOut(200);
	    } else {
	     alert("작성자 본인만 할 수 있습니다.");       
	    }
	   },
	   error : function(){
	    alert("로그인하셔야합니다.")
	   }
	  });
	 }
	 
	});
		   </script>
		  </div>
		  
		 </div>
		
		 <div class="modalBackground"></div>
		 
		</div>

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
