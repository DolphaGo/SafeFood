<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<header><jsp:include page="header.jsp"></jsp:include></header>
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
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<table class="table" style="text-align: center;">
			<tr>
				<td colspan="4">
					<input type="button" class="btn btn-primary mb-2" value="목록" onclick="location.href='notice.sf'">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${n.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="3">운영자</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${n.wdate}</td>
				<th>조회수</th>
				<td>${n.count}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${n.content}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3"><img src = "download.sf?nid=${n.nid }"></td>
			</tr>
			<tr>
				<td colspan="4">
					<c:if test="${'ssafy' eq userSession}">
						<input type="button" class="btn btn-primary mb-2" onclick="location.href='noticeUpdate.sf?nid=${n.nid}'" value="수정">
						<input type="button" class="btn btn-primary mb-2" onclick="location.href='noticeDelete.sf?nid=${n.nid}'" value="삭제">
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<div class="col-sm-2"></div>
</div>
</body>
</html>