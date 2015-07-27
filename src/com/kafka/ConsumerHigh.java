package com.kafka;
import java.util.HashMap;  
import java.util.List;  
import java.util.Map;  
import java.util.Properties; 
import kafka.consumer.Consumer;  
import kafka.consumer.ConsumerConfig;
import kafka.consumer.ConsumerIterator;
import kafka.consumer.KafkaStream;  
import kafka.javaapi.consumer.ConsumerConnector;  
public class ConsumerHigh {  
    private  ConsumerConnector consumer;  
    private  String topic;  
    private StringBuffer sb = new StringBuffer("");
   
    public String getMessage() {
        return sb.toString();
    }

    public ConsumerHigh(String a_zookeeper, String a_groupId, String a_topic) {  
        consumer = Consumer.createJavaConsumerConnector(createConsumerConfig(a_zookeeper,a_groupId));  
        this.topic = a_topic;  
    }  
   
    public void shutdown() {  
        if (consumer != null)  
            consumer.shutdown(); 
    }  
   
    public void run() {  
        Map<String, Integer> topicCountMap = new HashMap<String, Integer>();  
        topicCountMap.put(topic, new Integer(1));  
        Map<String, List<KafkaStream<byte[], byte[]>>> consumerMap = consumer  
                .createMessageStreams(topicCountMap);  
        KafkaStream<byte[], byte[]> stream = consumerMap.get(topic).get(0);  
        ConsumerIterator<byte[], byte[]> it = stream.iterator();
        long start=System.currentTimeMillis();  
        int i=0;
        while(it.hasNext()){
           String msg;
           msg = new String(it.next().message());
           sb.append(msg+"\n");
           long end = System.currentTimeMillis();
           if(end-start>=100) consumer.shutdown();
        //   System.out.println("-->"+end);
         //  i++;
        }
        consumer.shutdown();
    }  
   
    public ConsumerConfig createConsumerConfig(String a_zookeeper, String a_groupId) {  
        Properties props = new Properties();  
        props.put("zookeeper.connect", a_zookeeper);  
        props.put("group.id", a_groupId);  
        props.put("zookeeper.session.timeout.ms", "400");
        props.put("zookeeper.sync.time.ms", "200");
        props.put("auto.commit.interval.ms", "1000");
        props.put("auto.offset.reset", "smallest");
        props.put("serializer.class", "kafka.serializer.StringEncoder");    
        return new ConsumerConfig(props);  
    }
} 