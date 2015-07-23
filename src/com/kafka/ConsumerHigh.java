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
  private final ConsumerConnector consumer;
  private final String topic;
  private static String groupId;
  private static String zkConn;
  public ConsumerHigh(String topic,String zkConn,String groupId)
  {
    consumer = kafka.consumer.Consumer.createJavaConsumerConnector(
            createConsumerConfig());
    this.topic = topic;
    this.zkConn = zkConn;
    this.groupId = groupId;
  }

  private static ConsumerConfig createConsumerConfig()
  {
    Properties props = new Properties();
    props.put("zookeeper.connect",zkConn);
    props.put("group.id", groupId);
    props.put("zookeeper.session.timeout.ms", "4000");
    props.put("zookeeper.sync.time.ms", "200");
//  props.put("auto.commit.interval.ms", "1000");
    props.put("auto.offset.reset", "smallest");
 //  props.put("serializer.class", "kafka.serializer.StringEncoder");    
    return new ConsumerConfig(props);
  }
 
  public String getMessage() {
    Map<String, Integer> topicCountMap = new HashMap<String, Integer>();
    topicCountMap.put(topic, new Integer(1));
    Map<String, List<KafkaStream<byte[], byte[]>>> consumerMap = consumer.createMessageStreams(topicCountMap);
    KafkaStream<byte[], byte[]> stream =  consumerMap.get(topic).get(0);
    ConsumerIterator<byte[], byte[]> it = stream.iterator();
    StringBuffer sb = new StringBuffer("");
    while(it.hasNext()){
//      System.out.println("Consumer:------>"+new String(it.next().message()));
    	sb.append(it.next().message());
  	}
  	return sb.toString();
}
}