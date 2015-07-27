echo off
CLS
echo.
echo.
echo ==========================================================================
echo. 
echo                       欢迎使用Kafka管理系统
echo.
echo      1. 启动Zookeepek服务          2. 启动Kafka集群服务
echo      3. 创建Topic                  4. 查看所有的Topic  
echo      5. 创建Producer发送信息       6. 创建Consumer消费者
echo      7. 查看Topic分区              0. 退出系统 
echo.
echo ==========================================================================
set kafka_path=C:/Users/yuds/kafka_2.11-0.8.2.1
for /l %%a in (1,1,100) do (
	set /p opt=plese input num
	goto %opt%
	:0
		echo.
	:1
		%kafka_path%/bin/windows/zookeeper-server-start.bat %kafka_path%/config/zookeeper.properties 1>nul 2>nul
		goto optend
	:2
		%kafka_path%/bin/windows/kafka-server-start.bat %kafka_path%/config/server.properties 1>nul 2>nul
		%kafka_path%/bin/windows/kafka-server-start.bat %kafka_path%/config/server-1.properties 1>nul 2>nul
		%kafka_path%/bin/windows/kafka-server-start.bat %kafka_path%/config/server-2.properties 1>nul 2>nul
		goto optend
	:3	
		set /p topic=请输入Topic名:
		set /p replication=副本个数:
		set /p paritions=分区个数:
		%kafka_path%/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor %replication% --partitions %paritions% --topic %topic%
		goto optend
	:4
		%kafka_path%/bin/kafka-topics.sh --list --zookeeper localhost:2181
		goto optend
	:5
		set /p topic=Topic名:
		echo Ctrl+c退出发送
		%kafka_path%/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic %topic% 
		goto optend
	:6
		set /p topic=Topic名:
		echo Ctrl+c退出发送
		%kafka_path%/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic %topic% --from-beginning		
		goto optend
	:7
		set /p topic=Topic名:
		%kafka_path%/bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic %topic%		
		goto optend	
	:optend
		echo.	
)


