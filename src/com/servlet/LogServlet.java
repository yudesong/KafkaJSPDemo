/**
 * 
 */
package com.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String topic = req.getParameter("topic");
		
 		String cmd = "C:/Users/yuds/kafka_2.11-0.8.2.1/bin/windows/kafka-topics.bat --describe --zookeeper localhost:2181 --topic "+topic;
 		Process process = Runtime.getRuntime().exec(cmd);
        String line;
        StringBuffer sb = new StringBuffer();
        BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
        while((line=br.readLine())!=null)
        {
            sb.append(line+"\n");
        }
        PrintWriter out = resp.getWriter();
        out.println(sb.toString());
        br.close();
        
		
		
		
		
	}
	
}
