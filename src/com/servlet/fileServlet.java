/**
 * 
 */
package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class fileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	 PrintWriter out = resp.getWriter();
	 out.print("[");
   	 String filepath = "C:/Users/yuds/tmp";
   	 File folder = new File(filepath);
   	 if(folder.isDirectory()){
   		 String[] filelist = folder.list();
   		 for(int i=0;i<filelist.length;i++){
   			if(!(filelist[i].equals("zookeeper"))) out.print("{title:'"+filelist[i]+"',type:'folder',products:[");
   			else continue;
   			 File file = new File(filepath + "\\" + filelist[i]);
   			 if(file.isDirectory()){
   				 String[] file_list = file.list();
   				 for(int j=0;j<file_list.length;j++){
   					if(!(file_list[j].equals(".lock")) && !(file_list[j].equals(".kafka_cleanshutdown")) && !(file_list[j].equals("recovery-point-offset-checkpoint")) && !(file_list[j].equals("replication-offset-checkpoint")))
   					{
   						out.print("{title:'"+file_list[j]+"',type:'item'}");
   						if(j!=file_list.length-1) out.print(",");
   					}
   					
   				 }
   				 out.print("]}");
   			 }
   			if(i!=filelist.length-2) out.print(",");
   			else out.print("]");
   		 } 
   	 }
	}
}
