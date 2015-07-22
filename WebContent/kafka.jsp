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
  <li class="am-active"><a href="kafka.jsp">Kafka</a></li>
  <li><a href="producer.jsp">Producer</a></li>
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
		<div><strong>Kafka</strong></div>	
		<span>启动Kafka集群</span></br>
		<table class="am-table am-table-bordered am-table-striped am-table-hover">
	    	    <thead>
	        	    <tr>
	                     <th>Name</th>
	            	       <th>Port</th>
	                     <th>Operate</th>
	                 </tr>
	    	   </thead>
	    	   <tbody>
	    	     <tr>
	    	        <td>Kafka-1</td>
	    	        <td>9092</td>
	    	        <td>
	    	           	   <button id="kFStart-1" type="button" class="am-btn am-btn-secondary am-radius">Start</button>
	        	           <button id="kFStop-1" type="button" class="am-btn am-btn-danger am-radius">Stop</button>
	        	        </td>    
	    	     </tr>
	        	     <tr>
	  	        <td>Kafka-2</td>
	    	        <td>9093</td>
	    	        <td>
	    	           	   <button id="kFStart-2" type="button" class="am-btn am-btn-secondary am-radius">Start</button>
	        	           <button id="kFStop-2" type="button" class="am-btn am-btn-danger am-radius">Stop</button>
	        	        </td>
	        	     </tr>
	        	     <tr>
	  	        <td>Kafka-3</td>
	    	        <td>9094</td>
	    	        <td>
	    	           	   <button id="kFStart-3" type="button" class="am-btn am-btn-secondary am-radius">Start</button>
	        	           <button id="kFStop-3" type="button" class="am-btn am-btn-danger am-radius">Stop</button>
	        	        </td>	        	     	
	        	     </tr> 
	        	     <tr>
	  	        <td>Kafka-4</td>
	    	        <td>9095</td>
	    	        <td>
	    	           	   <button id="kFStart-4" type="button" class="am-btn am-btn-secondary am-radius">Start</button>
	        	           <button id="kFStop-4" type="button" class="am-btn am-btn-danger am-radius">Stop</button>
	        	        </td>	        	     	
	        	     </tr> 	        	     	
	    	   </tbody>
		</table>
	</div>
</body>
</html>