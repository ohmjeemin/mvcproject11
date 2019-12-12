<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar navbar-inverse navnbar-fixed-top">
		<div class="container"> 
		<a class="navbar-brand" href="/index.jsp" style="padding: 0px 0px">
		<img alt="" src="/images/uploadFiles/logo.png" width="200" height="50">
		</a> 
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
	

  <!--  회원관리 DrowDown -->
	
	<div class="collapse navbar-collapse" id="target"
		data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	 <ul class="nav navbar-nav">
	 
	    <li class="dropdown">
				 <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                  <span >회원관리</span>
	                  <span class="caret"></span>
	             </a>
	             <ul class="dropdown-menu">
	             	<li><a href="#">개인정보조회</a></li>
	             	
	             	<c:if test="${sessionScope.user.role=='admin'}">
	             		<li><a href="#">회원정보조회</a></li>
	     			</c:if>
	     			
	     			<li class="divider"></li>        
	                <li><a href="#">etc...</a></li>
	             </ul>
		</li>	
		
		
	 <!-- 판매상품관리 DrowDown  -->
		 
		<c:if test="${sessionScope.user.role=='admin'}">
			 <li class="dropdown">
		            <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                <span >상품관리</span>
		                <span class="caret"></span>
		            </a>
		            <ul class="dropdown-menu">
                         <li><a href="#">판매상품등록</a></li>
                         <li><a href="#">판매상품관리</a></li>
                         <li><a href="#">판매내역</a></li>
                         <li class="divider"></li>
                         <li><a href="#">etc..</a></li>
                     </ul>
                </li>
		</c:if>
		
	 <!-- 구매관리 DrowDown -->
	 	<c:if test="${sessionScope.user.role=='user'}">
	 
           <li class="dropdown">
                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                      <span >상품구매</span>
                      <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu">
                      <li><a href="#">상 품 검 색</a></li>
                      
                      <c:if test="${sessionScope.user.role == 'user'}">
                        <li><a href="#">구매이력조회</a></li>
                      </c:if>
                      
                      <li><a href="#">최근본상품</a></li>
                      <li class="divider"></li>
                      <li><a href="#">etc..</a></li>
                  </ul>
              </li>
             </c:if>
	                 	
		 <li><a href="#">etc...</a></li>
		             </ul>	
			
			 <ul class="nav navbar-nav navbar-right">
		                <li><a href="#">로그아웃</a></li>
			</ul>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
	 $(function(){
		
		 $("a:contains('로그아웃')").on("click", function(){
		 	$(self.location).attr("href","/user/logout");
		 });
		

		 $("a:contains('회원정보조회')").on("click", function(){
			self.location ="/user/listUser" 
		 });
			
	 
		$("a:contains('개인정보조회')" ).on("click" , function() {
 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
	
		$("a[href='#' ]:contains('판매상품등록')").on("click", function(){
			//alert(  $( ".Depth03:contains('판매상품등록')" ) );
				self.location = "/product/addProduct";
		}); 
		
		$("a[href='#' ]:contains('상 품 검 색')").on("click" , function() {
			self.location = "/product/listProduct?menu=search"
		});
		
		$("a[href='#' ]:contains('판매상품관리')").on("click", function(){
				self.location = "/product/listProduct?menu=manage";
		});

		$("a[href='#' ]:contains('판매내역')").on("click", function(){
				self.location = "/purchase/listSale";
		});
		
		
		$("a[href='#' ]:contains('구매이력조회')").on("click", function(){
				self.location = "/purchase/listPurchase";
		});
	 });
	
	
	</script>

	



    
