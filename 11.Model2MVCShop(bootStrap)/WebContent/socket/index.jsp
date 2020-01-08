<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- user�� empty�� �ƴϸ�!!! -->
<c:if test="${!empty user }">
	<jsp:forward page="main.jsp"/>
</c:if>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>	

  
	<script type="text/javascript">
		
		//==>"����" "Ȯ��"  Event ���� �� ó��
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
    //websocket�� �����ϰ� 
	function connect(){
		
		var socket = null;
		var ws = new WebSocket("ws://localhost:8080/");
		//socket�� �����Ǹ� socket�� �־��
		socket = ws;
		
		//onopen : eventHandler (event�� �߻�������)
		ws.onopen = function(){
			console.log('Info: connection opened. ');
			
		};
		//message�� ������
		ws.onmessage = function(event){
			console.log(event.data+ '\n');
		};
		
		ws.onclose = function(event){
			console.log('Info:connection closed.');
			//close�� �Ǹ� 1�ʿ� �ѹ��� �翬�� �õ���
			//setTimeout( function(){ connect(); }, 1000);
		};
		
		ws.onerror = function(error){
			console.log('Info:error.',error);
		};
	}
		
	</script>
	
<script type="text/javascript">

//============= ȸ�������� ȭ���̵� =============
$( function() {
	//==> �߰��Ⱥκ� : "addUser"  Event ����
	$("a[href='#' ]:contains('ȸ������')").on("click" , function() {
		self.location = "/user/addUser"
	});


//============= �α��� ȭ���̵� =============

	//==> �߰��Ⱥκ� : "addUser"  Event ����
	$("a[href='#' ]:contains('�� �� ��')").on("click" , function() {
		self.location = "/user/login"
	});


	//============= ��ǰ �˻� =============
	$("a[href='#' ]:contains('��ǰ�˻�')").on("click" , function() {
		self.location = "/product/listProduct?menu=manage"
	});
	
	$("a[href='#' ]:contains('�ǸŻ�ǰ���')").on("click", function(){
		//alert(  $( ".Depth03:contains('�ǸŻ�ǰ���')" ) );
			self.location = "/product/addProduct";
	});
	
	
	$("a[href='#' ]:contains('�ǸŻ�ǰ����')").on("click", function(){
		//alert(  $( ".Depth03:contains('�ǸŻ�ǰ����')") );
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
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	   	<!-- ToolBar End /////////////////////////////////////-->


<div class="container">
	<div class="row">
		<div class="col-md-3">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<i class="glyphicon glyphicon-heart"></i> ȸ������
			</div>
		
<!--  ȸ������ ������ -->
			<ul class="list-group">
				 <li class="list-group-item">
				 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
				 <li class="list-group-item">
				 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
			</ul>
		</div>
	
	 
		<div class="panel panel-primary">
			<div class="panel-heading">
					<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
       			</div>
			<ul class="list-group">
				 <li class="list-group-item">
				 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
				 <li class="list-group-item">
				 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
			</ul>
        </div>
             
             
		<div class="panel panel-primary">
			<div class="panel-heading">
					<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
   			</div>
			<ul class="list-group">
				 <li class="list-group-item"><a href="#">��ǰ�˻�</a></li>
				  <li class="list-group-item">
				  	<a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
				  </li>
				 <li class="list-group-item">
				 	<a href="#">�ֱٺ���ǰ</a> <i class="glyphicon glyphicon-ban-circle"></i>
				 </li>
			</ul>
		</div>
	
	</div>
 	 	<!--  Main start /////////////////////////////////////-->   		
 	 	<div class="col-md-9">
			<div class="jumbotron">
		  		<h1>Model2 MVC Shop</h1>
		  		<p>�α��� �� ��밡��...</p>
		  		<p>�α��� �� �˻��� �����մϴ�.</p>
		  		<p>ȸ������ �ϼ���.</p>
		  		
		  		<div class="text-center">
		  			<a class="btn btn-info btn-lg" href="#" role="button">ȸ������</a>
		  			<a class="btn btn-info btn-lg" href="#" role="button">�� �� ��</a>
		  		</div>
		  		
		  	</div>
        </div>


	</div>

</div>

<!-- input�� �ִ� message�� socket�� �����ڴ� -->
		<div class ="well">
			<input type="text" id="msg" value="1212" class="form-control"/>
			<button id="btnSend" class="btn btn-primary">send message</button>
		</div>
		
</body>

</html>