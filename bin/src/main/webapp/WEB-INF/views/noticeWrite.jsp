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
<form action="noticeWrite.sf" enctype="multipart/form-data" method="post">
	<table class="table" style="text-align: center;">
		<tr>
			<th>작성자</th>
			<td><input type="text" class="form-control" name="name" id="name" value="운영자"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" class="form-control" name="title" id="title" size="50" value="${n.title}"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" rows="10" cols="50" name="content" id="content">${n.content}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
				<td>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="ufile">
						<label class="custom-file-label" for="ufile">Choose file</label>
					</div>
				</td>
			</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-primary mb-2" name="submit" id="submit" value="작성">
			</td>
		</tr>
	</table>
</form>
</div>
<div class="col-sm-2"></div>
</div>
</body>
</html>