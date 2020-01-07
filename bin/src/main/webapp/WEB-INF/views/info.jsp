<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeFood</title>
<style>
#profile {
	width: 250px;
	height: 250px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(function(){
<c:forEach items="${allergy }" var="item">
	$('input:checkbox[name="allergy"]').each(function() {
	     if(this.value =="${item}"){ //값 비교
	            this.checked = true; //checked 처리
	      }
	 });
</c:forEach>
});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#pw').keyup(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if (pw.length<6 || pw.length>16) {
				document.getElementById('passText').innerHTML = "비밀번호는 6글자 이상, 16글자 이하로 설정할 수 있습니다.";
				document.getElementById('passText').style.color = 'red';
			} else {
				var num = 0;
				var eng = 0;
				for (var i = 0; i < pw.length; i++) {
					if (pw.charAt(i) <= '9' && pw.charAt(i) >= '0')
						num++;
					else
						eng++;
				}
				if (num > 0 && eng > 0) {
					document.getElementById('passText').innerHTML = "사용 가능한 비밀번호 입니다.";
					document.getElementById('passText').style.color = 'blue';
					$('#pass_pass2').val('1');
				} else {
					document.getElementById('passText').innerHTML = "비밀번호는 숫자와 문자조합으로 설정해야 합니다.";
					document.getElementById('passText').style.color = 'red';
				}
				
				if(pw!=pw2){
					document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
					document.getElementById('same').style.color = 'red';
					$("#pass_pass").val('0');
				}else{
					document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
					document.getElementById('same').style.color = 'blue';
					$("#pass_pass").val('1');
				}
			}
		});
		$('#pw2').keyup(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if (pw == pw2) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('same').style.color = 'blue';
				$("#pass_pass").val('1');
			} else {
				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color = 'red';
				$("#pass_pass").val('0');
			}
		});
		$("#btn").click(function() {
			var id_pass = $("#id_pass").val();
			var pass_pass = $("#pass_pass").val();
			var pass_pass2 = $("#pass_pass2").val();
			if (pass_pass2 == '0') {
				alert("비밀번호가 양식에 맞지 않습니다.")
			} else if (pass_pass == '0') {
				alert("비밀번호가 일치하지 않습니다.")
			} else {
				$('#updateForm').submit();
			}
		});
	});
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
		<div class="card mb-3">
			<div class="row no-gutters">
				<div class="row align-items-center">
					<div class="col-md-1"></div>
					<div class="col-md-3">
						<img src="profile.sf?id=${user.id }" class="rounded-circle" id="profile">
					</div>
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title">회원 정보</h5>
							<form method="post" enctype="multipart/form-data" id="updateForm" action='updateUser.sf'>
							 <input name="pass_pass" id="pass_pass" type="hidden" value='0'>
                    		 <input name="pass_pass2" id="pass_pass2" type="hidden" value='0'>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="id">ID</label>
										<input type="text" class="form-control" id="id" name="id" placeholder="ID" value="${user.id }" disabled="disabled">
									</div>
									<div class="form-group col-md-6">
										<label for="name">Name</label>
										<input type="text" class="form-control" name="name" value="${user.name }" disabled="disabled">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
							<label for="password">Password</label>
							<input type="password" id="pw" class="form-control" name="password" placeholder="Password">
							<small><span id="passText"></span></small>
						</div>
						<div class="form-group col-md-6">
							<label for="pass">Check Password</label>
							<input type="password" id="pw2" class="form-control" name="pass" placeholder="Check Password">
							<small><span id="same"></span></small>
						</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="phone">Phone</label>
										<input type="text" class="form-control" name="phone" value="${user.phone }">
									</div>
									<div class="form-group col-md-6">
										<label for="address">Address</label>
										<input type="text" class="form-control" name="address" value="${user.address }">
									</div>
								</div>
								<label for="name">Allergy</label>
									<div class="form-group">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="대두" >
									<label class="form-check-label">대두</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="땅콩">
									<label class="form-check-label">땅콩</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="우유">
									<label class="form-check-label">우유</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="게">
									<label class="form-check-label">게</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="새우">
									<label class="form-check-label">새우</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="참치">
									<label class="form-check-label">참치</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="연어">
									<label class="form-check-label">연어</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="쑥">
									<label class="form-check-label">쑥</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="소고기">
									<label class="form-check-label">소고기</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="닭고기">
									<label class="form-check-label">닭고기</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="돼지고기">
									<label class="form-check-label">돼지고기</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="복숭아">
									<label class="form-check-label">복숭아</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="민들레">
									<label class="form-check-label">민들레</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" name="allergy" value="계란흰자">
									<label class="form-check-label">계란흰자</label>
								</div>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroupFileAddon01">Upload Picture</span>
								</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input" name="ufile">
									<label class="custom-file-label" for="ufile">Choose Picture</label>
								</div>
							</div><br>
							<div align="right">
								<input type="button" class="btn btn-primary" id="btn" value="수정">
								<button type="submit" class="btn btn-primary" onclick="javascript: form.action='deleteUser.sf';">탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-3"></div>
</div>
</body>
</html>