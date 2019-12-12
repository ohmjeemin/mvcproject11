<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
	<title>���� Ȯ�� ȭ��</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
	
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	
	<script type="text/javascript">
	
	$(function(){
		$("button.btn.btn-primary").on("click" , function(){	
			history.go(-1);
			//purchaseList�� �̵��ϱ�!
			
		});
		
	});
	
	</script>
	
	
	<style>

      body > div.container{
       	border: 3px solid #D6CDB7;
           margin-top: 10px;
           ont-family: 'Do Hyeon', sans-serif;
       }
       
      .col-sm-offset-1.col-sm-3.control-label{
      		padding-top:0px;
      }
      
    </style>	
    
    
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<h1 class="bg-primary text-center">���� Ȯ�� ������</h1>
	
		<form class="form-horizontal">
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">${purchase.purchaseProd.prodNo}
				<input type="hidden" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}">
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�𵨸�</label>
		    <div class="col-sm-4">
				${purchase.purchaseProd.prodName}
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">�󼼼���</label>
		    <div class="col-sm-4">
			${purchase.purchaseProd.prodDetail}		   
		 </div>
		</div>
	
		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
			${purchase.purchaseProd.price}
			</div>	
		</div>
	
	
		<div class="form-group">
			<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
		    <div class="col-sm-4">
		    <input type="hidden" name="buyerId" value="${user.userId}" />
			<input type="hidden" name="receiverName" value="${user.userName}" />
			${user.userId}			
			</div>	
		</div>
		
		<div class="form-group">
			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������ �̸�</label>
		    <div class="col-sm-4">
			${purchase.receiverName}		
		</div>	
		</div>
		
			<div class="form-group">
			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
				${purchase.receiverPhone}
			</div>	
		</div>
		
			<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">������ �ּ�</label>
		    <div class="col-sm-4">
				${purchase.divyAddr}	
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4" >
		    	
			<c:if test="${purchase.paymentOption.trim()=='0'}">ī�����</c:if>
			<c:if test="${purchase.paymentOption.trim()=='1'}">�޴��� ����</c:if>
			<c:if test="${purchase.paymentOption.trim()=='2'}">������ �Ա�</c:if>
		
			</div>	
		</div>
		
		
	 	<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��û ����</label>
		    <div class="col-sm-4">
			${purchase.divyRequest}			
			</div>	
		</div>
		
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ۿ����</label>
   			 <div class="col-sm-4">
 				${purchase.divyDate}		
			</div>  
	 </div>
	 
	 <div class="form-group">
		 <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">Ȯ &nbsp;��</button>
		  </div>
		 </div>
	 </form>
	
	</div>

</body>
</html>