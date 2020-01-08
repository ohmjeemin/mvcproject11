<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- user가 empty가 아니면!!! -->
<c:if test="${!empty user }">
	<jsp:forward page="main.jsp"/>
</c:if>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>	

  
	<script type="text/javascript">
		
		//==>"수정" "확인"  Event 연결 및 처리
		 $(function() {
			
			$('#btnSend').on('click', function(evt){
				evt.preventDefault();
				if(socket.readyState!==1) return;
				
					let msg = $('input#msg').val();
					socket.send(msg);	
			});
			
			connect();
		});
		
	</script>

	<script>
    //websocket을 연결하고 
	function connect(){
		
		var socket = null;
		var ws = new WebSocket("ws://localhost:8080/socket");
		//socket이 생성되면 socket에 넣어라
		socket = ws;
		
		//onopen : eventHandler (event가 발생했을때)
		ws.onopen = function(){
			console.log('Info: connection opened. ');
			
		};
		//message가 왔을때
		ws.onmessage = function(event){
			console.log(event.data+ '\n');
		};
		
		ws.onclose = function(event){
			console.log('Info:connection closed.');
			//close가 되면 1초에 한번씩 재연결 시도해
			//setTimeout( function(){ connect(); }, 1000);
		};
		
		ws.onerror = function(error){
			console.log('Info:error.',error);
		};
	}
		
	</script>
	
<script type="text/javascript">

//============= 회원원가입 화면이동 =============
$( function() {
	//==> 추가된부분 : "addUser"  Event 연결
	$("a[href='#' ]:contains('회원가입')").on("click" , function() {
		self.location = "/user/addUser"
	});


//============= 로그인 화면이동 =============

	//==> 추가된부분 : "addUser"  Event 연결
	$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
		self.location = "/user/login"
	});


	//============= 상품 검색 =============
	$("a[href='#' ]:contains('상품검색')").on("click" , function() {
		self.location = "/product/listProduct?menu=manage"
	});
	
	$("a[href='#' ]:contains('판매상품등록')").on("click", function(){
		//alert(  $( ".Depth03:contains('판매상품등록')" ) );
			self.location = "/product/addProduct";
	});
	
	
	$("a[href='#' ]:contains('판매상품관리')").on("click", function(){
		//alert(  $( ".Depth03:contains('판매상품관리')") );
			self.location = "/product/listProduct?menu=manage";
	});

});

</script>

<style>
        body > div.container {
            padding-top : 70px;
             font-family: 'Do Hyeon', sans-serif;
            
        }
        
       
   	</style>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		
        <div class="container">
       
        	<a class="navbar-brand" href="/index.jsp" style="padding: 0px 0px">
		<img alt="" src="/images/uploadFiles/logo.png" width="200px" height="50px">
		</a> 
		
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>

			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	   	<!-- ToolBar End /////////////////////////////////////-->


<div class="container">
	<div class="row">
		<div class="col-md-3">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<i class="glyphicon glyphicon-heart"></i> 회원관리
			</div>
		
<!--  회원관리 아이템 -->
			<ul class="list-group">
				 <li class="list-group-item">
				 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
				 <li class="list-group-item">
				 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
			</ul>
		</div>
	
	 
		<div class="panel panel-primary">
			<div class="panel-heading">
					<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
       			</div>
			<ul class="list-group">
				 <li class="list-group-item">
				 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
				 <li class="list-group-item">
				 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
			</ul>
        </div>
             
             
		<div class="panel panel-primary">
			<div class="panel-heading">
					<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
   			</div>
			<ul class="list-group">
				 <li class="list-group-item"><a href="#">상품검색</a></li>
				  <li class="list-group-item">
				  	<a href="#">구매이력조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
				  </li>
				 <li class="list-group-item">
				 	<a href="#">최근본상품</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
			</ul>
		</div>
	
	</div>
 	 	<!--  Main start /////////////////////////////////////-->   		
 	 	<div class="col-md-9">
			<div class="jumbotron">
		  		<h1>Model2 MVC Shop</h1>
		  		<p>로그인 후 사용가능...</p>
		  		<p>로그인 전 검색만 가능합니다.</p>
		  		<p>회원가입 하세요.</p>
		  		
		  		<div class="text-center">
		  			<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a>
		  			<a class="btn btn-info btn-lg" href="#" role="button">로 그 인</a>
		  		</div>
		  		
		  	</div>
        </div>


	</div>

</div>

<!-- input에 있는 message를 socket에 보내겠다 -->
		<div class ="well">
			<input type="text" id="msg" value="1212" class="form-control"/>
			<button id="btnSend" class="btn btn-primary">send message</button>
		</div>
		
</body>

</html>