<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">
$(document).ready(function() {
	$(function(){
		$('#checkSession1').click(function(){
			var id="<%=session.getAttribute("userSession") %>";
			if(id=="null"){
				alert("로그인 하세요.");
			}else{
				location.href='eatInfo.sf';
			}
		});
		$('#checkSession2').click(function(){
			var id="<%=session.getAttribute("userSession") %>";
			if(id=="null"){
				alert("로그인 하세요.");
			}else{
				location.href='cartInfo.sf';
			}
		});
		$('#checkSession3').click(function(){
			var id="<%=session.getAttribute("userSession") %>";
			if(id=="null"){
				alert("로그인 하세요.");
			}else{
				location.href='qna.sf';
			}
		});
		$('#checkSession4').click(function(){
			var id="<%=session.getAttribute("userSession") %>";
			if(id=="null"){
				alert("로그인 하세요.");
			}else{
				location.href='users.sf';
			}
		});
	});
});
</script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-right">
<form class="form-inline my-2 my-lg-0">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
</form>
  <a class="navbar-brand" href="index.sf"><img src="img/ssafy_logo.png" width=50px>SafeFood</a>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="notice.sf">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="search.sf">상품 정보 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="best.sf">베스트 섭취 정보 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id='checkSession1'>내 섭취 정보 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id='checkSession2'>예상 섭취 정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id='checkSession3'>Q&A</a>
      </li>
      <li class="nav-item">
		<a class="nav-link" href="#" id='checkSession4'>Follow</a>
	  </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="search.sf">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="word">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <c:choose>
    	<c:when test="${empty userSession}">
    		<button type="button" class="btn btn-default navbar-btn" onclick="location.href='login.sf'">로그인</button>
    		<button type="button" class="btn btn-default navbar-btn" onclick="location.href='join.sf'">회원 가입</button>
    	</c:when>
    	<c:otherwise>
    		<button type="button" class="btn btn-default navbar-btn" onclick="location.href='logout.sf'">로그아웃</button>
    		<button type="button" class="btn btn-default navbar-btn" onclick="location.href='info.sf'">회원 정보</button>
    	</c:otherwise>
    </c:choose>
  </div>
</nav>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>