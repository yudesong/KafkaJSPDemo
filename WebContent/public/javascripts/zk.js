/**
 * 
 */
$(function(){
	
	$("#zkStart-1").click(function(){
		$.post("ManZK",
		{"id":"1","manager":"start"},
		function(data,status){
			alert(data);
			if(data==1){
				$("#zk-info1").addClass("am-alert am-alert-info");
				$("#zk-info1").html("启动中");
				$("#zkStart-1").attr("disabled",true);
				$("#zkStop-1").attr("disabled",false);
			}	
		});
	});
	
	
	
	
	
	$("#zkStop-1").click(function(){
			$.post("ManZK",
			{"id":"1","manager":"stop"},
			function(data,status){
				if(data==1){
					$("#zk-info1").addClass("am-alert am-alert-info");
					$("#zk-info1").html("以关闭");
					$("#zkStop-1").attr("disabled",true);
					$("#zkStart-1").attr("disabled",false);
				}	
			});
	});
	
	
	
});

