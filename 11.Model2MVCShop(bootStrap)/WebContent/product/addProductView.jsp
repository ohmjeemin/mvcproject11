<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>
	
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>상품 등록</title>

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
	
	
	
	<style>
	
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            ont-family: 'Do Hyeon', sans-serif;
            
        }
    </style>	
	
	
	<script type="text/javascript">

	
	function fncAddProduct(){
		

		
		var prod_name = $("input[name='prodName']").val();
		var prod_detail = $("textarea[name='prodDetail']").val();
		var manu_date = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(prod_name == null || prod_name.length <1){
			alert("상품명은 반드시 입력하셔야 합니다.");
			return;
		}
		if(prod_detail == null || prod_detail.length <1){
			alert("상품 상세정보는  반드시 입력하셔야 합니다.");
			return;
		}
		if(manu_date == null || manu_date.length <1){
			alert("제조일자는  반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length <1){
			alert("가격은  반드시 입력하셔야 합니다.");
			return;
		}
	
		//post방식으로 /product/addProduct로 보내겠읍니다!
		$("form").attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype","multipart/form-data").submit();	
	
	}
	 
 	//class이름으로  DOM object 연결!
	$(function(){
		$("button.btn.btn-primary").on("click" , function(){	
			fncAddProduct();
		});
	});
 
 
 	//tag+attr로 DOM object 연결!
	$(function(){
		$("a[href='#' ]").on("click", function(){
			$("form")[0].reset();
		});	
		
		
   $(function () {
	   
	   $('#datepicker').datepicker({
		   format: 'yyyy-mm-dd',
		   changeYear: true
		   
		});
	   
	  // $('#datepicker').datepicker();
	 
	   
	
     });
   

	});


</script>

</head>

<body>
	<!-- 툴바  start -->
<jsp:include page="/layout/toolbar.jsp" />
	<!-- 툴바  end -->

	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 등 록</h1>
	
		<form class="form-horizontal" enctype="mulpart/form-data" >
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">모델명</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="prodName" placeholder="모델명 입력해주세요">
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상세설명</label>
		    <div class="col-sm-4">
		      <textarea  class="form-control" id="prodDetail" rows="5" style="resize: none;" name="prodDetail" placeholder="상세설명"></textarea>
		    </div>
		</div>
	
		<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
				<input type="text" class="form-control" id="prodName" name="price" placeholder="모델명 입력해주세요">
			</div>	
		</div>
	
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">생산일자</label>
   			 <div class="col-sm-4">
   				<div class='input-group date' id="datepicker" data-provide="datepicker">
 				 <input placeholder="Selected date" type="text"  name="manuDate" class="form-control datepicker">                    
 				 <div class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                </div>			
			</div>	
		</div>  
	 </div>
	 
	 
	 <div class="form-group">
	 	<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">상품사진</label>
	 	<div class="col-sm-4" >
	 	<input type="file" name= "files" class="form-control-file"  multiple />
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
