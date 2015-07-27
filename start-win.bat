echo off
CLS
echo.
echo.
echo ==========================================================================
echo. 
echo                       ��ӭʹ��Kafka����ϵͳ
echo.
echo      1. ����Zookeepek����          2. ����Kafka��Ⱥ����
echo      3. ����Topic                  4. �鿴���е�Topic  
echo      5. ����Producer������Ϣ       6. ����Consumer������
echo      7. �鿴Topic����              0. �˳�ϵͳ 
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
		set /p topic=������Topic��:
		set /p replication=��������:
		set /p paritions=��������:
		%kafka_path%/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor %replication% --partitions %paritions% --topic %topic%
		goto optend
	:4
		%kafka_path%/bin/kafka-topics.sh --list --zookeeper localhost:2181
		goto optend
	:5
		set /p topic=Topic��:
		echo Ctrl+c�˳�����
		%kafka_path%/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic %topic% 
		goto optend
	:6
		set /p topic=Topic��:
		echo Ctrl+c�˳�����
		%kafka_path%/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic %topic% --from-beginning		
		goto optend
	:7
		set /p topic=Topic��:
		%kafka_path%/bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic %topic%		
		goto optend	
	:optend
		echo.	
)


