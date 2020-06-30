<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>HyoShopping</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<style>
	.gdsDes img {max-width : 70%; height : 70%}
	.oriImg{width:500px; height:auto;}
	.thumbImg{}
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 header#header { font-size:60px; padding:20px 0; }
 header#header h1 a { color:#000; font-weight:bold; }
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 aside ul li { text-align:center; margin-bottom:10px; }
 footer#footer { background:#f9f9f9; padding:20px; }
 footer#footer ul li { display:inline-block; margin-right:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
	</style>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="headerDiv">
			<%@ include file = "../insert/header.jsp" %>
		</div>
	</header>
	
	<nav id ="nav">
		<div id="nav_box">
			<%@ include file = "../insert/navi.jsp" %>
		</div>
	</nav>
	
	<section id ="container">
			<aside>
				<%@ include file="../insert/aside.jsp" %>
			</aside>
			<div id ="contaninerDiv">
				<h2>상품등록</h2>
			</div>
<form role="form" method="post" autocomplete="off">
<input type ="hidden" name="n" value="${goods.gdsNum}">
<div class="inputArea"> 
 <label>1차 분류</label>
 <span class="category1"></span>        
 <label>2차 분류</label>
 <span class="category2">${goods.cateCode}</span>
</div>

<div class="inputArea">
 <label for="gdsName">상품명</label>
 <span>${goods.gdsName}</span>
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
</div>

<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <span>${goods.gdsStock}</span>
</div>

<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <div class="gdsDes">${goods.gdsDes}</div>
</div>

<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <p>원본 이미지</p>
 <img src="${goods.gdsImg}" class="oriImg"/>
 
 <p>썸네일</p>
 <img src="${goods.gdsThumbImg}" class="thumbImg"/>
</div>

<div class="inputArea">
 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
 <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
	<script>
		var formobj = $("form[role='form']");
		
		$("#modify_Btn").click(function(){
			formobj.attr("action","/admin/goods/modify");
			formobj.attr("method" ,"get");
			formobj.submit();
		});
		$("#delete_Btn").click(function(){
			 
			 var con = confirm("정말로 삭제하시겠습니까?");
			 
			 if(con) {      
			  location.href="/admin/goods/delete?n="+${goods.gdsNum};
			 }
			});
		
		
	</script>
	
</div>

</form>
	</section>
	
	<footer id="footer">
			<div id="footerDiv">
				<%@ include file = "../insert/footer.jsp" %>
			</div>
	</footer>
</div>
</body>
</html>
