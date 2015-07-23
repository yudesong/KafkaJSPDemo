package com.kafka;

import kafka.api.FetchRequest;
import kafka.api.FetchRequestBuilder;
import kafka.javaapi.FetchResponse;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import kafka.javaapi.consumer.SimpleConsumer;
import kafka.javaapi.message.ByteBufferMessageSet;
import kafka.message.MessageAndOffset;
import java.util.HashMap;
import java.util.Map;

public class SimpleConsumerDemo {
  
  private static String kafkaServerURL="localhost";
  private int kafkaServerPort;
  private static int kafkaProducerBufferSize = 64*1024;
  private static int connectionTimeOut = 100000;
  private static String clientId = "SimpleConsumerDemoClient";
  private String topic;
  private int partition;
  private long offset;
  private static int fetchSize=3000*100;

  public SimpleConsumerDemo(String topic,int kafkaServerPort,int partition,int offset){
    this.topic = topic;
    this.kafkaServerPort = kafkaServerPort;
    this.partition = partition;
    this.offset = offset;
  }

  public String printMessages(ByteBufferMessageSet messageSet) throws UnsupportedEncodingException {
    StringBuffer sb = new StringBuffer("") ;
    for(MessageAndOffset messageAndOffset: messageSet) {
      ByteBuffer payload = messageAndOffset.message().payload();
      byte[] bytes = new byte[payload.limit()];
      payload.get(bytes);
//    System.out.println(new String(bytes, "UTF-8"));
      sb.append(new String(bytes,"UTF-8"));
    }
    return sb.toString();
  }
  
  public String pullMessage() throws Exception {
      
    SimpleConsumer simpleConsumer = new SimpleConsumer(kafkaServerURL,kafkaServerPort,connectionTimeOut,kafkaProducerBufferSize,clientId);
    FetchRequest req = new FetchRequestBuilder()
            .clientId(clientId)
            .addFetch(topic, partition, offset,fetchSize)  //addFetch(topic, partition, offset, fetchSize)
            .build();
    FetchResponse fetchResponse = simpleConsumer.fetch(req);
    return printMessages((ByteBufferMessageSet) fetchResponse.messageSet(topic, partition));
  }
}