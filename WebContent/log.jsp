<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kafka</title>
<link rel='stylesheet' href="public/stylesheets/style.css"/>    
<link rel='stylesheet' href="public/stylesheets/amazeui.min.css"/>
<link rel='stylesheet' href="public/stylesheets/amazeui.tree.min.css"/>
<script type="text/javascript" src="public/javascripts/jquery.min.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.ie8polyfill.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.widgets.helper.js"></script>
<script type="text/javascript" src="public/javascripts/amazeui.tree.min.js"></script>
<script type="text/javascript" src="public/javascripts/log.js"></script>
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
              <div><strong>Topics列表</strong></div>
              <%! String[] topic=new String[5]; %>
              <%
//                  String cmd = "sh /home/yudesong/Download/kafka_2.11-0.8.2.1/bin/kafka-topics.sh --list --zookeeper localhost:2181";
             		String cmd = "C:/Users/yuds/kafka_2.11-0.8.2.1/bin/windows/kafka-topics.bat --list --zookeeper localhost:2181";
             		Process process = Runtime.getRuntime().exec(cmd);
                    String line;
                    StringBuffer sb = new StringBuffer();
                    BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
                    int i=0;
                    while((line=br.readLine())!=null)
                    {
                    	topic[i] = line;
                        sb.append(line+"\n");
                        i++;
                    }
                    out.println("<pre style='width:500px;'>");
                    out.println(sb.toString());
                    out.println("</pre>");
                    br.close();
             %>
             <div>
             	<strong>Topic分区</strong>
             <select id="topic">
             	<%
             		int length = topic.length;
             		int k;
             		for(k=0;k<length;k++)
             		{
             			if(topic[k]!=null) out.print("<option value='"+topic[k]+"'>"+topic[k]+"</option>");
             		}
             	%>
             </select>&nbsp;&nbsp;<button type="button" id="CTopic" class="am-btn am-btn-secondary am-radius">Start</button>
             <pre id="show_topic"></pre>
             </div>      
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>日志文件列表</strong></br>
		&nbsp;&nbsp;&nbsp;&nbsp;
<ul class="am-tree" id="firstTree">
  <li class="am-tree-branch am-hide" data-template="treebranch">
    <div class="am-tree-branch-header">
      <button class="am-tree-branch-name">
        <span class="am-tree-icon am-tree-icon-folder"></span>
        <span class="am-tree-label"></span>
      </button>
    </div>
    <ul class="am-tree-branch-children"></ul>
    <div class="am-tree-loader"><span class="am-icon-spin am-icon-spinner"></span></div>
  </li>
  <li class="am-tree-item am-hide" data-template="treeitem">
    <button class="am-tree-item-name">
      <span class="am-tree-icon am-tree-icon-item"></span>
      <span class="am-tree-label"></span>
    </button>
  </li>
</ul>
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