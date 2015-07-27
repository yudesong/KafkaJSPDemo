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
	
	  var data = [
	              {
	                title: '苹果公司',
	                type: 'folder',
	                products: [
	                  {
	                    title: 'iPhone',
	                    type: 'item'
	                  },
	                  {
	                    title: 'iMac',
	                    type: 'item'
	                  },
	                  {
	                    title: 'MacBook Pro',
	                    type: 'item'
	                  }
	                ]
	              },
	              {
	                title: '微软公司',
	                type: 'item'
	              },
	              {
	                title: 'GitHub',
	                type: 'item',
	                attr: {
	                  icon: 'am-icon-github'
	                }
	              }
	            ];
	
	
	
	
	
	
});