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
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">로그인</h5>
				<form action="login.sf" method="post">
					<div class="form-group">
						<label for="id">ID</label>
						<input type="text" class="form-control" name="id" placeholder="Enter ID">
						<small id="idHelp" class="form-text text-muted">We'll never share your information with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="pass">Password</label>
						<input type="password" class="form-control" name="pass" placeholder="pass">
					</div>
					<div align="right">
						<button type="submit" class="btn btn-primary" >로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-sm-4"></div>
</div>
</body>
</html>