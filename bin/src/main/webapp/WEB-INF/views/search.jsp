<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function detail(code) {
	location.href = "detail.sf?code=" + code;
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
<section>
<form action='search.sf'>
<div class="row" id="target">
	<div class="col-sm-3"></div>
	<div class="col-sm-1">
		<select class="custom-select" name="sort" onchange="">
  			<option value="1" selected="selected">이름순</option>
  			<option value="2">칼로리순</option>
  			<option value="3">인기순</option>
  			<option value="4">고열량저영양</option>
  			<option value="5">안전먹거리</option>
		</select>
	</div>
	<div class="col-sm-1">
		<select class="custom-select" name="key">
  			<option value="1" selected="selected">상품명</option>
  			<option value="2">제조사</option>
  			<option value="3">재료명</option>
		</select>
	</div>
	<div class="col-sm-2">
		<input type="text" class="form-control" name="word" value="<c:if test="${word != null }">${word }</c:if>">
	</div>
	<div class="col-sm-2">
		<button class="btn" type="submit">검색</button>
	</div>
	<div class="col-sm-3"></div>
</div>
</form>
</section>
<hr>

<section>
<div align="center">
<c:set var="i" value="0" />
<c:set var="j" value="2" />
	<table>
		<c:forEach var="f" items='${list }' varStatus="status">
			<c:if test="${i%j==0 }"><tr></c:if>
			<td onclick="detail(${f.getCode() })">
				<div class="card mb-3" id="cdata" style="max-width: 540px;">
					<div class="row no-gutters">
    					<div class="col-md-4">
      						<img src="${f.getImg() }" class="card-img">
    					</div>
    					<div class="col-md-8">
      						<div class="card-body">
        						<h5 class="card-title">${f.getName() }</h5>
        						<p class="card-text"><small class="text-muted">${f.getMaterial() }</small></p>
      						</div>
    					</div>
  					</div>
				</div>
			</td>
			<c:if test="${i%j==j-1 }"></tr></c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
	</table>
</div>
</section>
</body>
</html>