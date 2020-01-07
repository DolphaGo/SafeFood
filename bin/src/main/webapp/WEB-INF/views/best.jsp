<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeFood</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">베스트 섭취 정보</h5>
				<form action="calcCal.sf">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="active">활동 지수</label>
							<input type="text" class="form-control" name="active" placeholder="활동 지수를 입력하세요.">
						</div>
						<div class="form-group col-md-6">
							<label for="height">키</label>
							<input type="text" class="form-control" name="height" placeholder="키를 입력하세요. (cm)">
						</div>
					</div>
					<p class="card-text" align="center">
						<small class="text-muted">
							앉아서 주로 생활하거나 매일 가벼운 움직임만 하며 활동량이 적은경우, 25<br>
							규칙적인 생활로 보통의 활동량을 가진 경우, 30 ~35<br>
							육체노동 등 평소 신체 활동량이 많은 경우, 40
						</small>
					</p>
					<div align="center">
						<button type="submit" class="btn btn-primary">일일 권장 칼로리 계산</button>
						<br><br>
						<table class="table" style="text-align: center;">
							<tr>
								<th>일일 권장 칼로리</th>
								<td>${dailyCal } kcal</td>
							</tr>
							<tr>
								<th>베스트 섭취 정보 칼로리</th>
								<td>${minCal } kcal</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<div align="center">
			<c:set var="i" value="0" />
			<c:set var="j" value="3" />
			<table>
				<c:forEach var="f" items='${list }' varStatus="status">
					<c:if test="${i%j==0 }"><tr></c:if>
					<td>
						<div class="card" style="width: 18rem;">
							<img src="${f.getImg() }" class="card-img-top">
  							<div class="card-body text-center">
  								<h5 class="card-title">${f.getName() }</h5>
    							<a href="detail.sf?code=${f.getCode() }" class="btn btn-light">상품 정보 이동</a>
  							</div>
						</div>
					</td>
					<c:if test="${i%j==j-1 }"></tr></c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-sm-3"></div>
</div>
</body>
</html>