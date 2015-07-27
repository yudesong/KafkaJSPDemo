$(function(){
	$("#show_topic").hide();
	$("#CTopic").click(function(){
	var topic = $("#topic").val();
	$("#loading").click();
//	console.log(topic);
	$.post("LogServlet",
		{"topic":topic},
		function(data,status){
//			console.log(topic);
			if(data!=""){
				$("#my-modal-loading").modal('close');
				$("#show_topic").html(data);
				$("#show_topic").show();
			}
		});
	});
	
//	$("#loading").click();
	
//	
	
	var data1;
	$.post("fileServlet",{},function(data1,status){
	//	 var data =JSON.parse(data1);
		var data = eval(data1);
	//	 var data = [{title:'kafka-logs',type:'folder',products:[{title:'test-0',type:'item'},{title:'test-3',type:'item'}]},{title:'kafka-logs-1',type:'folder',products:[{title:'test-1',type:'item'}]},{title:'kafka-logs-2',type:'folder',products:[{title:'test-2',type:'item'}]}];
	//	 console.log(typeof data);
		 $('#firstTree').tree({
			    dataSource: function(options, callback) {
			      // 模拟异步加载
			      setTimeout(function() {
			        callback({data: options.products || data});
			      }, 400);
			    },
			    multiSelect: false,
			    cacheItems: true,
			    folderSelect: false
			  });
	});
	

	/*
	
	*/
});