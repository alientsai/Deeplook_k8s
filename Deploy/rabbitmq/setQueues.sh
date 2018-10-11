#!/bin/bash
IP=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')
PASS=$( kubectl get secret --namespace default mq-rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 --decode )

curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "3", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/3
echo "rabbitmq queue 3 created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "3_L", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/3_L
echo "rabbitmq queue 3_L created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "3_H", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/3_H
echo "rabbitmq queue 3_H created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "5", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/5
echo "rabbitmq queue 5 created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "5_L", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/5_L
echo "rabbitmq queue 5_L created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "5_H", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/5_H
echo "rabbitmq queue 5_H created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "10", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/10
echo "rabbitmq queue 10 created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "10_L", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/10_L
echo "rabbitmq queue 10_L created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "10_H", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/10_H
echo "rabbitmq queue 10_H created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "11", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/11
echo "rabbitmq queue 11 created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "11_L", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/11_L
echo "rabbitmq queue 11_L created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "11_H", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/11_H
echo "rabbitmq queue 11_H created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "12", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/12
echo "rabbitmq queue 12 created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "12_L", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/12_L
echo "rabbitmq queue 12_L created!"
curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "12_H", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/12_H
echo "rabbitmq queue 12_H created!"
echo "You can open rabbitmq manager($IP:31075) to check."
