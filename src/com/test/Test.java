package com.test;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import java.io.UnsupportedEncodingException;

import org.apache.commons.collections4.CollectionUtils;
 
import kafka.consumer.*;
import kafka.javaapi.consumer.ConsumerConnector;
import kafka.message.MessageAndMetadata;

import com.kafka.ConsumerHigh;
import com.kafka.ProducerDemo;
import com.kafka.SimpleConsumerDemo;

public class Test{

     public static void testProducer(){
         String brokerList="127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094";
         String topic="test";
         boolean bool=true;
         ProducerDemo producer = new ProducerDemo(brokerList, topic, bool);
         String result=producer.sendMessageBat();
         System.out.println(result);
     }

     public static void testConsumerH(){
        String[] args = { "127.0.0.1:2181", "345", "test"};  
        String zooKeeper = args[0];  
        String groupId = args[1];  
        String topic = args[2]; 
        ConsumerHigh demo = new ConsumerHigh(zooKeeper, groupId, topic);  
        demo.run();
        System.out.println(demo.getMessage());
     }

     public static void testConsumerL(){
         String topic = "test";
         int kafkaServerPort = 9092;
         int partition = 2;
         int offset = 0;
         SimpleConsumerDemo consumer = new SimpleConsumerDemo(topic,kafkaServerPort,partition,offset);
         String result = null;
         try {
	     result = consumer.pullMessage();
         }catch (Exception e) {
	     e.printStackTrace();
         }
         System.out.println(result);
     }
/*
     public static void main(String[] args){
     	testProducer();
     	testConsumerH();
     	testConsumerL();
     }
*/    
     public static void main(String[] args) {
	
    	 Properties properties = new Properties();
    	 properties.put("zookeeper.connect", "127.0.0.1:2181");
    	 properties.put("auto.commit.enable", "true");
    	 properties.put("auto.commit.interval.ms", "60000");
    	 properties.put("group.id", "test-group");
    	 properties.put("zookeeper.session.timeout.ms", "4000");
    	 properties.put("zookeeper.sync.time.ms", "200");
    	 properties.put("auto.offset.reset", "smallest");
    	 properties.put("serializer.class", "kafka.serializer.StringEncoder");       	 
    	 
    	ConsumerConfig consumerConfig = new ConsumerConfig(properties);
    	 
    	ConsumerConnector javaConsumerConnector = (ConsumerConnector) Consumer.createJavaConsumerConnector(consumerConfig);
    	 
    	 //topic的过滤器
    	 Whitelist whitelist = new Whitelist("test");
    	 List<KafkaStream<byte[], byte[]>> partitions = javaConsumerConnector.createMessageStreamsByFilter(whitelist);
    	 
    	if (CollectionUtils.isEmpty(partitions)) {
    	 System.out.println("empty!");
    	 try {
			TimeUnit.SECONDS.sleep(1);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 }
    	 
    	//消费消息
    	 for (KafkaStream<byte[], byte[]> partition : partitions) {
    	 
    	ConsumerIterator<byte[], byte[]> iterator = partition.iterator();
    	 while (iterator.hasNext()) {
    	 MessageAndMetadata<byte[], byte[]> next = iterator.next();
    	 System.out.println("partiton:" + next.partition());
    	 System.out.println("offset:" + next.offset());
    	 try {
			System.out.println("message:" + new String(next.message(), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 }
	}
}
}