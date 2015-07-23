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

import kafka.javaapi.producer.Producer;
import kafka.producer.KeyedMessage;
import kafka.producer.ProducerConfig;

public class ConsumerHServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doPost(req, resp);
  }
  
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // TODO Auto-generated method stub
    //ConsumerHighDemo
        
    String topic = req.getParameter("topic");
    String zkConn = req.getParameter("zkConn");
    String groupId = req.getParameter("groupId");
    ConsumerHigh consumer = new ConsumerHigh(topic, zkConn,groupId);
    String result=consumer.getMessage();
    PrintWriter out = resp.getWritter();
    out.print(result);
  }
}
