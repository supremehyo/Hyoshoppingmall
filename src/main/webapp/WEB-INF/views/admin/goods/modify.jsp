<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>HyoShopping</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
	<style>
.select_img img {width:400px; margin:20px 0;}
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
<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

<input type ="hidden" name ="gdsNum" value ="${goods.gdsNum}">

			<div class="inputArea"> 
 				<label>1차 분류</label>
 				<select class="category1">
  					<option value="">전체</option>
 				</select>

 				<label>2차 분류</label>
 				<select class="category2" name="cateCode">
  					<option value="">전체</option>
 				</select>
			</div>

<div class="inputArea">
 <label for="gdsName">상품명</label>
 <input type="text" id="gdsName" name=gdsName value="${goods.gdsName}"/>
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}"/>
</div>
<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}"/>
</div>
<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
	<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/goods/ckUpload?type=image",
   extraPlugins : 'uploadimage'
 };
 
 CKEDITOR.replace("gdsDes", ckeditor_config);
</script>
</div>
<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img">
  <img src="${goods.gdsImg}" />
  <input type="hidden" name="gdsImg" value="${goods.gdsImg}" />
  <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" /> 
 </div>
 
 <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 <%=request.getRealPath("/") %>
</div>

<div class="inputArea">
 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
 <button type="submit" id="back_Btn" class="btn btn-warning">취소</button> 

	<script>
		$("#back_Btn").click(function(){
			location.href="/admin/goods/view?n="+${goods.gdsNum};
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

<script>
var jsonData = JSON.parse('${category}');
var cate1Arr = new Array();
var cate1Obj = new Object();
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}
}
var cate1Select = $("select.category1")
for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");	
}
$(document).on("change", "select.category1", function(){
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {
			cate2Obj = new Object();
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $("select.category2");	
	cate2Select.children().remove();
 
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();		
				
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		for(var i = 0; i < cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
});
var select_cateCode = '${goods.cateCode}';
var select_cateCodeRef = '${goods.cateCodeRef}';
var select_cateName = '${goods.cateName}';
console.log("select_cateCode = " + select_cateCode);
console.log("select_cateCodeRef = " + select_cateCodeRef);
if(select_cateCodeRef != null && select_cateCodeRef != "") {

	$(".category1").val(select_cateCodeRef);
	$(".category2").val(select_cateCode);
	$(".category2").children().remove();
	$(".category2").append("<option value='"+ select_cateCode + "'>" + select_cateName + "</option>");
	
} else {
	
	$(".category1").val(select_cateCode);
	$(".category2").append("<option value='"+ select_cateCode + "' selected='selected'>전체</option>");
}

</script>
</body>
</html>
