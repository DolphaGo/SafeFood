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
<form action="noticeUpdate.sf" method="post" enctype="multipart/form-data">
	<input type="hidden" name="nid" value="${n.nid}">
	<table class="table" style="text-align: center;">
		<tr>
			<th>글번호</th>
			<td>${n.nid}</td>
			<th>작성일</th>
			<td>${n.wdate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><input type="text" class="form-control" name="name" readonly="readonly" value="운영자"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" class="form-control" name="title" size="50" value="${n.title}"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><textarea class="form-control" rows="10" cols="50" name="content">${n.content}</textarea></td>
		</tr>
		<tr>
		<tr>
			<th>첨부파일</th>
				<td colspan="3">
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="ufile">
						<label class="custom-file-label" for="ufile">Choose file</label>
					</div>
				</td>
			</tr>
		<tr>
			<td colspan="4">
				<input type="submit" class="btn btn-primary mb-2" value="수정">
				<input type="button" class="btn btn-primary mb-2" value="취소" onclick="location.href='noticeView.sf?nid=${n.nid}'">
			</td>
		</tr>
	</table>
</form>
</div>
<div class="col-sm-2"></div>
</div>
</body>
</html>