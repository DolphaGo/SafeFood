<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatInformation</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
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
		<form action="viewEatInfo.sf">
			<div class="card">
			<input type="hidden" value="${nowuser }" id="userid" name="userid">
				<h5 class="card-header">${nowuser }님의 섭취 정보</h5>
				
				
				<div class="card-body">
					<div class="form-row">
						<input type="text" id="date" name="date" width="300" value="${date }" />&nbsp;&nbsp;
    					<button type="submit" class="btn btn-primary">검색</button>
    				</div>
				</div>
			</div>
    	</form>
    	<table class="table table-striped table-hover" style="text-align: center;">
    		<thead>
    			<tr>
    				<th scope="col" colspan="2">상품정보</th>
    				<th scope="col">섭취 수량</th>
    				<th scope="col">삭제</th>
    			</tr>
    		</thead>
    		<c:forEach items="${list}" var="f" varStatus="status">
    			<tr>
    				<td><img src="${f.getImg() }" height="30"></td>
    				<td>${f.name }&nbsp;&nbsp;<a href="detail.sf?code=${f.getCode() }" class="badge badge-primary">더보기</a></td>
    				<td>${nums[status.index]}</td>
    				<td><a href="deleteEatInfo.sf?code=${f.getCode()}&edate=${date}" class="badge badge-primary">삭제</a></td>
    			</tr>
    		</c:forEach>
    	</table>
    	<hr>
   <c:if test="${graph.calory!=0}">
	<div align="center">
	<div id="nutChart" style="width:1000px" align="center"></div>
	</div>
</c:if>
	</div>
	<div class="col-sm-3"></div>
	
</div>
<script>
    $('#date').datepicker({
        uiLibrary: 'bootstrap4', 
        format: "yyyy-mm-dd",
    });
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>


<script type="text/javascript">
var supportpereat = ${graph.supportpereat };
var calory = ${graph.calory };
var carbo = ${graph.carbo };
var protein = ${graph.protein };
var fat = ${graph.fat };
var sugar = ${graph.sugar };
var natrium = ${graph.natrium };
var chole = ${graph.chole };
var fattyacid = ${graph.fattyacid };
var transfat = ${graph.transfat };

var chart = new CanvasJS.Chart("nutChart", {
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: false,
	animationEnabled: true,
	title: {
		text: "총 섭취 정보"
	},
	data: [{
		type: "pie",
		startAngle: 25,
		toolTipContent: "<b>{label}</b>: {y}",
		showInLegend: "true",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}",
		dataPoints: [
			{ y: calory*1.0, label: "칼로리" },
			{ y: carbo*1.0, label: "탄수화물" },
			{ y: protein*1.0, label: "단백질" },
			{ y: fat*1.0, label: "지방"},
			{ y: sugar*1.0, label: "당류"},
			{ y: natrium*0.1, label: "나트륨"}, 
			{ y: chole*1.0, label: "콜레스트롤"}, 
			{ y: fattyacid*1.0, label: "포화지방산"}, 
			{ y: transfat*1.0, label: "트랜스지방"}
		]
	}]
});

chart.render();
</script>

</body>
</html>