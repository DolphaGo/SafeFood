<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Follower</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript"> <%--문제의 녀석들 --%>

function getfollower(){
$.ajax({
	url:'getfollowers.sf',
	type:'get',
	dataType:'json',//from server
	contentType:'application/json;charset=UTF-8',//to server
	success: function(data){
		alert(JSON.stringify(data));
	},
	error: function(request,error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
})
}
function getfollowing(){
	$.ajax({
		url:'getfollowings.sf',
		type:'get',
		dataType: 'json',//from server
		contentType: 'application/json;charset=UTF-8',//to server
		success: function(data){
			alert(JSON.stringify(data));
		},
		error: function(request,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
}

function userEatInfo(id) {
	location.href = "eatInfo.sf?userid=" + id;
}

function addfollow(id){
	$.ajax({
		url:'addfollow.sf/'+id,
		type:'post',
		dataType: 'json',//from server
		contentType: 'application/json',//to server
		success: function(data){
			if(data) {
				alert("이제 "+id+"님을 팔로우합니다!");
			}
			else alert("이미 팔로우 중인 친구입니다.");
		},
		error: function(request,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function unfollow(id){
	$.ajax({
		url:'unfollow.sf/'+id,
		type:'delete',
		dataType:'json',//from server
		contentType:"application/json;charset=UTF-8",//to server
		success: function(data){
			if(data) alert("이제 "+id+"님을 언팔로우합니다.");
			else alert("팔로우 중이지 않습니다.");
		},
		error: function(request,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>
<style>
#profile {
	width: 150px;
	height: 193px;
	margin-top: 10px;
	margin-left: 38px;
}
</style>
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

<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link" href="users.sf">친구 찾기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="getfollowings.sf">팔로잉</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="getfollowers.sf">팔로워</a>
      </li>
    </ul>
  </div>
  
  <div class="card">
      <div class="card-body">
      <c:set var="i" value="0" />
      <c:set var="j" value="4" />
      
       <table>
       <c:forEach var="u" items="${followerList }" varStatus="status">
			<c:if test="${i%j==0 }"><tr></c:if>
			<td>
				<div class="card">
					<div class="row no-gutters">
						<img onclick="userEatInfo('${u.getFollower()}')"   src="profile.sf?id=${u.getFollower()}" class="card-img-top rounded-circle" id="profile">
						<div class="card-body">
							<h5 class="card-title">${u.getFollower() }</h5>
							<a class="badge badge-primary" onclick="addfollow('${u.getFollower()}')" href="#">팔로우</a>
						</div>
					</div>
				</div>
			</td>
			<c:if test="${i%j==j-1 }"></tr></c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
	</table>
      </div>
  </div>
  
  
</div>

</div>
<div class="col-sm-3"></div>
</div>
</body>
</html>