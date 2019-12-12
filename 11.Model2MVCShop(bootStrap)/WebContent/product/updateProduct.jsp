<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<title>��ǰ���� ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<style>
      body > div.container{
       	border: 3px solid #D6CDB7;
           margin-top: 10px;
       }
   </style>	


<script type="text/javascript">

function fncUpdateProd(){
	
	//alert("������");
	
	var prod_name = $("input[name='prodName']").val();
	var prod_detail = $("textarea[name='prodDetail']").val();
	var manu_date = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	if(prod_name == null || prod_name.length <1){
		alert("��ǰ���� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(prod_detail == null || prod_detail.length <1){
		alert("��ǰ ��������  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(manu_date == null || manu_date.length <1){
		alert("�������ڴ�  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length <1){
		alert("������  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	

	$("form").attr("method","POST").attr("action" , "/product/updateProduct").attr("enctype","multipart/form-data").submit();	
	
}
	
	//class�̸�����  DOM object ����!
	$(function(){
		$("button.btn.btn-primary").on("click" , function(){	
			fncUpdateProd();
		});
	});
	
	
		//tag+attr�� DOM object ����!
	$(function(){
		$("a[href='#']").on("click", function(){
			history.go(-1);
		});	
		
		
	$(function () {
	   
	   $('#datepicker').datepicker({
		   format: 'yyyy-mm-dd',
		   changeYear: true
		   
		});

	 });
	
	
	});
	
	
	</script>

</head>

<body>
	<!-- ����  start -->
<jsp:include page="/layout/toolbar.jsp" />
	<!-- ����  end -->

	<div class="container">
	
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
	
		<form class="form-horizontal" >
		<input type="hidden" name="prodNo" value="${product.prodNo}" />
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�𵨸�</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">�󼼼���</label>
		    <div class="col-sm-4">
		      <textarea  class="form-control" id="prodDetail" rows="5" style="resize: none;" name="prodDetail" >${product.prodDetail}</textarea>
		    </div>
		</div>
	
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="price" name="price" value="${product.price}">
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
   			 <div class="col-sm-4">
   				<div class='input-group date' id="datepicker" data-provide="datepicker">
 				 <input placeholder="Selected date" type="text" value="${product.manuDate}"  name="manuDate" class="form-control datepicker">                    
 				 <div class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                </div>			
			</div>	
		</div>  
	 </div>
	 
	 
	 <div class="form-group">
	 	<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��ǰ����</label>
	 	<div class="col-sm-4" >
	 	
	 	<input type="file" name= "files" class="form-control-file"  multiple />
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