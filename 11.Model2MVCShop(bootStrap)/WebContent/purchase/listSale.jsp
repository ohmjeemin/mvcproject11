<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
	
	<link href="/css/animate.min.css" rel="stylesheet">
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
		
		
		//�ŷ���ȣ
		$(".getTranInfo td:nth-child(2)").on("click",function(){
			var tranNo = $(this).children('#tranNo').val();
			console.log(tranNo);
			self.location="/purchase/getPurchase?tranNo="+tranNo;	
		});
		
		//��ǰ��
		$(".getTranInfo td:nth-child(3)").on("click",function(){
			var prodNo = $(this).children('#prodNo').val();
			console.log(prodNo);
			self.location="/product/getProduct?prodNo="+prodNo;	
		});
		
		//������ID
		$(".getTranInfo td:nth-child(4)").on("click",function(){

			var userId = $(this).children('#userId').val();
			console.log(userId);
			self.location="/user/getUser?userId="+userId;	
		});
		
		$('input[name="delOkBtn"]').on("click", function(){
			alert("delOkBtn Ŭ����");
			var tranNo = $('input[name="delOkTran"]').val();		
			console.log(tranNo);
			
			self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3";
		});
	});
	

	
	
	
	
	
$(function(){
	
	$("td.ct_btn01:contains('�˻�')").on("click", function(){
		 fncGetList(1);		
		});
		
	$('#delBtn').click(function(){
		
		alert("Ŭ����");
		var prodNo = $('input[name="prodNo"]').val();
		console.log(prodNo);
		
		self.location="/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2";	
		
	});	
	
	$(".ct_list_pop td:nth-child(3)").click(function(){
		
		var tranNo = $(this).children('#tranNo').val();
		console.log(tranNo);
		self.location="/purchase/getPurchase?tranNo="+tranNo;	
	});
	
	
	$(".ct_list_pop td:nth-child(5)").click(function(){
		
		var prodNo = $(this).children('#prodNo').val();
		console.log(prodNo);
		self.location="/product/getProduct?prodNo="+prodNo;	
	});
	
	
});	

</script>
</head>

 <body>
 	<jsp:include page="/layout/toolbar.jsp" />
 	<div class="container">
 
		<div class="page-header text-info">
	       <h3>�Ǹ� ��Ȳ</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
			
		<br>	
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">no</th>
            <th align="left" >�ŷ���ȣ</th>
            <th align="left">��ǰ��</th>
            <th align="left">������ID</th>
            <th align="left">��ۻ���</th>
          
          </tr>
        </thead>
       
		<tbody class="getTranInfo">
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr>
			
			<td  align="left" id="no" >${i}</td>
			  
			  
			  <td  align="left" id="tranNo" >${purchase.tranNo}
			  	<input type="hidden" id="tranNo" value="${purchase.tranNo}"/>
			  </td>
			  
			  <td  align="left" id="" title="Click : ��ǰ���� Ȯ��">${purchase.purchaseProd.prodName}
			  <input type="hidden" id="prodNo" value="${purchase.purchaseProd.prodNo}"/>
			  </td>
			  
			  <td  align="left">${purchase.buyer.userId}
			  <input type="hidden" id="userId" value="${purchase.buyer.userId}"/>
			  </td>
			  
			 	<td  align="left"> 
			 		
								<c:if test = "${purchase.tranCode.trim()=='0'}"> 
									�Ǹ���
								</c:if>
								<c:if test = "${purchase.tranCode.trim()=='1'}"> 
									���ſϷ� 
									<!-- <a href="/purchase/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=2">����ϱ�</a> -->
									<input type="button" id="delBtn" value="���"/>
									<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}"/>								
								</c:if>
								<c:if test = "${purchase.tranCode.trim()=='2'}"> 
									�����
								</c:if>
								<c:if test = "${purchase.tranCode.trim()=='3'}"> 
									��ۿϷ�
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
