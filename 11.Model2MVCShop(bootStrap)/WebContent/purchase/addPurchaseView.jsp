<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>

	<meta charset="EUC-KR">
	<title>��ǰ ����</title>

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
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
	
	
	
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
	
	
			
	<script type="text/javascript">
	
	
	
	function fncAddPurchase(){
	
	//post������� /purchase/addPurchase�� ���������ϴ�!
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();	
	
	}
	
	
	$(function(){
	

	$("button.btn.btn-primary").on("click" , function(){	
		fncAddPurchase();
	});
		
	$("td.ct_btn01:contains('���')").on("click", function(){
		alert($("td.ct_btn01:contains('���')").html);
		$("form")[0].reset();
	});
		
	$('#datepicker').datepicker({		
				dateFormat: 'yy-mm-dd'
		       ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
               ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
               ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
               ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
               ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
               ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
               ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
               ,minDate: "+1D" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���) 
		
	});		
			

});	
		

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<h1 class="bg-primary text-center">���� ������</h1>
	
		<form class="form-horizontal">
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">${product.prodNo}
				<input type="hidden" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}">
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�𵨸�</label>
		    <div class="col-sm-4">
				${product.prodName}
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">�󼼼���</label>
		    <div class="col-sm-4">
			${product.prodDetail}		   
		 </div>
		</div>
	
		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
			${product.price}
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
			${user.userName}			
		</div>	
		</div>
		
			<div class="form-group">
			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="����ó�� �Է����ּ���">
			</div>	
		</div>
		
			<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">������ �ּ�</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="�ּҸ� �Է����ּ���">
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4" >
		    <select class="form-control" name="paymentOption">
				<option value="0" ${paymentOption ==0 ? 'selected' : '' }>ī�����</option>
				<option value="1" ${paymentOption ==1 ? 'selected' : '' }>�޴�������</option>
				<option value="2" ${paymentOption ==2 ? 'selected' : '' }>�������Ա�</option>
			</select>
			</div>	
		</div>
		
		
	 	<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��û ����</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="��û���� �Է����ּ���">
			</div>	
		</div>
		
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��ۿ����</label>
   			 <div class="col-sm-4">
   				<div class='input-group date' id="datepicker" data-provide="datepicker">
 				 <input placeholder="Selected date" type="text"  name="divyDate" class="form-control datepicker">                    
 				 <div class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                </div>			
			</div>	
		</div>  
	 </div>
	 
	 <div class="form-group">
		 <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">�� &nbsp;��</button>
			  <a class="btn btn-primary" href="#" role="button">��&nbsp;��</a>
		  </div>
		 </div>
	 </form>
	
	</div>

</body>

</html>

