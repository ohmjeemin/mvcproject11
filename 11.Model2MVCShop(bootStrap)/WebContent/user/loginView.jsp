<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="EUC-KR">

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	
	<style>
	 	body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	</style>
	
	
	<script type="text/javascript">
	   
	//============= "�α���"  Event ���� =============
	$( function() {
		
		$("#userId").focus();
		
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click" , function() {
			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				$("#password").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
		});
	});	
	
	
	//============= ȸ��������ȭ���̵� =============
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			self.location = "/user/addUser"
		});
		
	});
	
	
	
		
	</script>		
	
</head>

<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					    <a id="kakao-login-btn"></a>
						<a href="http://developers.kakao.com/logout"></a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // ����� ���� JavaScript Ű�� ������ �ּ���.
						    Kakao.init('9bb72b7e153e8b70555f0eca7a9d2ce1');
						    // īī�� �α��� ��ư�� �����մϴ�.

						    Kakao.Auth.createLoginButton({
						      container: '#kakao-login-btn',
						      success: function(authObj) {
						        alert(JSON.stringify(authObj));
							
						        Kakao.API.request({
						        	 url: '/v2/user/me',
						         success: function(res) {
						        
						        	 console.log(JSON.stringify(res));
						        	 
						        	 $.ajax({
						        	
						        		url : "/user/json/checkDuplication/"+ res.id ,
						        	headers : {
						        		"Accept" : "application/json",
						        		"Content-Type" : "application/json"
						        		},
						        	success : function(idChk){
						        		
						        		if(idChk==true){
						        			console.log(JSON.stringify(idChk));
						        			console.log("ȸ��������");
						        			
						        			 $.ajax({
					                                url : "/user/json/addUser",
					                                method : "POST",
					                                headers : {
					                                  "Accept" : "application/json",
					                                  "Content-Type" : "application/json"
					                                },
					                                data : JSON.stringify({
					                                				userId : res.id,
					                              				  userName : res.properties.nickname,
					                                		   	  password : "kakao123",
					                             		   }),
					                                success : function(JSONData){
					                                	
					                                   alert("ȸ�������� ���������� �Ǿ����ϴ�.");
					                                   $("form").attr("method","POST").attr("action","/user/kakaoLogin/"+res.id).attr("target","_parent").submit();
					                                }
					                            })
					                        }
					                        if(idChk==false){ //DB�� ���̵� ������ ��� => �α���
					                            console.log("�α�����...");
					                            $("form").attr("method","POST").attr("action","/user/kakaoLogin/"+res.id).attr("target","_parent").submit();
					                        }
				                    }
				              })
				            },
				            fail: function(error) {
				              alert(JSON.stringify(error));
				            }
				          });
				                  
				        },
				        fail: function(err) {
				          alert(JSON.stringify(err));
				        }
				      });
				        
				
			


						</script>
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->


</body>

</html>