package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kafka.ConsumerHigh;
import com.kafka.ProducerDemo;
import kafka.consumer.ConsumerConfig;
import kafka.consumer.ConsumerIterator;
import kafka.consumer.KafkaStream;
import kafka.javaapi.consumer.ConsumerConnector;
import kafka.javaapi.producer.Producer;
import kafka.producer.KeyedMessage;
import kafka.producer.ProducerConfig;

public class ConsumerHServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
@Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doPost(req, resp);
  }
  
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // TODO Auto-generated method stub
    //ConsumerHighDemo
        //  http://localhost:8080/kafka/ConsumerH?topic=test&zkConn=127.0.0.1:2181&groupId=aa
    String topic = req.getParameter("topic");
    String zkConn = req.getParameter("zkConn");
    String groupId = req.getParameter("groupId");
    PrintWriter out = resp.getWriter();
    
    ConsumerHigh demo = new ConsumerHigh(zkConn, groupId, topic);  
    demo.run();
    out.println(demo.getMessage());
    out.flush();
    out.close();
  }
}
