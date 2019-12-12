 <%@ page contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		
		//==>"����" "Ȯ��"  Event ���� �� ó��
		 $(function() {
			
			 $("button.btn.btn-primary").on("click" , function() {
				self.location = "/purchase/addPurchase?prodNo=${product.prodNo}"
			});
			
			 $("button.btn.btn-default").on("click" , function() {
					history.go(-1);
			});
			
		});
		
	</script>

</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ �� ��ȸ</h3>
	     <!--   <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5> -->
	    </div>
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><h4><strong>�� �� �� </strong></h4></div>
			<div class="col-xs-8 col-md-4"><h4>${product.prodName}</h4></div>
		</div>
		
		<hr/>
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><h4><strong>��ǰ�̹���</strong></h4></div>
			<div class="col-xs-8 col-md-4">
			<c:forEach var="fn" items="${fileNameArr}" >
					<img src="/images/uploadFiles/${fn}" width="500" height="350" />
				</c:forEach></div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><h4><strong>�� ��</strong></h4></div>
			<div class="col-xs-8 col-md-4"><h4>
			<fmt:formatNumber  value="${product.price}" type="currency" currencySymbol="��"/></h4></div>
		</div>
		
		<hr/>
		
	
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><h4><strong>�󼼼���</strong></h4></div>
			<div class="col-xs-8 col-md-6">
			<h4>
			${product.prodDetail}
			</h4>
			</div>
		</div>
		
		<hr/>
		
		
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  			<button type="button" class="btn btn-primary">����</button>
	  			<button type="button" class="btn btn-default">���</button>
	  		
	  		</div>
	  		
	  			
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>


</html>	
	
	
	
