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
	#contaninerDiv table {width:900px;}
	#contaninerDiv table th {font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666;}
	#contaninerDiv table tr:hover {background:#eee;}
	#contaninerDiv table td {padding:10px; text-align:center;}
	#contaninerDiv table img{width:150px; height:auto;}
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
				
				<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>이름</th>
   <th>카테고리</th>
   <th>가격</th>
   <th>수량</th>
  </tr>
 </thead>
 <tbody>
  <c:forEach items="${list}" var="list">
  <tr>
   <td><img src = "${list.gdsThumbImg}"></td>
   <td>
  	<a href ="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
   </td>
   <td>${list.cateName}</td>
   <td>
  	<fmt:formatNumber value ="${list.gdsPrice}" pattern="###,###,###"></fmt:formatNumber>
   </td>
   <td>${list.gdsStock}</td>
  </tr>   
  </c:forEach>
 </tbody>
</table>
			</div>

	</section>
	
	<footer id="footer">
			<div id="footerDiv">
				<%@ include file = "../insert/footer.jsp" %>
			</div>
	</footer>
</div>
</body>
</html>
