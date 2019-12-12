<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
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
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body > div.container{
            padding-top : 50px;
            font-family: 'Do Hyeon', sans-serif;
        }
        
  
		
		.thumbnail{        
		    width: 300px; 
		    // width : 100%;
		    height: 400px;
		    text-align :center;
		
		}

		.img-thumbnail.mx-auto.d-block{
		    width: 290px;
		    height: 250px;
		    display: block;
		    text-align :center;
		    	   
		}
		
		#thumbImage {
			width: 290px;
			height: 250px;
			margin: 0px auto;
			text-align : center;
		}
		
		.caption {
			text-align: center;
		}
		    </style>
    
	
	<script type="text/javascript">
	
	var role = '${sessionScope.user.role}'
	var currentPage = 2;
	var maxPage = ${resultPage.maxPage};
	
	if(role=='admin'){
		menu = 'manage'
	}else{
		menu = 'search'
	}
	
	
	
	//page, 검색 처리
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	
	   	//document.detailForm.submit();	
		$("form").attr("method","POST").attr("action", "/product/listProduct?menu=search").submit();
	}
	

    
    
	
	$(function(){
		
		$("button.btn.btn-default").on("click", function(){
		 fncGetList(1);		
		});
		
		
		$("select#order").on("change", function(){
		 fncGetList(1);		
		});
		
		$("a.btn.btn-default").on("click", function(){
			
			var prodNo = $(this).children('#pn').val();
			var status = $(this).children('#status').val();
			
			console.log ( prodNo );
			console.log( status );
			
			if(status=='soldout'){
				
				alert("판매완료된 상품입니다");
			
			}else if(status=='ok'){
			
				if(menu=='search'){
					self.location="/product/getProduct?prodNo="+prodNo;	
				}
				else if(menu=='manage'){
					self.location="/product/updateProduct?prodNo="+prodNo;	
				}
			}
			

	});
		

		$("#auto").autocomplete({		

			source: function(request,response) {
					
				$.ajax({
					url : "/product/json/autoProduct",
					method : "POST",
					data : JSON.stringify({
							searchKeyword  :  $("input[name='searchKeyword']").val(),
							searchCondition : $("select[name='searchCondition']").val()
							}),
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
				
				    success: function(JSONData) { 
				    						
				        response(
				        		$.map(JSONData, function(item) { 				   			 
				        		return {   
				        			label:item,
				        			data:item
				       		 	 } 
				      		 })); 
				      },
	
				});
			 } 
	});
	

	 $(document).scroll(function() { // 스크롤 이벤트가 발생할때마다 호출 
		
			$(function(){
			
				$("a.btn.btn-default").on("click", function(){
					//var menu = $(this).children('#mn').val();
					var prodNo = $(this).children('#pn').val();
					var status = $(this).children('#status').val();
					
					
					if(status=='soldout'){
						
						alert("판매완료된 상품입니다");
					
					}else if(status=='ok'){
					
						if(menu=='search'){
							self.location="/product/getProduct?prodNo="+prodNo;	
						}
						else if(menu=='manage'){
							self.location="/product/updateProduct?prodNo="+prodNo;	
						}
					}
					
				});
			});
	 
		    if ( $(window).scrollTop() == $(document).height() - $(window).height() ) { //스크롤이 끝에 닿는 걸 인식 !
						
		     //	alert( "currentPage:" + currentPage);
		    
		    	
		    	var obj = new Object();
		    	obj.currentPage = currentPage;
		    	obj.searchCondition =  $("select[name='searchCondition']").val();
		    	obj.orderCondition =  $("select[name='orderCondition']").val();
		    	obj.searchKeyword  =  $("input[name='searchKeyword']").val();
		    	
		    	if(maxPage >= currentPage){
		    
		   			$.ajax({
		    		  url : "/product/json/listProduct",
					  method : "POST",
					  data : JSON.stringify({
						  search : obj
					  }),
					  dataType : "json",
					  headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
					  success : function(JSONObj){
					
						  var display='';
						  currentPage += 1;
						  
						  display += "<div class='row' name='row_no'>";
						  for(var i=0; i<JSONObj.list.length; i++){
							  display +="<div class='col-sm-6 col-md-4'>";
							  display +="<div class='thumbnail'><div id='thumbImage'>";
							  display +="<img class='img-thumbnail mx-auto d-block' src= '/images/uploadFiles/" + JSONObj.list[i].fileName.split(",")[0] +"'></div>";
							  display +="<div class='caption'><h3>"+  JSONObj.list[i].prodName +"</h3><p> &#8361;" + JSONObj.list[i].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "</p>";
							  display +="<p><a href='#' class='btn btn-default' role='button'>view &raquo;<input type='hidden' id='pn' value='"+ JSONObj.list[i].prodNo +"'>";
							  display +="<input type='hidden' id='status'  value='ok'></a></p>";
							  display +="</div></div></div>";
						  }
						 display += "</div>"
						 
					  	$("div.scrollEve").append(display);
					  
					
					  }
		    	  
		    	  
		      })
		    
		  
		    }}
		    	
		    });
		
		})
	
	
	

	
	</script>
	
	
	
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>
	
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		  <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		<h4>차차차소영에 있는 '<b>${resultPage.totalCount}</b>'개의 상품을 확인해 보세요!</h4>
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			  
			   	<div class="form-group">
				    <select class="form-control" name="orderCondition" id="order">
				   		<option value="0" ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>정렬</option>
						<option value="1" ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>낮은순</option>
						<option value="2" ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>높은순</option>
					</select>
				  </div>
			   	
	 			
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <div class="ui-widget">
				    <input type="text" class="form-control" id="auto" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  </div>
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		    <br><br>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->






		<div class="row" name="row_no">
		<c:set var="i" value="0" />
		 <c:forEach var="product" items="${list}">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		    
		    	<div id="thumbImage">
		 		<img class="img-thumbnail mx-auto d-block" src= "/images/uploadFiles/${product.fileName}" >
		 		</div>      
		 		
		 		<div class="caption">
		        <h3>${product.prodName} 
		        
		        
		        </h3>
		        <p> <fmt:formatNumber  value="${product.price}" type="currency" currencySymbol="￦"/> </p>
		        <p>
		        	<a href="#" class="btn btn-default" role="button">view &raquo;
		        	 <input type="hidden" id="pn" value="${product.prodNo}">
		        	 
						<c:if test = "${product.proTranCode.trim().equals('0')}">
				   	 		<input type="hidden" id ="status" value="ok"/>
						</c:if>
							
						<c:if test = "${product.proTranCode.trim().equals('1')}">
							<input type="hidden" id ="status" value="soldout"/>
							</c:if>
						<c:if test = "${product.proTranCode.trim().equals('2')}">
							<input type="hidden" id ="status" value="soldout"/>
							</c:if>
						<c:if test = "${product.proTranCode.trim().equals('3')}">
							<input type="hidden" id ="status" value="soldout"/>
							</c:if>
		        	</a></p>
		      </div>
		    </div>
		  </div>
		   </c:forEach>
		</div>

	 	
 	<div class ="scrollEve"></div>




	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

	
	
	
</body>



</html>