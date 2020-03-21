<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<script src="https://unpkg.com/vue"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border-bottom: 1px solid #ddd;
	padding: 15px;
	text-align: center;
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
<div id='app'>
	<component v-bind:is="currentview"></component>
</div>
<script type="text/x-template" id="qnalisttemplate">
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
		<tbody v-for="q in result">
				<tr @click="show_detail(q.qid)">
					<td>{{q.qid}}</td>
					<td>{{q.title}}</td>
					<td>{{q.wdate}}</td>
					<td>{{q.id}}</td>
					<td>{{q.count}}</td>
				</tr>
		</tbody>
		<tr>
			<td colspan="2">
				<button @click="addQna" class="btn btn-outline-primary mb-2" style="text-align: right">글쓰기
			</td>
			<td colspan="4">
				<div class="input-group">
						<div class="input-group-append">
							<select name="type" class="custom-select" size="1">
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목 + 내용</option>
								<option value="4">작성자</option>
							</select>
							<input type="text" class="form-control" name="keyword">
							<input class="btn btn-outline-primary" type="submit" value="검색">
						</div>
				</div>
			</td>
		</tr>
	</table>
</div>

<div class="col-sm-2"></div>
</div>
	<nav aria-label="boardNav">
		<ul class="pagination justify-content-center">
			<template v-show="start != 1">
				<li class="page-item"><a class="page-link" href="boardList.do?page=1<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">처음</a></li>
				<li class="page-item"><a class="page-link" href="boardList.do?page=${start-1 }<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">이전</a></li>
			</template>
			<!-- <c:forEach begin="${start}" end="${end<last?end:last}" var="i">
				<c:choose>
					<c:when test="${i == current}">
						<li class="page-item active">
							<span class="page-link">${i}<span class="sr-only">(current)</span></span>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="boardList.do?page=${i}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${end < last}">
				<li class="page-item"><a class="page-link" href="boardList.do?page=${end+1}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">다음</a></li>
				<li class="page-item"><a class="page-link" href="boardList.do?page=${last}<c:if test="${keyword != null}">&keyword=${keyword}&type=${type}</c:if>">마지막</a></li>
			</c:if> -->
		</ul>
	</nav>
</script>

	<script type="text/x-template" id="qnaviewtemplate">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<table class="table" style="text-align: center;">
		<tr>
			<td colspan="4">
				<button class="btn btn-primary mb-2" @click="qnalist">목록
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">{{qnaresult.title}}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3">{{qnaresult.id}}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>{{qnaresult.wdate}}</td>
			<th>조회수</th>
			<td>{{qnaresult.count}}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">{{qnaresult.content}}</td>
		</tr>

	
		<tr v-show="PossibleUD()">
			<td colspan="2">
				<button class="btn btn-primary mb-2" @click="updateQna">수정하기
			</td>
			<td colspan="2">
				<button class="btn btn-primary mb-2" @click="deleteQna">삭제하기
			</td>
		</tr>
	</table>
	<div class="jumbotron">
			<div class="form-row">
				<div class="form-group col-md-1"></div>
    			<div class="form-group col-md-9">
      				<input type="text" class="form-control" name="content" v-model="content" placeholder="댓글 내용" @keyup.enter="addcomment()">
    			</div>
    			<div class="form-group col-md-2">
      				<button @click="addcomment()" class="btn btn-primary">댓글 작성
    			</div>
  			</div>
  		<table class="table">
  			<template v-for="c in commentresult">
				<tr>
					<td>{{c.id}}</td>
					<td>{{c.content}}</td>
					<td>{{c.wdate}}</td>
					<td v-if="possibleDelete(c.id)"><a class="badge badge-primary" href="" @click="deletecomment(c.cid)">삭제</a></td>
					<td v-else></td>
				</tr>
			</template>
  		</table>
  	</div>
</div>
<div class="col-sm-2"></div>
</div>
</script>

<script type="text/x-template" id="qnawritetemplate">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<table class="table" style="text-align: center;">
		<tr>
			<th>제목</th>
			<td><input type="text" class="form-control" name="title" id="title" size="50" v-model="title" placeholder="제목을 입력하세요"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" rows="10" cols="50" name="content" id="content" v-model="content">{{content}}</textarea></td>
		</tr>
		<tr>
			<td>
				<button @click="addQna" class="btn btn-primary mb-2">작성
			</td>
			<td>
				<button @click="reset" class="btn btn-primary mb-2">취소
			</td>
		</tr>
	</table>
</div>
<div class="col-sm-2"></div>
</div>
</script>

	<script type="text/x-template" id="qnaupdatetemplate">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<table class="table" style="text-align: center;">
		<tr>
			<th>글번호</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>{{qid}}</td>
			<td>{{wdate}}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>{{id}}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" class="form-control" v-model="title" name="title" size="50" :value="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" v-model="content" rows="10" cols="50" name="content">{{content}}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button @click="updateQna" class="btn btn-primary mb-2">수정
			</td>
			<td colspan="2">
				<button @click="resetQna" class="btn btn-primary mb-2">되돌아가기
			</td>
		</tr>
	</table>
</div>
<div class="col-sm-2"></div>
</div>

</script>


<script type="text/javascript">
var qnalist=Vue.component('qnalist',{
	template: '#qnalisttemplate',
	data(){
	 return{
	  result: [],
	  loading: true,
	     errored: false,
	     qid:'',
	     id :'',
	     wdate:'',
	     title:'',
	     content:'',
	     count:'',
	 }
	},
	methods: {
	    allQnas() {
	        axios.get(
	            'http://localhost:8080/SafeFood/qna'
	        ).then(response => {
	            this.result = response.data;
	            console.log(response.data);
	        });
	    },
	    show_detail(qid) {
	       App.$data.qid=qid;
	       App.showlist(1);
	    },
	    addQna() {
	        App.showlist(2);
	    },
	},
	mounted(){
		this.allQnas();
	}
 });
var qnaview=Vue.component('qnaview',{
	template: '#qnaviewtemplate',
	data(){
	 return{
	  cid:'',
	  qid:App.$data.qid,
	  id:'',
	  commentid:'',
	  wdate:'',
	  content:'',
	  qnaresult:[],
	  commentresult:[],
	  loading: true,
	     errored: false
	 }
	},	
	methods:{
    	PossibleUD(){
	 		  if(this.qnaresult.id==App.$data.id) return true;
	 		  else return false;
	 	   },
  	  initload(){
  		  axios
         .get('http://localhost:8080/SafeFood/qna/'+App.$data.qid)
         .then(response =>{
        	 
       		this.qnaresult =response.data.qna;
       		this.commentresult=response.data.comment;
         })
         .catch(error => {
           console.log(error)
           this.errored = true
         })
         .finally(() => this.loading = false);
  	  },
  	  deletecomment(cid) {
		var res=confirm("댓글을 삭제하시겠습니까?");
		if(res){
		      axios.delete('http://localhost:8080/SafeFood/comment/' + cid)
		          .then(response => {
		        	  this.initload();
		          })
		}
	  },
        addcomment(){
   		  if(this.comment==''){ alert('댓글을 작성하세요.'); return ;}
   		  
   		  var res=confirm("댓글을 등록하시겠습니까?");
   		  if(res){
      	  axios.post('http://localhost:8080/SafeFood/comment', {
      		  cid:null,
      		  qid:this.qid,
      		  id:App.$data.id,		
      		  wdate:null,
      		  content:this.content
      		 })
               .then(response => {
             	  this.id='';
             	  this.content='';
             	  this.initload();
               	})
   		  }
        },
        updateQna() {
      	 App.$data.qid=this.qid;
           App.$data.currentview='qnaupdate';
           App.showlist(3);
       },
       deleteQna() {
      	 var res=confirm("Q&A를 삭제하시겠습니까?");
      	 if(res){
           axios.delete('http://localhost:8080/SafeFood/qna/' + this.qid)
               .then(response => {
              	 App.$data.qid='';
  	             App.$data.currentview='qnalist';
  	             App.showlist(0);
               })
      	 }
       },
       qnalist(){
      	App.$data.qid='';
          App.$data.currentview='qnalist';
          App.showlist(0);
       },
       possibleDelete(id){
      	 if(App.$data.id===id) return true;
      	 else return false;
       }

    },
    mounted(){
      this.initload();
	}
});

var qnawrite=Vue.component('qnawrite',{
	template:"#qnawritetemplate",
	data(){
		return{
			 result: [],
			   loading: true,
		       errored: false,
		       qid:'',
		       id :App.$data.id,
		       wdate:'',
		       title:'',
		       content:'',
		       count:'',
		}
	},
	methods:{
		addQna(){
			 var res=confirm("Q&A를 등록하시겠습니까?");
        	 if(res){
             axios.post('http://localhost:8080/SafeFood/qna',{
               qid:null,
  		       id :App.$data.id,
  		       wdate:null,
  		       title:this.title,
  		       content:this.content,
  		       count:0,
             })
                 .then(response => {
    	             App.showlist(0);
                 })
        	 }
		},
		reset(){
             App.showlist(0);
		}
	},
	mounted(){
		this.id=App.$data.id;
	}
	
		
});

var qnaupdate=Vue.component('qnaupdate',{
	template:"#qnaupdatetemplate",
	data(){
		return{
			   loading: true,
		       errored: false,
		       qid:App.$data.qid,
		       id :'',
		       wdate:'',
		       title:'',
		       content:'',
		       count:'',
		}
	},
	mounted(){
		this.initqna();
	},
	methods:{
		initqna(){
			axios.get('http://localhost:8080/SafeFood/qna/' + App.$data.qid)
	         .then(response => {
	        	this.qid=response.data.qna.qid;
	        	this.id=response.data.qna.id;
	        	this.wdate=response.data.qna.wdate;
	        	this.title=response.data.qna.title;
	        	this.content=response.data.qna.content;
	        	this.count=response.data.qna.count;
	         })
		},
		updateQna(){
			axios.put('http://localhost:8080/SafeFood/qna/',{
				qid:this.qid,
	        	id:this.id,
	        	wdate:this.wdate,
	        	title:this.title,
	        	content:this.content,
	        	count:this.count
			}).then(response=>{
				this.backtoView();
			})
		},
		resetQna(){
			this.backtoView();
		},
		backtoView(){
			 axios
	          .get('http://localhost:8080/SafeFood/qna/'+App.$data.qid)
	          .then(response =>{
	        		this.qnaresult =response.data.qna;
	        		this.commentresult=response.data.comment;
	          })
	          .catch(error => {
	            console.log(error)
	            this.errored = true
	          })
	          .finally(() => this.loading = false);
            App.$data.currentview='qnaview';
		}
	},
	
});

var App=new Vue({
	   el:'#app',
		data:{
			currenttitle:'Q&A 무엇이든 물어보세요.',
			id:"<%=session.getAttribute("userSession") %>",
			qid:'',
			currentview:'qnalist',
			allviews:['qnalist','qnaview','qnawrite','qnaupdate'],
			cutt:['Q&A 무엇이든 물어보세요.','Q&A 보기','Q&A 작성하기','Q&A 수정하기']
		},
		components:{
		   qnalist:qnalist,
		   qnaview:qnaview,
		   qnawrite:qnawrite,
		   qnaupdate:qnaupdate
		},
		methods:{
		   showlist(val){
			   this.currentview=this.allviews[val];
			   this.cuttenttitle=this.cutt[val];
		   }
		}
});
</script>
</body>
</html>
