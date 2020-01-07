<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DetailFoodView</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function(){
		$('#zzim').on('click',function(){
		var code=$('#codeAjax').val();
		$.ajax({
			url: 'addCart.sf/'+code,
			type: 'post',
			dataType: 'json',//from server
			contentType: 'application/json',//to server
			success: function(data){
				if(data) alert("찜 목록에 추가되었습니다.");
				else alert("이미 찜 목록에 존재합니다.");
			},
			error: function(request,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
			}
		});
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
<h3 class="page-title text-center">제품 정보</h3>
<hr>
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-2">
		<img src="${f.getImg() }" alt="" style="width: 20rem;">
	</div>
	<div class="col-sm-4">
	<input name="codeAjax" id="codeAjax" type="hidden" value='${f.getCode() }'>
		<table class="table">
			<tbody>
				<tr><td width='100'>제품명</td>
					<td>
						${f.getName() }
						<c:if test="${!empty userSession}">
							<a class="badge badge-primary" href="#" data-toggle="modal" data-target="#addModal" data-whatever="${f.getCode() }">추가</a>
  							<a class="badge badge-primary" href="#" id="zzim">찜</a>
  						</c:if>
					</td>
				</tr>
				<tr><td width='100'>제조사</td><td>${f.getMaker() }</td></tr>
				<tr><td width='100'>원재료</td><td>${f.getMaterial() }</td></tr>
				<tr><td width='100'>알레르기 성분</td><td>${f.getAllergy() }</td></tr>
			</tbody>
		</table>
	</div>
	<div class="col-sm-3"></div>	
</div>
<div align="center">
<div id="nutChart" style="width:1000px" align="center"></div>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addModalLabel">추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="addEatInfo.sf" method="post">
      	<div class="modal-body">
      	  <input type="hidden" name="code" id="code" value="">
          <div class="form-row">
			<div class="form-group col-md-4">
            	<label for="recipient-name" class="col-form-label">섭취 날짜 선택</label>
            </div>
            <div class="form-group col-md-8">
            	<input type="text" id="date" name="date" width="250" value="" />
            </div>
          </div>
      	</div>
      	<div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-primary">추가</button>
      	</div>
      </form>
    </div>
  </div>
</div>
	<script>
		var today = new Date();
		$('#date').datepicker({
			uiLibrary : 'bootstrap4',
			format : "yyyy-mm-dd"
		});

		$('#date').val(
				today.getFullYear() + "-" + (today.getMonth() + 1) + "-"
						+ today.getDate());

		$('#addModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var code = button.data('whatever');
			var modal = $(this);
			$('#code').val(code);
		})
	</script>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
var supportpereat = ${f.supportpereat };
var calory = ${f.calory };
var carbo = ${f.carbo };
var protein = ${f.protein };
var fat = ${f.fat };
var sugar = ${f.sugar };
var natrium = ${f.natrium };
var chole = ${f.chole };
var fattyacid = ${f.fattyacid };
var transfat = ${f.transfat };

var chart = new CanvasJS.Chart("nutChart", {
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: false,
	animationEnabled: true,
	title: {
		text: "영양 정보"
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