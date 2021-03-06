<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kafka</title>
<link rel='stylesheet' href="public/stylesheets/style.css"/>    
<link rel='stylesheet' href="public/stylesheets/amazeui.min.css"/>
<script type="text/javascript" src="public/javascripts/jquery.min.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.ie8polyfill.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.widgets.helper.js"></script>
<script type="text/javascript" src="public/javascripts/consh.js"></script>
<style type="text/css">
#item{
    width:900px;
    padding:20px;
    font-size: 20px;
}
</style>
</head>
<body>
	<h2>Kafka 性能测试</h2>
<ul class="am-nav am-nav-tabs">
  <li><a href="index.jsp">Zookeeper</a></li>
  <li><a href="kafka.jsp">Kafka</a></li>
  <li><a href="producer.jsp">Producer</a></li>
  <li class="am-dropdown" data-am-dropdown>
    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">Consumer
    <span class="am-icon-caret-down"></span>
    </a>
    <ul class="am-dropdown-content">
		<li class="am-active"><a href="consumer-high.jsp">High-level API</a></li>
		<li><a href="consumer-low.jsp">Low-level API</a></li>
    </ul>
  </li>
  <li><a href="log.jsp">Log 日志文件</a></li>
</ul>
	<div id="item">
		<div><strong>Consumer</strong></div>
		<div><ul><li>High-level API</li></ul></div>
   		<div style="margin-left:40px;">
   		Zookeeper.connection:<input type="text" id="zkConn" style="width:120px;" value="localhost:2181">
   		Topic:<input type="text" id="topic" style="width:120px;"/>
   		Group Id:<input type="text" id="groupId" style="width:90px;"/>
   		<button type="button" id="CHMessage" class="am-btn am-btn-secondary am-radius">Start</button>
    		</div>
    		<div style="margin-left:40px;">
    			<span>Recieved Message:</span></br>
    			<textarea class="" rows="10" cols="60" id="doc-ta-1"></textarea></br>
    		</div>
	</div>
	
	<button id="loading" type="button" class="am-btn am-btn-success" style="display:none" data-am-modal="{target: '#my-modal-loading'}"></button>
	<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
  		<div class="am-modal-dialog">
    		<div class="am-modal-hd">正在载入...</div>
    			<div class="am-modal-bd">
      				<span class="am-icon-spinner am-icon-spin"></span>
    			</div>
  			</div>
	</div>
</body>
</html>