<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.safe.vo.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeFood</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function addCart(code){
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
	}
</script>

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
<div align="center">
<c:set var="i" value="0" />
<c:set var="j" value="4" />
	<table>
		<c:forEach var="f" items='${list }' varStatus="status">
			<c:if test="${i%j==0 }"><tr></c:if>
			<td>
				<div class="card" style="width: 18rem;">
					<img src="${f.getImg() }" class="card-img-top">
  					<div class="card-body text-center">
  						<h5 class="card-title">${f.getName() }</h5>
    					<a class="badge badge-primary" href="detail.sf?code=${f.getCode() }">더보기</a>
    					<c:if test="${!empty userSession}">
  							<a class="badge badge-primary" href="#" data-toggle="modal" data-target="#addModal" data-whatever="${f.getCode() }">추가</a>
  							<a class="badge badge-primary" href="#" onclick="addCart(${f.getCode()})">찜</a>
  						</c:if>
  					</div>
				</div>
			</td>
			<c:if test="${i%j==j-1 }"></tr></c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
	</table>
	
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
</div>
<script>
	var today = new Date();
    $('#date').datepicker({
        uiLibrary: 'bootstrap4', 
        format: "yyyy-mm-dd"
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
</body>
</html>