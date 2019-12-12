<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
	<title>구매 상세 조회</title>

	
	<link href="/css/animate.min.css" rel="stylesheet">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	
	<script type="text/javascript">
		
	$(function(){
		
		$("button.btn.btn-primary").on("click",function(){
			//alert("버튼ㅋ클릭됨");
			history.go(-1);
		
		});
	});
	
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body > div.container{
            padding-top : 50px;
            font-family: 'Do Hyeon', sans-serif;
        }
        
      .col-sm-offset-1.col-sm-3.control-label{
      		padding-top:0px;
      }
      
    </style>	
    
</head>



<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<h1 class="bg-primary text-center">구매 확인 페이지</h1>
	
		<form class="form-horizontal">
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">${purchase.purchaseProd.prodNo}
				<input type="hidden" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}">
			</div>	
		</div>
		
		
		<div class="form-group">
			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
			${purchase.receiverName}		
			</div>	
		</div>
		
		
		<div class="form-group">
			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
				${purchase.receiverPhone}
			</div>	
		</div>
		
			<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
				${purchase.divyAddr}	
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">결제 방법</label>
		    <div class="col-sm-4" >
		    	
			<c:if test="${purchase.paymentOption.trim()=='0'}">카드결제</c:if>
			<c:if test="${purchase.paymentOption.trim()=='1'}">휴대폰 결제</c:if>
			<c:if test="${purchase.paymentOption.trim()=='2'}">무통장 입금</c:if>
		
			</div>	
		</div>
		
		
	 	<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">요청 사항</label>
		    <div class="col-sm-4">
			${purchase.divyRequest}			
			</div>	
		</div>
		
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">배송요망일</label>
   			 <div class="col-sm-4">
 				${purchase.divyDate}		
			</div>  
	 </div>
	 
	 <div class="form-group">
		 <div class="col-sm-offset-4  col-sm-4 text-center">
		      	<button type="button" class="btn btn-primary">확인</button>
		  </div>
		 </div>
	 </form>
	
	</div>

</body>
</html>

