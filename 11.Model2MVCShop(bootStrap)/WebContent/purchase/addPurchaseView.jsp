<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>

	<meta charset="EUC-KR">
	<title>상품 구매</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
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
	
	//post방식으로 /purchase/addPurchase로 보내겠읍니다!
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();	
	
	}
	
	
	$(function(){
	

	$("button.btn.btn-primary").on("click" , function(){	
		fncAddPurchase();
	});
		
	$("td.ct_btn01:contains('취소')").on("click", function(){
		alert($("td.ct_btn01:contains('취소')").html);
		$("form")[0].reset();
	});
		
	$('#datepicker').datepicker({		
				dateFormat: 'yy-mm-dd'
		       ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "+1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
		
	});		
			

});	
		

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<h1 class="bg-primary text-center">구매 페이지</h1>
	
		<form class="form-horizontal">
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">${product.prodNo}
				<input type="hidden" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}">
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">모델명</label>
		    <div class="col-sm-4">
				${product.prodName}
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상세설명</label>
		    <div class="col-sm-4">
			${product.prodDetail}		   
		 </div>
		</div>
	
		<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
			${product.price}
			</div>	
		</div>
	
	
		<div class="form-group">
			<label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		    <input type="hidden" name="buyerId" value="${user.userId}" />
			<input type="hidden" name="receiverName" value="${user.userName}" />
			${user.userId}			
			</div>	
		</div>
		
		<div class="form-group">
			<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
			${user.userName}			
		</div>	
		</div>
		
			<div class="form-group">
			<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="연락처를 입력해주세요">
			</div>	
		</div>
		
			<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="주소를 입력해주세요">
			</div>	
		</div>
		
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">결제 방법</label>
		    <div class="col-sm-4" >
		    <select class="form-control" name="paymentOption">
				<option value="0" ${paymentOption ==0 ? 'selected' : '' }>카드결제</option>
				<option value="1" ${paymentOption ==1 ? 'selected' : '' }>휴대폰결제</option>
				<option value="2" ${paymentOption ==2 ? 'selected' : '' }>무통장입금</option>
			</select>
			</div>	
		</div>
		
		
	 	<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">요청 사항</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="요청사항 입력해주세요">
			</div>	
		</div>
		
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">배송요망일</label>
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
		      <button type="button" class="btn btn-primary">등 &nbsp;록</button>
			  <a class="btn btn-primary" href="#" role="button">취&nbsp;소</a>
		  </div>
		 </div>
	 </form>
	
	</div>

</body>

</html>

