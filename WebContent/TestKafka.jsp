<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%
		String cmd = "ps -aux";
		Process process = Runtime.getRuntime().exec(cmd);
		String line;
		StringBuffer sb = new StringBuffer();
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		while((line=br.readLine())!=null)
		{
			sb.append(line);
		}
		br.close();
		String str = "<script type='text/javascript'>";
		str+="$(function(){";
		//Test 
		if(sb.toString().contains("server.properties")){
			str+="$('#zkStart-1').attr('disabled',true);";
			str+="$('#zk-info1').addClass('am-alert am-alert-default');$('#zk-info1').html('启动中');";
		}
		//Test
		if(sb.toString().contains("zookeeper-1.properties")){
			str+="$('#zkStart-2').attr('disabled',true);";
			str+="$('#zk-info2').addClass('am-alert am-alert-default');$('#zk-info2').html('启动中');";
		}
		//Test 
		if(sb.toString().contains("zookeeper-2.properties")){
			str+="$('#zkStart-3').attr('disabled',true);";
			str+="$('#zk-info3').addClass('am-alert am-alert-default');$('#zk-info3').html('启动中');";
		}
		str+=	"});</script>";
		out.println(str);
%>