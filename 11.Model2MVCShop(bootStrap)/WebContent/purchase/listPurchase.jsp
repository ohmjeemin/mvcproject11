<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        
  </style>
  
	<script type="text/javascript">

	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	
		//document.detailForm.submit();
		$("form").attr("method","POST").attr("action", "/purchase/listPurchase").submit();
	}
	
	
	$(function(){
	
		$(".getTranInfo td:nth-child(1)").on("click",function(){
			//alert("1번째 자식");
			var tranNo = $(this).children('#tranNo').val();
			console.log(tranNo);
			self.location="/purchase/getPurchase?tranNo="+tranNo;	
		});
		/* 
		$(".getTranInfo td:nth-child(2)").on("click",function(){
			//alert("2번째 자식");
			var prodNo = $(this).children('#prodNo').val();
			console.log(prodNo);
			self.location="/product/getProduct?prodNo="+prodNo;	
		}); */
		
		/* $(".getTranInfo td:nth-child(3)").on("click",function(){
			alert("3번째 자식");

			var userId = $(this).children('#userId').val();
			console.log(userId);
			self.location="/user/getUser?userId="+userId;	
		}); */
		
		$('input[name="delOkBtn"]').on("click", function(){
			alert("delOkBtn 클릭됨");
			var tranNo = $('input[name="delOkTran"]').val();		
			console.log(tranNo);
			
			self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3";
		});
	});
	
</script>
</head>

 <body>
 	<jsp:include page="/layout/toolbar.jsp" />
 	<div class="container">
 
		<div class="page-header text-info">
	       <h3>나의 구매현황</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			
		<br>	
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">거래번호</th>
            <th align="left" >상품명</th>
  <!--           <th align="left">구매자ID</th> -->
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
          </tr>
        </thead>
       
		<tbody class="getTranInfo">
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr>
			  <td  align="left" id="tranNo" >${purchase.tranNo}
			  	<input type="hidden" id="tranNo" value="${purchase.tranNo}"/>
			  </td>
			  
			  <td align="left" id="" >${purchase.purchaseProd.prodName}
			  <input type="hidden" id="prodNo" value="${purchase.purchaseProd.prodNo}"/>
			  </td>
			  <%-- 
			  <td  align="left">${purchase.buyer.userId}
			  <input type="hidden" id="userId" value="${purchase.buyer.userId}"/>
			  </td> --%>
			  
			 	<td  align="left"> 
			 		<c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim()=='1'}"> 
					현재 구매완료 상태입니다
					</c:if>
					<c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim()=='2'}"> 
					현재 배송중 입니다
					</c:if>
					<c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim()=='3'}"> 
					현재 배송완료 상태입니다
					</c:if>	
			 	</td>
			 	
			 <td  align="center">
			<c:if test = "${!empty purchase.tranCode.trim() && purchase.tranCode.trim()=='2'}"> 
			<!--<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">상품 도착 </a>  -->
			<input type="button" name="delOkBtn" value="상품도착"/>
			<input type="hidden" name="delOkTran" value="${purchase.tranNo}"/>
			</c:if>
			</td>
			
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 
 </div>

</body>
</html>