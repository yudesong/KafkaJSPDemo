$(function(){
	$("#CHMessage").click(function(){
	$("#loading").click();
	var topic = $("#topic").val();
	var zkConn = $("#zkConn").val();
	var groupId = $("#groupId").val();
	
	/*定时关闭Modal
	setTimeout(function () { 
		$("#my-modal-loading").modal('close');
    }, 8000);
	*/
//	console.log(topic+"\n"+zKconn+"\n"+groupId);
//	$("#message").html(topic+"\n"+zkConn+"\n"+groupId);
	
	$.post("ConsumerH",
		{"topic": topic,
		 "zkConn":zkConn,
		 "groupId":groupId
		},
		function(data,status){
			console.log(data);
			if(data!=""){
				$("#my-modal-loading").modal('close');
				$("#message").html(data);
			}
			
		});
	
	});
});