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
<script type="text/javascript" src="public/javascripts/zk.js"></script>
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
  <li class="am-active"><a href="index.jsp">Zookeeper</a></li>
  <li><a href="kafka.jsp">Kafka</a></li>
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
		<div><strong>Zookeeper</strong></div>	
		<span>启动Zookeeper集群</span></br>
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
	    	        <td>Zookeeper-1</td>
	    	        <td>2181</td>
	    	        <td>
	    	               <button id="zkStart-1" type="button" class="am-btn am-btn-secondary am-radius am-icon-play">Start</button>
	        	           <button id="zkStop-1" type="button" class="am-btn am-btn-danger am-radius am-icon-pause">Stop</button>
	        	           <span id="zk-info1" style="font-size:14px;"></span>
	        	           <!-- class="am-alert am-alert-success" -->
	        	        </td>    
	    	     </tr>
	        	     <tr>
	  	        <td>Zookeeper-2</td>
	    	        <td>2182</td>
	    	        <td>
	    	           <button id="zkStart-2" type="button" class="am-btn am-btn-secondary am-radius am-icon-play">Start</button>
	        	       <button id="zkStop-2" type="button" class="am-btn am-btn-danger am-radius am-icon-pause">Stop</button>
	        	        </td>
	        	     </tr>
	        	     <tr>
	  	        <td>Zookeeper-3</td>
	    	        <td>2183</td>
	    	        <td>
	    	           <button id="zkStart-3" type="button" class="am-btn am-btn-secondary am-radius am-icon-play">Start</button>
	        	       <button id="zkStop-2" type="button" class="am-btn am-btn-danger am-radius am-icon-pause">Stop</button>
	        	        </td>	        	     	
	        	     </tr> 	
	    	   </tbody>
		</table>
	</div>
<!-- 
	<%@include file="test.jsp" %>
 -->	
	<%@include file="test-win.jsp" %>
</body>
</html>