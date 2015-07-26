$(function(){
	$("#send").click(function(){
	var port = $("#port").val();
	var topic = $("#topic").val();
	var parition = $("#parition").val();
	var offset = $("#offset").val();
	$("#loading").click();
//	console.log(port+topic+parition+offset);

	$.post("ConsumerL",
		{"port":port,
		 "topic":topic,
		 "parition":parition,
		 "offset":offset
		},
		function(data,status){
	//		console.log(data);
			if(data!=""){
				$("#my-modal-loading").modal('close');
				$("#doc-ta-1").html(data);
			}
		});

	});
});