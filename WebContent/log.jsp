<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.*"%>
<%@page import="kafka.consumer.ConsumerConfig"%>
<%@page import= "kafka.consumer.ConsumerIterator"%>
<%@page import="kafka.consumer.KafkaStream"%>
<%@page import="kafka.javaapi.consumer.ConsumerConnector"%>




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
  <li class="am-active"><a href="log.jsp">Log 日志文件</a></li>
</ul>
	<div id="item">
		<div><strong>Log 日志文件</strong></div>
              <div>Topics:</div>
             <%

                    String cmd = "sh /home/yudesong/Download/kafka_2.11-0.8.2.1/bin/kafka-topics.sh --list --zookeeper localhost:2181";
                    Process process = Runtime.getRuntime().exec(cmd);
                    String line;
                    StringBuffer sb = new StringBuffer();
                    BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
                    while((line=br.readLine())!=null)
                    {
                          sb.append(line);
                    }
                    out.println("<pre>");
                    out.println(sb.toString());
                    out.println("</pre>");
                    br.close();
             %>

<%

String topic = "test";
String zkConn = "localhost:2181";
String groupId = "7727";


Properties props = new Properties();
props.put("zookeeper.connect",zkConn);
props.put("group.id", groupId);
props.put("zookeeper.session.timeout.ms", "4000000");
props.put("zookeeper.sync.time.ms", "200000");
props.put("auto.commit.interval.ms", "1000");
props.put("auto.offset.reset", "smallest");
props.put("serializer.class", "kafka.serializer.StringEncoder");    
ConsumerConfig consumerfig =  new ConsumerConfig(props);
ConsumerConnector consumer = kafka.consumer.Consumer.createJavaConsumerConnector(consumerfig);

  Map<String, Integer> topicCountMap = new HashMap<String, Integer>();
  topicCountMap.put(topic, new Integer(1));
  Map<String, List<KafkaStream<byte[], byte[]>>> consumerMap = consumer.createMessageStreams(topicCountMap);
  KafkaStream<byte[], byte[]> stream =  consumerMap.get(topic).get(0);
  ConsumerIterator<byte[], byte[]> it = stream.iterator();
  while(it.hasNext()){
  	out.println(new String(it.next().message().toString())+"\n");
	}
%>






	</div>
</body>
</html>