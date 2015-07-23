package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kafka.ProducerDemo;
import com.kafka.SimpleConsumerDemo;

import kafka.javaapi.producer.Producer;
import kafka.producer.KeyedMessage;
import kafka.producer.ProducerConfig;

public class ConsumerLServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doPost(req, resp);
  }
  
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // TODO Auto-generated method stub
    //ConsumerLow Demo
        
    String topic = req.getParameter("topic");
    int kafkaServerPort = Integer.parseInt(req.getParameter("kafkaServerPort"));
    int partition = Integer.parseInt(req.getParameter("partition"));
    int offset = Integer.parseInt(req.getParameter("offset"));
    SimpleConsumerDemo consumer = new SimpleConsumerDemo(topic,kafkaServerPort,partition,offset);
    String result = null;
	try {
		result = consumer.pullMessage();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    PrintWriter out = resp.getWriter();
    out.print(result);
  }
}
