package com.kafka;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import kafka.consumer.ConsumerConfig;
import kafka.consumer.ConsumerIterator;
import kafka.consumer.KafkaStream;
import kafka.javaapi.consumer.ConsumerConnector;

public class ConsumerHigh
{
  public static ConsumerConnector consumer;
  public static String zkConn;
  public static String groupId;

  public ConsumerHigh(String zkConn,String groupId)
  {
    consumer = kafka.consumer.Consumer.createJavaConsumerConnector(createConsumerConfig());
    this.zkConn = zkConn;
    this.groupId = groupId;
  }

  public ConsumerConfig createConsumerConfig()
  {
    Properties props = new Properties();
    props.put("zookeeper.connect","localhost:2181");
    props.put("group.id", "1004");
    props.put("zookeeper.session.timeout.ms", "4000000");
    props.put("zookeeper.sync.time.ms", "200000");
//  props.put("auto.commit.interval.ms", "1000");
    props.put("auto.offset.reset", "smallest");
 //  props.put("serializer.class", "kafka.serializer.StringEncoder");    
    return new ConsumerConfig(props);
  }
 
  public String getMessage(String topic) {
    Map<String, Integer> topicCountMap = new HashMap<String, Integer>();
    topicCountMap.put(topic, new Integer(1));
    Map<String, List<KafkaStream<byte[], byte[]>>> consumerMap = consumer.createMessageStreams(topicCountMap);
    KafkaStream<byte[], byte[]> stream =  consumerMap.get(topic).get(0);
    ConsumerIterator<byte[], byte[]> it = stream.iterator();
    StringBuffer sb = new StringBuffer();
    while(it.hasNext()){
    //   System.out.println("Consumer:------>"+new String(it.next().message()));
    	String msg = it.next().message().toString();
    	System.out.println(msg+"----------->");
    	sb.append(msg);
    	if(msg.equals("")) break;
  	}
    
    System.out.println("-----------------------------------|");
    System.out.println(sb.toString());
  	return sb.toString();
}
  
  public static void main(String[] args) {
	
	  String zkConn = "localhost:2181";
	  String topic = "test";	
	  String groupId = "yu";
	  
	    ConsumerHigh consumer = new ConsumerHigh(zkConn,groupId);
	    String result;
	    result = consumer.getMessage(topic);
	    System.out.println(result);
}
  
  
  
  
}