<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%
		String cmd = "netstat -ano";
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
		if(sb.toString().contains("127.0.0.1:9092")){
			str+="$('#kFStart-1').attr('disabled',true);";
			str+="$('#kF-info1').addClass('am-alert am-alert-default');$('#kF-info1').html('启动中');";
		}
		//Test
		if(sb.toString().contains("127.0.0.1:9093")){
			str+="$('#kFStart-2').attr('disabled',true);";
			str+="$('#kF-info2').addClass('am-alert am-alert-default');$('#kF-info2').html('启动中');";
		}
		//Test 
		if(sb.toString().contains("127.0.0.1:9094")){
			str+="$('#kFStart-3').attr('disabled',true);";
			str+="$('#kF-info3').addClass('am-alert am-alert-default');$('#kF-info3').html('启动中');";
		}
		str+="});</script>";
		out.println(str);
%>