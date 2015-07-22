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
		PrintWriter out = resp.getWriter();
		while((line=br.readLine())!=null);
		{
			out.println(command+line);
		}
		out.flush();
		out.close();
	}
}
