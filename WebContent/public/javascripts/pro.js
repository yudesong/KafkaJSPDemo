$(function(){
	$("#sendProducer").click(function(){
	$("#loading").click();
	var topic = $("#topic").val();
	var brokerList="";
	var messMethod=$('input[name="doc-radio-4"]:checked').val();
	var message;
	if($("input:radio[name='doc-radio-0']:checked").val()!=null) brokerList+="localhost:9092";
	if($("input:radio[name='doc-radio-1']:checked").val()!=null) brokerList+=",localhost:9093";		
	if($("input:radio[name='doc-radio-2']:checked").val()!=null) brokerList+=",localhost:9094";
	if($("input:radio[name='doc-radio-5']:checked").val()!=null) {
		message = 1;
	}else{
		message = $("doc-ta-1").val();
	}
	
//	console.log(topic+brokerList+messMethod+message);
	$.post("Producer",
		{"brokerList":brokerList,
		 "topic":topic,
		 "messMethod":messMethod,
		 "message":message
		},
		function(data,status){
			console.log(data);
			if(data!=""){
				$("#my-modal-loading").modal('close');
				$("#doc-ta-1").html(data);
				$("#pD-info1").addClass("am-alert am-alert-info");
				$("#pD-info1").html("发送成功");
			}
		});
	});
});