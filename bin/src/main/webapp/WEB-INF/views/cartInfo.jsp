<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeFood</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function deleteCart(code){
		$.ajax({
			url: 'deleteCart.sf/'+code,
			type: 'delete',
			dataType: 'json',//from server
			contentType: 'application/json',//to server
			success: function(data){
				if(data) {
					alert("찜 목록에서 삭제되었습니다.");
					location.href="cartInfo.sf";
				}
				else alert("처리 중 오류가 발생하였습니다.");
			},
			error: function(request,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
			}
		});
	}
</script>
</head>
<body>
<header><jsp:include page="header.jsp" /></header>
<section>
<div class="card text-white">
  <img src="img/image.jpg" class="card-img" alt="...">
  <div class="card-img-overlay text-center">
  <br><br><br><br><br>
    <h1 class="card-title">WHAT WE <strong>PROVIDE</strong> </h1>
    <p class="card-text">건강한 삶을 위한 먹거리 프로젝트</p>
  </div>
</div>
</section>
<hr>
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
    	<table class="table table-striped table-hover" style="text-align: center;">
    		<thead>
    			<tr>
    				<th scope="col" colspan="2">상품정보</th>
    				<th scope="col">추가</th>
    				<th scope="col">삭제</th>
    			</tr>
    		</thead>
    		
    		<c:forEach items="${cart}" var="f" varStatus="status">
    			<tr>
					
    				<td><img src="${f.getImg() }" height="30"></td>
    				<td>${f.name }&nbsp;&nbsp;<a href="detail.sf?code=${f.getCode() }" class="badge badge-primary">더보기</a></td>
    				<td><a href="#" class="badge badge-primary">추가</a></td>
    				<td><a href="#" class="badge badge-primary" onclick="deleteCart(${f.getCode()})">삭제</a></td>
    			</tr>
    		</c:forEach>
    	</table>
	</div>
	<div class="col-sm-3"></div>
</div>
<script>
    $('#date').datepicker({
        uiLibrary: 'bootstrap4', 
        format: "yyyy-mm-dd",
    });
</script>
</body>
</html>