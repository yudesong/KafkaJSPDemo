$(function(){
	$("#CHMessage").click(function(){
	var zKconn = $("#zKconn").val();
	var topic = $("topic").val();
	var groupId = $("groupId").val();
//	console.log(topic+brokerList+messMethod+message);
	$.post("Producer",
		{"brokerList":brokerList,
		 "topic":topic,
		 "messMethod":messMethod,
		 "message":message
		},
		function(data,status){
			console.log(data);
			if(data=="success"){
				$("#pD-info1").addClass("am-alert am-alert-info");
				$("#pD-info1").html("发送成功");
			}
		});
	});
});