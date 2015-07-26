package com.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManZK extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req,resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String zk_id = req.getParameter("id");
		String manager = req.getParameter("manager");
		Process process;
		String command = "sh  /home/yudesong/Download/kafka_2.11-0.8.2.1/bin/zookeeper-server-"+manager+".sh  /home/yudesong/Download/kafka_2.11-0.8.2.1/config/zookeeper.properties";
		process = Runtime.getRuntime().exec(command); 
		BufferedReader br= new BufferedReader(new InputStreamReader(process.getInputStream()));
		String line;
		StringBuffer sb = new StringBuffer("");
		PrintWriter out = resp.getWriter();
		while((line=br.readLine())!=null);
		{
			sb.append(line);
		}
		if(sb.toString().contains("INFO")){
			out.println("1");
		} else if(sb.toString().contains("Exception")){
			out.println("0");
		}else{
			out.println("");
		}
		out.flush();
		out.close();
	}
}
