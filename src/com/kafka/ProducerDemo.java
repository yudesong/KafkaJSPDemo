package com.kafka;

import java.util.Properties;  
import kafka.javaapi.producer.Producer;  
import kafka.producer.KeyedMessage;  
import kafka.producer.ProducerConfig;
public class ProducerDemo {

    public static String brokerList;
    public static String topic;
    public static boolean bool;
    public ProducerDemo(String brokerList,String topic,boolean bool){
        this.topic = topic;
        this.brokerList = brokerList;
        this.bool = bool;
    }

    public String sendMessageBat(){
        Properties props = new Properties();
        props.put("metadata.broker.list",brokerList);  
        props.put("serializer.class", "kafka.serializer.StringEncoder");   
        props.put("key.serializer.class", "kafka.serializer.StringEncoder");  
        if(bool)   props.put("partitioner.class", "com.kafka.PartitionDemo"); 
        props.put("request.required.acks", "1");  
        ProducerConfig config = new ProducerConfig(props);
        Producer<String, String> producer = new Producer<String, String>(config);
        StringBuffer sb = new StringBuffer("");  
        for (int i = 1; i < 100; i++) {
            String ip = "127.0.0." + i; 
            String msg = "Message:"+i;  
            //如果topic不存在，则会自动创建，默认replication-factor为1，partitions为0  
            KeyedMessage<String, String> data = new KeyedMessage<String, String>(  
                    topic, ip, msg);  
            producer.send(data);
            sb.append(data);
 //           System.out.println(data);
        } 
        producer.close();
        return sb.toString();
    } 
    
    
    public static void main(String[] args) {
    	String brokerList="127.0.0.1:9092,127.0.0.1:9093,127.0.0.1:9094";
    	String topic="test";
    	boolean bool=true;
		ProducerDemo producer = new ProducerDemo(brokerList, topic, bool);
		String result=producer.sendMessageBat();
		System.out.println(result);
	}
    
    
}
