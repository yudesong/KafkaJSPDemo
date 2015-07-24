$(function(){
	$("#CHMessage").click(function(){
	var topic = $("#topic").val();
	var zkConn = $("#zkConn").val();
	var groupId = $("#groupId").val();
//	console.log(topic+"\n"+zKconn+"\n"+groupId);
//	$("#message").html(topic+"\n"+zkConn+"\n"+groupId);
	$.post("ConsumerH",
		{"topic": topic,
		 "zkConn":zkConn,
		 "groupId":groupId
		},
		function(data,status){
			console.log(data);
			$("#message").html(data);
		});
	
	});
});