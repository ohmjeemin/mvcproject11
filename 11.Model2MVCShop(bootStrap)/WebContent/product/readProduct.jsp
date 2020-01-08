 <%@ page contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	
<style>
 		 body > div.container {
           /* padding-top : 50px; */
            margin-top: 10px;
            font-family: 'Do Hyeon', sans-serif;
            
        }
     </style>
    
    
	<script type="text/javascript">
		
		//==>"수정" "확인"  Event 연결 및 처리
		 $(function() {
			
			 $("button.btn.btn-primary").on("click" , function() {
				self.location = "/purchase/addPurchase?prodNo=${product.prodNo}"
			});
			
			 $("button.btn.btn-default").on("click" , function() {
					history.go(-1);
			});
			 
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
		var ws = new WebSocket("ws://localhost:8080/product/getProduct?prodNo=10001");
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

</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품 상세 조회</h3>
	     <!--   <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5> -->
	    </div>
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><h4><strong>모 델 명 </strong></h4></div>
			<div class="col-xs-8 col-md-4"><h4>${product.prodName}</h4></div>
		</div>
		
		<hr/>
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><h4><strong>상품이미지</strong></h4></div>
			<div class="col-xs-8 col-md-4">
			<c:forEach var="fn" items="${fileNameArr}" >
					<img src="/images/uploadFiles/${fn}" width="500" height="350" />
				</c:forEach></div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><h4><strong>가 격</strong></h4></div>
			<div class="col-xs-8 col-md-4"><h4>
			<fmt:formatNumber  value="${product.price}" type="currency" currencySymbol="￦"/></h4></div>
		</div>
		
		<hr/>
		
	
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><h4><strong>상세설명</strong></h4></div>
			<div class="col-xs-8 col-md-6">
			<h4>
			${product.prodDetail}
			</h4>
			</div>
		</div>
		
		<hr/>
		
		
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-default">취소</button>
	  		
	  		</div>
	  		
	  		
	  			
		</div>
		
		<!-- input에 있는 message를 socket에 보내겠다 -->
		<div class ="well">
			<input type="text" id="msg" value="1212" class="form-control"/>
			<button id="btnSend" class="btn btn-primary">send message</button>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>


</html>	
	
	
	
