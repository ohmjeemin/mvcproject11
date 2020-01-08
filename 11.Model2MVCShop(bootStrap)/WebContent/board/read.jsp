<script>
	var ws = new WebSocket("ws://localhost:8080/replyEcho?bno=1234");
	
	//onopen : eventHandler (event가 발생했을때)
	ws.onopen = function(){
		console.log('Info: connection opened. ');
		setTimeout(function(){connect();},1000); //retry connection!!
		
	};
	//message가 왔을때
	ws.onmessage = function(event){
		console.log(event.data+ '\n');
	};
	
	ws.onclose = function(event){console.log('Info:connection closed.');};
	ws.onerror = function(error){console.log('Info:error.');};
	
	$('#btnSend').on('clcik',function(evt){
		evt.preventDefault();
		if(socket.readyState!==1) return;
			let msg = $('input#msg').val();
			
	})
	

		
	





</script>





