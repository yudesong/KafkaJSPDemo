#!/bin/bash
clear
echo "                                                                	        "
echo " 		                                             		        "
echo "--------------------------------------------------------------------------"
echo "                  	                            		        "
echo "          	      欢迎使用Kafka管理系统                             "
echo "                                              			        "
echo "	1. 启动Zookeepek服务         2. 启动Kafka集群服务 		        "
echo "	3. 创建Topic                 4. 查看所有的Topic          	        "
echo "	5. 创建Producer发送信息      6. 创建Consumer消费者		        "
echo "                                             	 			"
echo "--------------------------------------------------------------------------"
while [ True ]
 do
   read -p "请选择(1-6):" option
   case $option in
   1)
	nohup sh ~/Download/kafka_2.11-0.8.2.1/bin/zookeeper-server-start.sh ~/Download/kafka_2.11-0.8.2.1/config/zookeeper.properties > zookeeper.log 2>&1 &
	pwd $
	;;
   2)
	nohup sh ~/Download/kafka_2.11-0.8.2.1/bin/kafka-server-start.sh ~/Download/kafka_2.11-0.8.2.1/config/server.properties > kafka.log 2>&1 &
	nohup sh ~/Download/kafka_2.11-08.2.1/bin/kafka-server-start.sh ~/Download/kafka_2.11-0.8.2.1/config/server-1.properties > kafka-1.log 2>&1 &
	nohup sh ~/Download/kafka_2.11-08.2.1/bin/kafka-server-start.sh ~/Download/kafka_2.11-0.8.2.1/config/server-2.properties > kafka-2.log 2>&1 &
	;;
   3)
	read -p "Topic名:" topic
	read -p "副本个数:" replication
	read -p "分区个数:" partitions
	sh ~/Download/kafka_2.11-0.8.2.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor $replication --partitions $partitions --topic $topic	
	;;
   4)
	sh  ~/Download/kafka_2.11-0.8.2.1/bin/kafka-topics.sh --list --zookeeper localhost:2181
	;;
   5)
	echo -p "Topic名:" topic
	echo "Ctrl+c退出发送"
	sh  ~/Download/kafka_2.11-0.8.2.1/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $topic 
   	;;
   6)	
	echo -p "Topic名:" topic
	echo "Ctrl+c退出发送"
	sh ~/Download/kafka_2.11-0.8.2.1/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic $topic --from-beginning
   	;;	
   *)
	echo "输入错误.."
	;;
   esac
done
















