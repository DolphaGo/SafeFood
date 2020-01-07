<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript"> <%--문제의 녀석들 --%>
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
			if(data) alert("이제 "+id+"를 팔로우합니다!");
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
			if(data) alert("이제 "+id+"를 언팔로우합니다.");
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
        <a class="nav-link active" href="users.sf">친구 찾기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="getfollowings.sf">팔로잉</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="getfollowers.sf">팔로워</a>
      </li>
    </ul>
  </div>
  <div class="card-body">
    <form action='searchUser.sf'>
    <h5 class="card-title">
    	<input type="text" class="form-control" name="id" value="<c:if test='${id != null }'>${id }</c:if>" placeholder="ID를 입력하세요.">
    	<button class="btn btn-primary" type="submit">검색</button>
    </h5>
    </form>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>


<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        	친구 찾기
        </button>
      </h2>
    </div>
    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
      <form action='searchUser.sf'>
		<div class="row" id="target">
	<div class="col-sm-2"></div>
	<div class="col-sm-4">
		<input type="text" class="form-control" name="id" value="<c:if test='${id != null }'>${id }</c:if>" placeholder="ID를 입력하세요.">
	</div>
	<div class="col-sm-4">
		<button class="btn btn-primary" type="submit">검색</button>
	</div>
	<div class="col-sm-2"></div>
</div>
</form>
<c:set var="i" value="0" />
<c:set var="j" value="4" />
<!-- <input type="hidden" id="followList" value="">
<input type="hidden" id="followingList" value=""> -->

       <table>
		<c:forEach var="u" items='${list }' varStatus="status">
			<c:if test="${i%j==0 }"><tr></c:if>
			<td>
				<div class="card">
					<div class="row no-gutters">
						<img src="profile.sf?id=${u.getId()}" onclick="userEatInfo('${u.getId()}')" class="card-img-top rounded-circle" id="profile">
						<div class="card-body">
							<h5 class="card-title">${u.getId() }</h5>
							<a class="badge badge-primary" onclick="addfollow('${u.getId()}')">팔로우</a>
  							<a class="badge badge-primary" onclick="unfollow('${u.getId()}')">언팔로우</a>
							<p class="card-text"><small class="text-muted">${u.getName()}</small></p>
						</div>
					</div>
				</div>
			</td>
			<c:if test="${i%j==j-1 }"></tr></c:if>
			<c:set var="i" value="${i+1 }"/>
		</c:forEach>
	</table>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <input type="button" id="getfollower" value="팔로워" class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
      <c:set var="i" value="0" />
      <c:set var="j" value="4" />
      
       <table>
       <c:forEach var="u" items="${followerList }" varStatus="status">
			<c:if test="${i%j==0 }"><tr></c:if>
			<td>
				<div class="card">
					<div class="row no-gutters">
						<a href="">
							<img src="profile.sf?id=${u.getFollower()}" class="card-img-top rounded-circle" id="profile">
						</a>
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
  
  
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
      	<a onclick="getfollowing()" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">팔로잉</a>
  <!--       <input type="button" value="팔로잉" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"> -->
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
      <c:set var="i" value="0" />
		<c:set var="j" value="4" />
       <table>
		<c:forEach var="u" items="${followingList }" varStatus="status">
			<c:if test="${i%j==0 }"><tr></c:if>
			<td onclick="userEatInfo('${u.getFollow()}')">
				<div class="card">
					<div class="row no-gutters">
						<img src="profile.sf?id=${u.getFollow()}" class="card-img-top rounded-circle" id="profile">
						<div class="card-body">
							<h5 class="card-title">${u.getFollow() }</h5>
  							<a class="badge badge-primary" onclick="unfollow('${u.getFollow()}')" href="#">언팔로우</a>
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
</div>
<div class="col-sm-3"></div>
</div>
</body>
</html>