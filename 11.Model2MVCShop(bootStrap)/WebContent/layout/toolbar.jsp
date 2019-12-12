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
	

  <!--  ȸ������ DrowDown -->
	
	<div class="collapse navbar-collapse" id="target"
		data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	 <ul class="nav navbar-nav">
	 
	    <li class="dropdown">
				 <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                  <span >ȸ������</span>
	                  <span class="caret"></span>
	             </a>
	             <ul class="dropdown-menu">
	             	<li><a href="#">����������ȸ</a></li>
	             	
	             	<c:if test="${sessionScope.user.role=='admin'}">
	             		<li><a href="#">ȸ��������ȸ</a></li>
	     			</c:if>
	     			
	     			<li class="divider"></li>        
	                <li><a href="#">etc...</a></li>
	             </ul>
		</li>	
		
		
	 <!-- �ǸŻ�ǰ���� DrowDown  -->
		 
		<c:if test="${sessionScope.user.role=='admin'}">
			 <li class="dropdown">
		            <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                <span >��ǰ����</span>
		                <span class="caret"></span>
		            </a>
		            <ul class="dropdown-menu">
                         <li><a href="#">�ǸŻ�ǰ���</a></li>
                         <li><a href="#">�ǸŻ�ǰ����</a></li>
                         <li><a href="#">�Ǹų���</a></li>
                         <li class="divider"></li>
                         <li><a href="#">etc..</a></li>
                     </ul>
                </li>
		</c:if>
		
	 <!-- ���Ű��� DrowDown -->
	 	<c:if test="${sessionScope.user.role=='user'}">
	 
           <li class="dropdown">
                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                      <span >��ǰ����</span>
                      <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu">
                      <li><a href="#">�� ǰ �� ��</a></li>
                      
                      <c:if test="${sessionScope.user.role == 'user'}">
                        <li><a href="#">�����̷���ȸ</a></li>
                      </c:if>
                      
                      <li><a href="#">�ֱٺ���ǰ</a></li>
                      <li class="divider"></li>
                      <li><a href="#">etc..</a></li>
                  </ul>
              </li>
             </c:if>
	                 	
		 <li><a href="#">etc...</a></li>
		             </ul>	
			
			 <ul class="nav navbar-nav navbar-right">
		                <li><a href="#">�α׾ƿ�</a></li>
			</ul>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
	 $(function(){
		
		 $("a:contains('�α׾ƿ�')").on("click", function(){
		 	$(self.location).attr("href","/user/logout");
		 });
		

		 $("a:contains('ȸ��������ȸ')").on("click", function(){
			self.location ="/user/listUser" 
		 });
			
	 
		$("a:contains('����������ȸ')" ).on("click" , function() {
 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
	
		$("a[href='#' ]:contains('�ǸŻ�ǰ���')").on("click", function(){
			//alert(  $( ".Depth03:contains('�ǸŻ�ǰ���')" ) );
				self.location = "/product/addProduct";
		}); 
		
		$("a[href='#' ]:contains('�� ǰ �� ��')").on("click" , function() {
			self.location = "/product/listProduct?menu=search"
		});
		
		$("a[href='#' ]:contains('�ǸŻ�ǰ����')").on("click", function(){
				self.location = "/product/listProduct?menu=manage";
		});

		$("a[href='#' ]:contains('�Ǹų���')").on("click", function(){
				self.location = "/purchase/listSale";
		});
		
		
		$("a[href='#' ]:contains('�����̷���ȸ')").on("click", function(){
				self.location = "/purchase/listPurchase";
		});
	 });
	
	
	</script>

	



    
