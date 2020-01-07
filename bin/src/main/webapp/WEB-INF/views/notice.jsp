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
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="n">
						<tr>
							<td>${n.nid}</td>
							<td><a href='noticeView.sf?nid=${n.nid}&page=${current}'>${n.title}</a></td>
							<td>${n.wdate}</td>
							<td>운영자</td>
							<td>${n.count}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="2"></td>
					<td colspan="4">
						<div class="input-group">
							<c:if test="${'ssafy' eq userSession}">
								<input type="button" class="btn btn-outline-primary mb-2" value="글쓰기" onclick="location.href='noticeWrite.sf'" style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
							<form action="notice.sf">
								<div class="input-group-append">
									<select name="type" class="custom-select" size="1">
										<option value="1">제목</option>
										<option value="2">내용</option>
										<option value="3">제목 + 내용</option>
									</select> <input type="text" class="form-control" name="keyword">
									<input class="btn btn-outline-primary" type="submit" value="검색">
								</div>
							</form>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<nav aria-label="boardNav">
		<ul class="pagination justify-content-center">
			<c:if test="${start != 1}">
				<li class="page-item"><a class="page-link"
					href="notice.sf?page=1<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">처음</a></li>
				<li class="page-item"><a class="page-link"
					href="notice.sf?page=${start-1}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">이전</a></li>
			</c:if>
			<c:forEach begin="${start}" end="${end<last?end:last}" var="i">
				<c:choose>
					<c:when test="${i == current}">
						<li class="page-item active"><span class="page-link">${i}<span
								class="sr-only">(current)</span></span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="notice.sf?page=${i}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${end < last}">
				<li class="page-item"><a class="page-link"
					href="notice.sf?page=${end+1}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">다음</a></li>
				<li class="page-item"><a class="page-link"
					href="notice.sf?page=${last}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">마지막</a></li>
			</c:if>
		</ul>
	</nav>
</body>
</html>