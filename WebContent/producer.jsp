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
<script type="text/javascript" src="public/javascripts/pro.js"></script>
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
  <li class="am-active"><a href="producer.jsp">Producer</a></li>
  <li class="am-dropdown" data-am-dropdown>
    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">Consumer
    <span class="am-icon-caret-down"></span>
    </a>
    <ul class="am-dropdown-content">
		<li><a href="consumer-high.jsp">High-level API</a></li>
		<li><a href="consumer-low.jsp">Low-level API</a></li>
    </ul>
  </li>
  <li><a href="log.jsp">Log 日志文件</a></li>
</ul>
	<div id="item">
		<div><strong>Producer</strong></div>
		<div>Topic:&nbsp;<input type="text" id="topic"/>(默认为３个分区,3个副本)</div>
   		<div>
   					broker-list:
        			<input type="radio" name="doc-radio-0" id="doc-radio-0" value="9092" >
        			Kafka-0&nbsp;&nbsp;
        			<input type="radio" name="doc-radio-1" id="doc-radio-1" value="9093" >
        			Kafka-1&nbsp;&nbsp;
         			<input type="radio" name="doc-radio-2" id="doc-radio-2" value="9094" >
        			Kafka-2&nbsp;&nbsp;
        			<input type="radio" name="doc-radio-3" id="doc-radio-3" value="9095" >
        			Kafka-3&nbsp;&nbsp;       			
    		</div>
   		<div>
   					Kafka&nbsp;Message分区方法:
        			<input type="radio" name="doc-radio-4" id="doc-radio-4" value="0" >
        			系统随机分区&nbsp;
        			<input type="radio" name="doc-radio-4" id="doc-radio-4" value="1" >
        			key-value均匀分区
    		</div>
    		<div>
    			<span>Message:</span>&nbsp;
    			<input type="radio" name="doc-radio-5" value="option1" >
        			1-99随机数字 </br>
    			<textarea class="" rows="5" id="doc-ta-1"></textarea></br>
    			<button  id="sendProducer" type="button" class="am-btn am-btn-secondary am-radius">Send</button>
    			<span id="pD-info1" style="font-size:14px;"></span>
    		</div>		
	</div>
</body>
</html>