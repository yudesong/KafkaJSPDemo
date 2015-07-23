package com.kafka;

import java.util.Properties;  
import kafka.javaapi.producer.Producer;  
import kafka.producer.KeyedMessage;  
import kafka.producer.ProducerConfig;

public class ProducerDemo {

    private String brokerList;
    private Properties props;
    private String topic;
    private boolean bool;
    public ProducerDemo(String brokerList,String topic,boolean bool){
        this.topic = topic;
        props = new Properties();
        props.put("metadata.broker.list",brokerList);  
        props.put("serializer.class", "kafka.serializer.StringEncoder");   
        props.put("key.serializer.class", "kafka.serializer.StringEncoder");  
        if(bool) props.put("partitioner.class", "kafka.demo.PartitionerDemo"); 
        props.put("request.required.acks", "1");  
    }

    public void sendMessageBat(){
        ProducerConfig config = new ProducerConfig(props);  
        Producer<String, String> producer = new Producer<String, String>(config);  
        long start=System.currentTimeMillis();  
        for (long i = 1; i < 100; i++) {
            String ip = "127.0.0." + i; 
            String msg = i+"";  
            //如果topic不存在，则会自动创建，默认replication-factor为1，partitions为0  
            KeyedMessage<String, String> data = new KeyedMessage<String, String>(  
                    topic, ip, msg);  
            producer.send(data);
            producer.close();  
        }  
    } 
}
