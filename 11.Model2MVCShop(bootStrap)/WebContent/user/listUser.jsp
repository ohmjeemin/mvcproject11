<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 반응형.... -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body > div.container{
	           padding-top : 50px;
	       }
	  </style>
	   
	
	
	
 <script type="text/javascript">
 
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/user/listUser").submit();
	}

	
	//==>"검색" ,  userId link  Event 연결 및 처리
	$(function() {

		//==> 검색 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
		$("td.ct_btn01:contains('검색')").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
			fncGetUserList(1);
		});

	});	
		
		
		
		
	$(function() {

		//==> userId LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( "td:nth-child(5) > i" ).on("click",function() {
					//Debug..
					//alert(  $( this ).text().trim() );

					//////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
					//self.location ="/user/getUser?userId="+$(this).text().trim();
					////////////////////////////////////////////////////////////////////////////////////////////
					var userId = $(this).text().trim();
					console.log(userId);
					$.ajax({
						url : "/user/json/getUser/" + userId,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData : \n"+JSONData);

							var displayValue = "<h3>" + "아이디 : "
									+ JSONData.userId + "<br/>" + "이  름 : "
									+ JSONData.userName + "<br/>" + "이메일 : "
									+ JSONData.email + "<br/>" + "ROLE : "
									+ JSONData.role + "<br/>" + "등록일 : "
									+ JSONData.regDate + "<br/>" + "</h3>";
							//Debug...									
							alert(displayValue);
							$("h3").remove();
							$("#" + userId + "").html(displayValue);
						}
					});
					////////////////////////////////////////////////////////////////////////////////////////////

				});
		});	
		
		
	//오토 컴플리트!	
		
		$(function() {
			
			$("#auto").autocomplete({		
				  source: function(request,response) {
							
							
							//alert("ㅎㅇ");
							
							$.ajax({
								url : "/user/json/getUserId/"+ $('#auto').val(),
								method : "GET",
								minLength : 2,
								dataType : "json",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
							
							    success: function(JSONData, status) { 
							    	//alert(status);					
									//alert("JSONData : \n"+JSONData);
							        response(
							        		$.each(JSONData, function(item) { 				   			 
							        		return {   
							        			label:item[0]
							       		 	 } 
							      		 })); 
							      },
							     minLength: 2
							});
						 } 
				});
				
		});
		
	
	//============= userId 에 회원정보보기  Event  처리(Click) =============	
	 $(function() {
	
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td:nth-child(2)" ).on("click" , function() {
			 self.location ="/user/getUser?userId="+$(this).text().trim();
		});
					
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( "td:nth-child(2)" ).css("color" , "red");
		
	});	
	
		
		
	$(function() {

		//==> userId LINK Event End User 에게 보일수 있도록 
		$(".ct_list_pop td:nth-child(3)").css("color", "red");
		$("h7").css("color", "red");

		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)").css("background-color",
				"LightSteelBlue");

	});
	
	
</script>

</head>

<body>


<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				 
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				 <div class="ui-widget">  
				    <input type="text" id="auto"  class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 ID</th>
            <th align="left">회원명</th>
            <th align="left">이메일</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${user.userId}</td>
			  <td align="left">${user.userName}</td>
			  <td align="left">${user.email}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
			  	<input type="hidden" value="${user.userId}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>


