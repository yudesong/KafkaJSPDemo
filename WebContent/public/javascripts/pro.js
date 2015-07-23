$(function(){
	$("#sendProducer").click(function(){
	var topic = $("#topic").val();
	var brokerList;
	var messMethod = $("doc-radio-4").val();
	var message;
	if($("input:radil[name='doc-radio-0']:checked").val()!=null) brokerList="127.0.0.1:9092";
	if($("input:radil[name='doc-radio-1']:checked").val()!=null) brokerList+=",127.0.0.1:9093";		
	if($("input:radil[name='doc-radio-2']:checked").val()!=null) brokerList=",127.0.0.1:9094";
	if($("input:radil[name='doc-radio-5']:checked").val()!=null) {
		message = 1;
	}else{
		message = $("doc-ta-1").val();
	}

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
				$("#pD-info1").html("发动成功");
			}
		});
	});

});